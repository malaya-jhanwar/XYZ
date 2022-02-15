// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract ToDo {
  struct Task{
    uint id;
    uint date;
    string content;
    string author;
    bool done;
  }


  uint lastTaskId;
  mapping(uint => Task) tasks;

  
    uint[] taskIds;

  constructor () public {
    lastTaskId = 1;
  }

   event TaskCreated(uint, uint, string, string, bool);

  function createTask(string memory _content , string memory _author) public{
    tasks[lastTaskId] =  Task(lastTaskId, block.timestamp, _content, _author, false);
    taskIds.push(lastTaskId);
    emit TaskCreated(lastTaskId, block.timestamp, _content, _author, false);
    lastTaskId++;
  }

  function getTaskIds() public view returns(uint[] memory) {
    return taskIds;
  }





  function getTask(uint id) taskExists(id) public view returns(uint,uint,string memory,string memory,bool) {
    return(id  ,tasks[id].date  ,tasks[id].content  ,tasks[id].author,  tasks[id].done );
  }



   modifier taskExists(uint id) {
      if(tasks[id].id == 0) {
        revert();
      }
      _;
    }
}

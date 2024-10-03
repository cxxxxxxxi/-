#ifndef CFG_H
#define CFG_H

#include "SysY_tree.h"
#include "basic_block.h"
#include <bitset>
#include <iostream>
#include <map>
#include <queue>
#include <set>
#include <vector>

class CFG {
public:
    FuncDefInstruction function_def;

    /*this is the pointer to the value of LLVMIR.function_block_map
      you can see it in the LLVMIR::CFGInit()*/
    std::map<int, LLVMBlock> *block_map;

    // 使用邻接表存图
    std::vector<std::vector<LLVMBlock>> G{};       // control flow graph
    std::vector<std::vector<LLVMBlock>> invG{};    // inverse control flow graph

    void BuildCFG();

    // 获取某个基本块节点的前驱/后继
    std::vector<LLVMBlock> GetPredecessor(LLVMBlock B);
    std::vector<LLVMBlock> GetPredecessor(int bbid);
    std::vector<LLVMBlock> GetSuccessor(LLVMBlock B);
    std::vector<LLVMBlock> GetSuccessor(int bbid);
};

#endif
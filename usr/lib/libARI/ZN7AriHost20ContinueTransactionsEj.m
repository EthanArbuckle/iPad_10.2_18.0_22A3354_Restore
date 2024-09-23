@implementation ZN7AriHost20ContinueTransactionsEj

uint64_t *___ZN7AriHost20ContinueTransactionsEj_block_invoke(uint64_t a1)
{
  uint64_t *result;

  result = std::__hash_table<std::__hash_value_type<int,AriHost::TransactionMgr>,std::__unordered_map_hasher<int,std::__hash_value_type<int,AriHost::TransactionMgr>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,AriHost::TransactionMgr>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,AriHost::TransactionMgr>>>::find<int>((_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_DWORD *)(a1 + 40));
  if (!result)
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  *((_BYTE *)result + 284) = 0;
  return result;
}

@end

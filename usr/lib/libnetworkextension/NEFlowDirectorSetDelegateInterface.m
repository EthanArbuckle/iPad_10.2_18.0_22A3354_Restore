@implementation NEFlowDirectorSetDelegateInterface

char *__NEFlowDirectorSetDelegateInterface_block_invoke(uint64_t a1)
{
  char *result;
  char v3[16];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  result = if_indextoname(*(_DWORD *)(a1 + 40), v3);
  if (result)
    return (char *)flow_director_reset_default_interface_info(*(_QWORD *)(a1 + 32), v3);
  return result;
}

@end

@implementation PLIndexSetFromXPCDictionary

uint64_t __PLIndexSetFromXPCDictionary_block_invoke(uint64_t a1, char a2, xpc_object_t xuint)
{
  if ((a2 & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "addIndexesInRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), xpc_uint64_get_value(xuint));
  else
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = xpc_uint64_get_value(xuint);
  return 1;
}

@end

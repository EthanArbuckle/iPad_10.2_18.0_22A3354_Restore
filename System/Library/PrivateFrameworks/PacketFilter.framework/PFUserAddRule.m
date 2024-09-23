@implementation PFUserAddRule

void __PFUserAddRule_block_invoke(uint64_t a1)
{
  void *TransArray;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = PFManagerCheckUserExists(*(const void **)(a1 + 40));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    TransArray = (void *)__PFUserGetTransArray(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    if (TransArray)
    {
      xpc_array_append_value(TransArray, *(xpc_object_t *)(a1 + 56));
    }
    else
    {
      PFManagerErrorLog();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    }
  }
  else
  {
    PFManagerErrorLog();
  }
}

@end

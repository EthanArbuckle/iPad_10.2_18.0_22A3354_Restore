@implementation OOB

BOOL __get_agent_uuid_if_OOB_data_required_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  _BOOL8 result;

  result = 1;
  if (a3)
  {
    if (MEMORY[0x1DF0F1630](a3) == MEMORY[0x1E0C88FE8])
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_value(a3, "OutOfBandDataUUID");
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
        return 0;
    }
  }
  return result;
}

@end

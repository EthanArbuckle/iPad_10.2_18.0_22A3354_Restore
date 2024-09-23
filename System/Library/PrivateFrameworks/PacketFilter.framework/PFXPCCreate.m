@implementation PFXPCCreate

uint64_t ____PFXPCCreate_block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  BOOL v4;

  result = MEMORY[0x219A0CD04](a2);
  if (__pfconnection)
    v4 = result == MEMORY[0x24BDACFB8];
  else
    v4 = 0;
  if (v4)
  {
    xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x24BDACF40]);
    return PFManagerErrorLog();
  }
  else if (__pfconnection)
  {
    return PFManagerErrorLog();
  }
  return result;
}

@end

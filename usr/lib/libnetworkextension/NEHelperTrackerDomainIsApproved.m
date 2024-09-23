@implementation NEHelperTrackerDomainIsApproved

BOOL __NEHelperTrackerDomainIsApproved_block_invoke(uint64_t a1, int a2, xpc_object_t xstring)
{
  const char *string_ptr;
  int v5;

  string_ptr = xpc_string_get_string_ptr(xstring);
  v5 = strcasecmp(*(const char **)(a1 + 40), string_ptr);
  if (!v5)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return v5 != 0;
}

@end

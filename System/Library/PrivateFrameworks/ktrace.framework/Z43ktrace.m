@implementation Z43ktrace

char *___Z43ktrace_uuid_offset_get_description_internalP15ktrace_uuid_map18ktrace_uuid_offsetPKc_block_invoke(char *result, const __CFString *a2)
{
  char *v2;
  char *v3;

  if (!*(_QWORD *)(*(_QWORD *)(*((_QWORD *)result + 4) + 8) + 24))
  {
    v2 = result;
    v3 = utf8(a2);
    result = basename_r(v3, *((char **)v2 + 5));
    *(_QWORD *)(*(_QWORD *)(*((_QWORD *)v2 + 4) + 8) + 24) = result;
  }
  return result;
}

@end

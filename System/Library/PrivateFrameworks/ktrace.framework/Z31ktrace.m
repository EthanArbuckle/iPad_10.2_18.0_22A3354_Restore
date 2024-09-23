@implementation Z31ktrace

_QWORD *___Z31ktrace_uuid_map_update_internalP15ktrace_uuid_mapP14ktrace_sessionP12ktrace_pointbbU13block_pointerFv12PrepassOpRefE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  _QWORD *v4;
  optional_uint64 *v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD *result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1 = *(_QWORD *)(a1 + 32);
  if (!v1)
    ktrace_remotetime_update_params_cold_1();
  v3 = *(int *)(a1 + 64);
  v4 = address_space_for_pid(*(ktrace_uuid_map **)(a1 + 32), v3);
  if (v4)
  {
    v6 = v4[3];
    v5 = (optional_uint64 *)(v4 + 3);
    if (v6)
    {
      v7 = optional_uint64::value(v5);
      set_address_space_for_taskid(v1, v7, 0);
    }
  }
  set_address_space_for_pid(v1, v3, 0);
  result = ktrace_uuid_map_ensure_address_space_for_tid(*(ktrace_uuid_map **)(a1 + 32), *(ktrace_session **)(a1 + 40), *(const void **)(a1 + 48));
  if (result && *(_BYTE *)(a1 + 68))
  {
    v9 = *(_QWORD *)(a1 + 56);
    if (*(_BYTE *)(a1 + 69))
      v10 = *(_QWORD *)(v9 + 16);
    else
      v10 = *(unsigned int *)(v9 + 12);
    result[5] = v10;
    v11 = *(_QWORD *)(a1 + 56);
    if (*(_BYTE *)(a1 + 69))
      v12 = *(_QWORD *)(v11 + 24);
    else
      v12 = *(unsigned int *)(v11 + 16);
    result[6] = v12;
  }
  return result;
}

@end

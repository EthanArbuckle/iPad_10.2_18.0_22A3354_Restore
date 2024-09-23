@implementation PATH

BOOL __quic_frame_process_PATH_STATUS_block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 328) != *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
}

BOOL __quic_frame_process_PATH_STATUS_block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned __int8 *v2;
  unsigned __int8 *v3;

  v2 = (unsigned __int8 *)(a2 + 38);
  v3 = (unsigned __int8 *)quic_cid_entry_cid(*(_QWORD *)(a1 + 32));
  return !quic_cid_equal(v2, v3);
}

BOOL __quic_frame_acknowledged_PATH_ABANDON_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = quic_cid_array_find_by_cid(*(unsigned __int8 **)(*(_QWORD *)(a1 + 32) + 376), (_BYTE *)(a2 + 38));
  return quic_cid_entry_seq_number(v3) != *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24);
}

BOOL __quic_frame_acknowledged_PATH_ABANDON_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 328) != *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
}

@end

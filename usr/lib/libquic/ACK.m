@implementation ACK

uint64_t __quic_frame_acknowledged_ACK_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  quic_ack_acknowledged(*(char **)(*(_QWORD *)(a1 + 32) + 960), *(unsigned __int8 *)(a1 + 40), -1, a2, a3);
  return 1;
}

uint64_t __quic_frame_acknowledged_ACK_MP_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  quic_ack_acknowledged(*(char **)(*(_QWORD *)(a1 + 32) + 960), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), a2, a3);
  return 1;
}

@end

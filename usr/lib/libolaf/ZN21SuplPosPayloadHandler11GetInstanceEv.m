@implementation ZN21SuplPosPayloadHandler11GetInstanceEv

_QWORD *___ZN21SuplPosPayloadHandler11GetInstanceEv_block_invoke()
{
  _QWORD *result;

  result = operator new(0x18uLL, MEMORY[0x24BEDB6B8]);
  if (result)
  {
    *result = 0;
    result[1] = 0;
    result[2] = 0;
  }
  SuplPosPayloadHandler::m_pos_payload_handler = (uint64_t)result;
  return result;
}

@end

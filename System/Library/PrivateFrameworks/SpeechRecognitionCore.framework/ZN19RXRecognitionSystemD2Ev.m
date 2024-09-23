@implementation ZN19RXRecognitionSystemD2Ev

RXXPC *___ZN19RXRecognitionSystemD2Ev_block_invoke(uint64_t a1)
{
  uint64_t v1;
  RXXPC *result;

  v1 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v1 + 16) = 0;
  *(_QWORD *)(*(_QWORD *)sSystems + 8 * *(unsigned int *)(v1 + 40)) = 0;
  result = *(RXXPC **)(v1 + 88);
  if (result)
  {
    RXXPC::RemoveHandler((uint64_t)result, *(const void **)(v1 + 96));
    _Block_release(*(const void **)(v1 + 96));
    result = *(RXXPC **)(v1 + 88);
    if (result)
    {
      RXXPC::~RXXPC(result);
      JUMPOUT(0x2207B89E4);
    }
  }
  return result;
}

@end

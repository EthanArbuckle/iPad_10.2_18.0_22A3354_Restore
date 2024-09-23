@implementation ZN2re9Transport14onReceiveAsyncEPNS

_QWORD *___ZN2re9Transport14onReceiveAsyncEPNS_13ProtocolLayerEPNS_14ProtocolHandleENS_9ChannelIdEPKvj_block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = dispatch_queue_get_specific(*(dispatch_queue_t *)(a1 + 40), *(const void **)(a1 + 32));
  if (result)
  {
    result = (_QWORD *)result[76];
    if (result)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*result + 48))(result);
  }
  return result;
}

@end

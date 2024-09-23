@implementation ZN2re15NWProtocolLayer6updateEv

unint64_t *___ZN2re15NWProtocolLayer6updateEv_block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int *v4;
  unint64_t *result;
  unint64_t *v6;
  NSObject *message;
  NSObject *v8;
  NSObject *v9;
  unsigned int v10;

  v1 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = (unsigned int *)(v3 + 1856);
  do
  {
    result = re::PacketQueue::dequeue((unint64_t **)(v3 + 40 * (_QWORD)v1 + 912));
    if (result)
    {
      v6 = result;
      do
      {
        message = nw_framer_protocol_create_message(*(nw_protocol_definition_t *)(v2 + 136));
        nw_framer_message_set_value(message, "channel", v1, 0);
        v8 = nw_content_context_create("re-nw");
        nw_content_context_set_metadata_for_protocol(v8, message);
        v9 = dispatch_data_create((const void *)v6[2], *((unsigned int *)v6 + 6), 0, 0);
        do
          v10 = __ldaxr(v4);
        while (__stlxr(v10 + 1, v4));
        nw_connection_send(*(nw_connection_t *)(v3 + 1768), v9, v8, 1, *(nw_connection_send_completion_t *)(v3 + 1816));
        if (re::internal::enableSignposts(0, 0) && re::internal::enableHighFrequencyNetworkTracing(0, 0))
          kdebug_trace();
        re::PacketPool::free(*(re::PacketPool **)(v2 + 24), (re::Packet *)v6);

        result = re::PacketQueue::dequeue((unint64_t **)(v3 + 40 * (_QWORD)v1 + 912));
        v6 = result;
      }
      while (result);
    }
    v1 = (char *)v1 + 1;
  }
  while (v1 != (void *)10);
  return result;
}

@end

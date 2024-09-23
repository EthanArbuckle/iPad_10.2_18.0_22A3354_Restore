@implementation CKEventHandler

- (CKEventHandler)init
{
  CKEventHandler *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *event_stream_queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKEventHandler;
  v2 = -[CKEventHandler init](&v8, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.siriknowledged.xpc.event_stream.queue", v4);
    event_stream_queue = v2->_event_stream_queue;
    v2->_event_stream_queue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event_stream_queue, 0);
}

@end

@implementation BKHIDCollectedEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

- (void)dealloc
{
  __IOHIDEvent *event;
  objc_super v4;

  event = self->_event;
  if (event)
    CFRelease(event);
  v4.receiver = self;
  v4.super_class = (Class)BKHIDCollectedEvent;
  -[BKHIDCollectedEvent dealloc](&v4, "dealloc");
}

@end

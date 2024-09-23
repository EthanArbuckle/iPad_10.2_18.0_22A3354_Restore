@implementation VFXAnimationEvent

- (VFXAnimationEvent)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXAnimationEvent;
  return -[VFXAnimationEvent init](&v3, sel_init);
}

- (void)dealloc
{
  id eventBlock;
  objc_super v4;

  eventBlock = self->_eventBlock;
  if (eventBlock)
    _Block_release(eventBlock);
  v4.receiver = self;
  v4.super_class = (Class)VFXAnimationEvent;
  -[VFXAnimationEvent dealloc](&v4, sel_dealloc);
}

- (double)time
{
  return self->_eventTime;
}

- (void)setTime:(double)a3
{
  self->_eventTime = a3;
}

- (id)eventBlock
{
  return self->_eventBlock;
}

- (void)setEventBlock:(id)a3
{
  id eventBlock;

  eventBlock = self->_eventBlock;
  if (eventBlock)
    _Block_release(eventBlock);
  self->_eventBlock = _Block_copy(a3);
}

+ (id)animationEventWithKeyTime:(float)a3 block:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;

  v6 = objc_alloc_init((Class)a1);
  objc_msgSend_setTime_(v6, v7, v8, v9, a3);
  objc_msgSend_setEventBlock_(v6, v10, (uint64_t)a4, v11);
  return v6;
}

@end

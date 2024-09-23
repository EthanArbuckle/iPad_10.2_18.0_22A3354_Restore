@implementation SASHIDGenerator

- (SASHIDGenerator)init
{
  SASHIDGenerator *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *generatorQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SASHIDGenerator;
  v2 = -[SASHIDGenerator init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.siri.SASHIDGenerator", v3);
    generatorQueue = v2->_generatorQueue;
    v2->_generatorQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)dealloc
{
  __IOHIDEventSystemClient *ioSystemClient;
  objc_super v4;

  ioSystemClient = self->_ioSystemClient;
  if (ioSystemClient)
    CFRelease(ioSystemClient);
  v4.receiver = self;
  v4.super_class = (Class)SASHIDGenerator;
  -[SASHIDGenerator dealloc](&v4, sel_dealloc);
}

- (void)sendHoldHomeButtonHIDEvents
{
  NSObject *generatorQueue;
  _QWORD block[5];

  generatorQueue = self->_generatorQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__SASHIDGenerator_sendHoldHomeButtonHIDEvents__block_invoke;
  block[3] = &unk_24D47A450;
  block[4] = self;
  dispatch_async(generatorQueue, block);
}

uint64_t __46__SASHIDGenerator_sendHoldHomeButtonHIDEvents__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendHIDHoldHomeButton");
}

- (void)sendHoldLockButtonHIDEvents
{
  NSObject *generatorQueue;
  _QWORD block[5];

  generatorQueue = self->_generatorQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__SASHIDGenerator_sendHoldLockButtonHIDEvents__block_invoke;
  block[3] = &unk_24D47A450;
  block[4] = self;
  dispatch_async(generatorQueue, block);
}

uint64_t __46__SASHIDGenerator_sendHoldLockButtonHIDEvents__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendHIDHoldLockButton");
}

- (void)_sendHIDHoldHomeButton
{
  const void *KeyboardEvent;
  const void *v4;
  const void *v5;
  const void *v6;
  timespec v7;
  timespec v8;
  timespec __rqtp;

  SASHIDGetCurrentTime();
  KeyboardEvent = (const void *)IOHIDEventCreateKeyboardEvent();
  IOHIDEventSetIntegerValue();
  IOHIDEventSetPhase();
  -[SASHIDGenerator _sendHIDEvent:](self, "_sendHIDEvent:", KeyboardEvent, xmmword_215D70710, 0, 58393417, 0, 334856333);
  CFRelease(KeyboardEvent);
  nanosleep(&__rqtp, 0);
  v4 = (const void *)IOHIDEventCreateKeyboardEvent();
  IOHIDEventSetIntegerValue();
  IOHIDEventSetPhase();
  -[SASHIDGenerator _sendHIDEvent:](self, "_sendHIDEvent:", v4);
  CFRelease(v4);
  nanosleep(&v8, 0);
  v5 = (const void *)IOHIDEventCreateKeyboardEvent();
  IOHIDEventSetIntegerValue();
  IOHIDEventSetIntegerValue();
  -[SASHIDGenerator _sendHIDEvent:](self, "_sendHIDEvent:", v5);
  CFRelease(v5);
  nanosleep(&v7, 0);
  v6 = (const void *)IOHIDEventCreateKeyboardEvent();
  IOHIDEventSetIntegerValue();
  -[SASHIDGenerator _sendHIDEvent:](self, "_sendHIDEvent:", v6);
  CFRelease(v6);
}

- (void)_sendHIDHoldLockButton
{
  const void *KeyboardEvent;
  const void *v4;
  timespec v5;

  SASHIDGetCurrentTime();
  KeyboardEvent = (const void *)IOHIDEventCreateKeyboardEvent();
  IOHIDEventSetIntegerValue();
  -[SASHIDGenerator _sendHIDEvent:](self, "_sendHIDEvent:", KeyboardEvent, xmmword_215D70720);
  CFRelease(KeyboardEvent);
  nanosleep(&v5, 0);
  v4 = (const void *)IOHIDEventCreateKeyboardEvent();
  IOHIDEventSetIntegerValue();
  -[SASHIDGenerator _sendHIDEvent:](self, "_sendHIDEvent:", v4);
  CFRelease(v4);
}

- (void)_sendHIDEvent:(__IOHIDEvent *)a3
{
  if (a3)
  {
    if (!self->_ioSystemClient)
      self->_ioSystemClient = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate();
    IOHIDEventSystemClientDispatchEvent();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generatorQueue, 0);
}

@end

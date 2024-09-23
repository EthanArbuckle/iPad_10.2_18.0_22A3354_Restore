@implementation SignpostStreamEvent(LoggingSupport)

- (void)initWithOSLogEventProxy:()LoggingSupport timebaseRatio:shouldCompose:serialNumber:shouldCollectFrameInfo:timeoutInSec:timeoutHandlingQueue:timeoutHandlingBlock:
{
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  void *v20;
  dispatch_source_t v21;
  NSObject *v22;
  dispatch_time_t v23;
  NSObject *v24;
  NSObject *v25;
  _QWORD handler[4];
  id v28;
  id v29;
  id location;
  objc_super v31;

  v16 = a4;
  v17 = a9;
  v18 = a10;
  v31.receiver = a1;
  v31.super_class = (Class)&off_254B661C0;
  v19 = objc_msgSendSuper2(&v31, sel_initWithOSLogEventProxy_timebaseRatio_shouldCompose_, v16, a5, a2);
  v20 = v19;
  if (v19)
  {
    objc_msgSend(v19, "setSerialNumber:", a6);
    if (a8)
    {
      if (!objc_msgSend(v20, "eventType"))
      {
        v21 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v17);
        objc_msgSend(v20, "setTimeoutSource:", v21);

        objc_msgSend(v20, "timeoutSource");
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = dispatch_time(0, 1000000000 * a8);
        dispatch_source_set_timer(v22, v23, 0xFFFFFFFFFFFFFFFFLL, 0);

        objc_initWeak(&location, v20);
        objc_msgSend(v20, "timeoutSource");
        v24 = objc_claimAutoreleasedReturnValue();
        handler[0] = MEMORY[0x24BDAC760];
        handler[1] = 3221225472;
        handler[2] = __182__SignpostStreamEvent_LoggingSupport__initWithOSLogEventProxy_timebaseRatio_shouldCompose_serialNumber_shouldCollectFrameInfo_timeoutInSec_timeoutHandlingQueue_timeoutHandlingBlock___block_invoke;
        handler[3] = &unk_24CE7A638;
        v28 = v18;
        objc_copyWeak(&v29, &location);
        dispatch_source_set_event_handler(v24, handler);

        objc_msgSend(v20, "timeoutSource");
        v25 = objc_claimAutoreleasedReturnValue();
        dispatch_resume(v25);

        objc_destroyWeak(&v29);
        objc_destroyWeak(&location);
      }
    }
  }

  return v20;
}

@end

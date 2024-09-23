@implementation UIViewController(SUTransitionSafety)

+ (uint64_t)_iTunesStoreUI_dequeueTransitionSafeInvocations
{
  uint64_t result;
  uint64_t v2;
  uint64_t v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "endIgnoringInteractionEvents");
  if (__TransitionSafetyTimer)
  {
    dispatch_source_cancel((dispatch_source_t)__TransitionSafetyTimer);
    dispatch_release((dispatch_object_t)__TransitionSafetyTimer);
    __TransitionSafetyTimer = 0;
  }
  result = objc_msgSend((id)__TransitionSafetyInvocations, "count");
  if (result >= 1 && __TransitionSafetyCount == 0)
  {
    v2 = result;
    v3 = 1;
    do
    {
      objc_msgSend((id)objc_msgSend((id)__TransitionSafetyInvocations, "objectAtIndex:", 0), "invoke");
      result = objc_msgSend((id)__TransitionSafetyInvocations, "removeObjectAtIndex:", 0);
      if (v3 >= v2)
        break;
      ++v3;
    }
    while (!__TransitionSafetyCount);
  }
  return result;
}

+ (void)_iTunesStoreUI_enqueueTransitionSafeInvocation:()SUTransitionSafety
{
  id v4;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  dispatch_time_t v8;

  if (__TransitionSafetyCount)
  {
    v4 = (id)__TransitionSafetyInvocations;
    if (!__TransitionSafetyInvocations)
    {
      v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      __TransitionSafetyInvocations = (uint64_t)v4;
    }
    objc_msgSend(v4, "addObject:", a3);
    v5 = __TransitionSafetyTimer;
    if (__TransitionSafetyTimer)
    {
      v6 = dispatch_time(0, 1000000000);
      dispatch_source_set_timer(v5, v6, 0, 0);
    }
    else
    {
      v7 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
      __TransitionSafetyTimer = (uint64_t)v7;
      v8 = dispatch_time(0, 1000000000);
      dispatch_source_set_timer(v7, v8, 0, 0);
      dispatch_source_set_event_handler((dispatch_source_t)__TransitionSafetyTimer, &__block_literal_global_5);
      dispatch_resume((dispatch_object_t)__TransitionSafetyTimer);
    }
  }
  else
  {
    objc_msgSend(a3, "invoke");
  }
}

+ (void)_iTunesStoreUI_timeoutTransitionSafety
{
  void *v2;
  int v3;
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (__TransitionSafetyTimer)
  {
    dispatch_source_cancel((dispatch_source_t)__TransitionSafetyTimer);
    dispatch_release((dispatch_object_t)__TransitionSafetyTimer);
    __TransitionSafetyTimer = 0;
  }
  if (__TransitionSafetyCount >= 1)
  {
    v2 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v3 = objc_msgSend(v2, "shouldLog");
    if (objc_msgSend(v2, "shouldLogToDisk"))
      v4 = v3 | 2;
    else
      v4 = v3;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v2, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v4 &= 2u;
    if (v4)
    {
      v10 = 138412546;
      v11 = objc_opt_class();
      v12 = 2048;
      v13 = __TransitionSafetyCount;
      LODWORD(v9) = 22;
      v8 = &v10;
      v5 = _os_log_send_and_compose_impl();
      if (v5)
      {
        v6 = (void *)v5;
        v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v5, 4, &v10, v9);
        free(v6);
        v8 = (int *)v7;
        SSFileLog();
      }
    }
    if (__TransitionSafetyCount >= 1)
    {
      do
        objc_msgSend(a1, "endTransitionSafety", v8);
      while (__TransitionSafetyCount > 0);
    }
  }
}

+ (void)beginTransitionSafety
{
  ++__TransitionSafetyCount;
}

+ (uint64_t)endTransitionSafety
{
  BOOL v1;
  void *v2;

  v1 = __TransitionSafetyCount == 1;
  if (__TransitionSafetyCount >= 1)
  {
    --__TransitionSafetyCount;
    if (v1)
    {
      v2 = (void *)result;
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "beginIgnoringInteractionEvents");
      return objc_msgSend(v2, "performSelector:withObject:afterDelay:", sel__iTunesStoreUI_dequeueTransitionSafeInvocations, 0, 0.0);
    }
  }
  return result;
}

+ (SUTransitionSafetyInvocationRecorder)transitionSafePerformer:()SUTransitionSafety
{
  if (a3)
    return -[ISInvocationRecorder initWithTarget:]([SUTransitionSafetyInvocationRecorder alloc], "initWithTarget:", a3);
  else
    return 0;
}

+ (SUTransitionSafetyDelegate)transitionSafetyDelegate
{
  SUTransitionSafetyDelegate *result;

  result = (SUTransitionSafetyDelegate *)__TransitionSafetyDelegate;
  if (!__TransitionSafetyDelegate)
  {
    result = objc_alloc_init(SUTransitionSafetyDelegate);
    __TransitionSafetyDelegate = (uint64_t)result;
  }
  return result;
}

- (uint64_t)transitionSafePresentModalViewController:()SUTransitionSafety animated:
{
  if (objc_msgSend(a1, "presentedViewController"))
    objc_msgSend(a1, "dismissViewControllerAnimated:completion:", a4, 0);
  return objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "transitionSafePerformer:", a1), "presentViewController:animated:completion:", a3, 1, 0);
}

@end

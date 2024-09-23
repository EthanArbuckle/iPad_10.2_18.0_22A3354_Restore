@implementation RCPPlayerDisplayLinkWaiter

+ (void)wait
{
  id v2;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "_wait");

}

- (void)_wait
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__stop_);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addToRunLoop:forMode:", v2, CFSTR("RecapDisplayLinkWaitMode"));
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "runMode:beforeDate:", CFSTR("RecapDisplayLinkWaitMode"), v3);

}

- (void)_stop:(id)a3
{
  objc_msgSend(a3, "invalidate");
}

@end

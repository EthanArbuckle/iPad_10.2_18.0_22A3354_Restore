@implementation TSUMemoryWatcher

- (TSUMemoryWatcher)initWithFlushingManager:(id)a3
{
  TSUMemoryWatcher *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSUMemoryWatcher;
  result = -[TSUMemoryWatcher init](&v5, sel_init);
  if (result)
    result->_flushingManager = (TSUFlushingManager *)a3;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[TSUMemoryWatcher stopObserving](self, "stopObserving");
  v3.receiver = self;
  v3.super_class = (Class)TSUMemoryWatcher;
  -[TSUMemoryWatcher dealloc](&v3, sel_dealloc);
}

- (void)beginObserving
{
  uint64_t v3;

  if (!self->_going)
  {
    *(_WORD *)&self->_going = 1;
    v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "integerForKey:", CFSTR("TSUSimulateMemoryWarningsEvery"));
    if (v3 >= 1)
      objc_msgSend(MEMORY[0x24BDD17F0], "detachNewThreadSelector:toTarget:withObject:", sel__periodicallySimulateMemoryWarning_, self, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v3));
  }
}

- (void)stopObserving
{
  self->_stop = 1;
}

- (void)_periodicallySimulateMemoryWarning:(id)a3
{
  void *v5;
  uint64_t v6;

  v5 = (void *)objc_opt_new();
  v6 = objc_msgSend(a3, "integerValue");
  NSLog((NSString *)CFSTR("%@ enabled, simulating UIKit memory warning every %ld seconds"), CFSTR("TSUSimulateMemoryWarningsEvery"), v6);
  while (!self->_stop)
  {
    objc_msgSend(v5, "drain");
    v5 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDD17F0], "sleepForTimeInterval:", (double)v6);
    -[TSUMemoryWatcher performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__simulateMemoryWarning_, 0, 1);
  }
  objc_msgSend(v5, "drain");
}

- (void)_simulateMemoryWarning:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3);
  objc_msgSend(v3, "postNotificationName:object:", *MEMORY[0x24BDF7538], objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"));
}

@end

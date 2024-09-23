@implementation SUDelayedQuitController

- (void)dealloc
{
  objc_super v3;

  self->_longLivedViewControllers = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUDelayedQuitController;
  -[SUDelayedQuitController dealloc](&v3, sel_dealloc);
}

+ (id)sharedInstance
{
  pthread_once(&sharedInstance_sInstanceGuard, (void (*)(void))_create_shared_instance);
  return (id)__SharedInstance_4;
}

+ (void)checkInLongLivedViewController:(id)a3
{
  -[SUDelayedQuitController _checkInLongLivedViewController:](+[SUDelayedQuitController sharedInstance](SUDelayedQuitController, "sharedInstance"), "_checkInLongLivedViewController:", a3);
}

+ (void)checkOutLongLivedViewController:(id)a3
{
  -[SUDelayedQuitController _checkOutLongLivedViewController:](+[SUDelayedQuitController sharedInstance](SUDelayedQuitController, "sharedInstance"), "_checkOutLongLivedViewController:", a3);
}

+ (BOOL)viewControllerIsLongLived:(id)a3
{
  return -[SUDelayedQuitController _viewControllerIsLongLived:](+[SUDelayedQuitController sharedInstance](SUDelayedQuitController, "sharedInstance"), "_viewControllerIsLongLived:", a3);
}

+ (id)checkedInViewControllerOfClass:(Class)a3
{
  return -[SUDelayedQuitController _checkedInViewControllerOfClass:](+[SUDelayedQuitController sharedInstance](SUDelayedQuitController, "sharedInstance"), "_checkedInViewControllerOfClass:", a3);
}

+ (BOOL)isDelayingTerminate
{
  return -[SUDelayedQuitController _isDelayingTerminate](+[SUDelayedQuitController sharedInstance](SUDelayedQuitController, "sharedInstance"), "_isDelayingTerminate");
}

+ (void)beginDelayingTerminate
{
  objc_msgSend((id)-[SUDelayedQuitController mainThreadProxy](+[SUDelayedQuitController sharedInstance](SUDelayedQuitController, "sharedInstance"), "mainThreadProxy"), "_beginDelayingTerminate");
}

+ (void)endDelayingTerminate
{
  objc_msgSend((id)-[SUDelayedQuitController mainThreadProxy](+[SUDelayedQuitController sharedInstance](SUDelayedQuitController, "sharedInstance"), "mainThreadProxy"), "_endDelayingTerminate");
}

- (void)_beginDelayingTerminate
{
  ++self->_delayTerminateCount;
}

- (void)_checkInLongLivedViewController:(id)a3
{
  NSMutableArray *longLivedViewControllers;

  longLivedViewControllers = self->_longLivedViewControllers;
  if (!longLivedViewControllers)
  {
    longLivedViewControllers = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_longLivedViewControllers = longLivedViewControllers;
  }
  if ((-[NSMutableArray containsObject:](longLivedViewControllers, "containsObject:", a3) & 1) == 0)
  {
    -[NSMutableArray addObject:](self->_longLivedViewControllers, "addObject:", a3);
    -[SUDelayedQuitController _beginDelayingTerminate](self, "_beginDelayingTerminate");
  }
}

- (void)_checkOutLongLivedViewController:(id)a3
{
  NSMutableArray *longLivedViewControllers;
  id v6;

  longLivedViewControllers = self->_longLivedViewControllers;
  if (longLivedViewControllers)
  {
    if (-[NSMutableArray containsObject:](longLivedViewControllers, "containsObject:"))
    {
      v6 = a3;
      -[NSMutableArray removeObject:](self->_longLivedViewControllers, "removeObject:", a3);
      objc_msgSend((id)-[SUDelayedQuitController mainThreadProxy](self, "mainThreadProxy"), "_endDelayingTerminate");
    }
  }
}

- (id)_checkedInViewControllerOfClass:(Class)a3
{
  NSMutableArray *longLivedViewControllers;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  longLivedViewControllers = self->_longLivedViewControllers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](longLivedViewControllers, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = *(_QWORD *)v11;
LABEL_3:
  v7 = 0;
  while (1)
  {
    if (*(_QWORD *)v11 != v6)
      objc_enumerationMutation(longLivedViewControllers);
    v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return v8;
    if (v5 == ++v7)
    {
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](longLivedViewControllers, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        goto LABEL_3;
      return 0;
    }
  }
}

- (void)_endDelayingTerminate
{
  int64_t delayTerminateCount;
  BOOL v3;
  int64_t v4;
  void *v6;
  void *v7;

  delayTerminateCount = self->_delayTerminateCount;
  v3 = delayTerminateCount < 1;
  v4 = delayTerminateCount - 1;
  if (!v3)
  {
    self->_delayTerminateCount = v4;
    v6 = (void *)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    if (!self->_delayTerminateCount)
    {
      v7 = v6;
      if (objc_msgSend(v6, "isSuspended"))
      {
        if ((objc_msgSend(v7, "isSuspendedEventsOnly") & 1) == 0)
          objc_msgSend(v7, "terminateWithSuccess");
      }
    }
  }
}

- (BOOL)_isDelayingTerminate
{
  return self->_delayTerminateCount > 0;
}

- (BOOL)_viewControllerIsLongLived:(id)a3
{
  return -[NSMutableArray containsObject:](self->_longLivedViewControllers, "containsObject:", a3);
}

@end

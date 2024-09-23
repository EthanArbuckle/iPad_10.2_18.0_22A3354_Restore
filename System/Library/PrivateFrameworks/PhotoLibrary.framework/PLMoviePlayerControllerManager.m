@implementation PLMoviePlayerControllerManager

- (PLMoviePlayerControllerManager)init
{
  PLMoviePlayerControllerManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PLMoviePlayerControllerManager;
  v2 = -[PLMoviePlayerControllerManager init](&v4, sel_init);
  if (v2)
    v2->_playerStack = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLMoviePlayerControllerManager;
  -[PLMoviePlayerControllerManager dealloc](&v3, sel_dealloc);
}

- (void)moveControllerToTopOfStack:(id)a3
{
  id v5;

  v5 = (id)-[NSMutableArray lastObject](self->_playerStack, "lastObject");
  if (v5 != a3)
  {
    objc_msgSend(v5, "willResignAsActiveController");
    -[NSMutableArray removeObject:](self->_playerStack, "removeObject:", a3);
    -[NSMutableArray addObject:](self->_playerStack, "addObject:", a3);
    objc_msgSend(a3, "didBecomeActiveController");
  }
}

- (void)removeControllerFromStack:(id)a3
{
  void *v5;

  if ((id)-[NSMutableArray lastObject](self->_playerStack, "lastObject") == a3)
  {
    objc_msgSend(a3, "willResignAsActiveController");
    -[NSMutableArray removeObject:](self->_playerStack, "removeObject:", a3);
    v5 = (void *)-[NSMutableArray lastObject](self->_playerStack, "lastObject");
    if (v5)
      objc_msgSend(v5, "didBecomeActiveController");
  }
  else
  {
    -[NSMutableArray removeObject:](self->_playerStack, "removeObject:", a3);
  }
}

+ (id)sharedInstance
{
  pl_dispatch_once();
  return (id)sharedInstance___manager;
}

PLMoviePlayerControllerManager *__48__PLMoviePlayerControllerManager_sharedInstance__block_invoke()
{
  PLMoviePlayerControllerManager *result;

  result = objc_alloc_init(PLMoviePlayerControllerManager);
  sharedInstance___manager = (uint64_t)result;
  return result;
}

@end

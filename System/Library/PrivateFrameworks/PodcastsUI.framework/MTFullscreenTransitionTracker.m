@implementation MTFullscreenTransitionTracker

- (MTFullscreenTransitionTracker)init
{
  MTFullscreenTransitionTracker *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTFullscreenTransitionTracker;
  v2 = -[MTFullscreenTransitionTracker init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTFullscreenTransitionTracker setPendingBlocks:](v2, "setPendingBlocks:", v3);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_willBeginTransition_, CFSTR("NSWindowWillEnterFullScreenNotification"), 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_didFinishTransition_, CFSTR("NSWindowDidEnterFullScreenNotification"), 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_willBeginTransition_, CFSTR("NSWindowWillExitFullScreenNotification"), 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_didFinishTransition_, CFSTR("NSWindowDidExitFullScreenNotification"), 0);

  }
  return v2;
}

+ (BOOL)isTransitioning
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__MTFullscreenTransitionTracker_isTransitioning__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isTransitioning_onceToken != -1)
    dispatch_once(&isTransitioning_onceToken, block);
  return objc_msgSend((id)tracker, "isTransitioning");
}

void __48__MTFullscreenTransitionTracker_isTransitioning__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)tracker;
  tracker = (uint64_t)v1;

}

+ (void)performAfterTransitioning:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v3 = (void *)tracker;
    v4 = a3;
    objc_msgSend(v3, "pendingBlocks");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = _Block_copy(v4);

    objc_msgSend(v6, "addObject:", v5);
  }
}

- (void)willBeginTransition:(id)a3
{
  objc_msgSend((id)tracker, "setIsTransitioning:", 1);
}

- (void)didFinishTransition:(id)a3
{
  id v4;

  objc_msgSend((id)tracker, "setIsTransitioning:", 0);
  v4 = (id)-[NSMutableArray copy](self->_pendingBlocks, "copy");
  -[NSMutableArray removeAllObjects](self->_pendingBlocks, "removeAllObjects");
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &__block_literal_global_2);

}

uint64_t __53__MTFullscreenTransitionTracker_didFinishTransition___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (BOOL)isTransitioning
{
  return self->_isTransitioning;
}

- (void)setIsTransitioning:(BOOL)a3
{
  self->_isTransitioning = a3;
}

- (NSMutableArray)pendingBlocks
{
  return self->_pendingBlocks;
}

- (void)setPendingBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_pendingBlocks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingBlocks, 0);
}

@end

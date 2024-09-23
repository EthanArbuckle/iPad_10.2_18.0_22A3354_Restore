@implementation WBSPrivateRelayFailClosedExceptionManager

+ (WBSPrivateRelayFailClosedExceptionManager)sharedManager
{
  if (+[WBSPrivateRelayFailClosedExceptionManager sharedManager]::onceToken != -1)
    dispatch_once(&+[WBSPrivateRelayFailClosedExceptionManager sharedManager]::onceToken, &__block_literal_global_83);
  return (WBSPrivateRelayFailClosedExceptionManager *)(id)+[WBSPrivateRelayFailClosedExceptionManager sharedManager]::manager;
}

void __58__WBSPrivateRelayFailClosedExceptionManager_sharedManager__block_invoke()
{
  WBSPrivateRelayFailClosedExceptionManager *v0;
  void *v1;

  v0 = objc_alloc_init(WBSPrivateRelayFailClosedExceptionManager);
  v1 = (void *)+[WBSPrivateRelayFailClosedExceptionManager sharedManager]::manager;
  +[WBSPrivateRelayFailClosedExceptionManager sharedManager]::manager = (uint64_t)v0;

}

- (WBSPrivateRelayFailClosedExceptionManager)init
{
  WBSPrivateRelayFailClosedExceptionManager *v2;
  uint64_t v3;
  NSMutableSet *privateRelayFailClosedExceptions;
  uint64_t v5;
  NSMutableSet *clearedExceptionsForBrowsingSession;
  WBSPrivateRelayFailClosedExceptionManager *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WBSPrivateRelayFailClosedExceptionManager;
  v2 = -[WBSPrivateRelayFailClosedExceptionManager init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    privateRelayFailClosedExceptions = v2->_privateRelayFailClosedExceptions;
    v2->_privateRelayFailClosedExceptions = (NSMutableSet *)v3;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    clearedExceptionsForBrowsingSession = v2->_clearedExceptionsForBrowsingSession;
    v2->_clearedExceptionsForBrowsingSession = (NSMutableSet *)v5;

    v7 = v2;
  }

  return v2;
}

- (void)rememberPrivateRelayFailClosedExceptionForURL:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
  {
    -[NSMutableSet removeObject:](self->_clearedExceptionsForBrowsingSession, "removeObject:", v4);
    -[NSMutableSet addObject:](self->_privateRelayFailClosedExceptions, "addObject:", v4);
  }

}

- (BOOL)shouldPrivateRelayFailClosedExceptionApplyForURL:(id)a3
{
  return -[NSMutableSet containsObject:](self->_privateRelayFailClosedExceptions, "containsObject:", a3);
}

- (void)clearPrivateRelayFailClosedExceptionIfNecessaryForURL:(id)a3
{
  id v4;

  v4 = a3;
  if (v4 && (-[NSMutableSet containsObject:](self->_privateRelayFailClosedExceptions, "containsObject:", v4) & 1) != 0)
  {
    -[NSMutableSet removeObject:](self->_privateRelayFailClosedExceptions, "removeObject:", v4);
    -[NSMutableSet addObject:](self->_clearedExceptionsForBrowsingSession, "addObject:", v4);
  }

}

- (BOOL)wasExceptionClearedForCurrentBrowsingSession:(id)a3
{
  return -[NSMutableSet containsObject:](self->_clearedExceptionsForBrowsingSession, "containsObject:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clearedExceptionsForBrowsingSession, 0);
  objc_storeStrong((id *)&self->_privateRelayFailClosedExceptions, 0);
}

@end

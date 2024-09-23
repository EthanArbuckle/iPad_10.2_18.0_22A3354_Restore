@implementation _UIViewBackingObserver

+ (id)sharedObserver
{
  if (qword_1ECD7DDB8 != -1)
    dispatch_once(&qword_1ECD7DDB8, &__block_literal_global_241);
  return (id)_MergedGlobals_1060;
}

- (void)observe:(id)a3 forKeyPath:(id)a4 once:(id)a5
{
  id v8;
  id v9;
  id v10;
  _UIViewBackingObserver *v11;
  void *v12;
  _UIViewBackingObserver *v13;
  id v14;
  void *v15;
  id observerBlock;
  _QWORD v17[5];
  _UIViewBackingObserver *v18;
  id v19;

  v8 = a5;
  if (self->_observerBlock)
  {
    v9 = a4;
    v10 = a3;
    v11 = objc_alloc_init(_UIViewBackingObserver);
    -[_UIViewBackingObserver additionalObservers](self, "additionalObservers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v11);

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __50___UIViewBackingObserver_observe_forKeyPath_once___block_invoke;
    v17[3] = &unk_1E16BAD68;
    v17[4] = self;
    v18 = v11;
    v19 = v8;
    v13 = v11;
    -[_UIViewBackingObserver observe:forKeyPath:once:](v13, "observe:forKeyPath:once:", v10, v9, v17);

  }
  else
  {
    v14 = a4;
    v13 = (_UIViewBackingObserver *)a3;
    v15 = _Block_copy(v8);
    observerBlock = self->_observerBlock;
    self->_observerBlock = v15;

    -[_UIViewBackingObserver addObserver:forKeyPath:options:context:](v13, "addObserver:forKeyPath:options:context:", self, v14, 0, &_UIViewBackingObserverContext);
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id observerBlock;
  void (**v8)(void);

  if (a6 == &_UIViewBackingObserverContext)
  {
    objc_msgSend(a4, "removeObserver:forKeyPath:context:", self, a3, &_UIViewBackingObserverContext);
    v8 = (void (**)(void))_Block_copy(self->_observerBlock);
    observerBlock = self->_observerBlock;
    self->_observerBlock = 0;

    v8[2]();
  }
}

- (id)additionalBlocks
{
  NSMutableSet *additionalObservers;
  NSMutableSet *v4;
  NSMutableSet *v5;

  additionalObservers = self->_additionalObservers;
  if (!additionalObservers)
  {
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v5 = self->_additionalObservers;
    self->_additionalObservers = v4;

    additionalObservers = self->_additionalObservers;
  }
  return additionalObservers;
}

- (id)observerBlock
{
  return self->_observerBlock;
}

- (void)setObserverBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSMutableSet)additionalObservers
{
  return self->_additionalObservers;
}

- (void)setAdditionalObservers:(id)a3
{
  objc_storeStrong((id *)&self->_additionalObservers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalObservers, 0);
  objc_storeStrong(&self->_observerBlock, 0);
}

@end

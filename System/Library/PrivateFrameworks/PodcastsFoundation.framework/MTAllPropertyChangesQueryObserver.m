@implementation MTAllPropertyChangesQueryObserver

void __52__MTAllPropertyChangesQueryObserver_notifyObservers__block_invoke(uint64_t a1, int a2, void *aBlock)
{
  id v4;

  v4 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "results:", v4);

}

- (void)startObserving
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTAllPropertyChangesQueryObserver;
  -[MTBaseQueryObserver startObserving](&v3, sel_startObserving);
  -[MTAllPropertyChangesQueryObserver notifyObservers](self, "notifyObservers");
}

- (void)notifyObservers
{
  void *v3;
  _QWORD v4[5];

  if (!self->_inCallback)
  {
    self->_inCallback = 1;
    -[MTBaseQueryObserver handlers](self, "handlers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __52__MTAllPropertyChangesQueryObserver_notifyObservers__block_invoke;
    v4[3] = &unk_1E54D3AC8;
    v4[4] = self;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v4);

    self->_inCallback = 0;
  }
}

- (id)addResultsChangedHandler:(id)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v4 = _Block_copy(a3);
  v7.receiver = self;
  v7.super_class = (Class)MTAllPropertyChangesQueryObserver;
  -[MTBaseQueryObserver addResultsChangedHandler:](&v7, sel_addResultsChangedHandler_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)controllerDidChangeContent:(id)a3
{
  void *v4;

  objc_msgSend(a3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[MTAllPropertyChangesQueryObserver notifyObservers](self, "notifyObservers");
}

@end

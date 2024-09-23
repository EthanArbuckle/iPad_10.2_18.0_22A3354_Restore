@implementation PKPaymentOptionsSynchronization

+ (BOOL)shouldSyncToCloud
{
  void *v2;
  BOOL v3;

  PKCurrentRegion();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("CN")) != 0;

  return v3;
}

- (PKPaymentOptionsSynchronization)init
{
  PKPaymentOptionsSynchronization *v2;
  PKPaymentOptionsSynchronization *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentOptionsSynchronization;
  v2 = -[PKPaymentOptionsSynchronization init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PKPaymentOptionsSynchronization _updateSynchronizationBehavior](v2, "_updateSynchronizationBehavior");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__localeDidChangeNotification_, *MEMORY[0x1E0C99720], 0);

  }
  return v3;
}

- (void)_updateSynchronizationBehavior
{
  int shouldSyncToCloud;
  int v4;
  id WeakRetained;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  shouldSyncToCloud = self->_shouldSyncToCloud;
  v4 = objc_msgSend((id)objc_opt_class(), "shouldSyncToCloud");
  self->_shouldSyncToCloud = v4;
  if (shouldSyncToCloud != v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = WeakRetained;
    if (WeakRetained)
    {
      v9 = WeakRetained;
      v7 = objc_opt_respondsToSelector();
      v6 = v9;
      if ((v7 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldSyncToCloud);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "performSelector:withObject:", sel_optionsSynchronizationDidChangeTo_, v8);

        v6 = v9;
      }
    }

  }
}

- (BOOL)shouldSyncToCloud
{
  return self->_shouldSyncToCloud;
}

- (void)setShouldSyncToCloud:(BOOL)a3
{
  self->_shouldSyncToCloud = a3;
}

- (PKPaymentOptionsSynchronizationDelegate)delegate
{
  return (PKPaymentOptionsSynchronizationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end

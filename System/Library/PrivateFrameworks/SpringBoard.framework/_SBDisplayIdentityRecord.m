@implementation _SBDisplayIdentityRecord

- (_SBDisplayIdentityRecord)initWithIdentity:(id)a3 connectedAtInit:(BOOL)a4
{
  id v7;
  _SBDisplayIdentityRecord *v8;
  _SBDisplayIdentityRecord *v9;
  BSAtomicSignal *v10;
  BSAtomicSignal *invalidationSignal;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_SBDisplayIdentityRecord;
  v8 = -[_SBDisplayIdentityRecord init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_displayIdentity, a3);
    v9->_connectedAtInit = a4;
    v10 = (BSAtomicSignal *)objc_alloc_init(MEMORY[0x1E0D016C0]);
    invalidationSignal = v9->_invalidationSignal;
    v9->_invalidationSignal = v10;

  }
  return v9;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if ((-[BSAtomicSignal hasBeenSignalled](self->_invalidationSignal, "hasBeenSignalled") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayManager.m"), 703, CFSTR("must invalidate before dealloc: %@"), self);

  }
  -[BSAtomicSignal signal](self->_invalidationSignal, "signal");
  v5.receiver = self;
  v5.super_class = (Class)_SBDisplayIdentityRecord;
  -[_SBDisplayIdentityRecord dealloc](&v5, sel_dealloc);
}

- (BOOL)isValid
{
  return -[BSAtomicSignal hasBeenSignalled](self->_invalidationSignal, "hasBeenSignalled") ^ 1;
}

- (void)invalidate
{
  -[BSAtomicSignal signal](self->_invalidationSignal, "signal");
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _SBDisplayIdentityRecord *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57___SBDisplayIdentityRecord_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E8E9E820;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", self, v6);

}

- (FBSDisplayIdentity)displayIdentity
{
  return self->_displayIdentity;
}

- (BOOL)didConnectAtInit
{
  return self->_connectedAtInit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayIdentity, 0);
  objc_storeStrong((id *)&self->_invalidationSignal, 0);
}

@end

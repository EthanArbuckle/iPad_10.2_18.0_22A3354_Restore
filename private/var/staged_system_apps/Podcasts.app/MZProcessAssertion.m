@implementation MZProcessAssertion

- (MZProcessAssertion)initWithExpirationBlock:(id)a3 debugDescription:(id)a4
{
  id v6;
  id v7;
  MZProcessAssertion *v8;
  uint64_t v9;
  id v10;
  id expirationBlock;
  __CFString *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  RBSAssertion *v18;
  RBSAssertion *systemAssertion;
  objc_super v21;
  void *v22;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)MZProcessAssertion;
  v8 = -[MZProcessAssertion init](&v21, "init");
  if (v8)
  {
    if (qword_100567400 != -1)
      dispatch_once(&qword_100567400, &stru_1004A94F8);
    os_unfair_lock_lock((os_unfair_lock_t)&dword_1005673F8);
    v9 = ++qword_1005511B8;
    os_unfair_lock_unlock((os_unfair_lock_t)&dword_1005673F8);
    v8->_identifier = v9;
    v10 = objc_msgSend(v6, "copy");
    expirationBlock = v8->_expirationBlock;
    v8->_expirationBlock = v10;

    if (objc_msgSend(v7, "length"))
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("-%@"), v7));
    else
      v12 = &stru_1004C6D40;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.podcasts.storebookkeeper-%@"), v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[RBSDomainAttribute attributeWithDomain:name:](RBSDomainAttribute, "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("FinishTaskInterruptable")));
    v15 = objc_alloc((Class)RBSAssertion);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[RBSTarget currentProcess](RBSTarget, "currentProcess"));
    v22 = v14;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
    v18 = (RBSAssertion *)objc_msgSend(v15, "initWithExplanation:target:attributes:", v13, v16, v17);
    systemAssertion = v8->_systemAssertion;
    v8->_systemAssertion = v18;

    -[RBSAssertion addObserver:](v8->_systemAssertion, "addObserver:", v8);
    -[RBSAssertion acquireWithInvalidationHandler:](v8->_systemAssertion, "acquireWithInvalidationHandler:", &stru_1004A94D8);
    v8->_lock._os_unfair_lock_opaque = 0;

  }
  return v8;
}

- (NSString)description
{
  NSString *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MZProcessAssertion;
  v3 = -[MZProcessAssertion description](&v7, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, assertionID = %lu"), v4, self->_identifier));

  return (NSString *)v5;
}

- (void)dealloc
{
  objc_super v3;

  -[MZProcessAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MZProcessAssertion;
  -[MZProcessAssertion dealloc](&v3, "dealloc");
}

- (void)_withLockSetAssertion:(id)a3
{
  id v5;
  RBSAssertion **p_systemAssertion;
  RBSAssertion *v7;
  dispatch_time_t v8;
  RBSAssertion *v9;
  _QWORD block[4];
  RBSAssertion *v11;

  v5 = a3;
  p_systemAssertion = &self->_systemAssertion;
  if ((-[RBSAssertion isEqual:](self->_systemAssertion, "isEqual:", v5) & 1) == 0)
  {
    v7 = *p_systemAssertion;
    objc_storeStrong((id *)&self->_systemAssertion, a3);
    if (*p_systemAssertion)
      -[RBSAssertion addObserver:](*p_systemAssertion, "addObserver:", self);
    -[RBSAssertion removeObserver:](v7, "removeObserver:", self);
    v8 = dispatch_time(0, 500000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B0D9C;
    block[3] = &unk_1004A6200;
    v11 = v7;
    v9 = v7;
    dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (void)setSystemAssertion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[MZProcessAssertion _withLockSetAssertion:](self, "_withLockSetAssertion:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (RBSAssertion)systemAssertion
{
  os_unfair_lock_s *p_lock;
  RBSAssertion *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_systemAssertion;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)assertionWillInvalidate:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  void *v6;
  void (**v7)(_QWORD);

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_systemAssertion
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZProcessAssertion expirationBlock](self, "expirationBlock")),
        v5,
        v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MZProcessAssertion expirationBlock](self, "expirationBlock"));
    v7 = (void (**)(_QWORD))objc_msgSend(v6, "copy");

    -[MZProcessAssertion setExpirationBlock:](self, "setExpirationBlock:", 0);
    os_unfair_lock_unlock(p_lock);
    if (v7)
    {
      v7[2](v7);

    }
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_systemAssertion)
    -[MZProcessAssertion _withLockSetAssertion:](self, "_withLockSetAssertion:", 0);
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (id)expirationBlock
{
  return self->_expirationBlock;
}

- (void)setExpirationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)explanation
{
  return self->_explanation;
}

- (void)setExplanation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explanation, 0);
  objc_storeStrong(&self->_expirationBlock, 0);
  objc_storeStrong((id *)&self->_systemAssertion, 0);
}

@end

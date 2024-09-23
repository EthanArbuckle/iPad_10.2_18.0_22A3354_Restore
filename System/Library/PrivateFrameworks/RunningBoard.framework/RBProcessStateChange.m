@implementation RBProcessStateChange

- (RBProcessState)updatedState
{
  return self->_updatedState;
}

- (RBProcessState)originalState
{
  return self->_originalState;
}

- (RBSProcessIdentity)identity
{
  return self->_identity;
}

- (RBProcessStateChange)initWithIdentity:(id)a3 originalState:(id)a4 updatedState:(id)a5
{
  id v9;
  id v10;
  id v11;
  RBProcessStateChange *v12;
  RBProcessStateChange *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)RBProcessStateChange;
  v12 = -[RBProcessStateChange init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identity, a3);
    objc_storeStrong((id *)&v13->_originalState, a4);
    objc_storeStrong((id *)&v13->_updatedState, a5);
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedState, 0);
  objc_storeStrong((id *)&self->_originalState, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

- (id)changeByApplyingChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  RBProcessState *originalState;
  void *v8;
  BOOL v9;
  RBProcessStateChange *v10;

  v4 = a3;
  objc_msgSend(v4, "updatedState");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  originalState = self->_originalState;
  if (originalState == (RBProcessState *)v5
    || v5
    && originalState
    && (objc_msgSend(v4, "updatedState"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = -[RBProcessState isEqual:](originalState, "isEqual:", v8),
        v8,
        v9))
  {
    v10 = 0;
  }
  else
  {
    v10 = -[RBProcessStateChange initWithIdentity:originalState:updatedState:]([RBProcessStateChange alloc], "initWithIdentity:originalState:updatedState:", self->_identity, self->_originalState, v6);
  }

  return v10;
}

@end

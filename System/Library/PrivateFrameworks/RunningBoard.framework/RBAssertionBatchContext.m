@implementation RBAssertionBatchContext

- (RBProcess)process
{
  return self->_process;
}

- (unint64_t)acquisitionPolicy
{
  return self->_acquisitionPolicy;
}

- (void)setHoldToken:(id)a3
{
  objc_storeStrong(&self->_holdToken, a3);
}

+ (id)contextForProcess:(id)a3 withDescriptorsToAcquire:(id)a4 identifiersToInvalidate:(id)a5 daemonContext:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
LABEL_18:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("RBAssertionState.m"), 262, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("descriptors"));

    if (v13)
      goto LABEL_4;
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("RBAssertionState.m"), 261, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("process"));

  if (!v12)
    goto LABEL_18;
LABEL_3:
  if (v13)
    goto LABEL_4;
LABEL_19:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("RBAssertionState.m"), 263, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifiers"));

LABEL_4:
  v29 = v13;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v15 = v12;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v16)
  {
    v17 = v16;
    v18 = 0;
    v19 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v31 != v19)
          objc_enumerationMutation(v15);
        +[RBAssertionAcquisitionContext contextForProcess:withDescriptor:daemonContext:](RBAssertionAcquisitionContext, "contextForProcess:withDescriptor:daemonContext:", v11, *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i), v14);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "acquisitionPolicy");
        if (v22 > v18)
        {
          v23 = v22;
          if (RBSAcquisitionCompletionPolicyIsValid())
            v18 = v23;
        }

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v17);
  }
  else
  {
    v18 = 0;
  }

  objc_msgSend(a1, "contextForProcess:acquisitionCompletionPolicy:withDescriptorsToAcquire:identifiersToInvalidate:daemonContext:", v11, v18, v15, v29, v14);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (id)contextForProcess:(id)a3 acquisitionCompletionPolicy:(unint64_t)a4 withDescriptorsToAcquire:(id)a5 identifiersToInvalidate:(id)a6 daemonContext:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("RBAssertionState.m"), 290, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("descriptors"));

    if (v15)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("RBAssertionState.m"), 291, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifiers"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("RBAssertionState.m"), 289, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("process"));

  if (!v14)
    goto LABEL_6;
LABEL_3:
  if (!v15)
    goto LABEL_7;
LABEL_4:
  v17 = -[RBAssertionBatchContext _init]([RBAssertionBatchContext alloc], "_init");
  v18 = (void *)v17[2];
  v17[2] = v13;
  v19 = v13;

  v20 = objc_msgSend(v14, "copy");
  v21 = (void *)v17[3];
  v17[3] = v20;

  v22 = objc_msgSend(v15, "copy");
  v23 = (void *)v17[4];
  v17[4] = v22;

  v17[5] = a4;
  return v17;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RBAssertionBatchContext;
  return -[RBAssertionBatchContext init](&v3, sel_init);
}

- (void)setUnitTesting:(BOOL)a3
{
  self->_unitTesting = a3;
}

- (void)setAllowAbstractTarget:(BOOL)a3
{
  self->_allowAbstractTarget = a3;
}

- (void)setAcquisitionPolicy:(unint64_t)a3
{
  self->_acquisitionPolicy = a3;
}

- (id)acquisitionContextForDescriptor:(id)a3
{
  void *v4;

  +[RBAssertionAcquisitionContext contextForProcess:withDescriptor:daemonContext:](RBAssertionAcquisitionContext, "contextForProcess:withDescriptor:daemonContext:", self->_process, a3, self->_daemonContext);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHoldToken:", self->_holdToken);
  objc_msgSend(v4, "setUnitTesting:", self->_unitTesting);
  objc_msgSend(v4, "setAllowAbstractTarget:", self->_allowAbstractTarget);
  objc_msgSend(v4, "setAcquisitionPolicy:", self->_acquisitionPolicy);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonContext, 0);
  objc_storeStrong(&self->_holdToken, 0);
  objc_storeStrong((id *)&self->_identifiersToInvalidate, 0);
  objc_storeStrong((id *)&self->_descriptorsToAcquire, 0);
  objc_storeStrong((id *)&self->_process, 0);
}

- (NSArray)identifiersToInvalidate
{
  return self->_identifiersToInvalidate;
}

- (NSArray)descriptorsToAcquire
{
  return self->_descriptorsToAcquire;
}

- (BOOL)allowAbstractTarget
{
  return self->_allowAbstractTarget;
}

- (id)holdToken
{
  return self->_holdToken;
}

- (RBDaemonContextProviding)daemonContext
{
  return self->_daemonContext;
}

- (BOOL)unitTesting
{
  return self->_unitTesting;
}

@end

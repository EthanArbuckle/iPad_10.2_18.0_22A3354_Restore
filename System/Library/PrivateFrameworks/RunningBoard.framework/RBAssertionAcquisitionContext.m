@implementation RBAssertionAcquisitionContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonContext, 0);
  objc_storeStrong(&self->_holdToken, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_process, 0);
}

+ (id)contextForProcess:(id)a3 withDescriptor:(id)a4 daemonContext:(id)a5
{
  id v10;
  id v11;
  id v12;
  RBAssertionAcquisitionContext *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("RBAssertionState.m"), 234, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("process"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("RBAssertionState.m"), 235, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("descriptor"));

LABEL_3:
  v13 = objc_alloc_init(RBAssertionAcquisitionContext);
  objc_storeStrong((id *)&v13->_process, a3);
  objc_storeStrong((id *)&v13->_descriptor, a4);
  objc_storeStrong((id *)&v13->_daemonContext, a5);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v11, "attributes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v18++), "applyToAcquisitionContext:", v13);
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v16);
  }

  return v13;
}

- (RBDaemonContextProviding)daemonContext
{
  return self->_daemonContext;
}

- (RBSAssertionDescriptor)descriptor
{
  return self->_descriptor;
}

- (RBProcess)process
{
  return self->_process;
}

- (id)holdToken
{
  return self->_holdToken;
}

- (unint64_t)acquisitionPolicy
{
  return self->_acquisitionPolicy;
}

- (BOOL)allowAbstractTarget
{
  return self->_allowAbstractTarget;
}

- (BOOL)unitTesting
{
  return self->_unitTesting;
}

- (void)setAcquisitionPolicy:(unint64_t)a3
{
  self->_acquisitionPolicy = a3;
}

- (void)setAllowAbstractTarget:(BOOL)a3
{
  self->_allowAbstractTarget = a3;
}

- (void)setUnitTesting:(BOOL)a3
{
  self->_unitTesting = a3;
}

- (void)setHoldToken:(id)a3
{
  objc_storeStrong(&self->_holdToken, a3);
}

@end

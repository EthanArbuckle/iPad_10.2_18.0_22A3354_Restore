@implementation VisionCoreE5RTExecutionContextConfiguration

- (BOOL)isEqual:(id)a3
{
  VisionCoreE5RTExecutionContextConfiguration *v4;
  VisionCoreE5RTExecutionContextConfiguration *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  _BOOL4 v15;
  void *v16;
  void *v17;

  v4 = (VisionCoreE5RTExecutionContextConfiguration *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VisionCoreE5RTExecutionContextConfiguration boundInputObjects](self, "boundInputObjects");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VisionCoreE5RTExecutionContextConfiguration boundInputObjects](v5, "boundInputObjects");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        v9 = objc_msgSend(v6, "isEqual:", v7);

        if (!v9)
          goto LABEL_14;
      }
      -[VisionCoreE5RTExecutionContextConfiguration boundOutputObjects](self, "boundOutputObjects");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[VisionCoreE5RTExecutionContextConfiguration boundOutputObjects](v5, "boundOutputObjects");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v11 == (void *)v12)
      {

      }
      else
      {
        v13 = (void *)v12;
        v14 = objc_msgSend(v11, "isEqual:", v12);

        if (!v14)
          goto LABEL_14;
      }
      v15 = -[VisionCoreE5RTExecutionContextConfiguration prewireInUseAllocations](self, "prewireInUseAllocations");
      if (v15 == -[VisionCoreE5RTExecutionContextConfiguration prewireInUseAllocations](v5, "prewireInUseAllocations"))
      {
        -[VisionCoreE5RTExecutionContextConfiguration completionQueue](self, "completionQueue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[VisionCoreE5RTExecutionContextConfiguration completionQueue](v5, "completionQueue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v16 == v17;

        goto LABEL_16;
      }
LABEL_14:
      v10 = 0;
LABEL_16:

      goto LABEL_17;
    }
    v10 = 0;
  }
LABEL_17:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4)
  {
    v5 = -[VisionCoreNamedObjects copy](self->_boundInputObjects, "copy");
    v6 = (void *)*((_QWORD *)v4 + 1);
    *((_QWORD *)v4 + 1) = v5;

    v7 = -[VisionCoreNamedObjects copy](self->_boundOutputObjects, "copy");
    v8 = (void *)*((_QWORD *)v4 + 2);
    *((_QWORD *)v4 + 2) = v7;

    *((_BYTE *)v4 + 32) = self->_prewireInUseAllocations;
    objc_storeStrong((id *)v4 + 3, self->_completionQueue);
  }
  return v4;
}

- (VisionCoreNamedObjects)boundInputObjects
{
  return self->_boundInputObjects;
}

- (void)setBoundInputObjects:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (VisionCoreNamedObjects)boundOutputObjects
{
  return self->_boundOutputObjects;
}

- (void)setBoundOutputObjects:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)prewireInUseAllocations
{
  return self->_prewireInUseAllocations;
}

- (void)setPrewireInUseAllocations:(BOOL)a3
{
  self->_prewireInUseAllocations = a3;
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)setCompletionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_completionQueue, a3);
}

- (VisionCoreE5RTExecutionPrewarmedState)prewarmedState
{
  return self->_prewarmedState;
}

- (void)setPrewarmedState:(id)a3
{
  objc_storeStrong((id *)&self->_prewarmedState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prewarmedState, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_boundOutputObjects, 0);
  objc_storeStrong((id *)&self->_boundInputObjects, 0);
}

@end

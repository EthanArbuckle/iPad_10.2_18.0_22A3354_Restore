@implementation PLProgressFollower

- (NSProgress)outputProgress
{
  return (NSProgress *)objc_getProperty(self, a2, 32, 1);
}

- (PLProgressFollower)initWithSourceProgress:(id)a3 progressHandler:(id)a4
{
  id v7;
  id v8;
  PLProgressFollower *v9;
  PLProgressFollower *v10;
  uint64_t v11;
  id progressHandler;
  uint64_t v13;
  NSProgress *outputProgress;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PLProgressFollower;
  v9 = -[PLProgressFollower init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_sourceProgress, a3);
    v11 = MEMORY[0x19AEC174C](v8);
    progressHandler = v10->_progressHandler;
    v10->_progressHandler = (id)v11;

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", objc_msgSend(v7, "totalUnitCount"));
      v13 = objc_claimAutoreleasedReturnValue();
      outputProgress = v10->_outputProgress;
      v10->_outputProgress = (NSProgress *)v13;

      -[NSProgress setCompletedUnitCount:](v10->_outputProgress, "setCompletedUnitCount:", objc_msgSend(v7, "completedUnitCount"));
    }
    -[NSProgress addObserver:forKeyPath:options:context:](v10->_sourceProgress, "addObserver:forKeyPath:options:context:", v10, CFSTR("fractionCompleted"), 1, CFSTR("PLProgressFollowerFractionCompletedContext"));
  }

  return v10;
}

- (void)invalidate
{
  PLRunWithUnfairLock();
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLProgressFollower.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_invalidated"));

  }
  v5.receiver = self;
  v5.super_class = (Class)PLProgressFollower;
  -[PLProgressFollower dealloc](&v5, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSProgress *v14;
  void (**v15)(_QWORD, _QWORD);
  _BOOL4 invalidated;
  double v17;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v11;
  os_unfair_lock_lock(&self->_lock);
  v14 = self->_outputProgress;
  v15 = (void (**)(_QWORD, _QWORD))MEMORY[0x19AEC174C](self->_progressHandler);
  invalidated = self->_invalidated;
  os_unfair_lock_unlock(&self->_lock);
  if (a6 != CFSTR("PLProgressFollowerFractionCompletedContext") || invalidated)
  {
    v18.receiver = self;
    v18.super_class = (Class)PLProgressFollower;
    -[PLProgressFollower observeValueForKeyPath:ofObject:change:context:](&v18, sel_observeValueForKeyPath_ofObject_change_context_, v10, v13, v12, a6);
  }
  else if (v15)
  {
    ((void (**)(_QWORD, id))v15)[2](v15, v13);
  }
  else
  {
    objc_msgSend(v13, "fractionCompleted");
    -[NSProgress setCompletedUnitCount:](v14, "setCompletedUnitCount:", (uint64_t)(v17 * (double)-[NSProgress totalUnitCount](v14, "totalUnitCount")));
  }

}

- (NSProgress)sourceProgress
{
  return (NSProgress *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOutputProgress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputProgress, 0);
  objc_storeStrong((id *)&self->_sourceProgress, 0);
  objc_storeStrong(&self->_progressHandler, 0);
}

uint64_t __32__PLProgressFollower_invalidate__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), CFSTR("fractionCompleted"), CFSTR("PLProgressFollowerFractionCompletedContext"));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 1;
  return result;
}

@end

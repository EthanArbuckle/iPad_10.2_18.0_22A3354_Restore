@implementation PXTimeInterval

- (PXTimeInterval)init
{
  PXTimeInterval *v2;
  PXTimeInterval *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *tokenToTransitionHandler;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXTimeInterval;
  v2 = -[PXTimeInterval init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_state = 0;
    v2->_beginTime = 0.0;
    v2->_endTime = 0.0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    tokenToTransitionHandler = v3->_tokenToTransitionHandler;
    v3->_tokenToTransitionHandler = v4;

  }
  return v3;
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    -[PXTimeInterval _notifyStateTransitionHandlersOfTransitionFromState:](self, "_notifyStateTransitionHandlersOfTransitionFromState:");
  }
}

- (double)beginTime
{
  int64_t v3;
  double result;

  v3 = -[PXTimeInterval state](self, "state");
  result = 0.0;
  if ((unint64_t)(v3 - 1) <= 1)
    return self->_beginTime;
  return result;
}

- (double)endTime
{
  int64_t v3;
  double result;

  v3 = -[PXTimeInterval state](self, "state");
  if (v3 == 2)
    return self->_endTime;
  result = 0.0;
  if (v3 == 1)
    return CFAbsoluteTimeGetCurrent();
  return result;
}

- (double)duration
{
  double v3;
  double v4;
  double v5;

  -[PXTimeInterval endTime](self, "endTime");
  v4 = v3;
  -[PXTimeInterval beginTime](self, "beginTime");
  return v4 - v5;
}

- (id)addStateTransitionHandler:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTimeInterval.m"), 75, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler != nil"));

  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "copy");
  v8 = _Block_copy(v7);
  -[PXTimeInterval tokenToTransitionHandler](self, "tokenToTransitionHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v6);

  return v6;
}

- (void)removeStateTransitionHandler:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTimeInterval.m"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("token != nil"));

  }
  -[PXTimeInterval tokenToTransitionHandler](self, "tokenToTransitionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v7);

}

- (void)beginInterval
{
  -[PXTimeInterval beginIntervalWithTimeOverride:](self, "beginIntervalWithTimeOverride:", CFAbsoluteTimeGetCurrent());
}

- (void)beginIntervalWithTimeOverride:(double)a3
{
  if ((-[PXTimeInterval state](self, "state") | 2) == 2)
  {
    -[PXTimeInterval setBeginTime:](self, "setBeginTime:", a3);
    -[PXTimeInterval setState:](self, "setState:", 1);
  }
}

- (void)endInterval
{
  -[PXTimeInterval endIntervalWithTimeOverride:](self, "endIntervalWithTimeOverride:", CFAbsoluteTimeGetCurrent());
}

- (void)endIntervalWithTimeOverride:(double)a3
{
  if (-[PXTimeInterval state](self, "state") == 1)
  {
    -[PXTimeInterval setEndTime:](self, "setEndTime:", a3);
    -[PXTimeInterval setState:](self, "setState:", 2);
  }
}

- (void)reset
{
  if ((unint64_t)(-[PXTimeInterval state](self, "state") - 1) <= 1)
    -[PXTimeInterval setState:](self, "setState:", 0);
}

- (void)_notifyStateTransitionHandlersOfTransitionFromState:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[PXTimeInterval tokenToTransitionHandler](self, "tokenToTransitionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10) + 16))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (int64_t)state
{
  return self->_state;
}

- (void)setBeginTime:(double)a3
{
  self->_beginTime = a3;
}

- (void)setEndTime:(double)a3
{
  self->_endTime = a3;
}

- (NSMutableDictionary)tokenToTransitionHandler
{
  return self->_tokenToTransitionHandler;
}

- (void)setTokenToTransitionHandler:(id)a3
{
  objc_storeStrong((id *)&self->_tokenToTransitionHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenToTransitionHandler, 0);
}

@end

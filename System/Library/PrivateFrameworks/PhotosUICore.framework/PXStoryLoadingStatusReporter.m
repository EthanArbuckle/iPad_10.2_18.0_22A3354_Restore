@implementation PXStoryLoadingStatusReporter

- (PXStoryLoadingStatusReporter)init
{
  PXStoryLoadingStatusReporter *v3;
  PXStoryLoadingStatusReporter *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *lock_stateIndexByClipIdentifier;
  PXStoryLoadingStatusReporter *v7;
  objc_super v9;

  if (PFOSVariantHasInternalDiagnostics())
  {
    v9.receiver = self;
    v9.super_class = (Class)PXStoryLoadingStatusReporter;
    v3 = -[PXStoryLoadingStatusReporter init](&v9, sel_init);
    v4 = v3;
    if (v3)
    {
      v3->_lock._os_unfair_lock_opaque = 0;
      v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      lock_stateIndexByClipIdentifier = v4->_lock_stateIndexByClipIdentifier;
      v4->_lock_stateIndexByClipIdentifier = v5;

    }
    self = v4;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_lock_states);
  v3.receiver = self;
  v3.super_class = (Class)PXStoryLoadingStatusReporter;
  -[PXStoryLoadingStatusReporter dealloc](&v3, sel_dealloc);
}

- ($14D77461FF5D83CAEC4252578BA76F85)_lock_stateForClipIdentifier:(int64_t)a3
{
  NSMutableDictionary *lock_stateIndexByClipIdentifier;
  void *v6;
  void *v7;
  unint64_t lock_statesCapacity;
  $14D77461FF5D83CAEC4252578BA76F85 *lock_states;
  NSMutableDictionary *v10;
  void *v11;
  $14D77461FF5D83CAEC4252578BA76F85 *v12;
  $14D77461FF5D83CAEC4252578BA76F85 *v13;
  unint64_t v15;

  os_unfair_lock_assert_owner(&self->_lock);
  lock_stateIndexByClipIdentifier = self->_lock_stateIndexByClipIdentifier;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](lock_stateIndexByClipIdentifier, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_lock_statesCount);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    lock_statesCapacity = self->_lock_statesCapacity;
    ++self->_lock_statesCount;
    v15 = lock_statesCapacity;
    _PXGArrayCapacityResizeToCount();
    self->_lock_statesCapacity = v15;
    lock_states = self->_lock_states;
    lock_states[objc_msgSend(v7, "integerValue")] = 0;
    v10 = self->_lock_stateIndexByClipIdentifier;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v7, v11);

  }
  v12 = self->_lock_states;
  v13 = &v12[objc_msgSend(v7, "integerValue")];

  return v13;
}

- (void)_lock_updateStatusForLoadingState:(id *)a3 error:(id)a4 clipIdentifier:(int64_t)a5
{
  id v8;
  int var2;
  int var0;
  unsigned __int8 v11;
  BOOL v12;
  char v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  unint64_t v19;
  NSObject *v20;
  NSObject *v21;
  unint64_t v22;
  NSObject *v23;
  NSObject *v24;
  unint64_t v25;
  int v26;
  unint64_t v27;
  __int16 v28;
  int64_t v29;
  __int16 v30;
  int v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  var2 = a3->var2;
  if (var2 == 2)
  {
    v12 = a3->var1 >= 5u;
    v13 = 8 * a3->var1;
    v14 = 134678022;
  }
  else
  {
    if (var2 != 1)
    {
      if (a3->var2)
      {
        v11 = 0;
      }
      else
      {
        var0 = a3->var0;
        if (var0 == 2)
          v11 = 2;
        else
          v11 = var0 == 1;
      }
      goto LABEL_13;
    }
    v12 = a3->var1 >= 5u;
    v13 = 8 * a3->var1;
    v14 = 84148995;
  }
  v15 = (v14 & 0xFFFF0000FFFFFFFFLL | 0x900000000) >> v13;
  if (v12)
    v11 = 0;
  else
    v11 = v15;
LABEL_13:
  if (a3->var3 != v11)
  {
    PXStoryClipLoadingStatusDescription(v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryLoadingStatusReporter log](self, "log");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = a5 - 1;
    if ((unint64_t)(a5 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      v26 = 134217984;
      v27 = -[PXStoryLoadingStatusReporter logContext](self, "logContext");
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v18, OS_SIGNPOST_INTERVAL_END, a5, "PXStoryClipLoadingStatus", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v26, 0xCu);
    }

    -[PXStoryLoadingStatusReporter log](self, "log");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v19 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      v22 = -[PXStoryLoadingStatusReporter logContext](self, "logContext");
      v26 = 134219010;
      v27 = v22;
      v28 = 2048;
      v29 = a5;
      v30 = 1024;
      v31 = v11;
      v32 = 2114;
      v33 = v16;
      v34 = 2114;
      v35 = v8;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v21, OS_SIGNPOST_EVENT, a5, "PXStoryClipLoadingStatus", "Context=%{signpost.telemetry:string2}lu ClipIdentifier=%{signpost.description:attribute}ld Status=%{signpost.description:attribute}d Description=%{signpost.description:attribute,public}@ Error=%{signpost.description:attribute,public}@", (uint8_t *)&v26, 0x30u);
    }

    -[PXStoryLoadingStatusReporter log](self, "log");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v19 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      v25 = -[PXStoryLoadingStatusReporter logContext](self, "logContext");
      v26 = 134219010;
      v27 = v25;
      v28 = 2048;
      v29 = a5;
      v30 = 1024;
      v31 = v11;
      v32 = 2114;
      v33 = v16;
      v34 = 2114;
      v35 = v8;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v24, OS_SIGNPOST_INTERVAL_BEGIN, a5, "PXStoryClipLoadingStatus", "Context=%{signpost.telemetry:string2}lu ClipIdentifier=%{signpost.description:attribute}ld Status=%{signpost.description:attribute}d Description=%{signpost.description:attribute,public}@ Error=%{signpost.description:attribute,public}@", (uint8_t *)&v26, 0x30u);
    }

  }
  a3->var3 = v11;

}

- (void)notifyUserDidNavigate
{
  os_unfair_lock_s *p_lock;
  NSDate *v4;
  NSDate *lock_lastUserActivity;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lock_lastUserActivity = self->_lock_lastUserActivity;
  self->_lock_lastUserActivity = v4;

  os_unfair_lock_unlock(p_lock);
}

- (void)notifyStartedPreloadingClipIdentifier:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  $14D77461FF5D83CAEC4252578BA76F85 *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = -[PXStoryLoadingStatusReporter _lock_stateForClipIdentifier:](self, "_lock_stateForClipIdentifier:", a3);
  v6->var0 = 1;
  -[PXStoryLoadingStatusReporter _lock_updateStatusForLoadingState:error:clipIdentifier:](self, "_lock_updateStatusForLoadingState:error:clipIdentifier:", v6, 0, a3);
  os_unfair_lock_unlock(p_lock);
}

- (void)notifyPreloadingProgress:(double)a3 error:(id)a4 forClipIdentifier:(int64_t)a5
{
  id v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  unint64_t v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  os_unfair_lock_lock(&self->_lock);
  if (v8)
  {
    -[PXStoryLoadingStatusReporter _lock_updateStatusForLoadingState:error:clipIdentifier:](self, "_lock_updateStatusForLoadingState:error:clipIdentifier:", -[PXStoryLoadingStatusReporter _lock_stateForClipIdentifier:](self, "_lock_stateForClipIdentifier:", a5), v8, a5);
  }
  else
  {
    -[PXStoryLoadingStatusReporter log](self, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if ((unint64_t)(a5 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      v11 = 134218240;
      v12 = -[PXStoryLoadingStatusReporter logContext](self, "logContext");
      v13 = 2048;
      v14 = a3;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v10, OS_SIGNPOST_EVENT, a5, "PXStoryClipLoadingProgress", "Context=%{signpost.telemetry:string2}lu %.2f", (uint8_t *)&v11, 0x16u);
    }

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)notifyPreloadingCompleteForClipIdentifier:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  $14D77461FF5D83CAEC4252578BA76F85 *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = -[PXStoryLoadingStatusReporter _lock_stateForClipIdentifier:](self, "_lock_stateForClipIdentifier:", a3);
  v6->var0 = 2;
  -[PXStoryLoadingStatusReporter _lock_updateStatusForLoadingState:error:clipIdentifier:](self, "_lock_updateStatusForLoadingState:error:clipIdentifier:", v6, 0, a3);
  os_unfair_lock_unlock(p_lock);
}

- (void)notifyVisibility:(unsigned __int8)a3 forClipIdentifier:(int64_t)a4
{
  os_unfair_lock_s *p_lock;
  $14D77461FF5D83CAEC4252578BA76F85 *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v8 = -[PXStoryLoadingStatusReporter _lock_stateForClipIdentifier:](self, "_lock_stateForClipIdentifier:", a4);
  v8->var2 = a3;
  -[PXStoryLoadingStatusReporter _lock_updateStatusForLoadingState:error:clipIdentifier:](self, "_lock_updateStatusForLoadingState:error:clipIdentifier:", v8, 0, a4);
  os_unfair_lock_unlock(p_lock);
}

- (void)notifyLoadingStatus:(unsigned __int8)a3 error:(id)a4 forClipIdentifier:(int64_t)a5
{
  os_unfair_lock_s *p_lock;
  id v9;
  $14D77461FF5D83CAEC4252578BA76F85 *v10;

  p_lock = &self->_lock;
  v9 = a4;
  os_unfair_lock_lock(p_lock);
  v10 = -[PXStoryLoadingStatusReporter _lock_stateForClipIdentifier:](self, "_lock_stateForClipIdentifier:", a5);
  v10->var1 = a3;
  -[PXStoryLoadingStatusReporter _lock_updateStatusForLoadingState:error:clipIdentifier:](self, "_lock_updateStatusForLoadingState:error:clipIdentifier:", v10, v9, a5);

  os_unfair_lock_unlock(p_lock);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (unint64_t)logContext
{
  return self->_logContext;
}

- (void)setLogContext:(unint64_t)a3
{
  self->_logContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_lock_lastUserActivity, 0);
  objc_storeStrong((id *)&self->_lock_stateIndexByClipIdentifier, 0);
}

@end

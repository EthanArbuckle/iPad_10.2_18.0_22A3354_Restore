@implementation TUIFeedSuspendLayoutLayerUpdateCondition

- (TUIFeedSuspendLayoutLayerUpdateCondition)initWithSectionCount:(int64_t)a3 completion:(id)a4
{
  TUIFeedSuspendLayoutLayerUpdateCondition *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUIFeedSuspendLayoutLayerUpdateCondition;
  result = -[TUIFeedBaseLayoutCondition initWithCompletion:](&v6, "initWithCompletion:", a4);
  if (result)
    result->_totalSectionCount = a3;
  return result;
}

- (BOOL)evaluateWithRenderModel:(id)a3
{
  id v4;
  char state;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  os_unfair_lock_lock_with_options(&self->super._lock, 0x10000);
  state = (char)self->super._state;
  os_unfair_lock_unlock(&self->super._lock);
  if ((state & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    v6 = objc_opt_class(TUIRenderModelLayer);
    v7 = TUIDynamicCast(v6, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = v8;
    if (v8)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "submodels"));
      v11 = objc_msgSend(v10, "count") == (id)self->_totalSectionCount;

    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (int64_t)totalSectionCount
{
  return self->_totalSectionCount;
}

@end

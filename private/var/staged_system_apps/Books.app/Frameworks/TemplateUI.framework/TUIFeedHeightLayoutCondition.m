@implementation TUIFeedHeightLayoutCondition

- (TUIFeedHeightLayoutCondition)initWithView:(id)a3 completion:(id)a4
{
  id v6;
  TUIFeedHeightLayoutCondition *v7;
  TUIFeedHeightLayoutCondition *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TUIFeedHeightLayoutCondition;
  v7 = -[TUIFeedBaseLayoutCondition initWithCompletion:](&v10, "initWithCompletion:", a4);
  v8 = v7;
  if (v7)
    -[TUIFeedHeightLayoutCondition updateWithView:](v7, "updateWithView:", v6);

  return v8;
}

- (BOOL)evaluateWithRenderModel:(id)a3
{
  id v4;
  char state;
  double height;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  id v15;
  char v16;
  double v17;

  v4 = a3;
  os_unfair_lock_lock_with_options(&self->super._lock, 0x10000);
  state = (char)self->super._state;
  height = self->_height;
  os_unfair_lock_unlock(&self->super._lock);
  if ((state & 1) != 0)
  {
    v16 = 1;
  }
  else
  {
    v7 = objc_opt_class(2859008);
    v8 = TUIDynamicCast(v7, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = v9;
    if (v9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "info"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("TUIRenderInfoKeyIsFinal")));
      v13 = objc_msgSend(v12, "BOOLValue");

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sections"));
      v15 = objc_msgSend(v14, "count");
      v16 = v15 != 0;

      if (v15 && (v13 & 1) == 0)
      {
        objc_msgSend(v4, "size");
        v16 = v17 >= height;
      }
    }
    else
    {
      v16 = 0;
    }

  }
  return v16;
}

- (void)updateWithView:(id)a3
{
  double Height;
  CGRect v5;

  if (a3)
  {
    objc_msgSend(a3, "bounds");
    Height = CGRectGetHeight(v5);
  }
  else
  {
    Height = NAN;
  }
  os_unfair_lock_lock_with_options(&self->super._lock, 0x10000);
  self->_height = Height;
  os_unfair_lock_unlock(&self->super._lock);
}

- (double)height
{
  return self->_height;
}

@end

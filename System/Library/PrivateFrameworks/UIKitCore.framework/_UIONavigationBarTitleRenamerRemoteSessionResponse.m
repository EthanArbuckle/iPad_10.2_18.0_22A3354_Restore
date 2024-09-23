@implementation _UIONavigationBarTitleRenamerRemoteSessionResponse

+ (id)willBeginRenamingResponseWithText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setObject:forSetting:", &unk_1E1A9AA40, 0);
  objc_msgSend(v8, "setObject:forSetting:", v7, 1);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", location, length);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forSetting:", v9, 2);

  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:error:", v8, 0);
  return v10;
}

+ (id)shouldEndEditingResponse:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;

  v3 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setObject:forSetting:", &unk_1E1A9AA58, 0);
  objc_msgSend(v5, "setFlag:forSetting:", v3, 3);
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:error:", v5, 0);

  return v6;
}

+ (id)successResponseForAction:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v6, 0);

  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:error:", v5, 0);
  return v7;
}

- (int)_action
{
  void *v2;
  void *v3;
  int v4;

  -[BSActionResponse info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (NSString)text
{
  void *v4;
  void *v5;
  void *v7;
  void *v8;

  if (-[_UIONavigationBarTitleRenamerRemoteSessionResponse _action](self, "_action")
    && -[_UIONavigationBarTitleRenamerRemoteSessionResponse _action](self, "_action") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIONavigationBarTitleRenamerRemoteSessionAction.m"), 259, CFSTR("%@ is not supported for action of kind %d"), v8, -[_UIONavigationBarTitleRenamerRemoteSessionResponse _action](self, "_action"));

  }
  -[BSActionResponse info](self, "info");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForSetting:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (_NSRange)selectedRange
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  void *v11;
  void *v12;
  _NSRange result;

  if (-[_UIONavigationBarTitleRenamerRemoteSessionResponse _action](self, "_action"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIONavigationBarTitleRenamerRemoteSessionAction.m"), 265, CFSTR("%@ is not supported for action of kind %d"), v12, -[_UIONavigationBarTitleRenamerRemoteSessionResponse _action](self, "_action"));

  }
  -[BSActionResponse info](self, "info");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForSetting:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "rangeValue");
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (BOOL)shouldEndEditing
{
  void *v4;
  BOOL v5;
  void *v7;
  void *v8;

  if (-[_UIONavigationBarTitleRenamerRemoteSessionResponse _action](self, "_action") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIONavigationBarTitleRenamerRemoteSessionAction.m"), 271, CFSTR("%@ is not supported for action of kind %d"), v8, -[_UIONavigationBarTitleRenamerRemoteSessionResponse _action](self, "_action"));

  }
  -[BSActionResponse info](self, "info");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "flagForSetting:", 3) != 0;

  return v5;
}

@end

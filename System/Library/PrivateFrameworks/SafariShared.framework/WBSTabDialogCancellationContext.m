@implementation WBSTabDialogCancellationContext

- (WBSTabDialogCancellationContext)init
{

  return 0;
}

- (WBSTabDialogCancellationContext)initWithReason:(id)a3 userInfo:(id)a4
{
  id v7;
  id v8;
  WBSTabDialogCancellationContext *v9;
  WBSTabDialogCancellationContext *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  WBSTabDialogCancellationContext *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WBSTabDialogCancellationContext;
  v9 = -[WBSTabDialogCancellationContext init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_reason, a3);
    v11 = objc_msgSend(v8, "copy");
    v12 = (void *)v11;
    if (v11)
      v13 = (void *)v11;
    else
      v13 = (void *)MEMORY[0x1E0C9AA70];
    objc_storeStrong((id *)&v10->_userInfo, v13);

    v14 = v10;
  }

  return v10;
}

+ (id)cancellationContextWithReason:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithReason:userInfo:", v7, v6);

  return v8;
}

+ (id)provisionalNavigationContext
{
  return (id)objc_msgSend(a1, "cancellationContextWithReason:userInfo:", CFSTR("WBSTabDialogCancellationReasonProvisionalNavigation"), 0);
}

+ (id)committedNavigationContextWithURL:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v9 = CFSTR("WBSTabDialogCancellationReasonCommittedNavigationCurrentURLKey");
    v10[0] = a3;
    v4 = (void *)MEMORY[0x1E0C99D80];
    v5 = a3;
    objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(a1, "cancellationContextWithReason:userInfo:", CFSTR("WBSTabDialogCancellationReasonCommittedNavigation"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)tabClosedContext
{
  return (id)objc_msgSend(a1, "cancellationContextWithReason:userInfo:", CFSTR("WBSTabDialogCancellationReasonTabClosed"), 0);
}

- (NSString)reason
{
  return self->_reason;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end

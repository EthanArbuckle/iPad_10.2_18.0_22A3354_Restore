@implementation UISFetchContentInBackgroundAction

- (UISFetchContentInBackgroundAction)initWithHandler:(id)a3
{
  void *v4;
  UISFetchContentInBackgroundAction *v5;
  objc_super v7;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0D22F60], "responderWithHandler:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)UISFetchContentInBackgroundAction;
  v5 = -[UISFetchContentInBackgroundAction initWithInfo:responder:](&v7, sel_initWithInfo_responder_, 0, v4);

  return v5;
}

- (UISFetchContentInBackgroundAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
{
  return -[UISFetchContentInBackgroundAction initWithHandler:](self, "initWithHandler:", a6, a5, a4);
}

- (int64_t)UIActionType
{
  return 2;
}

- (void)sendResponse:(id)a3
{
  id v5;
  void *v6;
  objc_super v7;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISFetchContentInBackgroundAction.m"), 52, CFSTR("You sent back the wrong response class -> %@"), v5);

  }
  v7.receiver = self;
  v7.super_class = (Class)UISFetchContentInBackgroundAction;
  -[UISFetchContentInBackgroundAction sendResponse:](&v7, sel_sendResponse_, v5);

}

@end

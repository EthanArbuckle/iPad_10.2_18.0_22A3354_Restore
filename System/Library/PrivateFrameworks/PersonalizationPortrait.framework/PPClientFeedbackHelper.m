@implementation PPClientFeedbackHelper

- (void)setClientIdentifier:(id)a3
{
  PPClientFeedbackHelper *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (!objc_msgSend(v10, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPClientFeedbackHelper.m"), 18, CFSTR("clientIdentifier must not be nil or zero length"));

  }
  if ((unint64_t)objc_msgSend(v10, "length") >= 0xB)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPClientFeedbackHelper.m"), 19, CFSTR("clientIdentifier was longer than %d characters.  Please choose a shorter identifer"), 10);

  }
  v6 = self;
  objc_sync_enter(v6);
  if ((objc_msgSend(v10, "isEqualToString:", v6->_clientIdentifier) & 1) == 0)
  {
    if (-[NSString length](v6->_clientIdentifier, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("PPClientFeedbackHelper.m"), 22, CFSTR("clientIdentifier cannot be set twice on the same %@ to different values.  It is currently set to \"%@\". If two different clients are needed in the same process, initialize with \"init\" instead of using \"defaultStore\")."), v6->_parentObjectClass, v6->_clientIdentifier);

    }
    objc_storeStrong((id *)&v6->_clientIdentifier, a3);
  }
  objc_sync_exit(v6);

}

- (NSString)clientIdentifier
{
  PPClientFeedbackHelper *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_clientIdentifier;
  objc_sync_exit(v2);

  return v3;
}

- (PPClientFeedbackHelper)initWithParentObject:(id)a3
{
  id v4;
  PPClientFeedbackHelper *v5;
  objc_class *v6;
  uint64_t v7;
  NSString *parentObjectClass;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PPClientFeedbackHelper;
  v5 = -[PPClientFeedbackHelper init](&v10, sel_init);
  if (v5)
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = objc_claimAutoreleasedReturnValue();
    parentObjectClass = v5->_parentObjectClass;
    v5->_parentObjectClass = (NSString *)v7;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_parentObjectClass, 0);
}

@end

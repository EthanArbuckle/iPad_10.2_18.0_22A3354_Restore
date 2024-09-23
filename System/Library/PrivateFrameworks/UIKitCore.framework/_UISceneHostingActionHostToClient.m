@implementation _UISceneHostingActionHostToClient

- (void)performActionForHostedWindowScene:(id)a3
{
  objc_class *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneHostingActionHostToClient.m"), 16, CFSTR("_UISceneHostingActionHostToClient subclass <%@: %p> did not override -performActionForHostedWindowScene:"), v6, self);

}

- (int64_t)UIActionType
{
  return 57;
}

@end

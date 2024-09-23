@implementation _UIHomeAffordanceBSActionToClient

- (_UIHomeAffordanceBSActionToClient)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIHomeAffordanceBSActionToClient.m"), 40, CFSTR("%s: init is not allowed on %@"), "-[_UIHomeAffordanceBSActionToClient init]", objc_opt_class());

  return 0;
}

- (int64_t)actionType
{
  void *v2;
  void *v3;
  int64_t v4;

  -[_UIHomeAffordanceBSActionToClient info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _UIHomeAffordanceBSActionToClient *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63___UIHomeAffordanceBSActionToClient_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_1E16B1B50;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", self, v6);

}

@end

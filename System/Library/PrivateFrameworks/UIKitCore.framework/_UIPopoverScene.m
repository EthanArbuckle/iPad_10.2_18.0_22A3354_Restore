@implementation _UIPopoverScene

- (BOOL)_shouldLoadStoryboard
{
  return 0;
}

- (id)nextResponder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  if (!_UIResponderCrossSceneResponderChainEnabled())
    goto LABEL_6;
  -[UIWindowScene windows](self, "windows");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "rootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parentModalViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {

LABEL_6:
    v10.receiver = self;
    v10.super_class = (Class)_UIPopoverScene;
    -[UIScene nextResponder](&v10, sel_nextResponder);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    return v8;
  }
  v7 = objc_msgSend(v5, "_nextResponderIgnoresWindowIfRootVC");
  objc_msgSend(v5, "set_nextResponderIgnoresWindowIfRootVC:", 1);
  objc_msgSend(v5, "nextResponder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "set_nextResponderIgnoresWindowIfRootVC:", v7);

  if (!v8)
    goto LABEL_6;
  return v8;
}

@end

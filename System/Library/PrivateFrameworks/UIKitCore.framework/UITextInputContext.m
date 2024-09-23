@implementation UITextInputContext

+ (UITextInputContext)new
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___UITextInputContext;
  return (UITextInputContext *)objc_msgSendSuper2(&v3, sel_new);
}

+ (UITextInputContext)current
{
  return (UITextInputContext *)(id)objc_opt_new();
}

- (BOOL)isPencilInputExpected
{
  void *v2;
  BOOL v3;

  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lastEventSource") == 3;

  return v3;
}

- (void)setPencilInputExpected:(BOOL)pencilInputExpected
{
  -[UITextInputContext updateInputSource:toUpdate:](self, "updateInputSource:toUpdate:", 3, pencilInputExpected);
}

- (BOOL)isDictationInputExpected
{
  void *v2;
  BOOL v3;

  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lastEventSource") == 2;

  return v3;
}

- (void)setDictationInputExpected:(BOOL)dictationInputExpected
{
  -[UITextInputContext updateInputSource:toUpdate:](self, "updateInputSource:toUpdate:", 2, dictationInputExpected);
}

- (BOOL)isHardwareKeyboardInputExpected
{
  void *v2;
  BOOL v3;

  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lastEventSource") == 4;

  return v3;
}

- (void)setHardwareKeyboardInputExpected:(BOOL)hardwareKeyboardInputExpected
{
  -[UITextInputContext updateInputSource:toUpdate:](self, "updateInputSource:toUpdate:", 4, hardwareKeyboardInputExpected);
}

- (void)updateInputSource:(int64_t)a3 toUpdate:(BOOL)a4
{
  void *v5;
  int64_t v6;
  id v7;

  if (!a4)
  {
    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "lastEventSource");

    if (v6 == a3)
      a3 = 0;
    else
      a3 = v6;
  }
  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateEventSource:options:", a3, 15);

}

@end

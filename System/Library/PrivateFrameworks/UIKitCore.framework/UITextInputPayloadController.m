@implementation UITextInputPayloadController

+ (id)sharedInstance
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)__payloadController;
  if (!__payloadController)
  {
    v4 = objc_alloc_init((Class)a1);
    v5 = (void *)__payloadController;
    __payloadController = (uint64_t)v4;

    objc_msgSend((id)__payloadController, "setSupportedPayloadIds:", &unk_1E1A94418);
    v3 = (void *)__payloadController;
  }
  return v3;
}

+ (void)releaseSharedInstance
{
  void *v2;

  v2 = (void *)__payloadController;
  if (__payloadController)
  {
    __payloadController = 0;

  }
}

- (void)setSupportedPayloadIds:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *supportedPayloadIds;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (NSArray *)objc_msgSend(v4, "copy");
  supportedPayloadIds = self->_supportedPayloadIds;
  self->_supportedPayloadIds = v5;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyboardState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSupportedPayloadIds:", v4);

  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "remoteTextInputPartner");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "documentTraitsChanged");

  }
}

- (void)setPayloadDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_payloadDelegate, a3);
}

- (BOOL)_isMobileSMS
{
  void *v2;
  char v3;

  +[UIKeyboard keyboardBundleIdentifier](UIKeyboard, "keyboardBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.MobileSMS"));

  return v3;
}

- (BOOL)supportsStickerTapbackPayload
{
  _BOOL4 v3;

  v3 = -[UITextInputPayloadController _isMobileSMS](self, "_isMobileSMS");
  if (v3)
    LOBYTE(v3) = -[NSArray containsObject:](self->_supportedPayloadIds, "containsObject:", CFSTR("com.apple.messages.stickerTapback"));
  return v3;
}

- (NSArray)supportedPayloadIds
{
  return self->_supportedPayloadIds;
}

- (UITextInputPayloadDelegate)payloadDelegate
{
  return (UITextInputPayloadDelegate *)objc_loadWeakRetained((id *)&self->_payloadDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_payloadDelegate);
  objc_storeStrong((id *)&self->_supportedPayloadIds, 0);
}

@end

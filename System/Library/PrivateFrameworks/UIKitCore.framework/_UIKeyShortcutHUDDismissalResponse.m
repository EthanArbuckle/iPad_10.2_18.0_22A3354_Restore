@implementation _UIKeyShortcutHUDDismissalResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  UIKeyCommand *keyCommand;
  id v5;

  keyCommand = self->_keyCommand;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", keyCommand, CFSTR("keyCommand"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pasteAuthenticationMessage, CFSTR("pasteAuthenticationMessage"));

}

- (_UIKeyShortcutHUDDismissalResponse)initWithCoder:(id)a3
{
  id v4;
  _UIKeyShortcutHUDDismissalResponse *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (_UIKeyShortcutHUDDismissalResponse *)objc_opt_new();
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("keyCommand"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyShortcutHUDDismissalResponse setKeyCommand:](v5, "setKeyCommand:", v7);

  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("pasteAuthenticationMessage"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIKeyShortcutHUDDismissalResponse setPasteAuthenticationMessage:](v5, "setPasteAuthenticationMessage:", v9);
  return v5;
}

- (UIKeyCommand)keyCommand
{
  return self->_keyCommand;
}

- (void)setKeyCommand:(id)a3
{
  objc_storeStrong((id *)&self->_keyCommand, a3);
}

- (BKSHIDEventAuthenticationMessage)pasteAuthenticationMessage
{
  return self->_pasteAuthenticationMessage;
}

- (void)setPasteAuthenticationMessage:(id)a3
{
  objc_storeStrong((id *)&self->_pasteAuthenticationMessage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pasteAuthenticationMessage, 0);
  objc_storeStrong((id *)&self->_keyCommand, 0);
}

@end

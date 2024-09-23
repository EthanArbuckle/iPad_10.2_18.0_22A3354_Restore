@implementation UIKeyboardCameraSessionRTIConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIKeyboardCameraSessionRTIConfiguration)initWithCoder:(id)a3
{
  id v4;
  UIKeyboardCameraSessionRTIConfiguration *v5;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The decoder must allow keyed coding."));
  v5 = -[UIKeyboardCameraSessionRTIConfiguration init](self, "init");
  if (v5)
  {
    v5->_isWebKitInteractionView = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isWebKitInteractionView"));
    v5->_isSingleLineDocument = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSingleLineDocument"));
    v5->_shouldSuppressKeyboard = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldSuppressKeyboard"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The coder must allow keyed coding."));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isWebKitInteractionView, CFSTR("isWebKitInteractionView"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isSingleLineDocument, CFSTR("isSingleLineDocument"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_shouldSuppressKeyboard, CFSTR("shouldSuppressKeyboard"));

}

- (BOOL)isWebKitInteractionView
{
  return self->_isWebKitInteractionView;
}

- (void)setIsWebKitInteractionView:(BOOL)a3
{
  self->_isWebKitInteractionView = a3;
}

- (BOOL)isSingleLineDocument
{
  return self->_isSingleLineDocument;
}

- (void)setIsSingleLineDocument:(BOOL)a3
{
  self->_isSingleLineDocument = a3;
}

- (BOOL)shouldSuppressKeyboard
{
  return self->_shouldSuppressKeyboard;
}

- (void)setShouldSuppressKeyboard:(BOOL)a3
{
  self->_shouldSuppressKeyboard = a3;
}

@end

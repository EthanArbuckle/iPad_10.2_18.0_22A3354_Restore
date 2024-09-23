@implementation UIKBDerivedKeyboard

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_derivedKBStarPrefixName, 0);
}

- (void)setKeyboardSize:(CGSize)a3
{
  self->_keyboardSize = a3;
}

- (void)setDerivedKBStarPrefixName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CGSize)keyboardSize
{
  double width;
  double height;
  CGSize result;

  width = self->_keyboardSize.width;
  height = self->_keyboardSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSString)derivedKBStarPrefixName
{
  return self->_derivedKBStarPrefixName;
}

- (CGSize)keyboardSizeBasis
{
  double width;
  double height;
  CGSize result;

  width = self->_keyboardSizeBasis.width;
  height = self->_keyboardSizeBasis.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setKeyboardSizeBasis:(CGSize)a3
{
  self->_keyboardSizeBasis = a3;
}

- (BOOL)addsSupplementaryControlKeys
{
  return self->_addsSupplementaryControlKeys;
}

- (void)setAddsSupplementaryControlKeys:(BOOL)a3
{
  self->_addsSupplementaryControlKeys = a3;
}

@end

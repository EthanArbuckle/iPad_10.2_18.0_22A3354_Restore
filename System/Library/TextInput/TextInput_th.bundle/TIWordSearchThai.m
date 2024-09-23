@implementation TIWordSearchThai

- (int)mecabraInputMethodType
{
  return 18;
}

- (void)updateMecabraState
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TIWordSearchThai;
  -[TIWordSearch updateMecabraState](&v3, sel_updateMecabraState);
  -[TIWordSearch updateUserWordEntries](self, "updateUserWordEntries");
  -[TIWordSearch updateDictionaryPaths](self, "updateDictionaryPaths");
}

- (TIKeyboardLayout)baseLayout
{
  return self->_baseLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseLayout, 0);
}

@end

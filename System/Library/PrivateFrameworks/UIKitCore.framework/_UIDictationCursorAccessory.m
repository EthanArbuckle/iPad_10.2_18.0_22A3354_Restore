@implementation _UIDictationCursorAccessory

- (id)identifier
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIDictationCursorAccessory;
  -[_UICursorAccessory identifier](&v5, sel_identifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dictation"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICursorAccessory setIdentifier:](self, "setIdentifier:", v3);
  }
  return v3;
}

@end

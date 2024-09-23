@implementation UITextReplacement

+ (UITextReplacement)replacementWithRange:(id)a3 original:(id)a4 replacement:(id)a5 menuTitle:(id)a6
{
  return (UITextReplacement *)objc_msgSend(a1, "replacementWithRange:original:replacement:menuTitle:isDictationCommandReplacement:", a3, a4, a5, a6, 0);
}

+ (UITextReplacement)replacementWithRange:(id)a3 original:(id)a4 replacement:(id)a5 menuTitle:(id)a6 isDictationCommandReplacement:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  UITextReplacement *v16;
  UITextReplacement *v17;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = objc_alloc_init(UITextReplacement);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_range, a3);
    objc_storeStrong((id *)&v17->_originalText, a4);
    objc_storeStrong((id *)&v17->_replacementText, a5);
    objc_storeStrong((id *)&v17->_menuTitle, a6);
    v17->_isDictationCommandReplacement = a7;
  }

  return v17;
}

- (void)didReplaceTextWithTarget:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v12;
  id v13;

  v13 = a3;
  -[UITextReplacement replacementCompletionBlock](self, "replacementCompletionBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && objc_msgSend(v13, "conformsToProtocol:", &unk_1EDE22B80))
  {
    v5 = v13;
    -[UITextReplacement range](self, "range");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "start");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[UITextReplacement replacementText](self, "replacementText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "positionFromPosition:offset:", v7, objc_msgSend(v8, "length"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "textRangeFromPosition:toPosition:", v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextReplacement replacementCompletionBlock](self, "replacementCompletionBlock");
    v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[UITextReplacement replacementText](self, "replacementText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, id))v11)[2](v11, v12, v10, v5);

    -[UITextReplacement setReplacementCompletionBlock:](self, "setReplacementCompletionBlock:", 0);
  }

}

- (BOOL)_isNoReplacementsFoundItem
{
  NSString *menuTitle;
  void *v3;

  menuTitle = self->_menuTitle;
  _UINSLocalizedStringWithDefaultValue(CFSTR("No Replacements Found"), CFSTR("No Replacements Found"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(menuTitle) = -[NSString isEqualToString:](menuTitle, "isEqualToString:", v3);

  return (char)menuTitle;
}

- (UITextRange)range
{
  return self->_range;
}

- (NSString)originalText
{
  return self->_originalText;
}

- (NSString)replacementText
{
  return self->_replacementText;
}

- (NSString)menuTitle
{
  return self->_menuTitle;
}

- (BOOL)isDictationCommandReplacement
{
  return self->_isDictationCommandReplacement;
}

- (id)replacementCompletionBlock
{
  return self->_replacementCompletionBlock;
}

- (void)setReplacementCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unsigned)usageTrackingMask
{
  return self->_usageTrackingMask;
}

- (void)setUsageTrackingMask:(unsigned int)a3
{
  self->_usageTrackingMask = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_replacementCompletionBlock, 0);
  objc_storeStrong((id *)&self->_menuTitle, 0);
  objc_storeStrong((id *)&self->_replacementText, 0);
  objc_storeStrong((id *)&self->_originalText, 0);
  objc_storeStrong((id *)&self->_range, 0);
}

@end

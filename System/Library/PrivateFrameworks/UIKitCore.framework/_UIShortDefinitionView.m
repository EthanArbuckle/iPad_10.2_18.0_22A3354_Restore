@implementation _UIShortDefinitionView

- (_UIShortDefinitionView)initWithFrame:(CGRect)a3
{
  _UIShortDefinitionView *v3;
  _UIShortDefinitionView *v4;
  UITextView *v5;
  uint64_t v6;
  UITextView *definitionTextView;
  void *v8;
  UITextView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_UIShortDefinitionView;
  v3 = -[UIView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView setClipsToBounds:](v3, "setClipsToBounds:", 1);
    -[UIView setAutoresizingMask:](v4, "setAutoresizingMask:", 18);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
    -[UIView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    v5 = [UITextView alloc];
    v6 = -[UITextView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    definitionTextView = v4->_definitionTextView;
    v4->_definitionTextView = (UITextView *)v6;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_definitionTextView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITextView textContainer](v4->_definitionTextView, "textContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLineBreakMode:", 4);

    -[UIView addSubview:](v4, "addSubview:", v4->_definitionTextView);
    -[UITextView setScrollEnabled:](v4->_definitionTextView, "setScrollEnabled:", 0);
    -[UITextView setEditable:](v4->_definitionTextView, "setEditable:", 0);
    -[UITextView setMarginTop:](v4->_definitionTextView, "setMarginTop:", 0);
    -[UITextView _setInteractiveTextSelectionDisabled:](v4->_definitionTextView, "_setInteractiveTextSelectionDisabled:", 1);
    v9 = v4->_definitionTextView;
    +[UIColor clearColor](UIColor, "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v9, "setBackgroundColor:", v10);

    -[UITextView textContainer](v4->_definitionTextView, "textContainer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLineFragmentPadding:", 0.0);

    _NSDictionaryOfVariableBindings(CFSTR("_definitionTextView"), v4->_definitionTextView, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(15)-[_definitionTextView]-(15)-|"), 0, 0, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-[_definitionTextView]-|"), 0, 0, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraints:](v4, "addConstraints:", v13);
    -[UIView addConstraints:](v4, "addConstraints:", v14);

  }
  return v4;
}

- (void)setDefinitionValue:(id)a3
{
  _UIDefinitionValue *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _UIDefinitionValue *v10;

  v5 = (_UIDefinitionValue *)a3;
  if (self->_definitionValue != v5)
  {
    v10 = v5;
    objc_storeStrong((id *)&self->_definitionValue, a3);
    -[_UIDefinitionValue definition](self->_definitionValue, "definition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    v8 = objc_msgSend(v7, "length");
    +[UIReferenceLibraryViewController _colorAttributes](UIReferenceLibraryViewController, "_colorAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAttributes:range:", v9, 0, v8);

    objc_msgSend(v7, "removeAttribute:range:", *(_QWORD *)off_1E1678EB8, 0, v8);
    -[UITextView setAttributedText:](self->_definitionTextView, "setAttributedText:", v7);

    v5 = v10;
  }

}

- (_UIDefinitionValue)definitionValue
{
  return self->_definitionValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_definitionTextView, 0);
  objc_storeStrong((id *)&self->_definitionValue, 0);
}

@end

@implementation AENoteEditorViewController

- (void)beginEditing
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[AENoteEditorViewController textView](self, "textView"));
  objc_msgSend(v2, "becomeFirstResponder");

}

- (void)endEditing
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[AENoteEditorViewController textView](self, "textView"));
  objc_msgSend(v2, "endEditing:", 1);

}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 310.0;
  v3 = 205.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;
  _QWORD v28[4];

  v27.receiver = self;
  v27.super_class = (Class)AENoteEditorViewController;
  -[AENoteEditorViewController viewDidLoad](&v27, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteEditorViewController textView](self, "textView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteEditorViewController view](self, "view"));
  objc_msgSend(v23, "addSubview:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "safeAreaLayoutGuide"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:constant:", v24, 14.0));
  v28[0] = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v20, -14.0));
  v28[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, 10.0));
  v28[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v26 = v4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, -10.0));
  v28[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteEditorViewController delegate](self, "delegate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "noteEditorViewControllerAnnotationToEdit:", self));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "annotationNote"));
  objc_msgSend(v3, "setText:", v15);

  objc_msgSend(v3, "setTextDragOptions:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "themeForNoteEditorViewController:", self));
  v17 = v16;
  if (v16)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "noteTextColor"));
    objc_msgSend(v3, "setTextColor:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "noteBorderColor"));
    objc_msgSend(v23, "setBackgroundColor:", v19);

  }
}

- (UITextView)textView
{
  UITextView *textView;
  UITextView *v4;
  UITextView *v5;
  void *v6;
  void *v7;

  textView = self->_textView;
  if (!textView)
  {
    v4 = (UITextView *)objc_alloc_init((Class)UITextView);
    v5 = self->_textView;
    self->_textView = v4;

    -[UITextView setDelegate:](self->_textView, "setDelegate:", self);
    -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_textView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITextView setAlwaysBounceVertical:](self->_textView, "setAlwaysBounceVertical:", 1);
    -[UITextView setShowsHorizontalScrollIndicator:](self->_textView, "setShowsHorizontalScrollIndicator:", 0);
    -[UITextView setDelaysContentTouches:](self->_textView, "setDelaysContentTouches:", 0);
    -[UITextView setCanCancelContentTouches:](self->_textView, "setCanCancelContentTouches:", 0);
    -[UITextView setBouncesZoom:](self->_textView, "setBouncesZoom:", 0);
    -[UITextView setAutocapitalizationType:](self->_textView, "setAutocapitalizationType:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithName:size:](UIFont, "fontWithName:size:", CFSTR("Avenir-Roman"), 17.0));
    -[UITextView setFont:](self->_textView, "setFont:", v6);

    -[UITextView setTextAlignment:](self->_textView, "setTextAlignment:", 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UITextView setBackgroundColor:](self->_textView, "setBackgroundColor:", v7);

    textView = self->_textView;
  }
  return textView;
}

- (void)textViewDidChangeSelection:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "selectedRange");
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "layoutManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "textContainer"));
    objc_msgSend(v4, "ensureLayoutForTextContainer:", v5);

    objc_msgSend(v16, "layoutIfNeeded");
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "selectedTextRange"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "start"));
    objc_msgSend(v16, "caretRectForPosition:", v7);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    objc_msgSend(v16, "scrollRectToVisible:animated:", 1, v9, v11, v13, v15);
  }

}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  id v7;
  void *v8;
  char *v9;
  char *v10;

  length = a4.length;
  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "text"));
  v9 = (char *)objc_msgSend(v8, "length") - length;
  v10 = (char *)objc_msgSend(v7, "length");

  return &v10[(_QWORD)v9] < (_BYTE *)&loc_186A0 + 1;
}

- (void)textViewDidEndEditing:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[AENoteEditorViewController delegate](self, "delegate", a3));
  if ((objc_opt_respondsToSelector(v4, "noteEditorViewControllerDidEndEditing:") & 1) != 0)
    objc_msgSend(v4, "noteEditorViewControllerDidEndEditing:", self);

}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (AENoteEditorViewControllerDelegate)delegate
{
  return (AENoteEditorViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end

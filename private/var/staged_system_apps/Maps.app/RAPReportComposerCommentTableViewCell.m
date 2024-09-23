@implementation RAPReportComposerCommentTableViewCell

- (double)preferredHeight
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText font](self->_textView, "font"));
  objc_msgSend(v2, "_mapkit_scaledValueForValue:", 146.0);
  v4 = v3;

  return v4;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  CGSize result;

  width = a3.width;
  -[RAPReportComposerCommentTableViewCell intrinsicContentSize](self, "intrinsicContentSize", a3.width, a3.height);
  v5 = width;
  result.height = v4;
  result.width = v5;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  CGSize result;

  -[RAPReportComposerCommentTableViewCell preferredHeight](self, "preferredHeight");
  v3 = v2;
  v4 = UITableViewAutomaticDimension;
  result.height = v3;
  result.width = v4;
  return result;
}

- (RAPReportComposerCommentTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  RAPReportComposerCommentTableViewCell *v4;
  RAPReportComposerCommentTableViewCell *v5;
  TextViewWithPlaceholderText *v6;
  void *v7;
  TextViewWithPlaceholderText *v8;
  TextViewWithPlaceholderText *textView;
  void *v10;
  void *v11;
  uint64_t v12;
  NSLayoutConstraint *heightConstraint;
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
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  objc_super v39;
  _QWORD v40[5];

  v39.receiver = self;
  v39.super_class = (Class)RAPReportComposerCommentTableViewCell;
  v4 = -[RAPReportComposerCommentTableViewCell initWithStyle:reuseIdentifier:](&v39, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_maximumTextLength = -1;
    -[RAPReportComposerCommentTableViewCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    v6 = [TextViewWithPlaceholderText alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerCommentTableViewCell contentView](v5, "contentView"));
    objc_msgSend(v7, "bounds");
    v8 = -[TextViewWithPlaceholderText initWithFrame:](v6, "initWithFrame:");
    textView = v5->_textView;
    v5->_textView = v8;

    -[TextViewWithPlaceholderText setTranslatesAutoresizingMaskIntoConstraints:](v5->_textView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TextViewWithPlaceholderText setDelegate:](v5->_textView, "setDelegate:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerCommentTableViewCell contentView](v5, "contentView"));
    objc_msgSend(v10, "addSubview:", v5->_textView);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText heightAnchor](v5->_textView, "heightAnchor"));
    -[RAPReportComposerCommentTableViewCell preferredHeight](v5, "preferredHeight");
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToConstant:"));
    heightConstraint = v5->_heightConstraint;
    v5->_heightConstraint = (NSLayoutConstraint *)v12;

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText leadingAnchor](v5->_textView, "leadingAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerCommentTableViewCell contentView](v5, "contentView"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "leadingAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:constant:", v36, 5.0));
    v40[0] = v35;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText trailingAnchor](v5->_textView, "trailingAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerCommentTableViewCell contentView](v5, "contentView"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "trailingAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:constant:", v32, -5.0));
    v40[1] = v31;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText topAnchor](v5->_textView, "topAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerCommentTableViewCell contentView](v5, "contentView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "topAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v15, 10.0));
    v40[2] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText bottomAnchor](v5->_textView, "bottomAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerCommentTableViewCell contentView](v5, "contentView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bottomAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v19, -10.0));
    v40[3] = v20;
    v40[4] = v5->_heightConstraint;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 5));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);

    -[RAPReportComposerCommentTableViewCell _setFont](v5, "_setFont");
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v22, "addObserver:selector:name:object:", v5, "_setFont", UIContentSizeCategoryDidChangeNotification, 0);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v23, "addObserver:selector:name:object:", v5, "_textDidChange", UITextViewTextDidChangeNotification, v5->_textView);

    -[NSLayoutConstraint setActive:](v5->_heightConstraint, "setActive:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerCommentTableViewCell traitCollection](v5, "traitCollection"));
    v25 = objc_msgSend(v24, "userInterfaceIdiom");

    if (v25 == (id)5)
    {
      -[TextViewWithPlaceholderText setTextContainerInset:](v5->_textView, "setTextContainerInset:", 0.0, 0.0, 0.0, 0.0);
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGray6Color](UIColor, "systemGray6Color"));
      -[TextViewWithPlaceholderText setBackgroundColor:](v5->_textView, "setBackgroundColor:", v26);

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText layer](v5->_textView, "layer"));
      objc_msgSend(v27, "setCornerRadius:", 7.5);

      -[TextViewWithPlaceholderText setClipsToBounds:](v5->_textView, "setClipsToBounds:", 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      -[RAPReportComposerCommentTableViewCell setBackgroundColor:](v5, "setBackgroundColor:", v28);

    }
  }
  return v5;
}

- (void)_setFont
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RAPFontManager regularTitleFont](RAPFontManager, "regularTitleFont"));
  -[TextViewWithPlaceholderText setFont:](self->_textView, "setFont:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText font](self->_textView, "font"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText placeholderLabel](self->_textView, "placeholderLabel"));
  objc_msgSend(v5, "setFont:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText placeholderLabel](self->_textView, "placeholderLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
  objc_msgSend(v6, "setTextColor:", v7);

  -[RAPReportComposerCommentTableViewCell preferredHeight](self, "preferredHeight");
  -[NSLayoutConstraint setConstant:](self->_heightConstraint, "setConstant:");
}

- (void)setPropertiesFromQuestion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  id v9;

  v9 = a3;
  -[RAPReportComposerCommentTableViewCell setMaximumTextLength:](self, "setMaximumTextLength:", +[RAPCommentQuestion maximumCommentLength](RAPCommentQuestion, "maximumCommentLength"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "commentsPlaceholderText"));
  -[RAPReportComposerCommentTableViewCell setPlaceholderText:](self, "setPlaceholderText:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "comment"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerCommentTableViewCell commentText](self, "commentText"));
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "comment"));
    -[RAPReportComposerCommentTableViewCell setCommentText:](self, "setCommentText:", v8);

  }
}

- (void)_textDidChange
{
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[RAPReportComposerCommentTableViewCell commentText](self, "commentText"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RAPCommentQuestion validatedComment:](RAPCommentQuestion, "validatedComment:", v7));
  if ((objc_msgSend(v7, "isEqualToString:", v3) & 1) == 0)
    -[RAPReportComposerCommentTableViewCell setCommentText:](self, "setCommentText:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerCommentTableViewCell textDidChange](self, "textDidChange"));

  if (v4)
  {
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[RAPReportComposerCommentTableViewCell textDidChange](self, "textDidChange"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerCommentTableViewCell commentText](self, "commentText"));
    ((void (**)(_QWORD, void *))v5)[2](v5, v6);

  }
}

- (void)textViewDidBeginEditing:(id)a3
{
  if (-[RAPReportComposerCommentTableViewCell analyticTarget](self, "analyticTarget", a3))
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 10182, -[RAPReportComposerCommentTableViewCell analyticTarget](self, "analyticTarget"), 0);
}

- (void)beginEditingCommentIfPossible
{
  -[TextViewWithPlaceholderText becomeFirstResponder](self->_textView, "becomeFirstResponder");
}

- (NSString)commentText
{
  return (NSString *)-[TextViewWithPlaceholderText text](self->_textView, "text");
}

- (NSString)placeholderText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText placeholderLabel](self->_textView, "placeholderLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return (NSString *)v3;
}

- (void)setCommentText:(id)a3
{
  -[TextViewWithPlaceholderText setText:](self->_textView, "setText:", a3);
}

- (void)setPlaceholderText:(id)a3
{
  TextViewWithPlaceholderText *textView;
  id v5;
  void *v6;

  textView = self->_textView;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText placeholderLabel](textView, "placeholderLabel"));
  objc_msgSend(v6, "setText:", v5);

  -[TextViewWithPlaceholderText setNeedsLayout](self->_textView, "setNeedsLayout");
}

- (id)textDidChange
{
  return self->_textDidChange;
}

- (void)setTextDidChange:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)maximumTextLength
{
  return self->_maximumTextLength;
}

- (void)setMaximumTextLength:(unint64_t)a3
{
  self->_maximumTextLength = a3;
}

- (int)analyticTarget
{
  return self->_analyticTarget;
}

- (void)setAnalyticTarget:(int)a3
{
  self->_analyticTarget = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_textDidChange, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end

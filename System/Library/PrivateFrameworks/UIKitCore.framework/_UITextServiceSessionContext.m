@implementation _UITextServiceSessionContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *textWithContext;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  textWithContext = self->_textWithContext;
  if (textWithContext)
    objc_msgSend(v7, "encodeObject:forKey:", textWithContext, CFSTR("textWithContext"));
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", self->_selectedRange.location, self->_selectedRange.length);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("selectedRange"));

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", self->_presentationRect.origin.x, self->_presentationRect.origin.y, self->_presentationRect.size.width, self->_presentationRect.size.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("presentationRect"));

}

- (_UITextServiceSessionContext)initWithCoder:(id)a3
{
  id v4;
  _UITextServiceSessionContext *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  void *v9;
  NSUInteger v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_UITextServiceSessionContext;
  v5 = -[_UITextServiceSessionContext init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textWithContext"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (__CFString *)v6;
    else
      v8 = &stru_1E16EDF20;
    objc_storeStrong((id *)&v5->_textWithContext, v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selectedRange"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_selectedRange.location = objc_msgSend(v9, "rangeValue");
    v5->_selectedRange.length = v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("presentationRect"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "CGRectValue");
    v5->_presentationRect.origin.x = v12;
    v5->_presentationRect.origin.y = v13;
    v5->_presentationRect.size.width = v14;
    v5->_presentationRect.size.height = v15;

  }
  return v5;
}

+ (id)sessionContextWithText:(id)a3 withRect:(CGRect)a4 withView:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  id v12;
  CGFloat *v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a5;
  v12 = a3;
  v13 = (CGFloat *)objc_msgSend(objc_alloc((Class)a1), "initForType:withText:withTextInput:withView:", 0, v12, 0, v11);

  v13[7] = x;
  v13[8] = y;
  v13[9] = width;
  v13[10] = height;
  return v13;
}

+ (id)sessionContextWithText:(id)a3 withRect:(CGRect)a4 withRange:(_NSRange)a5 withView:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v14;
  id v15;
  CGFloat *v16;

  length = a5.length;
  location = a5.location;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v14 = a6;
  v15 = a3;
  v16 = (CGFloat *)objc_msgSend(objc_alloc((Class)a1), "initForType:withText:withTextInput:withView:", 0, v15, 0, v14);

  v16[7] = x;
  v16[8] = y;
  v16[9] = width;
  v16[10] = height;
  *((_QWORD *)v16 + 5) = location;
  *((_QWORD *)v16 + 6) = length;
  return v16;
}

+ (id)sessionContextForType:(int64_t)a3 withTextInput:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initForType:withText:withTextInput:withView:", a3, 0, v6, 0);

  return v7;
}

- (id)initForType:(int64_t)a3 withText:(id)a4 withTextInput:(id)a5 withView:(id)a6
{
  id v10;
  id v11;
  id v12;
  _UITextServiceSessionContext *v13;
  _UITextServiceSessionContext *v14;
  UIView *v15;
  UIView *view;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSString *textWithContext;
  uint64_t v26;
  NSString *v27;
  uint64_t v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  objc_super v34;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v34.receiver = self;
  v34.super_class = (Class)_UITextServiceSessionContext;
  v13 = -[_UITextServiceSessionContext init](&v34, sel_init);
  v14 = v13;
  if (!v13)
    goto LABEL_23;
  objc_storeStrong((id *)&v13->_textInput, a5);
  if (v12)
  {
    v15 = (UIView *)v12;
  }
  else
  {
    objc_msgSend(v11, "textInputView");
    v15 = (UIView *)objc_claimAutoreleasedReturnValue();
  }
  view = v14->_view;
  v14->_view = v15;

  if (!v10)
  {
    objc_msgSend((id)objc_opt_class(), "selectedTextRangeForTextInput:", v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_15;
    objc_msgSend(v11, "_rvItemForSelectedRange");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_storeStrong((id *)&v14->_rvItemWithContext, v19);
      if (objc_msgSend(v19, "type") == 3)
      {
        objc_msgSend(v19, "ddResult");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "matchedString");
        v21 = objc_claimAutoreleasedReturnValue();
LABEL_13:
        textWithContext = v14->_textWithContext;
        v14->_textWithContext = (NSString *)v21;

        goto LABEL_14;
      }
      objc_msgSend(v19, "text");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend(v19, "text");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v19, "highlightRange");
        objc_msgSend(v20, "substringWithRange:", v23, v24);
        v21 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
    }
LABEL_14:

LABEL_15:
    if (!v14->_textWithContext)
    {
      objc_msgSend(v11, "textInRange:", v18);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v14->_textWithContext;
      v14->_textWithContext = (NSString *)v26;

    }
    goto LABEL_17;
  }
  v17 = (NSString *)v10;
  v18 = v14->_textWithContext;
  v14->_textWithContext = v17;
LABEL_17:

  v28 = -[NSString length](v14->_textWithContext, "length");
  v14->_selectedRange.location = 0;
  v14->_selectedRange.length = v28;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIView _shortcutPresentationRect](v14->_view, "_shortcutPresentationRect");
  else
    objc_msgSend((id)objc_opt_class(), "selectionBoundingBoxForTextInput:", v11);
  v14->_presentationRect.origin.x = v29;
  v14->_presentationRect.origin.y = v30;
  v14->_presentationRect.size.width = v31;
  v14->_presentationRect.size.height = v32;
  if (v14->_textInput && -[_UITextServiceSessionContext _typeRequiresContext:](v14, "_typeRequiresContext:", a3))
    -[_UITextServiceSessionContext _gatherAdditionalContext](v14, "_gatherAdditionalContext");
LABEL_23:

  return v14;
}

+ (id)selectedTextRangeForTextInput:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a3;
  objc_msgSend(v3, "selectedTextRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEmpty") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "textRangeForServicesInteraction");
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }

  return v4;
}

+ (CGRect)selectionBoundingBoxForTextInput:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect result;

  v3 = a3;
  objc_msgSend(v3, "interactionAssistant");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_editMenuAssistant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "selectionBoundingBox");
  x = v20.origin.x;
  y = v20.origin.y;
  width = v20.size.width;
  height = v20.size.height;
  if (CGRectIsEmpty(v20) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "textRangeForServicesInteraction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "selectionRectsForRange:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectionBoundingBoxForRects:", v11);
    x = v12;
    y = v13;
    width = v14;
    height = v15;

  }
  v16 = x;
  v17 = y;
  v18 = width;
  v19 = height;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (BOOL)_typeRequiresContext:(int64_t)a3
{
  return a3 == 16;
}

- (void)_gatherAdditionalContext
{
  void *v3;
  UITextInput *textInput;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  UITextInput *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  UITextInput *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  uint64_t v24;
  UITextInput *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  __CFString *v30;
  __CFString *v31;
  __CFString *textWithContext;
  __CFString *v33;
  NSString *v34;
  NSString *v35;
  NSUInteger v36;
  NSUInteger v37;
  id v38;

  -[UITextInput selectedTextRange](self->_textInput, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  textInput = self->_textInput;
  v38 = v3;
  objc_msgSend(v3, "start");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInput positionFromPosition:inDirection:offset:](textInput, "positionFromPosition:inDirection:offset:", v5, 3, 250);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_4;
  -[UITextInput tokenizer](self->_textInput, "tokenizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isPosition:atBoundary:inDirection:", v6, 1, 1);

  if ((v8 & 1) == 0)
  {
    -[UITextInput tokenizer](self->_textInput, "tokenizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "positionFromPosition:toBoundary:inDirection:", v6, 1, 1);
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v10;
    if (!v10)
    {
LABEL_4:
      -[UITextInput beginningOfDocument](self->_textInput, "beginningOfDocument");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  v11 = self->_textInput;
  objc_msgSend(v38, "start");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInput textRangeFromPosition:toPosition:](v11, "textRangeFromPosition:toPosition:", v6, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInput textInRange:](v11, "textInRange:", v13);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (__CFString *)v14;
  else
    v16 = &stru_1E16EDF20;
  v17 = v16;

  v18 = self->_textInput;
  objc_msgSend(v38, "end");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInput positionFromPosition:inDirection:offset:](v18, "positionFromPosition:inDirection:offset:", v19, 2, 250);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
    goto LABEL_11;
  -[UITextInput tokenizer](self->_textInput, "tokenizer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isPosition:atBoundary:inDirection:", v20, 1, 0);

  if ((v22 & 1) == 0)
  {
    -[UITextInput tokenizer](self->_textInput, "tokenizer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "positionFromPosition:toBoundary:inDirection:", v20, 1, 0);
    v24 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v24;
    if (!v24)
    {
LABEL_11:
      -[UITextInput endOfDocument](self->_textInput, "endOfDocument");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  v25 = self->_textInput;
  objc_msgSend(v38, "end");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInput textRangeFromPosition:toPosition:](v25, "textRangeFromPosition:toPosition:", v26, v20);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInput textInRange:](v25, "textInRange:", v27);
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v28;
  if (v28)
    v30 = (__CFString *)v28;
  else
    v30 = &stru_1E16EDF20;
  v31 = v30;

  textWithContext = (__CFString *)self->_textWithContext;
  if (!textWithContext)
    textWithContext = &stru_1E16EDF20;
  v33 = textWithContext;
  -[__CFString stringByAppendingFormat:](v17, "stringByAppendingFormat:", CFSTR("%@%@"), v33, v31);
  v34 = (NSString *)objc_claimAutoreleasedReturnValue();
  v35 = self->_textWithContext;
  self->_textWithContext = v34;

  v36 = -[__CFString length](v17, "length");
  v37 = -[__CFString length](v33, "length");

  self->_selectedRange.location = v36;
  self->_selectedRange.length = v37;

}

- (void)convertRectToView:(id)a3
{
  UITextInput *textInput;
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  id v14;

  textInput = self->_textInput;
  v5 = a3;
  -[UITextInput textInputView](textInput, "textInputView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertRect:fromView:", v14, self->_presentationRect.origin.x, self->_presentationRect.origin.y, self->_presentationRect.size.width, self->_presentationRect.size.height);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  self->_presentationRect.origin.x = v7;
  self->_presentationRect.origin.y = v9;
  self->_presentationRect.size.width = v11;
  self->_presentationRect.size.height = v13;

}

- (UITextInput)textInput
{
  return self->_textInput;
}

- (UIView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
  objc_storeStrong((id *)&self->_view, a3);
}

- (_UITextServiceSessionContext)textWithContext
{
  return (_UITextServiceSessionContext *)self->_textWithContext;
}

- (RVItem)rvItemWithContext
{
  return self->_rvItemWithContext;
}

- (_NSRange)selectedRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_selectedRange.length;
  location = self->_selectedRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (CGRect)presentationRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_presentationRect.origin.x;
  y = self->_presentationRect.origin.y;
  width = self->_presentationRect.size.width;
  height = self->_presentationRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rvItemWithContext, 0);
  objc_storeStrong((id *)&self->_textWithContext, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_textInput, 0);
}

@end

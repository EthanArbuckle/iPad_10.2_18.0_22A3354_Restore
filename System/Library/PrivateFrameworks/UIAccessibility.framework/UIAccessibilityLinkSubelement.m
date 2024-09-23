@implementation UIAccessibilityLinkSubelement

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x1E0CEB138];
}

- (unint64_t)_accessibilityAutomationType
{
  return 42;
}

- (id)textRangeForTextView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "beginningOfDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "positionFromPosition:offset:", v5, -[UIAccessibilityLinkSubelement range](self, "range"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UIAccessibilityLinkSubelement range](self, "range");
  -[UIAccessibilityLinkSubelement range](self, "range");
  objc_msgSend(v4, "positionFromPosition:offset:", v5, v8 + v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textRangeFromPosition:toPosition:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (CGRect)accessibilityFrame
{
  uint64_t v3;
  void *v4;
  CGFloat x;
  double v6;
  CGFloat y;
  double v8;
  CGFloat width;
  double v10;
  CGFloat height;
  void *v12;
  char isKindOfClass;
  void *v14;
  id v15;
  UIView *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect result;

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    -[UIAccessibilityLinkSubelement accessibilityContainer](self, "accessibilityContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[UIAccessibilityLinkSubelement accessibilityContainer](self, "accessibilityContainer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (id)objc_msgSend(v14, "hitTest:withEvent:", 0, 0.0, 0.0);

      -[UIAccessibilityLinkSubelement accessibilityContainer](self, "accessibilityContainer");
      v16 = (UIView *)objc_claimAutoreleasedReturnValue();
      -[UIAccessibilityLinkSubelement textRangeForTextView:](self, "textRangeForTextView:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView firstRectForRange:](v16, "firstRectForRange:", v17);
      v23 = UIAccessibilityConvertFrameToScreenCoordinates(v22, v16);
    }
    else
    {
      -[UIAccessibilityElement accessibilityDelegate](self, "accessibilityDelegate");
      v16 = (UIView *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[UIView accessibilityFrame:](v16, "accessibilityFrame:", self);
          x = v24.origin.x;
          y = v24.origin.y;
          width = v24.size.width;
          height = v24.size.height;
          if (!CGRectIsEmpty(v24))
            goto LABEL_10;
        }
      }
      -[UIAccessibilityLinkSubelement accessibilityContainer](self, "accessibilityContainer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "accessibilityFrame");
    }
    x = v23.origin.x;
    y = v23.origin.y;
    width = v23.size.width;
    height = v23.size.height;

LABEL_10:
    goto LABEL_11;
  }
  x = (*(double (**)(uint64_t))(v3 + 16))(v3);
  y = v6;
  width = v8;
  height = v10;
LABEL_11:

  v18 = x;
  v19 = y;
  v20 = width;
  v21 = height;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (_NSRange)range
{
  _NSRange *p_range;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_range = &self->_range;
  location = self->_range.location;
  length = p_range->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end

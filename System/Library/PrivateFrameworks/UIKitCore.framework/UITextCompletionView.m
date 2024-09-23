@implementation UITextCompletionView

- (UITextCompletionView)initWithFrame:(CGRect)a3 string:(id)a4 type:(int)a5 edgeType:(int)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v13;
  void *v14;
  double v15;
  CGFloat v16;
  UITextCompletionView *v17;
  UITextCompletionView *v18;
  uint64_t v19;
  NSString *string;
  objc_super v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a4;
  if (v13)
  {
    _documentTextFont();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(v13, "_legacy_sizeWithFont:forWidth:lineBreakMode:", v14, 2, 3.40282347e38);
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  v24 = CGRectInset(v23, 0.0, 0.0);
  v15 = v24.size.height * 0.68;
  if ((a6 - 1) >= 2)
    v15 = -0.0;
  v16 = v24.size.width + v15;
  v25 = CGRectIntegral(v24);
  v22.receiver = self;
  v22.super_class = (Class)UITextCompletionView;
  v17 = -[UIView initWithFrame:](&v22, sel_initWithFrame_, v25.origin.x, v25.origin.y, v25.size.width, v25.size.height);
  v18 = v17;
  if (v17)
  {
    v17->_edgeType = a6;
    v19 = objc_msgSend(v13, "copy");
    string = v18->_string;
    v18->_string = (NSString *)v19;

    v18->_type = a5;
    objc_storeStrong((id *)&v18->_textFont, v14);
    -[UIView setOpaque:](v18, "setOpaque:", 0);
    -[UIView setUserInteractionEnabled:](v18, "setUserInteractionEnabled:", 0);
  }

  return v18;
}

- (void)drawRect:(CGRect)a3
{
  double height;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  void *v31;
  NSString *string;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  int v38;
  double v39;
  double v40;
  id v41;
  id v42;
  id v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  height = a3.size.height;
  -[UIView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width);
  v5 = 0;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  switch(self->_type)
  {
    case 2:
      _typedTextBackgroundColor();
      v41 = (id)objc_claimAutoreleasedReturnValue();
      +[UIColor systemBlackColor](UIColor, "systemBlackColor");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 8:
      _typedTextBackgroundColor();
      v41 = (id)objc_claimAutoreleasedReturnValue();
      v15 = (void *)_textCompletionTextColor_color;
      if (!_textCompletionTextColor_color)
      {
        +[UIColor systemGrayColor](UIColor, "systemGrayColor");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)_textCompletionTextColor_color;
        _textCompletionTextColor_color = v16;

        v15 = (void *)_textCompletionTextColor_color;
      }
      v14 = v15;
LABEL_6:
      v18 = v14;
      v5 = v41;
      goto LABEL_10;
    case 9:
      +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "colorWithAlphaComponent:", 1.0);
      v42 = (id)objc_claimAutoreleasedReturnValue();

      v5 = v42;
      goto LABEL_9;
    case 0xA:
      +[UIColor systemBlueColor](UIColor, "systemBlueColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      v18 = 0;
LABEL_10:
      v43 = v5;
      if (v5)
      {
        v44.origin.x = v7;
        v44.origin.y = v9;
        v44.size.width = v11;
        v44.size.height = v13;
        v45 = CGRectInset(v44, 1.0, 1.0);
        x = v45.origin.x;
        y = v45.origin.y;
        width = v45.size.width;
        v23 = v45.size.height;
        objc_msgSend(v43, "set");
        v5 = v43;
        switch(self->_edgeType)
        {
          case 0:
          case 3:
            UIRectFillUsingOperation(1, x, y, width, v23);
            goto LABEL_16;
          case 1:
            v46.origin.x = x;
            v46.origin.y = y;
            v46.size.width = width;
            v46.size.height = v23;
            v24 = CGRectGetHeight(v46) * 0.5;
            v47.origin.x = x;
            v47.origin.y = y;
            v47.size.width = width;
            v47.size.height = v23;
            v25 = CGRectGetWidth(v47) * 0.5;
            v26 = x;
            v27 = y;
            v28 = width;
            v29 = v23;
            v30 = 10;
            goto LABEL_15;
          case 2:
            v48.origin.x = x;
            v48.origin.y = y;
            v48.size.width = width;
            v48.size.height = v23;
            v24 = CGRectGetHeight(v48) * 0.5;
            v49.origin.x = x;
            v49.origin.y = y;
            v49.size.width = width;
            v49.size.height = v23;
            v25 = CGRectGetWidth(v49) * 0.5;
            v26 = x;
            v27 = y;
            v28 = width;
            v29 = v23;
            v30 = 5;
LABEL_15:
            +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v30, v26, v27, v28, v29, v24, v25);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "fill");

LABEL_16:
            v5 = v43;
            break;
          default:
            break;
        }
      }
      if (v18)
      {
        objc_msgSend(v18, "set");
        string = self->_string;
        if (string && -[NSString length](string, "length"))
        {
          -[NSString _legacy_sizeWithFont:forWidth:lineBreakMode:](self->_string, "_legacy_sizeWithFont:forWidth:lineBreakMode:", self->_textFont, 2, 3.40282347e38);
          v34 = v33;
        }
        else
        {
          objc_msgSend(CFSTR(" "), "_legacy_sizeWithFont:forWidth:lineBreakMode:", self->_textFont, 2, 3.40282347e38);
          v34 = v35;
        }
        if (+[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI"))
        {
          +[UIKeyboard keyboardApplicationIdentifier](UIKeyboard, "keyboardApplicationIdentifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v36 = 0;
        }
        v37 = height - v34;
        if (objc_msgSend(v36, "isEqualToString:", CFSTR("com.apple.mobilemail")))
        {
          if (v37 < 1.0)
            v37 = 0.0;
          else
            v37 = v37 + -1.0;
        }
        else if ((objc_msgSend(v36, "isEqualToString:", CFSTR("com.apple.MobileSMS")) & 1) == 0)
        {
          v38 = objc_msgSend(v36, "isEqualToString:", CFSTR("com.apple.mobilenotes"));
          v39 = 1.0;
          if (v37 < 1.0)
            v39 = 0.0;
          if (v38)
            v37 = v39;
        }

        v40 = 0.0;
        if (self->_edgeType == 2)
          v40 = v13 * 0.68 + 0.0;
        -[NSString _legacy_drawAtPoint:forWidth:withFont:lineBreakMode:](self->_string, "_legacy_drawAtPoint:forWidth:withFont:lineBreakMode:", self->_textFont, 2, v40, v37 + 0.0, 3.40282347e38);

        v5 = v43;
      }
      break;
    default:
      break;
  }

}

- (CGRect)_calculateRectForExpandedHitRegion
{
  CGFloat x;
  CGFloat y;
  CGFloat height;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;
  CGRect v15;

  -[UIView bounds](self, "bounds");
  v12 = CGRectInset(v11, -15.0, -30.0);
  x = v12.origin.x;
  y = v12.origin.y;
  height = v12.size.height;
  v6 = v12.size.width + 5.0;
  -[UIView bounds](self, "bounds");
  v15.origin.x = v7;
  v15.origin.y = v8;
  v15.size.width = v9;
  v15.size.height = v10;
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = v6;
  v13.size.height = height;
  return CGRectUnion(v13, v15);
}

- (BOOL)pointInside:(CGPoint)a3 forEvent:(__GSEvent *)a4
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGPoint v18;
  CGRect v19;

  -[UITextCompletionView _calculateRectForExpandedHitRegion](self, "_calculateRectForExpandedHitRegion", a3.x, a3.y);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  GSEventGetLocationInWindow();
  -[UIView convertPoint:fromView:](self, "convertPoint:fromView:", GSEventGetWindow(), v13, v14);
  v18.x = v15;
  v18.y = v16;
  v19.origin.x = v6;
  v19.origin.y = v8;
  v19.size.width = v10;
  v19.size.height = v12;
  return CGRectContainsPoint(v19, v18);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[UITextCompletionView _calculateRectForExpandedHitRegion](self, "_calculateRectForExpandedHitRegion", a4);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFont, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end

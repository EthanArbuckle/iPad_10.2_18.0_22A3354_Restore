@implementation UIAutocorrectTextView

- (UIAutocorrectTextView)initWithFrame:(CGRect)a3 string:(id)a4 type:(int)a5 edgeType:(int)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  UIAutocorrectTextView *v21;
  UIAutocorrectTextView *v22;
  uint64_t v23;
  NSString *m_string;
  objc_super v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a4;
  if (v13)
  {
    if (a6)
      inlinePromptTextFont();
    else
      textFont();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  if (a5 == 2)
  {
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    v28 = CGRectInset(v27, -3.0, 0.0);
    v15 = v28.origin.y + -1.5;
    v16 = v28.size.width + -1.0;
    v17 = 1.0;
LABEL_16:
    v28.size.height = v28.size.height + v17;
    goto LABEL_17;
  }
  objc_msgSend(v13, "_legacy_sizeWithFont:forWidth:lineBreakMode:", v14, 2, 3.40282347e38);
  v29.size.width = ceil(v18);
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.height = height;
  v28 = CGRectInset(v29, -3.0, 0.0);
  if (a5 < 2)
  {
    v17 = 4.0;
    goto LABEL_16;
  }
  if (a5 == 3)
  {
    v17 = -1.0;
    goto LABEL_16;
  }
  if (a5 == 4)
    v28.size.height = v28.size.height + -1.0;
LABEL_17:
  v19 = v28.size.height * 0.68;
  if ((a6 - 1) >= 2)
    v19 = -0.0;
  v20 = v16 + v19;
  v30 = CGRectIntegral(v28);
  v26.receiver = self;
  v26.super_class = (Class)UIAutocorrectTextView;
  v21 = -[UIView initWithFrame:](&v26, sel_initWithFrame_, v30.origin.x, v30.origin.y, v30.size.width, v30.size.height);
  v22 = v21;
  if (v21)
  {
    v21->m_edgeType = a6;
    v23 = objc_msgSend(v13, "copy");
    m_string = v22->m_string;
    v22->m_string = (NSString *)v23;

    v22->m_type = a5;
    objc_storeStrong((id *)&v22->m_textFont, v14);
    -[UIView setOpaque:](v22, "setOpaque:", 0);
    -[UIView setUserInteractionEnabled:](v22, "setUserInteractionEnabled:", 0);
  }

  return v22;
}

- (void)setEdgeType:(int)a3
{
  double v5;
  double v6;
  double v7;
  int m_edgeType;

  if (self->m_edgeType != a3)
  {
    -[UIView frame](self, "frame");
    v7 = v6 * 0.68;
    if (a3 == 2)
    {
      m_edgeType = self->m_edgeType;
      if (m_edgeType == 1)
      {
        v5 = v5 + v7;
        goto LABEL_14;
      }
      if (m_edgeType)
      {
LABEL_14:
        self->m_edgeType = a3;
        -[UIView setFrame:](self, "setFrame:", v5);
        -[UIView setNeedsDisplay](self, "setNeedsDisplay");
        return;
      }
    }
    else
    {
      if (a3 == 1)
      {
        if (self->m_edgeType == 2)
          v5 = v5 - v7;
        goto LABEL_14;
      }
      if (a3 || self->m_edgeType != 2)
        goto LABEL_14;
    }
    v5 = v5 + v7;
    goto LABEL_14;
  }
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double x;
  double y;
  double width;
  double height;
  int m_edgeType;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  int v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  void *v41;
  int m_type;
  double v43;
  double v44;
  double v45;
  double v46;
  UIFont *m_textFont;
  uint64_t v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  int v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  id v67;
  id v68;
  id v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;

  -[UIView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  switch(self->m_type)
  {
    case 0:
    case 1:
      autocorrectTextBackgroundColor();
      v67 = (id)objc_claimAutoreleasedReturnValue();
      AutocorrectTextColor();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 1;
      AutocorrectTextOutlineColor();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        goto LABEL_6;
      goto LABEL_25;
    case 2:
      TypedTextBackgroundColor();
      v67 = (id)objc_claimAutoreleasedReturnValue();
      TypedTextBackgroundColor();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      v12 = 0;
      if (!v14)
        goto LABEL_25;
LABEL_6:
      if (self->m_animating)
        goto LABEL_25;
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "scale");
      v17 = v16;

      v18 = 0.5;
      if (v17 <= 1.0)
        v18 = 0.0;
      v65 = v18;
      v66 = v17;
      if (v17 <= 1.0)
        v19 = 0.0;
      else
        v19 = 0.75;
      v70.origin.x = v5;
      v70.origin.y = v7;
      v70.size.width = v9;
      v70.size.height = v11;
      v71 = CGRectInset(v70, v19, v19);
      x = v71.origin.x;
      y = v71.origin.y;
      width = v71.size.width;
      height = v71.size.height;
      objc_msgSend(v14, "set");
      m_edgeType = self->m_edgeType;
      if (m_edgeType != 2)
      {
        if (m_edgeType == 1)
        {
          +[UIBezierPath roundedRectBezierPath:withRoundedEdges:](UIBezierPath, "roundedRectBezierPath:withRoundedEdges:", 8, x, y, width, height);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (m_edgeType)
            goto LABEL_25;
          +[UIBezierPath roundedRectBezierPath:withRoundedCorners:withCornerRadius:](UIBezierPath, "roundedRectBezierPath:withRoundedCorners:withCornerRadius:", -1, x, y, width, height, 0.0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v29 = v25;
        objc_msgSend(v25, "setLineWidth:", v65);
        v30 = 1.0;
        if (v66 > 1.0)
          goto LABEL_23;
LABEL_20:
        objc_msgSend(v29, "fill", v30);
        goto LABEL_24;
      }
      +[UIBezierPath roundedRectBezierPath:withRoundedEdges:](UIBezierPath, "roundedRectBezierPath:withRoundedEdges:", 2, x, y, width, height);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setLineWidth:", v65);
      v30 = v66;
      if (v66 <= 1.0)
        goto LABEL_20;
LABEL_23:
      objc_msgSend(v29, "stroke", v30);
LABEL_24:

LABEL_25:
      v28 = v67;
LABEL_26:
      v68 = v28;
      if (v28)
      {
        v72.origin.x = v5;
        v72.origin.y = v7;
        v72.size.width = v9;
        v72.size.height = v11;
        v73 = CGRectInset(v72, 1.0, 1.0);
        v31 = v73.origin.x;
        v32 = v73.origin.y;
        v33 = v73.size.width;
        v34 = v73.size.height;
        objc_msgSend(v68, "set");
        v35 = self->m_edgeType;
        if (v35 == 2)
        {
          v36 = v31;
          v37 = v32;
          v38 = v33;
          v39 = v34;
          v40 = 2;
        }
        else
        {
          if (v35 != 1)
          {
            if (!v35)
              UIRectFillUsingOperation(1, v31, v32, v33, v34);
            goto LABEL_34;
          }
          v36 = v31;
          v37 = v32;
          v38 = v33;
          v39 = v34;
          v40 = 8;
        }
        +[UIBezierPath roundedRectBezierPath:withRoundedEdges:](UIBezierPath, "roundedRectBezierPath:withRoundedEdges:", v40, v36, v37, v38, v39);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "fill");

      }
LABEL_34:
      if (v12)
      {
        objc_msgSend(v12, "set");
        m_type = self->m_type;
        if (m_type == 1)
        {
          v43 = 2.0;
        }
        else
        {
          v43 = 3.0;
          if (m_type != 2)
            v43 = (double)(2 * (m_type == 3));
        }
        v44 = v43 + (double)v13;
        v45 = v11 * 0.68 + 3.0;
        if (self->m_edgeType != 2)
          v45 = 3.0;
        if (self->m_isLongString)
        {
          v46 = v9 - v11;
          m_textFont = self->m_textFont;
          v48 = 4;
        }
        else
        {
          m_textFont = self->m_textFont;
          v46 = 3.40282347e38;
          v48 = 2;
        }
        -[NSString _legacy_drawAtPoint:forWidth:withFont:lineBreakMode:](self->m_string, "_legacy_drawAtPoint:forWidth:withFont:lineBreakMode:", m_textFont, v48, v45, v44, v46);
      }
      if (self->m_type == 1)
      {
        v49 = v11 * 0.5;
        +[UIScreen mainScreen](UIScreen, "mainScreen");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "scale");
        v52 = v51;

        AutoCorrectCancelImage();
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "size");
        v55 = v54;
        v57 = v56;
        +[UIColor systemGrayColor](UIColor, "systemGrayColor");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v58;
        v60 = self->m_edgeType;
        if (v60 == 2)
        {
          if (v52 <= 1.0)
            v62 = 0.65;
          else
            v62 = dbl_18667F850[v11 < 22.0];
          v64 = v49 + v55 * -0.5 + -2.0 + 1.0;
        }
        else
        {
          if (v60 != 1)
          {
LABEL_56:

            goto LABEL_57;
          }
          v61 = v5 + v9;
          v62 = 1.0;
          v63 = 0.0;
          if (v52 > 1.0)
            v63 = 0.5;
          v64 = v63 + v61 - v49 - v55 * 0.5 + -1.0;
          objc_msgSend(v58, "set");
        }
        objc_msgSend(v53, "drawAtPoint:blendMode:alpha:", 0, v64, v49 + v57 * -0.5 + 0.0, v62);
        goto LABEL_56;
      }
LABEL_57:

      return;
    case 3:
      autocorrectTextBackgroundColor();
      v26 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    case 4:
      documentBackgroundColor();
      v26 = objc_claimAutoreleasedReturnValue();
LABEL_18:
      v69 = (id)v26;
      v13 = 1;
      typedTextColor();
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = v69;
      v12 = (void *)v27;
      v14 = 0;
      goto LABEL_26;
    default:
      v14 = 0;
      v12 = 0;
      v68 = 0;
      goto LABEL_57;
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

  -[UIAutocorrectTextView _calculateRectForExpandedHitRegion](self, "_calculateRectForExpandedHitRegion", a3.x, a3.y);
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
  -[UIAutocorrectTextView _calculateRectForExpandedHitRegion](self, "_calculateRectForExpandedHitRegion", a4);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (BOOL)animating
{
  return self->m_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->m_animating = a3;
}

- (BOOL)isLongString
{
  return self->m_isLongString;
}

- (void)setIsLongString:(BOOL)a3
{
  self->m_isLongString = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_textFont, 0);
  objc_storeStrong((id *)&self->m_string, 0);
}

@end

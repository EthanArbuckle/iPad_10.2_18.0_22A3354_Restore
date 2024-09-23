@implementation SUSubtitledButton

- (void)dealloc
{
  __CFDictionary *subtitleContentLookup;
  objc_super v4;

  subtitleContentLookup = self->_subtitleContentLookup;
  if (subtitleContentLookup)
  {
    CFRelease(subtitleContentLookup);
    self->_subtitleContentLookup = 0;
  }

  self->_subtitleView = 0;
  v4.receiver = self;
  v4.super_class = (Class)SUSubtitledButton;
  -[SUSubtitledButton dealloc](&v4, sel_dealloc);
}

- (void)layoutSubviews
{
  NSString *v3;
  UILabel *subtitleView;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUSubtitledButton;
  -[SUSubtitledButton layoutSubviews](&v5, sel_layoutSubviews);
  v3 = -[SUSubtitledButton currentSubtitle](self, "currentSubtitle");
  if (-[NSString length](v3, "length"))
  {
    -[SUSubtitledButton _setupSubtitleView](self, "_setupSubtitleView");
    -[UILabel setHidden:](self->_subtitleView, "setHidden:", 0);
    -[UILabel setShadowColor:](self->_subtitleView, "setShadowColor:", -[SUSubtitledButton currentSubtitleShadowColor](self, "currentSubtitleShadowColor"));
    -[UILabel setText:](self->_subtitleView, "setText:", v3);
    -[UILabel setTextColor:](self->_subtitleView, "setTextColor:", -[SUSubtitledButton currentSubtitleColor](self, "currentSubtitleColor"));
    subtitleView = self->_subtitleView;
    -[SUSubtitledButton bounds](self, "bounds");
    -[SUSubtitledButton contentRectForBounds:](self, "contentRectForBounds:");
    -[SUSubtitledButton subtitleRectForContentRect:](self, "subtitleRectForContentRect:");
    -[UILabel setFrame:](subtitleView, "setFrame:");
  }
  else
  {
    -[UILabel setHidden:](self->_subtitleView, "setHidden:", 1);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  NSString *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  CGSize result;

  v17.receiver = self;
  v17.super_class = (Class)SUSubtitledButton;
  -[SUSubtitledButton sizeThatFits:](&v17, sel_sizeThatFits_, a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  v8 = -[SUSubtitledButton currentSubtitle](self, "currentSubtitle");
  if (-[NSString length](v8, "length"))
  {
    -[NSString _legacy_sizeWithFont:forWidth:lineBreakMode:](v8, "_legacy_sizeWithFont:forWidth:lineBreakMode:", -[SUSubtitledButton _subtitleFont](self, "_subtitleFont"), -[SUSubtitledButton _subtitleLineBreakMode](self, "_subtitleLineBreakMode"), 3.40282347e38);
    v10 = v9;
    v12 = v11;
    -[SUSubtitledButton contentEdgeInsets](self, "contentEdgeInsets");
    v7 = v7 + v12;
    if (v5 < v10 + v13 + v14)
      v5 = v10 + v13 + v14;
  }
  v15 = v5;
  v16 = v7;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)configureFromScriptButton:(id)a3
{
  uint64_t v5;
  objc_super v6;

  objc_msgSend(a3, "subtitle");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = 0;
  else
    v5 = objc_msgSend(a3, "subtitle");
  -[SUSubtitledButton setSubtitle:forState:](self, "setSubtitle:forState:", v5, 0);
  v6.receiver = self;
  v6.super_class = (Class)SUSubtitledButton;
  -[UIButton configureFromScriptButton:](&v6, sel_configureFromScriptButton_, a3);
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  NSString *v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  id v25;
  double v26;
  double v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  objc_super v33;
  CGRect v34;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v33.receiver = self;
  v33.super_class = (Class)SUSubtitledButton;
  -[SUSubtitledButton titleRectForContentRect:](&v33, sel_titleRectForContentRect_);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = -[SUSubtitledButton currentSubtitle](self, "currentSubtitle");
  if (-[NSString length](v16, "length"))
  {
    -[SUSubtitledButton titleEdgeInsets](self, "titleEdgeInsets");
    v18 = x + v17;
    v20 = y + v19;
    v22 = width - (v17 + v21);
    v24 = height - (v19 + v23);
    v25 = -[SUSubtitledButton _subtitleFont](self, "_subtitleFont");
    v34.origin.x = v18;
    v34.origin.y = v20;
    v34.size.width = v22;
    v34.size.height = v24;
    -[NSString _legacy_sizeWithFont:forWidth:lineBreakMode:](v16, "_legacy_sizeWithFont:forWidth:lineBreakMode:", v25, -[SUSubtitledButton _subtitleLineBreakMode](self, "_subtitleLineBreakMode"), CGRectGetWidth(v34));
    v27 = v26;
    v28 = -[SUSubtitledButton contentVerticalAlignment](self, "contentVerticalAlignment");
    if (v28 != 1 && v28 != 3)
    {
      if (v28 == 2)
        v11 = v11 - (v27 + 1.0);
      else
        v11 = v20 + floor((v24 - (v15 + v27 + 1.0)) * 0.5);
    }
  }
  v29 = v9;
  v30 = v11;
  v31 = v13;
  v32 = v15;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (NSString)currentSubtitle
{
  return (NSString *)-[SUSubtitledButton subtitleForState:](self, "subtitleForState:", -[SUSubtitledButton state](self, "state"));
}

- (UIColor)currentSubtitleColor
{
  return (UIColor *)-[SUSubtitledButton subtitleColorForState:](self, "subtitleColorForState:", -[SUSubtitledButton state](self, "state"));
}

- (UIColor)currentSubtitleShadowColor
{
  return (UIColor *)-[SUSubtitledButton subtitleShadowColorForState:](self, "subtitleShadowColorForState:", -[SUSubtitledButton state](self, "state"));
}

- (void)setSubtitle:(id)a3 forState:(unint64_t)a4
{
  objc_msgSend(-[SUSubtitledButton _subtitledContentForState:](self, "_subtitledContentForState:", a4), "setSubtitle:", a3);
  if (-[SUSubtitledButton autosizesToFit](self, "autosizesToFit"))
    -[SUSubtitledButton sizeToFit](self, "sizeToFit");
  -[SUSubtitledButton setNeedsLayout](self, "setNeedsLayout");
  if (a4)
  {
    if (-[SUSubtitledButton state](self, "state") == a4)
      -[SUSubtitledButton layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)setSubtitleColor:(id)a3 forState:(unint64_t)a4
{
  objc_msgSend(-[SUSubtitledButton _subtitledContentForState:](self, "_subtitledContentForState:", a4), "setSubtitleColor:", a3);
  -[SUSubtitledButton setNeedsLayout](self, "setNeedsLayout");
  if (a4)
  {
    if (-[SUSubtitledButton state](self, "state") == a4)
      -[SUSubtitledButton layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)setSubtitleShadowColor:(id)a3 forState:(unint64_t)a4
{
  objc_msgSend(-[SUSubtitledButton _subtitledContentForState:](self, "_subtitledContentForState:", a4), "setSubtitleShadowColor:", a3);
  -[SUSubtitledButton setNeedsLayout](self, "setNeedsLayout");
  if (a4)
  {
    if (-[SUSubtitledButton state](self, "state") == a4)
      -[SUSubtitledButton layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (id)subtitleColorForState:(unint64_t)a3
{
  id result;

  result = (id)objc_msgSend(-[SUSubtitledButton _subtitledContentForState:](self, "_subtitledContentForState:", a3), "subtitleColor");
  if (!result)
    return (id)objc_msgSend(-[SUSubtitledButton _subtitledContentForState:](self, "_subtitledContentForState:", 0), "subtitleColor");
  return result;
}

- (id)subtitleForState:(unint64_t)a3
{
  id result;

  result = (id)objc_msgSend(-[SUSubtitledButton _subtitledContentForState:](self, "_subtitledContentForState:", a3), "subtitle");
  if (!result)
    return (id)objc_msgSend(-[SUSubtitledButton _subtitledContentForState:](self, "_subtitledContentForState:", 0), "subtitle");
  return result;
}

- (UILabel)subtitleLabel
{
  -[SUSubtitledButton _setupSubtitleView](self, "_setupSubtitleView");
  -[SUSubtitledButton layoutIfNeeded](self, "layoutIfNeeded");
  return self->_subtitleView;
}

- (CGRect)subtitleRectForContentRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  NSString *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  id v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  uint64_t v24;
  double v27;
  uint64_t v28;
  CGFloat MaxY;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[SUSubtitledButton currentSubtitle](self, "currentSubtitle");
  if (-[NSString length](v8, "length"))
  {
    -[SUSubtitledButton titleEdgeInsets](self, "titleEdgeInsets");
    v10 = x + v9;
    v12 = y + v11;
    v14 = width - (v9 + v13);
    v16 = height - (v11 + v15);
    v17 = -[SUSubtitledButton _subtitleFont](self, "_subtitleFont");
    v36.origin.x = v10;
    v36.origin.y = v12;
    v33 = v16;
    v34 = v14;
    v36.size.width = v14;
    v36.size.height = v16;
    -[NSString _legacy_sizeWithFont:forWidth:lineBreakMode:](v8, "_legacy_sizeWithFont:forWidth:lineBreakMode:", v17, -[SUSubtitledButton _subtitleLineBreakMode](self, "_subtitleLineBreakMode"), CGRectGetWidth(v36));
    v19 = v18;
    v35 = v20;
    v21 = -[SUSubtitledButton contentHorizontalAlignment](self, "contentHorizontalAlignment");
    v22 = v10;
    if (v21 != 1 && v21 != 3)
    {
      if (v21 == 2)
      {
        v37.origin.x = v10;
        v37.origin.y = v12;
        v37.size.height = v33;
        v37.size.width = v34;
        v22 = CGRectGetMaxX(v37) - v19;
      }
      else
      {
        v22 = v10 + floor((v34 - v19) * 0.5);
      }
    }
    -[SUSubtitledButton titleRectForContentRect:](self, "titleRectForContentRect:", x, y, width, height);
    if (v27 > 0.00000011920929)
    {
      v12 = CGRectGetMaxY(*(CGRect *)&v24) + 1.0;
LABEL_14:
      v23 = v35;
      goto LABEL_15;
    }
    v28 = -[SUSubtitledButton contentVerticalAlignment](self, "contentVerticalAlignment");
    if (v28 == 1 || v28 == 3)
      goto LABEL_14;
    if (v28 == 2)
    {
      v38.origin.x = v10;
      v38.origin.y = v12;
      v38.size.height = v33;
      v38.size.width = v34;
      MaxY = CGRectGetMaxY(v38);
      v23 = v35;
      v12 = MaxY - v35;
    }
    else
    {
      v23 = v35;
      v12 = v12 + floor((v33 - v35) * 0.5);
    }
  }
  else
  {
    v22 = *MEMORY[0x24BDBF090];
    v12 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v19 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v23 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
LABEL_15:
  v30 = v22;
  v31 = v12;
  v32 = v19;
  result.size.height = v23;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (id)subtitleShadowColorForState:(unint64_t)a3
{
  id result;

  result = (id)objc_msgSend(-[SUSubtitledButton _subtitledContentForState:](self, "_subtitledContentForState:", a3), "subtitleShadowColor");
  if (!result)
    return (id)objc_msgSend(-[SUSubtitledButton _subtitledContentForState:](self, "_subtitledContentForState:", 0), "subtitleShadowColor");
  return result;
}

- (void)_setupSubtitleView
{
  UILabel *v3;

  if (!self->_subtitleView)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    self->_subtitleView = v3;
    -[UILabel setBackgroundColor:](v3, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
    -[UILabel setFont:](self->_subtitleView, "setFont:", objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 14.0));
    -[UILabel setEnabled:](self->_subtitleView, "setEnabled:", 1);
    -[UILabel setClipsToBounds:](self->_subtitleView, "setClipsToBounds:", 1);
    -[UILabel setShadowOffset:](self->_subtitleView, "setShadowOffset:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
    -[UILabel setTextAlignment:](self->_subtitleView, "setTextAlignment:", 2 * (-[SUSubtitledButton contentHorizontalAlignment](self, "contentHorizontalAlignment") == 2));
    -[SUSubtitledButton addSubview:](self, "addSubview:", self->_subtitleView);
    -[SUSubtitledButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)_subtitledContentForState:(unint64_t)a3
{
  __CFDictionary *subtitleContentLookup;
  SUSubtitledButtonContent *Value;

  subtitleContentLookup = self->_subtitleContentLookup;
  if (!subtitleContentLookup)
  {
    subtitleContentLookup = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x24BDBD6B0]);
    self->_subtitleContentLookup = subtitleContentLookup;
  }
  Value = (SUSubtitledButtonContent *)CFDictionaryGetValue(subtitleContentLookup, (const void *)a3);
  if (!Value)
  {
    Value = objc_alloc_init(SUSubtitledButtonContent);
    CFDictionarySetValue(self->_subtitleContentLookup, (const void *)a3, Value);

  }
  return Value;
}

- (id)_subtitleFont
{
  UILabel *subtitleView;

  subtitleView = self->_subtitleView;
  if (subtitleView)
    return -[UILabel font](subtitleView, "font");
  else
    return (id)objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 14.0);
}

- (int64_t)_subtitleLineBreakMode
{
  UILabel *subtitleView;

  subtitleView = self->_subtitleView;
  if (subtitleView)
    return -[UILabel lineBreakMode](subtitleView, "lineBreakMode");
  else
    return 4;
}

@end

@implementation PBToolbar

+ (id)backgroundImage
{
  return -[UIImage stretchableImageWithLeftCapWidth:topCapHeight:](+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("PBGlassToolbar.png")), "stretchableImageWithLeftCapWidth:topCapHeight:", 0, 0);
}

- (PBToolbar)initWithFrame:(CGRect)a3
{
  PBToolbar *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PBToolbar;
  v3 = -[PBToolbar initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PBToolbar setBarStyle:](v3, "setBarStyle:", 1);
  -[PBToolbar setBackgroundColor:](v3, "setBackgroundColor:", +[UIColor clearColor](UIColor, "clearColor"));
  -[PBToolbar setOpaque:](v3, "setOpaque:", 0);
  v3->_backgroundImage = (UIImage *)objc_msgSend((id)objc_opt_class(v3, v4), "backgroundImage");
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PBToolbar;
  -[PBToolbar dealloc](&v3, "dealloc");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  CGSize result;

  width = a3.width;
  -[UIImage size](self->_backgroundImage, "size", a3.width, a3.height);
  v5 = width;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PBToolbar;
  -[PBToolbar layoutSubviews](&v3, "layoutSubviews");
  if (self->_labelView)
    -[PBToolbar _updateLabelViewLocation](self, "_updateLabelViewLocation");
}

- (void)_updateLabelViewLocation
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  char *v23;
  char *v24;
  unint64_t v25;
  uint64_t v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  double MaxX;
  double v36;
  double MinX;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v42;
  CGFloat v43;
  CGFloat v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  -[UILabel sizeToFit](self->_labelView, "sizeToFit");
  -[UILabel frame](self->_labelView, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[PBToolbar bounds](self, "bounds");
  v17 = UIRectCenteredIntegralRect(v11, v4, v6, v8, v10, v12, v13, v14, v15);
  v19 = v18;
  v21 = v20;
  if (self->_labelPlaceholder)
  {
    v44 = v16;
    v22 = -[PBToolbar items](self, "items");
    v23 = (char *)objc_msgSend(v22, "count");
    v24 = (char *)objc_msgSend(v22, "indexOfObject:", self->_labelPlaceholder);
    v25 = (unint64_t)v24;
    if (v24 + 1 < v23)
      v26 = (uint64_t)(v24 + 1);
    else
      v26 = 0x7FFFFFFFFFFFFFFFLL;
    -[PBToolbar bounds](self, "bounds");
    v31 = v27;
    v32 = v28;
    v33 = v29;
    v34 = v30;
    if ((v25 & 0x7FFFFFFFFFFFFFFFLL) != 0)
    {
      -[PBToolbar _frameOfBarButtonItem:](self, "_frameOfBarButtonItem:", objc_msgSend(v22, "objectAtIndex:", v25 - 1));
      MaxX = CGRectGetMaxX(v45);
    }
    else
    {
      MaxX = CGRectGetMinX(*(CGRect *)&v27);
    }
    v36 = MaxX;
    if (v26 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v46.origin.x = v31;
      v46.origin.y = v32;
      v46.size.width = v33;
      v46.size.height = v34;
      MinX = CGRectGetMaxX(v46);
    }
    else
    {
      -[PBToolbar _frameOfBarButtonItem:](self, "_frameOfBarButtonItem:", objc_msgSend(v22, "objectAtIndex:", v26));
      MinX = CGRectGetMinX(v47);
    }
    v48.size.width = MinX - v36;
    v48.origin.x = v36;
    v48.origin.y = v32;
    v48.size.height = v34;
    v49 = CGRectInset(v48, 10.0, 0.0);
    x = v49.origin.x;
    y = v49.origin.y;
    width = v49.size.width;
    height = v49.size.height;
    if (v17 < v49.origin.x)
      v17 = v49.origin.x;
    v50.origin.x = v17;
    v50.origin.y = v44;
    v50.size.width = v19;
    v50.size.height = v21;
    v42 = CGRectGetMaxX(v50);
    v51.origin.x = x;
    v51.origin.y = y;
    v51.size.width = width;
    v51.size.height = height;
    v43 = CGRectGetMaxX(v51);
    v16 = v44;
    v19 = v19 - fmax(v42 - v43, 0.0);
  }
  -[UILabel setFrame:](self->_labelView, "setFrame:", v17, v16, v19, v21);
}

- (void)drawRect:(CGRect)a3
{
  UIImage *backgroundImage;

  backgroundImage = self->_backgroundImage;
  -[PBToolbar bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UIImage drawInRect:](backgroundImage, "drawInRect:");
}

- (void)setMessage:(id)a3
{
  UILabel *labelView;
  id v6;
  UILabel *v7;

  if (a3 && !objc_msgSend(a3, "isEqualToString:", &stru_100035390))
  {
    labelView = self->_labelView;
    if (!labelView)
    {
      v6 = objc_alloc((Class)UILabel);
      -[PBToolbar bounds](self, "bounds");
      v7 = (UILabel *)objc_msgSend(v6, "initWithFrame:");
      self->_labelView = v7;
      -[UILabel setAutoresizingMask:](v7, "setAutoresizingMask:", 1);
      -[UILabel setAdjustsFontSizeToFitWidth:](self->_labelView, "setAdjustsFontSizeToFitWidth:", 1);
      -[UILabel setBackgroundColor:](self->_labelView, "setBackgroundColor:", +[UIColor clearColor](UIColor, "clearColor"));
      -[UILabel setTextColor:](self->_labelView, "setTextColor:", +[UIColor whiteColor](UIColor, "whiteColor"));
      -[UILabel setTextAlignment:](self->_labelView, "setTextAlignment:", 1);
      -[UILabel setFont:](self->_labelView, "setFont:", +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 20.0));
      -[PBToolbar addSubview:](self, "addSubview:", self->_labelView);

      labelView = self->_labelView;
    }
    -[UILabel setText:](labelView, "setText:", a3);
    -[PBToolbar _updateLabelViewLocation](self, "_updateLabelViewLocation");
  }
  else
  {
    -[UILabel removeFromSuperview](self->_labelView, "removeFromSuperview");
    self->_labelView = 0;
  }
}

- (NSString)message
{
  return -[UILabel text](self->_labelView, "text");
}

- (void)setItems:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PBToolbar;
  -[PBToolbar setItems:](&v4, "setItems:", a3);
  self->_labelPlaceholder = 0;
}

- (void)setLabelPlaceholder:(id)a3
{
  if ((objc_msgSend(-[PBToolbar items](self, "items"), "containsObject:", a3) & 1) == 0)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBToolbar.m"), 169, CFSTR("-items does not contain %@"), a3);

  self->_labelPlaceholder = (UIBarButtonItem *)a3;
  -[PBToolbar _updateLabelViewLocation](self, "_updateLabelViewLocation");
}

- (UIBarButtonItem)labelPlaceholder
{
  return self->_labelPlaceholder;
}

- (void)setItemsEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  objc_msgSend(-[PBToolbar items](self, "items"), "setValue:forKeyPath:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3), CFSTR("enabled"));
  -[UILabel setEnabled:](self->_labelView, "setEnabled:", v3);
}

- (BOOL)itemsEnabled
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = -[PBToolbar items](self, "items", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v5)
        objc_enumerationMutation(v2);
      v7 = objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "isEnabled");
      if (!v7)
        break;
      if (v4 == (id)++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v7) = 1;
  }
  return v7;
}

@end

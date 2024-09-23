@implementation _TVZoomableTextView

- (_TVZoomableTextView)initWithFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  _TVZoomableTextView *v5;
  _TVZoomableTextView *v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  v14.receiver = self;
  v14.super_class = (Class)_TVZoomableTextView;
  v5 = -[TVFocusableTextView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  v6 = v5;
  if (v5)
  {
    v5->_cachedSizeThatFits.width = width;
    v5->_cachedSizeThatFits.height = height;
    v5->_previousTargetSize = (CGSize)*MEMORY[0x24BDBF148];
    objc_initWeak(&location, v5);
    v7 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __37___TVZoomableTextView_initWithFrame___block_invoke;
    v11[3] = &unk_24EB863F8;
    objc_copyWeak(&v12, &location);
    -[TVFocusableTextView setSelectionHandler:](v6, "setSelectionHandler:", v11);
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __37___TVZoomableTextView_initWithFrame___block_invoke_2;
    v9[3] = &unk_24EB863F8;
    objc_copyWeak(&v10, &location);
    -[TVFocusableTextView setPlayHandler:](v6, "setPlayHandler:", v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)_TVZoomableTextView;
  -[_TVZoomableTextView dealloc](&v4, sel_dealloc);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double maxWidth;
  double v5;
  double width;
  double maxHeight;
  double v8;
  double height;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;
  CGSize result;

  maxWidth = self->_maxWidth;
  v5 = fmin(a3.width, maxWidth);
  if (maxWidth <= 0.0)
    width = a3.width;
  else
    width = v5;
  maxHeight = self->_maxHeight;
  v8 = fmin(a3.height, maxHeight);
  if (maxHeight <= 0.0)
    height = a3.height;
  else
    height = v8;
  -[_TVZoomableTextView cachedSizeThatFits](self, "cachedSizeThatFits");
  v11 = v10;
  v13 = v12;
  -[_TVZoomableTextView previousTargetSize](self, "previousTargetSize");
  if (-[UIView tv_shouldReuseCachedSizeThatFits:previousTargetSize:newTargetSize:](self, "tv_shouldReuseCachedSizeThatFits:previousTargetSize:newTargetSize:", v11, v13, v14, v15, width, height))
  {
    v18.receiver = self;
    v18.super_class = (Class)_TVZoomableTextView;
    -[TVFocusableTextView sizeThatFits:](&v18, sel_sizeThatFits_, width, height);
    -[_TVZoomableTextView setCachedSizeThatFits:](self, "setCachedSizeThatFits:");
    -[_TVZoomableTextView setPreviousTargetSize:](self, "setPreviousTargetSize:", width, height);
  }
  -[_TVZoomableTextView cachedSizeThatFits](self, "cachedSizeThatFits");
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)updateWithViewElement:(id)a3
{
  IKViewElement *v5;
  uint64_t v6;
  IKViewElement *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  IKViewElement *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _TVZoomableTextView *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  IKViewElement *v52;

  v5 = (IKViewElement *)a3;
  v52 = v5;
  if (self->_viewElement != v5 || (v6 = -[IKViewElement updateType](v5, "updateType"), v7 = v52, v6))
  {
    objc_storeStrong((id *)&self->_viewElement, a3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[IKViewElement style](v52, "style");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVFocusableTextView setDescriptionTextAlignment:](self, "setDescriptionTextAlignment:", objc_msgSend(v8, "tv_textAlignment"));

      -[IKViewElement style](v52, "style");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "tv_tintColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "color");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        -[TVFocusableTextView setMoreLabelTextColor:](self, "setMoreLabelTextColor:", v11);
      v12 = v52;
      -[IKViewElement tv_attributedString](v12, "tv_attributedString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVFocusableTextView setDescriptionText:](self, "setDescriptionText:", v13);
      -[IKViewElement style](v12, "style");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "tv_backgroundHighlightStyle");
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v15)
        v16 = v15;
      else
        v16 = CFSTR("show-on-highlight");
      -[TVFocusableTextView setAlwaysShowBackground:](self, "setAlwaysShowBackground:", -[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("always")));
      -[IKViewElement style](v12, "style");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "tv_highlightColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "color");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        -[IKViewElement style](v12, "style");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "tv_color");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "color");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVFocusableTextView setDescriptionTextColor:](self, "setDescriptionTextColor:", v22);

        v23 = self;
        v24 = v19;
      }
      else
      {
        v23 = self;
        v24 = 0;
      }
      -[TVFocusableTextView setDescriptionTextHighlightColor:](v23, "setDescriptionTextHighlightColor:", v24);
      -[IKViewElement style](v12, "style");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "tv_backgroundHighlightColor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "color");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
        -[TVFocusableTextView setHighlightBackgroundColor:](self, "setHighlightBackgroundColor:", v27);
      -[IKViewElement style](v12, "style");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "tv_backgroundColor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "color");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
        -[TVFocusableTextView setBackgroundColor:](self, "setBackgroundColor:", v30);

    }
    -[IKViewElement style](v52, "style");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVFocusableTextView setMaximumNumberOfLines:](self, "setMaximumNumberOfLines:", objc_msgSend(v31, "tv_maxTextLines"));

    -[IKViewElement style](v52, "style");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "tv_maxWidth");
    self->_maxWidth = v33;

    -[IKViewElement style](v52, "style");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "tv_maxHeight");
    self->_maxHeight = v35;

    -[IKViewElement appDocument](v52, "appDocument");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "templateElement");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "tv_elementType");

    if (v38 == 69)
    {
      -[IKViewElement parent](v52, "parent");
      v39 = objc_claimAutoreleasedReturnValue();
      if (v39)
      {
        v40 = (void *)v39;
        while (objc_msgSend(v40, "tv_elementType") != 38)
        {
          objc_msgSend(v40, "parent");
          v41 = objc_claimAutoreleasedReturnValue();

          v40 = (void *)v41;
          if (!v41)
            goto LABEL_24;
        }
        -[TVFocusableTextView setMoreLabelOnNewLine:](self, "setMoreLabelOnNewLine:", 1);

      }
    }
LABEL_24:
    -[_TVZoomableTextView frame](self, "frame");
    v43 = v42;
    v45 = v44;
    -[IKViewElement style](v52, "style");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "tv_height");
    v48 = v47;

    -[IKViewElement style](v52, "style");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "tv_width");
    v51 = v50;

    -[TVFocusableTextView setFrame:](self, "setFrame:", v43, v45, v51, v48);
    -[_TVZoomableTextView _clearCachedValues](self, "_clearCachedValues");
    v7 = v52;
  }

}

- (void)_clearCachedValues
{
  CGSize v2;

  v2 = (CGSize)*MEMORY[0x24BDBF148];
  self->_cachedSizeThatFits = (CGSize)*MEMORY[0x24BDBF148];
  self->_previousTargetSize = v2;
}

- (IKViewElement)viewElement
{
  return self->_viewElement;
}

- (void)setViewElement:(id)a3
{
  objc_storeStrong((id *)&self->_viewElement, a3);
}

- (CGSize)cachedSizeThatFits
{
  double width;
  double height;
  CGSize result;

  width = self->_cachedSizeThatFits.width;
  height = self->_cachedSizeThatFits.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCachedSizeThatFits:(CGSize)a3
{
  self->_cachedSizeThatFits = a3;
}

- (CGSize)previousTargetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_previousTargetSize.width;
  height = self->_previousTargetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreviousTargetSize:(CGSize)a3
{
  self->_previousTargetSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElement, 0);
}

@end

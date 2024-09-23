@implementation PKPassBoardingPassFrontFaceView

- (id)templateForLayoutMode:(int64_t)a3
{
  double v3;
  double v4;
  PKPassFaceTemplate *v5;
  void *v6;
  void *v7;
  void *v8;
  PKPassBucketTemplate *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PKPassBucketTemplate *v16;
  void *v17;
  void *v18;
  void *v19;
  PKPassBucketTemplate *v20;
  void *v21;
  void *v22;
  void *v23;

  PKPassFrontFaceContentSize();
  v4 = v3;
  v5 = objc_alloc_init(PKPassFaceTemplate);
  -[PKPassFaceTemplate setBarcodeBottomInset:](v5, "setBarcodeBottomInset:", 14.0);
  -[PKPassFaceTemplate setBarcodeMaxSize:](v5, "setBarcodeMaxSize:", 290.0, 188.0);
  -[PKPassFaceTemplate defaultFieldTemplate](v5, "defaultFieldTemplate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextAlignment:", 0);

  -[PKPassFaceTemplate defaultFieldTemplate](v5, "defaultFieldTemplate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 11.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLabelFont:", v8);

  v9 = objc_alloc_init(PKPassBucketTemplate);
  -[PKPassBucketTemplate setBucketAlignment:](v9, "setBucketAlignment:", 3);
  v10 = v4 + -30.0;
  -[PKPassBucketTemplate setBucketRect:](v9, "setBucketRect:", 15.0, 68.0, v10, 60.0);
  -[PKPassBucketTemplate setMinFieldPadding:](v9, "setMinFieldPadding:", 38.0);
  -[PKPassBucketTemplate setMaxFields:](v9, "setMaxFields:", 2);
  -[PKPassBucketTemplate defaultFieldTemplate](v9, "defaultFieldTemplate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "_lightSystemFontOfSize:", 40.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValueFont:", v12);

  -[PKPassBucketTemplate defaultFieldTemplate](v9, "defaultFieldTemplate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setVerticalPadding:", -3.0);

  +[PKPassFieldTemplate fieldTemplateWithTextAlignment:](PKPassFieldTemplate, "fieldTemplateWithTextAlignment:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassBucketTemplate addFieldTemplate:](v9, "addFieldTemplate:", v14);

  +[PKPassFieldTemplate fieldTemplateWithTextAlignment:](PKPassFieldTemplate, "fieldTemplateWithTextAlignment:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassBucketTemplate addFieldTemplate:](v9, "addFieldTemplate:", v15);

  -[PKPassFaceTemplate addBucketTemplate:](v5, "addBucketTemplate:", v9);
  v16 = objc_alloc_init(PKPassBucketTemplate);

  -[PKPassBucketTemplate setBucketAlignment:](v16, "setBucketAlignment:", 2);
  -[PKPassBucketTemplate setBucketRect:](v16, "setBucketRect:", 15.0, 192.0, v10, 40.0);
  -[PKPassBucketTemplate setMinFieldPadding:](v16, "setMinFieldPadding:", 10.0);
  -[PKPassBucketTemplate setMaxFields:](v16, "setMaxFields:", 4);
  -[PKPassBucketTemplate defaultFieldTemplate](v16, "defaultFieldTemplate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 17.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setValueFont:", v18);

  -[PKPassBucketTemplate defaultFieldTemplate](v16, "defaultFieldTemplate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setVerticalPadding:", -2.0);

  -[PKPassFaceTemplate addBucketTemplate:](v5, "addBucketTemplate:", v16);
  v20 = objc_alloc_init(PKPassBucketTemplate);

  -[PKPassBucketTemplate setBucketAlignment:](v20, "setBucketAlignment:", 2);
  -[PKPassBucketTemplate setBucketRect:](v20, "setBucketRect:", 15.0, 137.0, v10, 40.0);
  -[PKPassBucketTemplate setMinFieldPadding:](v20, "setMinFieldPadding:", 10.0);
  -[PKPassBucketTemplate defaultFieldTemplate](v20, "defaultFieldTemplate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 17.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setValueFont:", v22);

  -[PKPassBucketTemplate defaultFieldTemplate](v20, "defaultFieldTemplate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setVerticalPadding:", -2.0);

  -[PKPassBucketTemplate setMaxFields:](v20, "setMaxFields:", 5);
  -[PKPassFaceTemplate addBucketTemplate:](v5, "addBucketTemplate:", v20);

  return v5;
}

- (void)createBodyContentViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UIImageView *v7;
  UIImageView *transitImageView;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  UIImageView *v13;
  UIImageView *footerImageView;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PKPassBoardingPassFrontFaceView;
  -[PKPassFrontFaceView createBodyContentViews](&v15, sel_createBodyContentViews);
  -[PKPassFaceView pass](self, "pass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassBoardingPassFrontFaceView _transitGlyphForTransitType:](self, "_transitGlyphForTransitType:", objc_msgSend(v3, "transitType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPassFaceView colorProfile](self, "colorProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "labelImageForGlyph:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v6);
  transitImageView = self->_transitImageView;
  self->_transitImageView = v7;

  -[PKPassFrontFaceView insertContentView:ofType:](self, "insertContentView:ofType:", self->_transitImageView, 2);
  -[PKPassFaceView pass](self, "pass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "footerImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithPKImage:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (UIImageView *)objc_msgSend(v11, "initWithImage:", v12);
    footerImageView = self->_footerImageView;
    self->_footerImageView = v13;

    if (-[PKPassFrontFaceView showsBarcodeView](self, "showsBarcodeView"))
      -[PKPassFrontFaceView insertContentView:ofType:](self, "insertContentView:ofType:", self->_footerImageView, 2);
  }

}

- (void)setShowsBarcodeView:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  _BOOL4 v7;
  _BOOL4 v8;
  UIImageView *footerImageView;
  objc_super v10;

  v4 = a4;
  v5 = a3;
  v7 = -[PKPassFrontFaceView showsBarcodeView](self, "showsBarcodeView");
  v10.receiver = self;
  v10.super_class = (Class)PKPassBoardingPassFrontFaceView;
  -[PKPassFrontFaceView setShowsBarcodeView:animated:](&v10, sel_setShowsBarcodeView_animated_, v5, v4);
  if (v7 != v5 && self->_footerImageView)
  {
    v8 = -[PKPassFrontFaceView showsBarcodeView](self, "showsBarcodeView");
    footerImageView = self->_footerImageView;
    if (v8)
      -[PKPassFrontFaceView insertContentView:ofType:](self, "insertContentView:ofType:", footerImageView, 2);
    else
      -[PKPassFaceView removeContentView:ofType:](self, "removeContentView:ofType:", footerImageView, 2);
  }
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  UIImageView *transitImageView;
  UIImageView *footerImageView;
  UIImageView *v14;
  objc_super v15;
  CGRect v16;
  CGRect v17;

  v15.receiver = self;
  v15.super_class = (Class)PKPassBoardingPassFrontFaceView;
  -[PKPassFrontFaceView layoutSubviews](&v15, sel_layoutSubviews);
  -[PKPassFaceView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[UIImageView frame](self->_transitImageView, "frame");
  transitImageView = self->_transitImageView;
  UIRectCenteredXInRect();
  -[UIImageView setFrame:](transitImageView, "setFrame:");
  footerImageView = self->_footerImageView;
  if (footerImageView)
  {
    -[UIImageView frame](footerImageView, "frame");
    -[PKPassFrontFaceView barcodeFrame](self, "barcodeFrame");
    if (CGRectIsNull(v16))
    {
      v17.origin.x = v5;
      v17.origin.y = v7;
      v17.size.width = v9;
      v17.size.height = v11;
      CGRectGetMaxY(v17);
    }
    v14 = self->_footerImageView;
    UIRectCenteredXInRect();
    -[UIImageView setFrame:](v14, "setFrame:");
  }

}

- (id)_transitGlyphForTransitType:(int64_t)a3
{
  __CFString *v3;
  void *v4;
  void *v5;

  if ((unint64_t)a3 > 4)
  {
    v5 = 0;
  }
  else
  {
    v3 = off_1E3E62A60[a3];
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:", *MEMORY[0x1E0DC4AE8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerImageView, 0);
  objc_storeStrong((id *)&self->_transitImageView, 0);
}

@end

@implementation PKPassCouponFrontFaceView

- (id)templateForLayoutMode:(int64_t)a3
{
  double v4;
  double v5;
  PKPassFaceTemplate *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PKPassBucketTemplate *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PKPassBucketTemplate *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double MaxY;
  PKPassBucketTemplate *v26;
  void *v27;
  void *v28;
  void *v29;
  CGRect v31;

  PKPassFrontFaceContentSize();
  v5 = v4;
  v6 = objc_alloc_init(PKPassFaceTemplate);
  -[PKPassFaceTemplate setBarcodeBottomInset:](v6, "setBarcodeBottomInset:", 14.0);
  -[PKPassFaceTemplate setBarcodeMaxSize:](v6, "setBarcodeMaxSize:", 290.0, 165.0);
  -[PKPassFaceTemplate defaultFieldTemplate](v6, "defaultFieldTemplate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextAlignment:", 0);

  -[PKPassFaceTemplate defaultFieldTemplate](v6, "defaultFieldTemplate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 11.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLabelFont:", v9);

  -[PKPassFaceTemplate defaultFieldTemplate](v6, "defaultFieldTemplate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextAlignment:", 0);

  v11 = objc_alloc_init(PKPassBucketTemplate);
  -[PKPassBucketTemplate setBucketAlignment:](v11, "setBucketAlignment:", 0);
  v12 = v5 + -30.0;
  -[PKPassBucketTemplate setBucketRect:](v11, "setBucketRect:", 15.0, 73.0, v12, 74.0);
  -[PKPassBucketTemplate setMaxFields:](v11, "setMaxFields:", 1);
  -[PKPassBucketTemplate setSitsOnStripImage:](v11, "setSitsOnStripImage:", 1);
  -[PKPassBucketTemplate defaultFieldTemplate](v11, "defaultFieldTemplate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "_lightSystemFontOfSize:", 66.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setValueFont:", v14);

  -[PKPassBucketTemplate defaultFieldTemplate](v11, "defaultFieldTemplate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 18.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setLabelFont:", v16);

  -[PKPassBucketTemplate defaultFieldTemplate](v11, "defaultFieldTemplate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSuppressesLabel:", 1);

  -[PKPassFaceTemplate addBucketTemplate:](v6, "addBucketTemplate:", v11);
  v18 = objc_alloc_init(PKPassBucketTemplate);

  -[PKPassBucketTemplate setBucketAlignment:](v18, "setBucketAlignment:", 0);
  -[PKPassBucketTemplate setBucketRect:](v18, "setBucketRect:", 15.0, 141.0, v12, 46.0);
  -[PKPassBucketTemplate setMaxFields:](v18, "setMaxFields:", 1);
  -[PKPassBucketTemplate setSitsOnStripImage:](v18, "setSitsOnStripImage:", 1);
  -[PKPassBucketTemplate defaultFieldTemplate](v18, "defaultFieldTemplate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "_lightSystemFontOfSize:", 18.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setValueFont:", v20);

  -[PKPassBucketTemplate defaultFieldTemplate](v18, "defaultFieldTemplate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setValueCanWrap:", 1);

  -[PKPassBucketTemplate defaultFieldTemplate](v18, "defaultFieldTemplate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setSuppressesLabel:", 1);

  -[PKPassFaceTemplate addBucketTemplate:](v6, "addBucketTemplate:", v18);
  -[PKPassFaceView pass](self, "pass");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "displayProfile");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  PKPassFaceStripImageFrame();
  MaxY = CGRectGetMaxY(v31);

  v26 = objc_alloc_init(PKPassBucketTemplate);
  -[PKPassBucketTemplate setBucketAlignment:](v26, "setBucketAlignment:", 2);
  -[PKPassBucketTemplate setBucketRect:](v26, "setBucketRect:", 15.0, MaxY + 8.0, v12, 46.0);
  -[PKPassBucketTemplate setMinFieldPadding:](v26, "setMinFieldPadding:", 16.0);
  -[PKPassBucketTemplate setMaxFields:](v26, "setMaxFields:", 4);
  -[PKPassBucketTemplate defaultFieldTemplate](v26, "defaultFieldTemplate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "_lightSystemFontOfSize:", 26.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setValueFont:", v28);

  -[PKPassBucketTemplate defaultFieldTemplate](v26, "defaultFieldTemplate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setVerticalPadding:", -4.0);

  -[PKPassFaceTemplate addBucketTemplate:](v6, "addBucketTemplate:", v26);
  return v6;
}

@end

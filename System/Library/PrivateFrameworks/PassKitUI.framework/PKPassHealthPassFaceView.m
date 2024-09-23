@implementation PKPassHealthPassFaceView

- (id)templateForLayoutMode:(int64_t)a3
{
  double v3;
  double v4;
  _BOOL4 v5;
  BOOL v6;
  double v7;
  double v8;
  PKPassFaceTemplate *v9;
  void *v10;
  void *v11;
  void *v12;
  PKPassBucketTemplate *v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  PKPassBucketTemplate *v20;
  void *v21;
  void *v22;
  double v23;
  PKPassBucketTemplate *v24;
  void *v25;
  void *v26;
  PKPassBucketTemplate *v27;
  void *v28;
  void *v29;

  PKPassFrontFaceContentSize();
  v4 = v3;
  v5 = PKIsSmallDevice();
  v6 = v5;
  if (v5)
    v7 = 40.0;
  else
    v7 = 50.0;
  v8 = v7 + 10.0;
  v9 = objc_alloc_init(PKPassFaceTemplate);
  -[PKPassFaceTemplate setBarcodeBottomInset:](v9, "setBarcodeBottomInset:", 14.0);
  -[PKPassFaceTemplate setBarcodeMaxSize:](v9, "setBarcodeMaxSize:", 100.0, 100.0);
  -[PKPassFaceTemplate defaultFieldTemplate](v9, "defaultFieldTemplate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextAlignment:", 0);

  -[PKPassFaceTemplate defaultFieldTemplate](v9, "defaultFieldTemplate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 11.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLabelFont:", v12);

  v13 = objc_alloc_init(PKPassBucketTemplate);
  -[PKPassBucketTemplate setBucketAlignment:](v13, "setBucketAlignment:", 3);
  v14 = v4 + -30.0;
  -[PKPassBucketTemplate setBucketRect:](v13, "setBucketRect:", 15.0, 60.0, v14, v7);
  -[PKPassBucketTemplate setMaxFields:](v13, "setMaxFields:", 1);
  -[PKPassBucketTemplate defaultFieldTemplate](v13, "defaultFieldTemplate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "_lightSystemFontOfSize:", 18.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setValueFont:", v16);

    objc_msgSend(v15, "setValueCanWrap:", 0);
    objc_msgSend(v15, "setSuppressesEmptyLabel:", 1);
    -[PKPassFaceTemplate addBucketTemplate:](v9, "addBucketTemplate:", v13);
    v17 = v7 + 10.0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 28.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setValueFont:", v18);

    objc_msgSend(v15, "setValueCanWrap:", 0);
    objc_msgSend(v15, "setSuppressesEmptyLabel:", 1);
    -[PKPassFaceTemplate addBucketTemplate:](v9, "addBucketTemplate:", v13);
    v17 = v8 + -10.0;
  }
  v19 = v8 + 60.0;
  v20 = objc_alloc_init(PKPassBucketTemplate);

  -[PKPassBucketTemplate setBucketAlignment:](v20, "setBucketAlignment:", 3);
  -[PKPassBucketTemplate setBucketRect:](v20, "setBucketRect:", 15.0, v19, v14, 40.0);
  -[PKPassBucketTemplate setMinFieldPadding:](v20, "setMinFieldPadding:", 12.0);
  -[PKPassBucketTemplate setMaxFields:](v20, "setMaxFields:", 2);
  -[PKPassBucketTemplate defaultFieldTemplate](v20, "defaultFieldTemplate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "_lightSystemFontOfSize:", 18.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setValueFont:", v22);

  objc_msgSend(v21, "setVerticalPadding:", 0.0);
  -[PKPassFaceTemplate addBucketTemplate:](v9, "addBucketTemplate:", v20);
  v23 = v19 + v17;
  v24 = objc_alloc_init(PKPassBucketTemplate);

  -[PKPassBucketTemplate setBucketAlignment:](v24, "setBucketAlignment:", 3);
  -[PKPassBucketTemplate setBucketRect:](v24, "setBucketRect:", 15.0, v23, v14, 40.0);
  -[PKPassBucketTemplate setMinFieldPadding:](v24, "setMinFieldPadding:", 12.0);
  -[PKPassBucketTemplate setMaxFields:](v24, "setMaxFields:", 4);
  -[PKPassBucketTemplate defaultFieldTemplate](v24, "defaultFieldTemplate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "_lightSystemFontOfSize:", 18.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setValueFont:", v26);

  objc_msgSend(v25, "setVerticalPadding:", 0.0);
  -[PKPassFaceTemplate addBucketTemplate:](v9, "addBucketTemplate:", v24);
  v27 = objc_alloc_init(PKPassBucketTemplate);

  -[PKPassBucketTemplate setBucketAlignment:](v27, "setBucketAlignment:", 3);
  -[PKPassBucketTemplate setBucketRect:](v27, "setBucketRect:", 15.0, v17 + v23, v14, 40.0);
  -[PKPassBucketTemplate setMinFieldPadding:](v27, "setMinFieldPadding:", 12.0);
  -[PKPassBucketTemplate setMaxFields:](v27, "setMaxFields:", 4);
  -[PKPassBucketTemplate defaultFieldTemplate](v27, "defaultFieldTemplate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "_lightSystemFontOfSize:", 18.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setValueFont:", v29);

  objc_msgSend(v28, "setVerticalPadding:", 0.0);
  -[PKPassFaceTemplate addBucketTemplate:](v9, "addBucketTemplate:", v27);

  return v9;
}

- (id)templateForHeaderBucket
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPassHealthPassFaceView;
  -[PKPassFrontFaceView templateForHeaderBucket](&v6, sel_templateForHeaderBucket);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bucketRect");
  objc_msgSend(v2, "setBucketRect:");
  objc_msgSend(v2, "defaultFieldTemplate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 20.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValueFont:", v4);

  return v2;
}

@end

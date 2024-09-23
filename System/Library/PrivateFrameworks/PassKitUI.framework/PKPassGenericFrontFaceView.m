@implementation PKPassGenericFrontFaceView

- (id)templateForLayoutMode:(int64_t)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  PKPassFaceTemplate *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  PKPassBucketTemplate *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  PKPassBucketTemplate *v27;
  void *v28;
  void *v29;
  void *v30;
  PKPassBucketTemplate *v31;
  void *v32;
  void *v33;
  void *v34;
  CGRect v36;

  PKPassFrontFaceContentSize();
  v5 = v4;
  -[PKPassFaceView pass](self, "pass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "thumbnailRect");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v36.origin.x = v8;
  v36.origin.y = v10;
  v36.size.width = v12;
  v36.size.height = v14;
  if (CGRectIsEmpty(v36))
    v15 = 0.0;
  else
    v15 = v12 + 17.0;
  v16 = objc_alloc_init(PKPassFaceTemplate);
  -[PKPassFaceTemplate setBarcodeBottomInset:](v16, "setBarcodeBottomInset:", 14.0);
  -[PKPassFaceTemplate setBarcodeMaxSize:](v16, "setBarcodeMaxSize:", 290.0, 165.0);
  -[PKPassFaceTemplate defaultFieldTemplate](v16, "defaultFieldTemplate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTextAlignment:", 0);

  -[PKPassFaceTemplate defaultFieldTemplate](v16, "defaultFieldTemplate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 11.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLabelFont:", v19);

  -[PKPassFaceTemplate defaultFieldTemplate](v16, "defaultFieldTemplate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTextAlignment:", 0);

  v21 = objc_alloc_init(PKPassBucketTemplate);
  -[PKPassBucketTemplate setBucketAlignment:](v21, "setBucketAlignment:", 0);
  v22 = v5 + -30.0;
  -[PKPassBucketTemplate setBucketRect:](v21, "setBucketRect:", 15.0, 76.0, v22 - v15, 88.0);
  -[PKPassBucketTemplate setMaxFields:](v21, "setMaxFields:", 1);
  -[PKPassBucketTemplate defaultFieldTemplate](v21, "defaultFieldTemplate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 30.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setValueFont:", v24);

  -[PKPassBucketTemplate defaultFieldTemplate](v21, "defaultFieldTemplate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setValueCanWrap:", 1);

  -[PKPassBucketTemplate defaultFieldTemplate](v21, "defaultFieldTemplate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setSuppressesEmptyLabel:", 1);

  -[PKPassFaceTemplate addBucketTemplate:](v16, "addBucketTemplate:", v21);
  v27 = objc_alloc_init(PKPassBucketTemplate);

  -[PKPassBucketTemplate setBucketAlignment:](v27, "setBucketAlignment:", 2);
  -[PKPassBucketTemplate setBucketRect:](v27, "setBucketRect:", 15.0, 174.0, v22, 40.0);
  -[PKPassBucketTemplate setMinFieldPadding:](v27, "setMinFieldPadding:", 12.0);
  -[PKPassBucketTemplate setMaxFields:](v27, "setMaxFields:", 4);
  -[PKPassBucketTemplate defaultFieldTemplate](v27, "defaultFieldTemplate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "_lightSystemFontOfSize:", 20.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setValueFont:", v29);

  -[PKPassBucketTemplate defaultFieldTemplate](v27, "defaultFieldTemplate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setVerticalPadding:", -2.0);

  -[PKPassFaceTemplate addBucketTemplate:](v16, "addBucketTemplate:", v27);
  v31 = objc_alloc_init(PKPassBucketTemplate);

  -[PKPassBucketTemplate setBucketAlignment:](v31, "setBucketAlignment:", 2);
  -[PKPassBucketTemplate setBucketRect:](v31, "setBucketRect:", 15.0, 218.0, v22, 40.0);
  -[PKPassBucketTemplate setMinFieldPadding:](v31, "setMinFieldPadding:", 12.0);
  -[PKPassBucketTemplate setMaxFields:](v31, "setMaxFields:", 4);
  -[PKPassBucketTemplate defaultFieldTemplate](v31, "defaultFieldTemplate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "_lightSystemFontOfSize:", 16.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setValueFont:", v33);

  -[PKPassBucketTemplate defaultFieldTemplate](v31, "defaultFieldTemplate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setVerticalPadding:", -2.0);

  -[PKPassFaceTemplate addBucketTemplate:](v16, "addBucketTemplate:", v31);
  return v16;
}

@end

@implementation PKPassAccessCardFrontFaceView

- (id)templateForLayoutMode:(int64_t)a3
{
  double v5;
  double v6;
  void *v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v12;
  double v13;
  double v14;
  double v15;
  PKPassFaceTemplate *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  double v32;
  PKPassBucketTemplate *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  PKPassBucketTemplate *v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  PKPassBucketTemplate *v49;
  void *v50;
  void *v51;
  void *v52;
  double v54;
  double v55;
  double v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  PKPassFrontFaceContentSize();
  v6 = v5;
  -[PKPassFaceView pass](self, "pass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "thumbnailRect");
  x = v57.origin.x;
  y = v57.origin.y;
  width = v57.size.width;
  height = v57.size.height;
  if (CGRectIsEmpty(v57))
  {
    objc_msgSend(v7, "stripRect");
    x = v12;
    y = v13;
    width = v14;
    height = v15;
  }
  v58.origin.x = x;
  v58.origin.y = y;
  v58.size.width = width;
  v58.size.height = height;
  if (CGRectIsEmpty(v58))
  {
    x = *MEMORY[0x1E0C9D538];
    y = *(double *)(MEMORY[0x1E0C9D538] + 8);
    height = 65.0;
    width = v6;
  }
  v16 = objc_alloc_init(PKPassFaceTemplate);
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

  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 22.0, *MEMORY[0x1E0DC1448]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4A88]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v23, 17.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "leading");
  objc_msgSend(v24, "leading");
  objc_msgSend(v21, "lineHeight");
  PKFloatCeilToPixel();
  v56 = v25;
  objc_msgSend(v24, "lineHeight");
  PKFloatCeilToPixel();
  v55 = v26;
  objc_msgSend(v21, "ascender");
  v54 = v6;
  objc_msgSend(v21, "capHeight");
  PKFloatFloorToPixel();
  v28 = v27;
  objc_msgSend(v21, "descender");
  objc_msgSend(v24, "ascender");
  v29 = width;
  v30 = x;
  objc_msgSend(v24, "capHeight");
  PKFloatFloorToPixel();
  v32 = fmax(v31, 0.0);
  v33 = objc_alloc_init(PKPassBucketTemplate);
  -[PKPassBucketTemplate setBucketAlignment:](v33, "setBucketAlignment:", 3);
  v59.origin.x = v30;
  v59.origin.y = y;
  v59.size.width = v29;
  v59.size.height = height;
  -[PKPassBucketTemplate setBucketRect:](v33, "setBucketRect:", 15.0, v28 + CGRectGetMaxY(v59), v54 + -30.0, v55 + v56 + v32);
  -[PKPassBucketTemplate setMaxFields:](v33, "setMaxFields:", 1);
  -[PKPassBucketTemplate defaultFieldTemplate](v33, "defaultFieldTemplate");
  v34 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v34, "setTextAlignment:", 1);
  objc_msgSend((id)v34, "setValueSignificant:", 1);
  objc_msgSend((id)v34, "setSuppressesEmptyLabel:", 1);
  objc_msgSend((id)v34, "setLabelCaseStyle:", 3);
  PKFloatRoundToPixel();
  objc_msgSend((id)v34, "setVerticalPadding:");
  objc_msgSend((id)v34, "setValueFont:", v21);
  objc_msgSend((id)v34, "setLabelFont:", v24);
  -[PKPassFaceTemplate addBucketTemplate:](v16, "addBucketTemplate:", v33);

  LODWORD(v34) = a3 == 0;
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4AA0]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "fontDescriptorWithSymbolicTraits:", 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v36, 11.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", v22);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v38, 17.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v37, "leading");
  objc_msgSend(v39, "leading");
  objc_msgSend(v37, "lineHeight");
  PKFloatCeilToPixel();
  v41 = v40;
  objc_msgSend(v39, "lineHeight");
  PKFloatCeilToPixel();
  v43 = v42;
  v44 = objc_alloc_init(PKPassBucketTemplate);

  -[PKPassBucketTemplate setBucketAlignment:](v44, "setBucketAlignment:", 3);
  v45 = v41 + -1.0 + v43;
  -[PKPassBucketTemplate setBucketRect:](v44, "setBucketRect:", 15.0, dbl_19DF152A0[v34], v54 + -30.0, v45);
  -[PKPassBucketTemplate setMaxFields:](v44, "setMaxFields:", 1);
  -[PKPassBucketTemplate defaultFieldTemplate](v44, "defaultFieldTemplate");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setLabelFont:", v37);

  -[PKPassBucketTemplate defaultFieldTemplate](v44, "defaultFieldTemplate");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setValueFont:", v39);

  -[PKPassBucketTemplate defaultFieldTemplate](v44, "defaultFieldTemplate");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  PKFloatRoundToPixel();
  objc_msgSend(v48, "setVerticalPadding:");

  -[PKPassFaceTemplate addBucketTemplate:](v16, "addBucketTemplate:", v44);
  v49 = objc_alloc_init(PKPassBucketTemplate);

  -[PKPassBucketTemplate setBucketAlignment:](v49, "setBucketAlignment:", 3);
  -[PKPassBucketTemplate setBucketRect:](v49, "setBucketRect:", 15.0, dbl_19DF152B0[v34], v54 + -30.0, v45);
  -[PKPassBucketTemplate setMinFieldPadding:](v49, "setMinFieldPadding:", 12.0);
  -[PKPassBucketTemplate setMaxFields:](v49, "setMaxFields:", 4);
  -[PKPassBucketTemplate defaultFieldTemplate](v49, "defaultFieldTemplate");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setLabelFont:", v37);

  -[PKPassBucketTemplate defaultFieldTemplate](v49, "defaultFieldTemplate");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setValueFont:", v39);

  -[PKPassBucketTemplate defaultFieldTemplate](v49, "defaultFieldTemplate");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  PKFloatRoundToPixel();
  objc_msgSend(v52, "setVerticalPadding:");

  -[PKPassFaceTemplate addBucketTemplate:](v16, "addBucketTemplate:", v49);
  return v16;
}

@end

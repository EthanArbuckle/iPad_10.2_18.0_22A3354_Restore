@implementation PKPassEventTicketFrontFaceView

- (id)templateForLayoutMode:(int64_t)a3
{
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  _BOOL4 IsEmpty;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  PKPassFaceTemplate *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  PKPassBucketTemplate *v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  PKPassBucketTemplate *v38;
  void *v39;
  void *v40;
  void *v41;
  PKPassBucketTemplate *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  PKPassBucketTemplate *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  PKPassFaceTemplate *v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  PKPassBucketTemplate *v60;
  double v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  double MaxY;
  double v70;
  PKPassBucketTemplate *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  double v77;
  PKPassBucketTemplate *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  CGRect v89;
  CGRect v90;
  CGRect v91;

  -[PKPassFaceView pass](self, "pass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "thumbnailRect");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v89.origin.x = v7;
  v89.origin.y = v9;
  v89.size.width = v11;
  v89.size.height = v13;
  IsEmpty = CGRectIsEmpty(v89);
  -[PKPassFaceView pass](self, "pass");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stripRect");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v90.origin.x = v17;
  v90.origin.y = v19;
  v90.size.width = v21;
  v90.size.height = v23;
  LODWORD(v15) = CGRectIsEmpty(v90);
  PKPassFrontFaceContentSize();
  v25 = v24;
  if ((_DWORD)v15)
  {
    if (IsEmpty)
      v26 = 0.0;
    else
      v26 = v11 + 17.0;
    v27 = objc_alloc_init(PKPassFaceTemplate);
    -[PKPassFaceTemplate setBarcodeBottomInset:](v27, "setBarcodeBottomInset:", 14.0);
    -[PKPassFaceTemplate setBarcodeMaxSize:](v27, "setBarcodeMaxSize:", 290.0, 165.0);
    -[PKPassFaceTemplate defaultFieldTemplate](v27, "defaultFieldTemplate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setTextAlignment:", 0);

    -[PKPassFaceTemplate defaultFieldTemplate](v27, "defaultFieldTemplate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 11.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setLabelFont:", v30);

    -[PKPassFaceTemplate defaultFieldTemplate](v27, "defaultFieldTemplate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setTextAlignment:", 0);

    v32 = objc_alloc_init(PKPassBucketTemplate);
    -[PKPassBucketTemplate setBucketAlignment:](v32, "setBucketAlignment:", 0);
    v33 = v25 + -30.0 - v26;
    -[PKPassBucketTemplate setBucketRect:](v32, "setBucketRect:", 15.0, 68.0, v33, 46.0);
    -[PKPassBucketTemplate setMaxFields:](v32, "setMaxFields:", 1);
    -[PKPassBucketTemplate defaultFieldTemplate](v32, "defaultFieldTemplate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 20.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setValueFont:", v35);

    -[PKPassBucketTemplate defaultFieldTemplate](v32, "defaultFieldTemplate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setValueCanWrap:", 1);

    -[PKPassBucketTemplate defaultFieldTemplate](v32, "defaultFieldTemplate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setVerticalPadding:", -2.0);

    -[PKPassFaceTemplate addBucketTemplate:](v27, "addBucketTemplate:", v32);
    v38 = objc_alloc_init(PKPassBucketTemplate);

    -[PKPassBucketTemplate setBucketAlignment:](v38, "setBucketAlignment:", 2);
    -[PKPassBucketTemplate setBucketRect:](v38, "setBucketRect:", 15.0, 120.0, v33, 44.0);
    -[PKPassBucketTemplate setMaxFields:](v38, "setMaxFields:", 4);
    -[PKPassBucketTemplate defaultFieldTemplate](v38, "defaultFieldTemplate");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 16.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setValueFont:", v40);

    -[PKPassBucketTemplate defaultFieldTemplate](v38, "defaultFieldTemplate");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setVerticalPadding:", -2.0);

    -[PKPassFaceTemplate addBucketTemplate:](v27, "addBucketTemplate:", v38);
    v42 = objc_alloc_init(PKPassBucketTemplate);

    -[PKPassBucketTemplate setBucketAlignment:](v42, "setBucketAlignment:", 2);
    -[PKPassBucketTemplate setBucketRect:](v42, "setBucketRect:", 15.0, 168.0, v25 + -30.0, 52.0);
    -[PKPassBucketTemplate setMinFieldPadding:](v42, "setMinFieldPadding:", 16.0);
    -[PKPassBucketTemplate setMaxFields:](v42, "setMaxFields:", 4);
    -[PKPassBucketTemplate defaultFieldTemplate](v42, "defaultFieldTemplate");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setValueFont:", v44);

    -[PKPassBucketTemplate defaultFieldTemplate](v42, "defaultFieldTemplate");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setVerticalPadding:", -1.0);

    -[PKPassBucketTemplate defaultFieldTemplate](v42, "defaultFieldTemplate");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setValueCanWrap:", 1);

    -[PKPassFaceTemplate addBucketTemplate:](v27, "addBucketTemplate:", v42);
    v47 = objc_alloc_init(PKPassBucketTemplate);

    -[PKPassBucketTemplate setBucketAlignment:](v47, "setBucketAlignment:", 2);
    -[PKPassBucketTemplate setBucketRect:](v47, "setBucketRect:", 15.0, 224.0, v25 + -30.0, 46.0);
    -[PKPassBucketTemplate setMinFieldPadding:](v47, "setMinFieldPadding:", 16.0);
    -[PKPassBucketTemplate setMaxFields:](v47, "setMaxFields:", 4);
    -[PKPassBucketTemplate defaultFieldTemplate](v47, "defaultFieldTemplate");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 10.0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setLabelFont:", v49);

    -[PKPassBucketTemplate defaultFieldTemplate](v47, "defaultFieldTemplate");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)MEMORY[0x1E0DC1350];
  }
  else
  {
    v52 = objc_alloc_init(PKPassFaceTemplate);
    v27 = v52;
    v53 = 14.0;
    if (a3 == 1)
    {
      v53 = 6.0;
      v54 = 40.0;
    }
    else
    {
      v54 = 46.0;
    }
    if (a3 == 1)
      v55 = 42.0;
    else
      v55 = 48.0;
    -[PKPassFaceTemplate setBarcodeBottomInset:](v52, "setBarcodeBottomInset:", v53);
    -[PKPassFaceTemplate setBarcodeMaxSize:](v27, "setBarcodeMaxSize:", 290.0, 165.0);
    -[PKPassFaceTemplate defaultFieldTemplate](v27, "defaultFieldTemplate");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setTextAlignment:", 0);

    -[PKPassFaceTemplate defaultFieldTemplate](v27, "defaultFieldTemplate");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 11.0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setLabelFont:", v58);

    -[PKPassFaceTemplate defaultFieldTemplate](v27, "defaultFieldTemplate");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setTextAlignment:", 0);

    v60 = objc_alloc_init(PKPassBucketTemplate);
    -[PKPassBucketTemplate setBucketAlignment:](v60, "setBucketAlignment:", 0);
    v61 = v25 + -30.0;
    -[PKPassBucketTemplate setBucketRect:](v60, "setBucketRect:", 15.0, 73.0, v61, 74.0);
    -[PKPassBucketTemplate setSitsOnStripImage:](v60, "setSitsOnStripImage:", 1);
    -[PKPassBucketTemplate setMaxFields:](v60, "setMaxFields:", 1);
    -[PKPassBucketTemplate defaultFieldTemplate](v60, "defaultFieldTemplate");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "_lightSystemFontOfSize:", 66.0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setValueFont:", v63);

    -[PKPassBucketTemplate defaultFieldTemplate](v60, "defaultFieldTemplate");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "_lightSystemFontOfSize:", 18.0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setLabelFont:", v65);

    -[PKPassBucketTemplate defaultFieldTemplate](v60, "defaultFieldTemplate");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setSuppressesLabel:", 1);

    -[PKPassFaceTemplate addBucketTemplate:](v27, "addBucketTemplate:", v60);
    -[PKPassFaceView pass](self, "pass");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "displayProfile");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    PKPassFaceStripImageFrame();
    MaxY = CGRectGetMaxY(v91);

    v70 = MaxY + 8.0;
    v71 = objc_alloc_init(PKPassBucketTemplate);

    -[PKPassBucketTemplate setBucketAlignment:](v71, "setBucketAlignment:", 2);
    -[PKPassBucketTemplate setBucketRect:](v71, "setBucketRect:", 15.0, v70, v61, v54);
    -[PKPassBucketTemplate setMinFieldPadding:](v71, "setMinFieldPadding:", 16.0);
    -[PKPassBucketTemplate setMaxFields:](v71, "setMaxFields:", 4);
    -[PKPassBucketTemplate defaultFieldTemplate](v71, "defaultFieldTemplate");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 10.0);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setLabelFont:", v73);

    -[PKPassBucketTemplate defaultFieldTemplate](v71, "defaultFieldTemplate");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 20.0);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setValueFont:", v75);

    -[PKPassBucketTemplate defaultFieldTemplate](v71, "defaultFieldTemplate");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setVerticalPadding:", 0.0);

    -[PKPassFaceTemplate addBucketTemplate:](v27, "addBucketTemplate:", v71);
    v77 = v55 + v70;
    v78 = objc_alloc_init(PKPassBucketTemplate);

    -[PKPassBucketTemplate setBucketAlignment:](v78, "setBucketAlignment:", 2);
    -[PKPassBucketTemplate setBucketRect:](v78, "setBucketRect:", 15.0, v77, v61, v54);
    -[PKPassBucketTemplate setMinFieldPadding:](v78, "setMinFieldPadding:", 16.0);
    -[PKPassBucketTemplate setMaxFields:](v78, "setMaxFields:", 4);
    -[PKPassBucketTemplate defaultFieldTemplate](v78, "defaultFieldTemplate");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 10.0);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setLabelFont:", v80);

    -[PKPassBucketTemplate defaultFieldTemplate](v78, "defaultFieldTemplate");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 20.0);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "setValueFont:", v82);

    -[PKPassBucketTemplate defaultFieldTemplate](v78, "defaultFieldTemplate");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setVerticalPadding:", 0.0);

    -[PKPassFaceTemplate addBucketTemplate:](v27, "addBucketTemplate:", v78);
    v47 = objc_alloc_init(PKPassBucketTemplate);

    -[PKPassBucketTemplate setBucketAlignment:](v47, "setBucketAlignment:", 2);
    -[PKPassBucketTemplate setBucketRect:](v47, "setBucketRect:", 15.0, v55 + v77, v61, v54);
    -[PKPassBucketTemplate setMinFieldPadding:](v47, "setMinFieldPadding:", 16.0);
    -[PKPassBucketTemplate setMaxFields:](v47, "setMaxFields:", 4);
    -[PKPassBucketTemplate defaultFieldTemplate](v47, "defaultFieldTemplate");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 10.0);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "setLabelFont:", v85);

    -[PKPassBucketTemplate defaultFieldTemplate](v47, "defaultFieldTemplate");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)MEMORY[0x1E0DC1350];
  }
  objc_msgSend(v51, "systemFontOfSize:", 20.0);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setValueFont:", v86);

  -[PKPassBucketTemplate defaultFieldTemplate](v47, "defaultFieldTemplate");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setVerticalPadding:", 0.0);

  -[PKPassFaceTemplate addBucketTemplate:](v27, "addBucketTemplate:", v47);
  return v27;
}

@end

@implementation UIKBRenderFactory_CarTenKey

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  unint64_t v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  double MaxX;
  double v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  void *v84;
  void *v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  void *v94;
  objc_super v96;
  _QWORD v97[2];
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;

  v97[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v96.receiver = self;
  v96.super_class = (Class)UIKBRenderFactory_CarTenKey;
  v7 = a4;
  -[UIKBRenderFactory_Car _traitsForKey:onKeyplane:](&v96, sel__traitsForKey_onKeyplane_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderFactory lightKeycapsFontName](self, "lightKeycapsFontName", v96.receiver, v96.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "symbolStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFontName:", v9);

  -[UIKBRenderFactory_Car displayContentsForKey:](self, "displayContentsForKey:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayString");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    objc_msgSend(v11, "secondaryDisplayStrings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15)
    {
      objc_msgSend(v8, "symbolStyle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v16, "copy");

      v97[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setSecondarySymbolStyles:", v18);

      if (objc_msgSend(v6, "displayType") == 34)
      {
        -[UIKBRenderFactory lightKeycapsFontName](self, "lightKeycapsFontName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setFontName:", v19);

        -[UIKBRenderFactory_Car defaultKeyFontSize](self, "defaultKeyFontSize");
        objc_msgSend(v17, "setFontSize:", v20 * 0.6);
        -[UIKBRenderFactory_Car defaultKeyFontSize](self, "defaultKeyFontSize");
        v22 = v21 * 0.3;
        -[UIKBRenderFactory_Car defaultKeyFontSize](self, "defaultKeyFontSize");
        objc_msgSend(v17, "setTextOffset:", v22, v23 * 0.5);
      }
      else
      {
        if (objc_msgSend(v6, "displayType") == 31)
        {
          objc_msgSend(v11, "displayString");
          v24 = objc_claimAutoreleasedReturnValue();
          if (!v24)
            goto LABEL_11;
          v25 = (void *)v24;
          objc_msgSend(v11, "secondaryDisplayStrings");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "count");

          if (!v27)
            goto LABEL_11;
          -[UIKBRenderFactory_Car defaultKeyFontSize](self, "defaultKeyFontSize");
          v29 = v28 * 0.8;
          objc_msgSend(v8, "symbolStyle");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setFontSize:", v29);

          -[UIKBRenderFactory_Car defaultKeyFontSize](self, "defaultKeyFontSize");
          v32 = v31 * 0.2;
          objc_msgSend(v8, "symbolStyle");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setTextOffset:", 0.0, v32);

          objc_msgSend(v8, "symbolStyle");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setKerning:", 0.0);

          -[UIKBRenderFactory_Car defaultKeyFontSize](self, "defaultKeyFontSize");
          objc_msgSend(v17, "setFontSize:", v35 * 0.8);
          -[UIKBRenderFactory_Car defaultKeyFontSize](self, "defaultKeyFontSize");
          v37 = v36 * 0.2;
          -[UIKBRenderFactory_Car defaultKeyFontSize](self, "defaultKeyFontSize");
          objc_msgSend(v17, "setTextOffset:", v37, v38 * -0.1);
          v39 = -4.0;
        }
        else
        {
          -[UIKBRenderFactory_Car defaultKeyFontSize](self, "defaultKeyFontSize");
          v41 = v40 * -0.3;
          objc_msgSend(v8, "symbolStyle");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setTextOffset:", 0.0, v41);

          -[UIKBRenderFactory_Car defaultKeyFontSize](self, "defaultKeyFontSize");
          objc_msgSend(v17, "setFontSize:", v43 * 0.5);
          -[UIKBRenderFactory_Car defaultKeyFontSize](self, "defaultKeyFontSize");
          objc_msgSend(v17, "setTextOffset:", 0.0, v44 * 0.5);
          v39 = 1.0;
        }
        objc_msgSend(v17, "setKerning:", v39);
      }
LABEL_11:

    }
  }
  objc_msgSend(v11, "displayString");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "length");

  if (v46 >= 2)
  {
    objc_msgSend(v8, "symbolStyle");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "fontSize");
    v49 = v48 * 0.8;
    objc_msgSend(v8, "symbolStyle");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setFontSize:", v49);

  }
  objc_msgSend(v6, "name");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v51, "hasPrefix:", CFSTR("TenKey-Chinese-Pinyin-")))
  {

  }
  else
  {
    objc_msgSend(v6, "name");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "hasPrefix:", CFSTR("TenKey-Latin-"));

    if (!v53)
      goto LABEL_18;
  }
  objc_msgSend(v8, "symbolStyle");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setFontName:", CFSTR("UIKBRenderFactorySystemFontName"));

LABEL_18:
  objc_msgSend(v6, "frame");
  MaxX = CGRectGetMaxX(v98);
  objc_msgSend(v7, "frame");
  if (MaxX >= CGRectGetMaxX(v99))
    v56 = 0.0;
  else
    v56 = 0.5;
  objc_msgSend(v6, "frame");
  objc_msgSend(v7, "frame", CGRectGetMinY(v100));
  v58 = v57;
  v60 = v59;
  v62 = v61;
  v64 = v63;

  v101.origin.x = v58;
  v101.origin.y = v60;
  v101.size.width = v62;
  v101.size.height = v64;
  objc_msgSend(v8, "geometry", CGRectGetMaxY(v101));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "paddedFrame");
  v67 = v66 + 0.0;
  v69 = v68 - v56;
  v71 = v70 + 0.0;
  v73 = v72 + -0.5;
  objc_msgSend(v8, "geometry");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setFrame:", v67, v71, v69, v73);

  objc_msgSend(v8, "geometry");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "frame");
  v77 = v76;
  v79 = v78;
  v81 = v80;
  v83 = v82;
  objc_msgSend(v8, "geometry");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setPaddedFrame:", v77, v79, v81, v83);

  objc_msgSend(v8, "geometry");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "frame");
  v87 = v86;
  v89 = v88;
  v91 = v90;
  v93 = v92;
  objc_msgSend(v8, "geometry");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "setDisplayFrame:", v87, v89, v91, v93);

  return v8;
}

@end

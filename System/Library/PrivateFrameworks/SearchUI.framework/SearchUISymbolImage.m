@implementation SearchUISymbolImage

+ (id)uiImageWithSymbolName:(id)a3 font:(id)a4 scale:(int64_t)a5
{
  uint64_t v6;

  LODWORD(v6) = 0;
  return (id)objc_msgSend(a1, "uiImageWithSymbolName:font:scale:weight:isTemplate:primaryColor:secondaryColor:appearance:", a3, a4, a5, 4, 1, 0, v6, 0);
}

+ (id)uiImageWithSymbolName:(id)a3 font:(id)a4 scale:(int64_t)a5 weight:(int64_t)a6 isTemplate:(BOOL)a7 primaryColor:(int)a8 secondaryColor:(int)a9 appearance:(id)a10
{
  uint64_t v11;

  LODWORD(v11) = a9;
  return (id)objc_msgSend(a1, "uiImageWithSymbolName:font:scale:weight:isTemplate:primaryColor:secondaryColor:appearance:preferredFill:", a3, a4, a5, a6, a7, *(_QWORD *)&a8, v11, a10, -1);
}

+ (id)uiImageWithSymbolName:(id)a3 font:(id)a4 scale:(int64_t)a5 weight:(int64_t)a6 isTemplate:(BOOL)a7 primaryColor:(int)a8 secondaryColor:(int)a9 appearance:(id)a10 preferredFill:(int64_t)a11
{
  uint64_t v11;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v23;

  v11 = *(_QWORD *)&a8;
  v23 = a7;
  v16 = a3;
  v17 = a4;
  v18 = a10;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0DBD910], "appearanceWithStyle:", 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (!(_DWORD)v11)
  {
    v19 = 0;
    if (a9)
      goto LABEL_5;
LABEL_7:
    v20 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v18, "textColorForColor:", +[SearchUITLKConverters colorForSFColor:](SearchUITLKConverters, "colorForSFColor:", v11));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a9)
    goto LABEL_7;
LABEL_5:
  objc_msgSend(v18, "textColorForColor:", +[SearchUITLKConverters colorForSFColor:](SearchUITLKConverters, "colorForSFColor:", a9));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  objc_msgSend(a1, "uiImageWithSymbolName:font:scale:weight:isTemplate:platformPrimaryColor:platformSecondaryColor:appearance:preferredFill:", v16, v17, a5, a6, v23, v19, v20, v18, a11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)uiImageWithSymbolName:(id)a3 font:(id)a4 scale:(int64_t)a5 weight:(int64_t)a6 isTemplate:(BOOL)a7 platformPrimaryColor:(id)a8 platformSecondaryColor:(id)a9 appearance:(id)a10 preferredFill:(int64_t)a11
{
  _BOOL4 v12;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  NSObject *v34;

  v12 = a7;
  v15 = a3;
  v16 = a4;
  v17 = a8;
  v18 = a9;
  v19 = (void *)objc_opt_new();
  v20 = v19;
  if (v17)
    objc_msgSend(v19, "addObject:", v17);
  if (v18)
  {
    objc_msgSend(v20, "addObject:", v18);
    objc_msgSend(v20, "addObject:", v18);
  }
  if (a11 == -1
    || (objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:shape:fill:", v15, -1, a11),
        (v21 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22 = objc_msgSend(v21, "_isHierarchicalColorSymbolImage");
  v23 = v22;
  if (v12)
    v24 = 2;
  else
    v24 = 1;
  if (!v12 && v22)
  {
    if ((unint64_t)objc_msgSend(v20, "count", v24) <= 1)
      v24 = 1;
    else
      v24 = 2;
  }
  objc_msgSend(v21, "imageWithRenderingMode:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v26 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(v16, "pointSize");
    objc_msgSend(v26, "configurationWithPointSize:weight:scale:", a6, a5);
    v27 = objc_claimAutoreleasedReturnValue();
LABEL_20:
    v28 = (void *)v27;
    objc_msgSend(v25, "imageWithSymbolConfiguration:", v27);
    v29 = objc_claimAutoreleasedReturnValue();

    v25 = (void *)v29;
    goto LABEL_21;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", a5);
    v27 = objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_21:
  if (!v12 && objc_msgSend(v20, "count"))
  {
    if (v23 && (unint64_t)objc_msgSend(v20, "count") >= 2)
    {
      objc_msgSend(MEMORY[0x1E0DC3888], "_configurationWithHierarchicalColors:", v20);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "imageWithSymbolConfiguration:", v30);
      v31 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = (void *)MEMORY[0x1E0DBD970];
      objc_msgSend(v20, "firstObject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "applyTintColor:toImage:", v30, v25);
      v31 = objc_claimAutoreleasedReturnValue();
    }
    v33 = (void *)v31;

    v25 = v33;
  }
  if (!v25)
  {
    SearchUIGeneralLog();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      +[SearchUISymbolImage uiImageWithSymbolName:font:scale:weight:isTemplate:platformPrimaryColor:platformSecondaryColor:appearance:preferredFill:].cold.1((uint64_t)v15, v34);

  }
  return v25;
}

- (SearchUISymbolImage)initWithSFImage:(id)a3
{
  id v4;
  SearchUISymbolImage *v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchUISymbolImage;
  v5 = -[SearchUIImage initWithSFImage:](&v9, sel_initWithSFImage_, v4);
  if (v5)
  {
    objc_msgSend(v4, "symbolName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUISymbolImage setSymbolName:](v5, "setSymbolName:", v6);

    -[SearchUISymbolImage setPunchThroughBackground:](v5, "setPunchThroughBackground:", objc_msgSend(v4, "punchThroughBackground"));
    -[SearchUISymbolImage setBackgroundColor:](v5, "setBackgroundColor:", objc_msgSend(v4, "backgroundColor"));
    -[SearchUISymbolImage setPrimaryColor:](v5, "setPrimaryColor:", objc_msgSend(v4, "primaryColor"));
    -[SearchUISymbolImage setSecondaryColor:](v5, "setSecondaryColor:", objc_msgSend(v4, "secondaryColor"));
    -[SearchUISymbolImage setSpecifiedFillStyle:](v5, "setSpecifiedFillStyle:", objc_msgSend(v4, "fillStyle"));
    if (-[SearchUISymbolImage punchThroughBackground](v5, "punchThroughBackground")
      && !-[SearchUISymbolImage backgroundColor](v5, "backgroundColor"))
    {
      v7 = 1;
    }
    else
    {
      if (!-[SearchUISymbolImage primaryColor](v5, "primaryColor")
        && !-[SearchUISymbolImage secondaryColor](v5, "secondaryColor"))
      {
        goto LABEL_9;
      }
      v7 = 0;
    }
    -[SearchUISymbolImage setIsTemplate:](v5, "setIsTemplate:", v7);
LABEL_9:
    -[SearchUISymbolImage setSymbolScale:](v5, "setSymbolScale:", 0);
    -[SearchUISymbolImage setSymbolWeight:](v5, "setSymbolWeight:", 4);
    -[SearchUISymbolImage setPreferredFill:](v5, "setPreferredFill:", -1);
  }

  return v5;
}

- (SearchUISymbolImage)initWithSymbolName:(id)a3
{
  return -[SearchUISymbolImage initWithSymbolName:font:scale:](self, "initWithSymbolName:font:scale:", a3, 0, 0);
}

- (SearchUISymbolImage)initWithSymbolName:(id)a3 font:(id)a4 scale:(int64_t)a5
{
  return -[SearchUISymbolImage initWithSymbolName:font:scale:weight:](self, "initWithSymbolName:font:scale:weight:", a3, a4, a5, 4);
}

- (SearchUISymbolImage)initWithSymbolName:(id)a3 font:(id)a4 scale:(int64_t)a5 weight:(int64_t)a6
{
  id v10;
  id v11;
  SearchUISymbolImage *v12;
  SearchUISymbolImage *v13;
  objc_super v15;

  v10 = a3;
  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SearchUISymbolImage;
  v12 = -[SearchUISymbolImage init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    -[SearchUISymbolImage setSymbolName:](v12, "setSymbolName:", v10);
    -[SearchUISymbolImage setSymbolFont:](v13, "setSymbolFont:", v11);
    -[SearchUISymbolImage setSymbolScale:](v13, "setSymbolScale:", a5);
    -[SearchUISymbolImage setSymbolWeight:](v13, "setSymbolWeight:", a6);
    -[SearchUISymbolImage setPreferredFill:](v13, "setPreferredFill:", -1);
    -[SearchUISymbolImage setIsTemplate:](v13, "setIsTemplate:", 1);
  }

  return v13;
}

- (BOOL)drawsOnBackground
{
  BOOL v3;
  void *v4;

  if (-[SearchUISymbolImage punchThroughBackground](self, "punchThroughBackground")
    || -[SearchUISymbolImage backgroundColor](self, "backgroundColor"))
  {
    return 1;
  }
  -[SearchUISymbolImage customBackgroundColor](self, "customBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 != 0;

  return v3;
}

- (double)aspectRatio
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SearchUISymbolImage;
  -[SearchUIImage aspectRatio](&v12, sel_aspectRatio);
  v4 = v3;
  if (v3 == 0.0)
  {
    v5 = (void *)objc_opt_class();
    -[SearchUISymbolImage symbolName](self, "symbolName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uiImageWithSymbolName:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "size");
    v9 = v8;
    objc_msgSend(v7, "size");
    v4 = v9 / v10;

  }
  return v4;
}

- (id)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v7;
  uint64_t v8;
  int64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double MinX;
  double v52;
  double MinY;
  double v54;
  void *v55;
  CGFloat v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  uint64_t v66;
  CGFloat v67;
  uint64_t v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  uint64_t v74;
  double v76;
  double v77;
  double v78;
  void *v79;
  void *v80;
  CGSize v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;

  v4 = a4;
  v7 = -[SearchUISymbolImage drawsOnBackground](self, "drawsOnBackground");
  -[SearchUISymbolImage symbolFont](self, "symbolFont");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = -[SearchUISymbolImage symbolScale](self, "symbolScale");
  if (!v8 && v7)
  {
    -[SearchUISymbolImage preferredSymbolFontSize](self, "preferredSymbolFontSize");
    if (v10 <= 0.0)
    {
      -[SearchUIImage size](self, "size");
      v13 = v12;
      -[SearchUIImage size](self, "size");
      if (v13 >= v14)
        v15 = v14;
      else
        v15 = v13;
      v11 = v15 * 0.32;
      v9 = 3;
    }
    else
    {
      -[SearchUISymbolImage preferredSymbolFontSize](self, "preferredSymbolFontSize");
      v9 = 0;
    }
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", round(v11));
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v79 = (void *)v8;
  -[SearchUISymbolImage preferredFill](self, "preferredFill");
  -[SearchUISymbolImage specifiedFillStyle](self, "specifiedFillStyle");
  if (v4)
    v16 = 3;
  else
    v16 = 2;
  objc_msgSend(MEMORY[0x1E0DBD910], "appearanceWithStyle:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUISymbolImage customForegroundColor](self, "customForegroundColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18 || !-[SearchUISymbolImage primaryColor](self, "primaryColor"))
  {
    v19 = v18;
  }
  else
  {
    objc_msgSend(v17, "textColorForColor:", +[SearchUITLKConverters colorForSFColor:](SearchUITLKConverters, "colorForSFColor:", -[SearchUISymbolImage primaryColor](self, "primaryColor")));
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  v20 = v19;

  if (-[SearchUISymbolImage secondaryColor](self, "secondaryColor"))
  {
    objc_msgSend(v17, "textColorForColor:", +[SearchUITLKConverters colorForSFColor:](SearchUITLKConverters, "colorForSFColor:", -[SearchUISymbolImage secondaryColor](self, "secondaryColor")));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
  v22 = (void *)objc_opt_class();
  -[SearchUISymbolImage symbolName](self, "symbolName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = v17;
  objc_msgSend(v22, "uiImageWithSymbolName:font:scale:weight:isTemplate:platformPrimaryColor:platformSecondaryColor:appearance:preferredFill:", v23, v79, v9, -[SearchUISymbolImage symbolWeight](self, "symbolWeight"), -[SearchUIImage isTemplate](self, "isTemplate"), v20, v21, v17, -[SearchUISymbolImage preferredFill](self, "preferredFill"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUIImage size](self, "size");
  if (v7)
  {
    v27 = v25;
    v28 = v26;
    if (v25 != *MEMORY[0x1E0C9D820] || v26 != *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      -[SearchUISymbolImage customBackgroundColor](self, "customBackgroundColor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      v78 = a3;
      if (v29)
      {
        v31 = v29;
      }
      else
      {
        objc_msgSend(v80, "textColorForColor:", +[SearchUITLKConverters colorForSFColor:](SearchUITLKConverters, "colorForSFColor:", -[SearchUISymbolImage backgroundColor](self, "backgroundColor")));
        v31 = (id)objc_claimAutoreleasedReturnValue();
      }
      v32 = v31;

      v33 = (void *)MEMORY[0x1E0DBD9B0];
      objc_msgSend(v24, "size");
      objc_msgSend(v33, "idealImageSizeWithSize:fittingSize:");
      v76 = v35;
      v77 = v34;
      v36 = v35;
      objc_msgSend(v24, "size");
      v38 = v36 / v37;
      objc_msgSend(v24, "size");
      v40 = v39;
      v42 = v41;
      objc_msgSend(v24, "alignmentRectInsets");
      v44 = v43;
      v46 = v45;
      v48 = v40 - v45 - v47;
      v50 = v42 - v43 - v49;
      v82.origin.x = v45;
      v82.origin.y = v44;
      v82.size.width = v48;
      v82.size.height = v50;
      MinX = CGRectGetMinX(v82);
      v83.origin.x = v46;
      v83.origin.y = v44;
      v83.size.width = v48;
      v83.size.height = v50;
      v52 = v38 * CGRectGetWidth(v83) * 0.5 + MinX * v38;
      v84.origin.x = v46;
      v84.origin.y = v44;
      v84.size.width = v48;
      v84.size.height = v50;
      MinY = CGRectGetMinY(v84);
      v85.origin.x = v46;
      v85.origin.y = v44;
      v85.size.width = v48;
      v85.size.height = v50;
      v54 = MinY + CGRectGetHeight(v85) * 0.5;
      v55 = (void *)MEMORY[0x1E0DBD9B0];
      v86.origin.x = 0.0;
      v86.origin.y = 0.0;
      v86.size.width = v27;
      v86.size.height = v28;
      v56 = CGRectGetMidX(v86) - v52;
      v87.origin.x = 0.0;
      v87.origin.y = 0.0;
      v87.size.width = v27;
      v87.size.height = v28;
      objc_msgSend(v55, "deviceScaledRoundedRect:forView:", 0, v56, CGRectGetMidY(v87) - v54, v77, v76);
      v58 = v57;
      v60 = v59;
      v62 = v61;
      v64 = v63;
      -[SearchUISymbolImage customForegroundColor](self, "customForegroundColor");
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      if (v65)
      {
        v66 = 0;
        v67 = v78;
      }
      else
      {
        v67 = v78;
        if (-[SearchUISymbolImage punchThroughBackground](self, "punchThroughBackground")
          && !-[SearchUISymbolImage primaryColor](self, "primaryColor"))
        {
          v66 = 23;
        }
        else
        {
          v66 = 20;
        }
      }
      v81.width = v27;
      v81.height = v28;
      UIGraphicsBeginImageContextWithOptions(v81, 0, v67);
      objc_msgSend(v32, "setFill");
      v88.origin.x = 0.0;
      v88.origin.y = 0.0;
      v88.size.width = v27;
      v88.size.height = v28;
      UIRectFill(v88);
      if (-[SearchUISymbolImage primaryColor](self, "primaryColor"))
        v68 = -[SearchUISymbolImage primaryColor](self, "primaryColor");
      else
        v68 = 7;
      -[SearchUISymbolImage customForegroundColor](self, "customForegroundColor");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = v69;
      if (v69)
      {
        v71 = v69;
      }
      else
      {
        objc_msgSend(v80, "textColorForColor:", +[SearchUITLKConverters colorForSFColor:](SearchUITLKConverters, "colorForSFColor:", v68));
        v71 = (id)objc_claimAutoreleasedReturnValue();
      }
      v72 = v71;

      objc_msgSend(v24, "imageWithTintColor:", v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "drawInRect:blendMode:alpha:", v66, v58, v60, v62, v64, 1.0);
      UIGraphicsGetImageFromCurrentImageContext();
      v74 = objc_claimAutoreleasedReturnValue();

      UIGraphicsEndImageContext();
      v24 = (void *)v74;
    }
  }

  return v24;
}

- (void)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  void (**v8)(id, void *, uint64_t);
  void *v9;
  objc_super v10;

  v5 = a4;
  v8 = (void (**)(id, void *, uint64_t))a5;
  if (-[SearchUISymbolImage drawsOnBackground](self, "drawsOnBackground"))
  {
    v10.receiver = self;
    v10.super_class = (Class)SearchUISymbolImage;
    -[SearchUIImage loadImageWithScale:isDarkStyle:completionHandler:](&v10, sel_loadImageWithScale_isDarkStyle_completionHandler_, v5, v8, a3);
  }
  else
  {
    -[SearchUISymbolImage loadImageWithScale:isDarkStyle:](self, "loadImageWithScale:isDarkStyle:", v5, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v9, 1);

  }
}

- (int)defaultCornerRoundingStyle
{
  objc_super v4;

  if (!-[SearchUISymbolImage drawsOnBackground](self, "drawsOnBackground"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)SearchUISymbolImage;
  return -[SearchUIImage defaultCornerRoundingStyle](&v4, sel_defaultCornerRoundingStyle);
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  SearchUISymbolImage *v7;
  SearchUISymbolImage *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  int64_t v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  objc_super v36;

  v7 = (SearchUISymbolImage *)a3;
  if (v7 == self)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
      -[SearchUIImage sfImage](self, "sfImage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 || (-[SearchUIImage sfImage](v8, "sfImage"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        v36.receiver = self;
        v36.super_class = (Class)SearchUISymbolImage;
        v10 = -[SearchUIImage isEqual:](&v36, sel_isEqual_, v8);
        if (v9)
        {

          if (v10)
            goto LABEL_7;
LABEL_14:
          v14 = 0;
LABEL_28:

          goto LABEL_29;
        }

        if ((v10 & 1) == 0)
          goto LABEL_14;
      }
LABEL_7:
      -[SearchUISymbolImage symbolName](self, "symbolName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUISymbolImage symbolName](v8, "symbolName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v11, "isEqualToString:", v12))
      {
        v14 = 0;
LABEL_27:

        goto LABEL_28;
      }
      -[SearchUISymbolImage symbolFont](self, "symbolFont");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13
        || (-[SearchUISymbolImage symbolFont](self, "symbolFont"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            -[SearchUISymbolImage symbolFont](v8, "symbolFont"),
            v5 = (void *)objc_claimAutoreleasedReturnValue(),
            (objc_msgSend(v4, "isEqual:", v5) & 1) == 0))
      {
        -[SearchUISymbolImage symbolFont](self, "symbolFont");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15
          || (-[SearchUISymbolImage symbolFont](v8, "symbolFont"),
              (v15 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {

LABEL_24:
          v14 = 0;
          goto LABEL_25;
        }
      }
      v16 = -[SearchUISymbolImage symbolScale](self, "symbolScale");
      if (v16 != -[SearchUISymbolImage symbolScale](v8, "symbolScale"))
        goto LABEL_24;
      -[SearchUISymbolImage preferredSymbolFontSize](self, "preferredSymbolFontSize");
      v18 = v17;
      -[SearchUISymbolImage preferredSymbolFontSize](v8, "preferredSymbolFontSize");
      if (v18 - v19 >= 2.22044605e-16)
        goto LABEL_24;
      -[SearchUISymbolImage customBackgroundColor](self, "customBackgroundColor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v35
        && (-[SearchUISymbolImage customBackgroundColor](self, "customBackgroundColor"),
            v20 = (void *)objc_claimAutoreleasedReturnValue(),
            -[SearchUISymbolImage customBackgroundColor](v8, "customBackgroundColor"),
            v33 = v20,
            v34 = objc_claimAutoreleasedReturnValue(),
            (objc_msgSend(v20, "isEqual:") & 1) != 0))
      {
        v31 = 0;
      }
      else
      {
        -[SearchUISymbolImage customBackgroundColor](self, "customBackgroundColor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v14 = 0;
LABEL_44:

          if (!v35)
          {
LABEL_49:

LABEL_25:
            if (v13)
            {

            }
            goto LABEL_27;
          }
          v28 = (void *)v34;
LABEL_48:

          goto LABEL_49;
        }
        -[SearchUISymbolImage customBackgroundColor](v8, "customBackgroundColor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {

          v14 = 0;
          goto LABEL_47;
        }
        v31 = 1;
      }
      -[SearchUISymbolImage customForegroundColor](self, "customForegroundColor");
      v32 = objc_claimAutoreleasedReturnValue();
      if (v32
        && (-[SearchUISymbolImage customForegroundColor](self, "customForegroundColor"),
            v24 = (void *)objc_claimAutoreleasedReturnValue(),
            -[SearchUISymbolImage customForegroundColor](v8, "customForegroundColor"),
            v29 = (void *)objc_claimAutoreleasedReturnValue(),
            v30 = v24,
            (objc_msgSend(v24, "isEqual:") & 1) != 0))
      {
        v14 = 1;
        v25 = (void *)v32;
      }
      else
      {
        -[SearchUISymbolImage customForegroundColor](self, "customForegroundColor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {

          v14 = 0;
        }
        else
        {
          -[SearchUISymbolImage customForegroundColor](v8, "customForegroundColor");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v27 == 0;

        }
        v25 = (void *)v32;
        if (!v32)
        {
          if (v31)
            goto LABEL_43;
          goto LABEL_47;
        }
      }

      if ((v31 & 1) != 0)
      {
LABEL_43:
        v22 = 0;
        goto LABEL_44;
      }
LABEL_47:
      v28 = (void *)v34;
      if (!v35)
        goto LABEL_25;
      goto LABEL_48;
    }
    v14 = 0;
  }
LABEL_29:

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;

  -[SearchUISymbolImage symbolName](self, "symbolName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SearchUISymbolImage symbolFont](self, "symbolFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SearchUISymbolImage symbolScale](self, "symbolScale"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SearchUISymbolImage symbolWeight](self, "symbolWeight"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[SearchUISymbolImage preferredSymbolFontSize](self, "preferredSymbolFontSize");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8 ^ v10 ^ objc_msgSend(v12, "hash");
  -[SearchUISymbolImage customBackgroundColor](self, "customBackgroundColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");
  -[SearchUISymbolImage customForegroundColor](self, "customForegroundColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v13 ^ v15 ^ objc_msgSend(v16, "hash");

  return v17;
}

+ (id)chevronImage
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x1E0DBD940], "cachedFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithSymbolName:font:scale:weight:", CFSTR("chevron.forward"), v3, 1, (uint64_t)*MEMORY[0x1E0DC1448]);

  return v4;
}

+ (id)uiImageWithSymbolName:(id)a3
{
  return (id)objc_msgSend(a1, "uiImageWithSymbolName:font:scale:", a3, 0, 0);
}

+ (id)uiImageWithSymbolName:(id)a3 font:(id)a4 scale:(int64_t)a5 weight:(int64_t)a6 isTemplate:(BOOL)a7
{
  _BOOL8 v7;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v18;

  v7 = a7;
  v12 = (void *)MEMORY[0x1E0DBD910];
  v13 = a4;
  v14 = a3;
  objc_msgSend(v12, "appearanceWithStyle:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = 0;
  objc_msgSend(a1, "uiImageWithSymbolName:font:scale:weight:isTemplate:primaryColor:secondaryColor:appearance:", v14, v13, a5, a6, v7, 0, v18, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (int64_t)preferredFill
{
  return self->_preferredFill;
}

- (void)setPreferredFill:(int64_t)a3
{
  self->_preferredFill = a3;
}

- (int64_t)symbolScale
{
  return self->_symbolScale;
}

- (void)setSymbolScale:(int64_t)a3
{
  self->_symbolScale = a3;
}

- (double)preferredSymbolFontSize
{
  return self->_preferredSymbolFontSize;
}

- (void)setPreferredSymbolFontSize:(double)a3
{
  self->_preferredSymbolFontSize = a3;
}

- (UIColor)customForegroundColor
{
  return self->_customForegroundColor;
}

- (void)setCustomForegroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_customForegroundColor, a3);
}

- (UIColor)customBackgroundColor
{
  return self->_customBackgroundColor;
}

- (void)setCustomBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_customBackgroundColor, a3);
}

- (NSString)symbolName
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setSymbolName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (UIFont)symbolFont
{
  return (UIFont *)objc_getProperty(self, a2, 208, 1);
}

- (void)setSymbolFont:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (int64_t)symbolWeight
{
  return self->_symbolWeight;
}

- (void)setSymbolWeight:(int64_t)a3
{
  self->_symbolWeight = a3;
}

- (BOOL)punchThroughBackground
{
  return self->_punchThroughBackground;
}

- (void)setPunchThroughBackground:(BOOL)a3
{
  self->_punchThroughBackground = a3;
}

- (int)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(int)a3
{
  self->_backgroundColor = a3;
}

- (int)primaryColor
{
  return self->_primaryColor;
}

- (void)setPrimaryColor:(int)a3
{
  self->_primaryColor = a3;
}

- (int)secondaryColor
{
  return self->_secondaryColor;
}

- (void)setSecondaryColor:(int)a3
{
  self->_secondaryColor = a3;
}

- (int)specifiedFillStyle
{
  return self->_specifiedFillStyle;
}

- (void)setSpecifiedFillStyle:(int)a3
{
  self->_specifiedFillStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolFont, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_customBackgroundColor, 0);
  objc_storeStrong((id *)&self->_customForegroundColor, 0);
}

+ (void)uiImageWithSymbolName:(uint64_t)a1 font:(NSObject *)a2 scale:weight:isTemplate:platformPrimaryColor:platformSecondaryColor:appearance:preferredFill:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DAD39000, a2, OS_LOG_TYPE_ERROR, "Symbol named %@ not found", (uint8_t *)&v2, 0xCu);
}

@end

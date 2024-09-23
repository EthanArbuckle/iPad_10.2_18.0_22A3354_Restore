@implementation TVImageLayout

- (void)setScaleMode:(int64_t)a3
{
  self->_scaleMode = a3;
}

- (TVImageLayout)init
{
  TVImageLayout *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVImageLayout;
  result = -[TVViewLayout init](&v3, sel_init);
  if (result)
    result->_scaleMode = 1;
  return result;
}

+ (id)layoutWithLayout:(id)a3 element:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  double v20;
  double v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  double v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  int v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  double v60;
  double v61;
  double v62;
  double v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  double v67;
  double v68;
  double v69;
  double v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  id v99;
  __int128 v100;
  __int128 v101;
  objc_super v102;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    v22 = v6;
    goto LABEL_91;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v22 = 0;
    goto LABEL_91;
  }
  v8 = v6;
  if (!v8)
    v8 = (id)objc_opt_new();
  v102.receiver = a1;
  v102.super_class = (Class)&OBJC_METACLASS___TVImageLayout;
  v9 = objc_msgSendSuper2(&v102, sel_layoutWithLayout_element_, v8, v7);
  v10 = v7;
  objc_msgSend(v10, "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tv_tintColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "colorType"))
  {
    objc_msgSend(v11, "tv_tintColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "color");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (!v14)
      goto LABEL_9;
    objc_msgSend(v8, "setTintColor:", v14);
    objc_msgSend(v8, "setDarkTintColor:", v14);
    v12 = v14;
  }

LABEL_9:
  objc_msgSend(v11, "tv_darkTintColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "colorType"))
  {
    objc_msgSend(v11, "tv_darkTintColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "color");
    v17 = (id)objc_claimAutoreleasedReturnValue();

    if (!v17)
      goto LABEL_13;
    objc_msgSend(v8, "setDarkTintColor:", v17);
    v15 = v17;
  }

LABEL_13:
  objc_msgSend(v11, "tv_highlightColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "color");
  v19 = objc_claimAutoreleasedReturnValue();

  if (v19)
    objc_msgSend(v8, "setHighlightColor:", v19);
  objc_msgSend(v11, "tv_width");
  if (v20 == 0.0)
    objc_msgSend(v10, "width");
  else
    objc_msgSend(v11, "tv_width");
  v23 = v21;
  objc_msgSend(v11, "tv_height");
  if (v24 == 0.0)
    objc_msgSend(v10, "height");
  else
    objc_msgSend(v11, "tv_height");
  v26 = v25;
  if (v23 == 0.0)
  {
    objc_msgSend(v8, "imageSize");
    v23 = v27;
  }
  v97 = (void *)v19;
  v98 = v7;
  if (v26 == 0.0)
  {
    objc_msgSend(v8, "imageSize");
    v26 = v28;
  }
  objc_msgSend(v8, "imageSymbolConfiguration");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v11, "tv_symbolScale");
  if (v30)
  {
    objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithScale:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v29)
    {
      objc_msgSend(v29, "configurationByApplyingConfiguration:", v31);
      v33 = objc_claimAutoreleasedReturnValue();

      v29 = (id)v33;
    }
    else
    {
      v29 = v31;
    }

  }
  v34 = objc_msgSend(v11, "tv_symbolWeight");
  if (v34)
  {
    objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithWeight:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v29)
    {
      objc_msgSend(v29, "configurationByApplyingConfiguration:", v35);
      v37 = objc_claimAutoreleasedReturnValue();

      v29 = (id)v37;
    }
    else
    {
      v29 = v35;
    }

  }
  objc_msgSend(v11, "tv_symbolPointSize");
  if (v38 != 0.0)
  {
    objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithPointSize:");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (v29)
    {
      objc_msgSend(v29, "configurationByApplyingConfiguration:", v39);
      v41 = objc_claimAutoreleasedReturnValue();

      v29 = (id)v41;
    }
    else
    {
      v29 = v39;
    }

  }
  objc_msgSend(v11, "tv_symbolTextStyle");
  v42 = objc_claimAutoreleasedReturnValue();
  v96 = (void *)v42;
  if (v42)
  {
    objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithTextStyle:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v43;
    if (v29)
    {
      objc_msgSend(v29, "configurationByApplyingConfiguration:", v43);
      v45 = objc_claimAutoreleasedReturnValue();

      v29 = (id)v45;
    }
    else
    {
      v29 = v43;
    }

  }
  objc_msgSend(v8, "setImageSymbolConfiguration:", v29);
  if (v23 != *MEMORY[0x24BDBF148] || v26 != *(double *)(MEMORY[0x24BDBF148] + 8))
    goto LABEL_57;
  objc_msgSend(v10, "url");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "tv_isResourceURL");

  if (v47)
  {
    +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
    v48 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "url");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "tv_resourceName");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "imageForResource:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_54;
  }
  objc_msgSend(v10, "url");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "tv_isSymbolURL");

  if (v53)
  {
    v54 = (void *)MEMORY[0x24BDF6AC8];
    objc_msgSend(v10, "url");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "tv_symbolName");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageSymbolConfiguration");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "systemImageNamed:withConfiguration:", v56, v57);
    v48 = (id)objc_claimAutoreleasedReturnValue();

    if (!v48)
    {
      v51 = 0;
LABEL_55:

      if (v51)
      {
        objc_msgSend(v51, "size");
        v23 = v60;
        v26 = v61;

      }
      goto LABEL_57;
    }
    v58 = (void *)MEMORY[0x24BDF6AC8];
    v48 = objc_retainAutorelease(v48);
    v59 = objc_msgSend(v48, "CGImage");
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "scale");
    objc_msgSend(v58, "imageWithCGImage:scale:orientation:", v59, 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_54:

    goto LABEL_55;
  }
LABEL_57:
  objc_msgSend(v8, "setImageSize:", v23, v26);
  objc_msgSend(v10, "aspectRatio");
  if (v62 != 0.0)
    objc_msgSend(v8, "setAspectRatio:");
  objc_msgSend(v11, "tv_imageUpscaleFactor");
  if (v63 != 0.0)
    objc_msgSend(v8, "setUpscaleFactor:");
  v64 = objc_msgSend(v10, "tv_scaleModeWithDefaultMode:", objc_msgSend(v8, "scaleMode"));
  if (v64)
    objc_msgSend(v8, "setScaleMode:", v64);
  objc_msgSend(v11, "tv_borderColor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "color");
  v66 = objc_claimAutoreleasedReturnValue();

  if (v66)
    objc_msgSend(v8, "setBorderColor:", v66);
  objc_msgSend(v11, "tv_borderWidths");
  if (v70 != *(double *)(MEMORY[0x24BDF7718] + 8)
    || v67 != *MEMORY[0x24BDF7718]
    || v69 != *(double *)(MEMORY[0x24BDF7718] + 24)
    || v68 != *(double *)(MEMORY[0x24BDF7718] + 16))
  {
    objc_msgSend(v8, "setBorderWidth:");
  }
  objc_msgSend(v11, "tv_shadow");
  v71 = objc_claimAutoreleasedReturnValue();
  if (v71)
    objc_msgSend(v8, "setShadow:", v71);
  v94 = (void *)v71;
  objc_msgSend(v11, "tv_tintColor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (v72)
  {
    objc_msgSend(v11, "tv_tintColor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIkTintColor:", v73);

    objc_msgSend(v11, "tv_tintColor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIkDarkTintColor:", v74);

  }
  objc_msgSend(v11, "tv_imageTreatment");
  v75 = objc_claimAutoreleasedReturnValue();
  if (v75)
    objc_msgSend(v8, "setImageTreatment:", v75);
  v93 = (void *)v75;
  objc_msgSend(v11, "valueForStyle:", CFSTR("tv-placeholder"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  if (v76)
  {
    v77 = v76;
    if (objc_msgSend(v76, "isEqualToString:", CFSTR("none")))
    {

      v77 = 0;
    }
    objc_msgSend(v8, "setPlaceholderArtworkName:", v77);

  }
  objc_msgSend(v10, "attributes");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "valueForKey:", CFSTR("inline-title"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  if (v79)
    objc_msgSend(v8, "setInlineTitle:", v79);
  objc_msgSend(v11, "borderRadius");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  if (v80)
    objc_msgSend(v8, "setIkBorderRadius:", v80);
  v100 = TVCornerRadiiZero;
  v101 = *(_OWORD *)&qword_222E77538;
  if (+[TVMLUtilities _cornerRadiiFromImageLayout:cornerRadii:circle:](TVMLUtilities, "_cornerRadiiFromImageLayout:cornerRadii:circle:", v8, &v100, 0))
  {
    objc_msgSend(v8, "setBorderRadii:", v100, v101);
  }
  v95 = v29;
  v99 = v6;
  objc_msgSend(v11, "valueForStyle:", CFSTR("tv-border-continuous"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  if (v81)
    objc_msgSend(v8, "setContinuousBorder:", objc_msgSend(v11, "tv_borderContinuous"));
  v82 = (void *)v66;
  objc_msgSend(v10, "attributes");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("opaque"));
  v84 = v10;
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  if (v85)
  {
    objc_msgSend(v84, "attributes");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "objectForKeyedSubscript:", CFSTR("opaque"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowsNonOpaqueShadows:", objc_msgSend(v87, "BOOLValue") ^ 1);

  }
  objc_msgSend(v84, "appDocument");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "templateElement");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "style");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "tv_searchStyle");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUseInSearchPartial:", objc_msgSend(v91, "isEqualToString:", CFSTR("partial")));

  v22 = v8;
  v7 = v98;
  v6 = v99;
LABEL_91:

  return v22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)TVImageLayout;
  v5 = -[TVViewLayout copyWithZone:](&v16, sel_copyWithZone_);
  objc_msgSend(v5, "setImageSize:", self->_imageSize.width, self->_imageSize.height);
  objc_msgSend(v5, "setUpscaleFactor:", self->_upscaleFactor);
  objc_msgSend(v5, "setAspectRatio:", self->_aspectRatio);
  objc_msgSend(v5, "setScaleMode:", self->_scaleMode);
  objc_msgSend(v5, "setBorderRadii:", self->_borderRadii.topLeft, self->_borderRadii.topRight, self->_borderRadii.bottomLeft, self->_borderRadii.bottomRight);
  objc_msgSend(v5, "setBorderWidth:", self->_borderWidth.top, self->_borderWidth.left, self->_borderWidth.bottom, self->_borderWidth.right);
  v6 = (void *)-[UIColor copyWithZone:](self->_borderColor, "copyWithZone:", a3);
  objc_msgSend(v5, "setBorderColor:", v6);

  objc_msgSend(v5, "setContinuousBorder:", self->_continuousBorder);
  v7 = (void *)-[IKColor copyWithZone:](self->_ikTintColor, "copyWithZone:", a3);
  objc_msgSend(v5, "setIkTintColor:", v7);

  v8 = (void *)-[IKColor copyWithZone:](self->_ikDarkTintColor, "copyWithZone:", a3);
  objc_msgSend(v5, "setIkDarkTintColor:", v8);

  v9 = (void *)-[NSShadow copyWithZone:](self->_shadow, "copyWithZone:", a3);
  objc_msgSend(v5, "setShadow:", v9);

  v10 = (void *)-[NSString copyWithZone:](self->_placeholderArtworkName, "copyWithZone:", a3);
  objc_msgSend(v5, "setPlaceholderArtworkName:", v10);

  v11 = (void *)-[NSString copyWithZone:](self->_cropCode, "copyWithZone:", a3);
  objc_msgSend(v5, "setCropCode:", v11);

  v12 = (void *)-[UIImageSymbolConfiguration copyWithZone:](self->_imageSymbolConfiguration, "copyWithZone:", a3);
  objc_msgSend(v5, "setImageSymbolConfiguration:", v12);

  v13 = (void *)-[NSString copyWithZone:](self->_imageTreatment, "copyWithZone:", a3);
  objc_msgSend(v5, "setImageTreatment:", v13);

  objc_msgSend(v5, "setIkBorderRadius:", self->_ikBorderRadius);
  v14 = (void *)-[NSString copyWithZone:](self->_inlineTitle, "copyWithZone:", a3);
  objc_msgSend(v5, "setInlineTitle:", v14);

  return v5;
}

- (CGSize)decoratorSize
{
  double height;
  double width;
  double aspectRatio;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  aspectRatio = self->_aspectRatio;
  if (aspectRatio != 0.0)
  {
    if (width == 0.0)
    {
      width = ceil(height * aspectRatio);
    }
    else if (height == 0.0)
    {
      height = ceil(width / aspectRatio);
    }
  }
  -[TVViewLayout maxWidth](self, "maxWidth");
  if (v6 != 0.0 || (-[TVViewLayout maxHeight](self, "maxHeight"), v7 != 0.0))
  {
    if (self->_scaleMode == 1)
    {
      -[TVViewLayout maxWidth](self, "maxWidth");
      v9 = v8;
      -[TVViewLayout maxHeight](self, "maxHeight");
      -[TVImageLayout _aspectFitToSize:scaleToSize:aspectRatio:](self, "_aspectFitToSize:scaleToSize:aspectRatio:", v9, v10, width, height, aspectRatio);
      width = v11;
      height = v12;
    }
  }
  v13 = width;
  v14 = height;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGSize)_aspectFitToSize:(CGSize)a3 scaleToSize:(CGSize)a4 aspectRatio:(double)a5
{
  double width;
  CGFloat height;
  CGFloat v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  CGFloat v11;
  CGFloat x;
  CGFloat y;
  CGFloat v14;
  CGFloat v15;
  BOOL v18;
  double v19;
  double v20;
  double v21;
  CGSize result;
  CGRect v23;
  CGRect v24;

  width = a4.width;
  height = a3.height;
  v7 = a3.width;
  if (a3.width == 0.0 || a3.height == 0.0)
  {
    if (a3.height != 0.0)
    {
      if (a5 != 0.0 && a4.width == *MEMORY[0x24BDBF148] && a4.height == *(double *)(MEMORY[0x24BDBF148] + 8))
      {
        width = ceil(a3.height * a5);
      }
      else
      {
        if (a4.height <= a3.height)
          goto LABEL_30;
        width = a3.height * (a4.width / a4.height);
      }
      a4.height = a3.height;
      goto LABEL_30;
    }
    if (a3.width == 0.0)
      goto LABEL_30;
    if (a5 != 0.0
      && (a4.width == *MEMORY[0x24BDBF148] ? (v18 = a4.height == *(double *)(MEMORY[0x24BDBF148] + 8)) : (v18 = 0), v18))
    {
      v19 = a3.width / a5;
    }
    else
    {
      if (a4.width <= a3.width || a4.height <= 0.0)
        goto LABEL_30;
      v19 = a3.width / (a4.width / a4.height);
    }
    a4.height = ceil(v19);
    width = v7;
    goto LABEL_30;
  }
  v8 = ceil(a3.height * a5);
  if (a4.width != *MEMORY[0x24BDBF148] || a4.height != *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    v8 = a4.width;
    a3.height = a4.height;
  }
  v9 = 0;
  v10 = 0;
  v11 = v7;
  v23 = AVMakeRectWithAspectRatioInsideRect(a3, *(CGRect *)(&height - 3));
  x = v23.origin.x;
  y = v23.origin.y;
  v14 = v23.size.width;
  v15 = v23.size.height;
  width = ceil(CGRectGetWidth(v23));
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = v14;
  v24.size.height = v15;
  a4.height = ceil(CGRectGetHeight(v24));
LABEL_30:
  v20 = width;
  v21 = a4.height;
  result.height = v21;
  result.width = v20;
  return result;
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (double)upscaleFactor
{
  return self->_upscaleFactor;
}

- (void)setUpscaleFactor:(double)a3
{
  self->_upscaleFactor = a3;
}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (void)setAspectRatio:(double)a3
{
  self->_aspectRatio = a3;
}

- (int64_t)scaleMode
{
  return self->_scaleMode;
}

- (TVCornerRadii)borderRadii
{
  double topLeft;
  double topRight;
  double bottomLeft;
  double bottomRight;
  TVCornerRadii result;

  topLeft = self->_borderRadii.topLeft;
  topRight = self->_borderRadii.topRight;
  bottomLeft = self->_borderRadii.bottomLeft;
  bottomRight = self->_borderRadii.bottomRight;
  result.bottomRight = bottomRight;
  result.bottomLeft = bottomLeft;
  result.topRight = topRight;
  result.topLeft = topLeft;
  return result;
}

- (void)setBorderRadii:(TVCornerRadii)a3
{
  self->_borderRadii = a3;
}

- (UIEdgeInsets)borderWidth
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_borderWidth.top;
  left = self->_borderWidth.left;
  bottom = self->_borderWidth.bottom;
  right = self->_borderWidth.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setBorderWidth:(UIEdgeInsets)a3
{
  self->_borderWidth = a3;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (void)setBorderColor:(id)a3
{
  objc_storeStrong((id *)&self->_borderColor, a3);
}

- (BOOL)continuousBorder
{
  return self->_continuousBorder;
}

- (void)setContinuousBorder:(BOOL)a3
{
  self->_continuousBorder = a3;
}

- (IKColor)ikTintColor
{
  return self->_ikTintColor;
}

- (void)setIkTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_ikTintColor, a3);
}

- (IKColor)ikDarkTintColor
{
  return self->_ikDarkTintColor;
}

- (void)setIkDarkTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_ikDarkTintColor, a3);
}

- (NSShadow)shadow
{
  return self->_shadow;
}

- (void)setShadow:(id)a3
{
  objc_storeStrong((id *)&self->_shadow, a3);
}

- (NSString)placeholderArtworkName
{
  return self->_placeholderArtworkName;
}

- (void)setPlaceholderArtworkName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (NSString)cropCode
{
  return self->_cropCode;
}

- (void)setCropCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (UIImageSymbolConfiguration)imageSymbolConfiguration
{
  return self->_imageSymbolConfiguration;
}

- (void)setImageSymbolConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_imageSymbolConfiguration, a3);
}

- (NSString)imageTreatment
{
  return self->_imageTreatment;
}

- (void)setImageTreatment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (IKFourTuple)ikBorderRadius
{
  return self->_ikBorderRadius;
}

- (void)setIkBorderRadius:(id)a3
{
  objc_storeStrong((id *)&self->_ikBorderRadius, a3);
}

- (NSString)inlineTitle
{
  return self->_inlineTitle;
}

- (void)setInlineTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (BOOL)allowsNonOpaqueShadows
{
  return self->_allowsNonOpaqueShadows;
}

- (void)setAllowsNonOpaqueShadows:(BOOL)a3
{
  self->_allowsNonOpaqueShadows = a3;
}

- (BOOL)useInSearchPartial
{
  return self->_useInSearchPartial;
}

- (void)setUseInSearchPartial:(BOOL)a3
{
  self->_useInSearchPartial = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inlineTitle, 0);
  objc_storeStrong((id *)&self->_ikBorderRadius, 0);
  objc_storeStrong((id *)&self->_imageTreatment, 0);
  objc_storeStrong((id *)&self->_imageSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_cropCode, 0);
  objc_storeStrong((id *)&self->_placeholderArtworkName, 0);
  objc_storeStrong((id *)&self->_shadow, 0);
  objc_storeStrong((id *)&self->_ikDarkTintColor, 0);
  objc_storeStrong((id *)&self->_ikTintColor, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
}

- (double)defaultFocusSizeIncrease
{
  double result;
  double v4;
  double v5;

  if (-[TVViewLayout centerGrowth](self, "centerGrowth"))
    return 60.0;
  -[TVImageLayout decoratorSize](self, "decoratorSize");
  +[TVMLUtilities focusedSizeIncreaseForSize:upscaleFactor:useInSearchPartial:](TVMLUtilities, "focusedSizeIncreaseForSize:upscaleFactor:useInSearchPartial:", -[TVImageLayout useInSearchPartial](self, "useInSearchPartial"), v4, v5, self->_upscaleFactor);
  return result;
}

@end

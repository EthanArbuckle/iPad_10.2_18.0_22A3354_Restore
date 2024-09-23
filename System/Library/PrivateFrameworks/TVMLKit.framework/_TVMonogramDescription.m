@implementation _TVMonogramDescription

- (_TVMonogramDescription)initWithFirstName:(id)a3 lastName:(id)a4 imageURL:(id)a5 font:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _TVMonogramDescription *v14;
  _TVMonogramDescription *v15;
  uint64_t v16;
  NSString *firstName;
  uint64_t v18;
  NSString *lastName;
  uint64_t v20;
  NSURL *imageURL;
  void **p_font;
  uint64_t v23;
  void *v24;
  objc_super v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)_TVMonogramDescription;
  v14 = -[_TVMonogramDescription init](&v26, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_shouldFallBackToSilhouette = 1;
    v16 = objc_msgSend(v10, "copy");
    firstName = v15->_firstName;
    v15->_firstName = (NSString *)v16;

    v18 = objc_msgSend(v11, "copy");
    lastName = v15->_lastName;
    v15->_lastName = (NSString *)v18;

    v20 = objc_msgSend(v12, "copy");
    imageURL = v15->_imageURL;
    v15->_imageURL = (NSURL *)v20;

    p_font = (void **)&v15->_font;
    objc_storeStrong((id *)&v15->_font, a6);
    if (!v15->_font)
    {
      objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7850]);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = *p_font;
      *p_font = (void *)v23;

    }
    v15->_scaleMode = 3;
  }

  return v15;
}

- (_TVMonogramDescription)init
{
  return -[_TVMonogramDescription initWithFirstName:lastName:imageURL:font:](self, "initWithFirstName:lastName:imageURL:font:", 0, 0, 0, 0);
}

- (id)copyWithType:(unint64_t)a3
{
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;

  if (-[_TVMonogramDescription preferedMonogramType](self, "preferedMonogramType") <= a3)
    return 0;
  v5 = -[_TVMonogramDescription copy](self, "copy");
  v6 = (_QWORD *)v5;
  if (a3 <= 2)
  {
    v7 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;

    if (a3 != 2)
    {
      v8 = (void *)v6[2];
      v6[2] = 0;

      v9 = (void *)v6[3];
      v6[3] = 0;

      objc_msgSend(v6, "setText:", 0);
      if (!a3)
        objc_msgSend(v6, "setShouldFallBackToSilhouette:", 0);
    }
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _TVMonogramDescription *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _TVMonogramDescription *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = +[_TVMonogramDescription allocWithZone:](_TVMonogramDescription, "allocWithZone:", a3);
  -[_TVMonogramDescription firstName](self, "firstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVMonogramDescription lastName](self, "lastName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVMonogramDescription imageURL](self, "imageURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVMonogramDescription font](self, "font");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_TVMonogramDescription initWithFirstName:lastName:imageURL:font:](v4, "initWithFirstName:lastName:imageURL:font:", v5, v6, v7, v8);

  -[_TVMonogramDescription text](self, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVMonogramDescription setText:](v9, "setText:", v10);

  -[_TVMonogramDescription size](self, "size");
  -[_TVMonogramDescription setSize:](v9, "setSize:");
  -[_TVMonogramDescription padding](self, "padding");
  -[_TVMonogramDescription setPadding:](v9, "setPadding:");
  -[_TVMonogramDescription setScaleMode:](v9, "setScaleMode:", -[_TVMonogramDescription scaleMode](self, "scaleMode"));
  -[_TVMonogramDescription backgroundColor](self, "backgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVMonogramDescription setBackgroundColor:](v9, "setBackgroundColor:", v11);

  -[_TVMonogramDescription textColor](self, "textColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVMonogramDescription setTextColor:](v9, "setTextColor:", v12);

  -[_TVMonogramDescription upscaleAdjustment](self, "upscaleAdjustment");
  -[_TVMonogramDescription setUpscaleAdjustment:](v9, "setUpscaleAdjustment:");
  -[_TVMonogramDescription cornerRadius](self, "cornerRadius");
  -[_TVMonogramDescription setCornerRadius:](v9, "setCornerRadius:");
  -[_TVMonogramDescription fillColor](self, "fillColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVMonogramDescription setFillColor:](v9, "setFillColor:", v13);

  -[_TVMonogramDescription setShouldFallBackToSilhouette:](v9, "setShouldFallBackToSilhouette:", -[_TVMonogramDescription shouldFallBackToSilhouette](self, "shouldFallBackToSilhouette"));
  -[_TVMonogramDescription borderWidth](self, "borderWidth");
  -[_TVMonogramDescription setBorderWidth:](v9, "setBorderWidth:");
  -[_TVMonogramDescription borderColor](self, "borderColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVMonogramDescription setBorderColor:](v9, "setBorderColor:", v14);

  -[_TVMonogramDescription requestLoader](self, "requestLoader");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVMonogramDescription setRequestLoader:](v9, "setRequestLoader:", v15);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  int64_t v77;
  uint64_t v78;
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

  v4 = a3;
  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[_TVMonogramDescription firstName](self, "firstName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 != v7)
    {
      -[_TVMonogramDescription firstName](self, "firstName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "firstName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v8, "isEqual:", v9))
      {
        v10 = 0;
        goto LABEL_37;
      }
      v88 = v9;
      v89 = v8;
    }
    -[_TVMonogramDescription lastName](self, "lastName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 != v12)
    {
      -[_TVMonogramDescription lastName](self, "lastName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v13, "isEqual:", v14))
      {
        v10 = 0;
LABEL_35:

LABEL_36:
        v9 = v88;
        v8 = v89;
        if (v6 == v7)
        {
LABEL_38:

          goto LABEL_39;
        }
LABEL_37:

        goto LABEL_38;
      }
      v86 = v14;
      v87 = v13;
    }
    -[_TVMonogramDescription text](self, "text");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 != v16)
    {
      -[_TVMonogramDescription text](self, "text");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "text");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = v17;
      if (!objc_msgSend(v17, "isEqual:"))
      {
        v10 = 0;
LABEL_33:

LABEL_34:
        v14 = v86;
        v13 = v87;
        if (v11 == v12)
          goto LABEL_36;
        goto LABEL_35;
      }
    }
    -[_TVMonogramDescription imageURL](self, "imageURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageURL");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = v12;
    v85 = v16;
    if (v18 != v83)
    {
      v76 = v7;
      v19 = v6;
      v20 = v18;
      -[_TVMonogramDescription imageURL](self, "imageURL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "imageURL");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = v21;
      if (!objc_msgSend(v21, "isEqual:"))
      {
        v40 = v15;
        v10 = 0;
        v18 = v20;
        v44 = v83;
        v6 = v19;
        v7 = v76;
        goto LABEL_31;
      }
      v18 = v20;
      v6 = v19;
      v7 = v76;
    }
    -[_TVMonogramDescription size](self, "size");
    v23 = v22;
    v25 = v24;
    objc_msgSend(v5, "size");
    if (v23 != v27
      || v25 != v26
      || (-[_TVMonogramDescription padding](self, "padding"),
          v29 = v28,
          v31 = v30,
          v33 = v32,
          v35 = v34,
          objc_msgSend(v5, "padding"),
          v31 != v39)
      || v29 != v36
      || v35 != v38
      || v33 != v37
      || (v77 = -[_TVMonogramDescription scaleMode](self, "scaleMode"), v77 != objc_msgSend(v5, "scaleMode")))
    {
      v40 = v15;
      v10 = 0;
      v43 = 0;
      goto LABEL_28;
    }
    -[_TVMonogramDescription backgroundColor](self, "backgroundColor");
    v78 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "backgroundColor");
    v73 = objc_claimAutoreleasedReturnValue();
    v74 = v18;
    if (v78 != v73)
    {
      -[_TVMonogramDescription backgroundColor](self, "backgroundColor");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "backgroundColor");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v72, "isEqual:"))
      {
        v40 = v15;
        v10 = 0;
        v41 = (void *)v78;
        v42 = (void *)v73;
        goto LABEL_62;
      }
    }
    -[_TVMonogramDescription textColor](self, "textColor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textColor");
    v71 = objc_claimAutoreleasedReturnValue();
    if (v75 != (void *)v71)
    {
      -[_TVMonogramDescription textColor](self, "textColor");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "textColor");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v70, "isEqual:"))
      {
        v10 = 0;
        v46 = (void *)v71;
        goto LABEL_59;
      }
    }
    -[_TVMonogramDescription upscaleAdjustment](self, "upscaleAdjustment");
    v48 = v47;
    objc_msgSend(v5, "upscaleAdjustment");
    if (v48 != v49
      || (-[_TVMonogramDescription cornerRadius](self, "cornerRadius"),
          v51 = v50,
          objc_msgSend(v5, "cornerRadius"),
          v51 != v52))
    {
      v10 = 0;
      goto LABEL_58;
    }
    -[_TVMonogramDescription fillColor](self, "fillColor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fillColor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (v67 == v66
      || (-[_TVMonogramDescription fillColor](self, "fillColor"),
          v65 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v5, "fillColor"),
          v62 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v65, "isEqual:")))
    {
      v63 = -[_TVMonogramDescription shouldFallBackToSilhouette](self, "shouldFallBackToSilhouette");
      if (v63 == objc_msgSend(v5, "shouldFallBackToSilhouette")
        && (-[_TVMonogramDescription borderWidth](self, "borderWidth"),
            v55 = v54,
            objc_msgSend(v5, "borderWidth"),
            v55 == v56))
      {
        -[_TVMonogramDescription borderColor](self, "borderColor");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "borderColor");
        v57 = objc_claimAutoreleasedReturnValue();
        if (v64 == (void *)v57)
        {

          v10 = 1;
        }
        else
        {
          v61 = (void *)v57;
          -[_TVMonogramDescription borderColor](self, "borderColor");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "borderColor");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v60, "isEqual:", v59);

        }
      }
      else
      {
        v10 = 0;
      }
      v53 = v66;
      if (v67 == v66)
      {

        goto LABEL_57;
      }
    }
    else
    {
      v10 = 0;
      v53 = v66;
    }
    v58 = v53;

LABEL_57:
LABEL_58:
    v46 = (void *)v71;
    if (v75 == (void *)v71)
    {
      v40 = v15;
LABEL_61:

      v41 = (void *)v78;
      v42 = (void *)v73;
      if (v78 == v73)
      {
LABEL_63:

        v43 = v10;
        v18 = v74;
LABEL_28:
        v44 = v83;
        if (v18 == v83)
        {

          v10 = v43;
          goto LABEL_32;
        }
LABEL_31:

LABEL_32:
        v15 = v40;
        v12 = v84;
        v16 = v85;
        if (v15 == v85)
          goto LABEL_34;
        goto LABEL_33;
      }
LABEL_62:

      goto LABEL_63;
    }
LABEL_59:
    v40 = v15;

    goto LABEL_61;
  }
  v10 = 0;
LABEL_39:

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v11;

  -[_TVMonogramDescription lastName](self, "lastName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[_TVMonogramDescription firstName](self, "firstName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[_TVMonogramDescription firstName](self, "firstName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "hash");
LABEL_11:

      goto LABEL_12;
    }
    -[_TVMonogramDescription text](self, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[_TVMonogramDescription text](self, "text");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (id)objc_msgSend(v7, "hash");
    }
    else
    {
      -[_TVMonogramDescription imageURL](self, "imageURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[_TVMonogramDescription imageURL](self, "imageURL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v9, "hash");

        goto LABEL_10;
      }
      v11.receiver = self;
      v11.super_class = (Class)_TVMonogramDescription;
      v8 = -[_TVMonogramDescription hash](&v11, sel_hash);
    }
    v5 = (unint64_t)v8;
LABEL_10:

    goto LABEL_11;
  }
  -[_TVMonogramDescription lastName](self, "lastName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
LABEL_12:

  return v5;
}

- (unint64_t)preferedMonogramType
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;

  -[_TVMonogramDescription imageURL](self, "imageURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[_TVMonogramDescription firstName](self, "firstName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "length"))
    {
      -[_TVMonogramDescription lastName](self, "lastName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v8, "length"))
      {
        -[_TVMonogramDescription text](self, "text");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "length");

        if (!v12)
          return -[_TVMonogramDescription shouldFallBackToSilhouette](self, "shouldFallBackToSilhouette");
        return 2;
      }

    }
    return 2;
  }
  -[_TVMonogramDescription imageURL](self, "imageURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[_TVMonogramResourceImageGenerator isResourceURL:](_TVMonogramResourceImageGenerator, "isResourceURL:", v4);

  if (v5)
    return 3;
  -[_TVMonogramDescription imageURL](self, "imageURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[_TVMonogramAppleAccountImageGenerator isAppleAccountsURL:](_TVMonogramAppleAccountImageGenerator, "isAppleAccountsURL:", v9);

  if (v10)
    return 4;
  else
    return 5;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (UIFont)font
{
  return self->_font;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (int64_t)scaleMode
{
  return self->_scaleMode;
}

- (void)setScaleMode:(int64_t)a3
{
  self->_scaleMode = a3;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
}

- (double)upscaleAdjustment
{
  return self->_upscaleAdjustment;
}

- (void)setUpscaleAdjustment:(double)a3
{
  self->_upscaleAdjustment = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (void)setFillColor:(id)a3
{
  objc_storeStrong((id *)&self->_fillColor, a3);
}

- (BOOL)shouldFallBackToSilhouette
{
  return self->_shouldFallBackToSilhouette;
}

- (void)setShouldFallBackToSilhouette:(BOOL)a3
{
  self->_shouldFallBackToSilhouette = a3;
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (void)setBorderWidth:(double)a3
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

- (IKNetworkRequestLoader)requestLoader
{
  return (IKNetworkRequestLoader *)objc_loadWeakRetained((id *)&self->_requestLoader);
}

- (void)setRequestLoader:(id)a3
{
  objc_storeWeak((id *)&self->_requestLoader, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_requestLoader);
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
}

@end

@implementation VUIMonogramDescription

- (VUIMonogramDescription)initWithFirstName:(id)a3 lastName:(id)a4 imageURL:(id)a5 font:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  VUIMonogramDescription *v14;
  VUIMonogramDescription *v15;
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
  v26.super_class = (Class)VUIMonogramDescription;
  v14 = -[VUIMonogramDescription init](&v26, sel_init);
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
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B58]);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = *p_font;
      *p_font = (void *)v23;

    }
    v15->_scaleMode = 3;
    v15->_optimizedImageRendering = 1;
  }

  return v15;
}

- (VUIMonogramDescription)init
{
  return -[VUIMonogramDescription initWithFirstName:lastName:imageURL:font:](self, "initWithFirstName:lastName:imageURL:font:", 0, 0, 0, 0);
}

- (id)copyWithType:(unint64_t)a3
{
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;

  if (-[VUIMonogramDescription preferedMonogramType](self, "preferedMonogramType") <= a3)
    return 0;
  v5 = -[VUIMonogramDescription copy](self, "copy");
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
  VUIMonogramDescription *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  VUIMonogramDescription *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = +[VUIMonogramDescription allocWithZone:](VUIMonogramDescription, "allocWithZone:", a3);
  -[VUIMonogramDescription firstName](self, "firstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMonogramDescription lastName](self, "lastName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMonogramDescription imageURL](self, "imageURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMonogramDescription font](self, "font");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[VUIMonogramDescription initWithFirstName:lastName:imageURL:font:](v4, "initWithFirstName:lastName:imageURL:font:", v5, v6, v7, v8);

  -[VUIMonogramDescription text](self, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMonogramDescription setText:](v9, "setText:", v10);

  -[VUIMonogramDescription size](self, "size");
  -[VUIMonogramDescription setSize:](v9, "setSize:");
  -[VUIMonogramDescription defaultImageSize](self, "defaultImageSize");
  -[VUIMonogramDescription setDefaultImageSize:](v9, "setDefaultImageSize:");
  -[VUIMonogramDescription specialOffsetByFirstLetter](self, "specialOffsetByFirstLetter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMonogramDescription setSpecialOffsetByFirstLetter:](v9, "setSpecialOffsetByFirstLetter:", v11);

  -[VUIMonogramDescription padding](self, "padding");
  -[VUIMonogramDescription setPadding:](v9, "setPadding:");
  -[VUIMonogramDescription setScaleMode:](v9, "setScaleMode:", -[VUIMonogramDescription scaleMode](self, "scaleMode"));
  -[VUIMonogramDescription backgroundColor](self, "backgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMonogramDescription setBackgroundColor:](v9, "setBackgroundColor:", v12);

  -[VUIMonogramDescription textColor](self, "textColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMonogramDescription setTextColor:](v9, "setTextColor:", v13);

  -[VUIMonogramDescription upscaleAdjustment](self, "upscaleAdjustment");
  -[VUIMonogramDescription setUpscaleAdjustment:](v9, "setUpscaleAdjustment:");
  -[VUIMonogramDescription cornerRadius](self, "cornerRadius");
  -[VUIMonogramDescription setCornerRadius:](v9, "setCornerRadius:");
  -[VUIMonogramDescription fillColor](self, "fillColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMonogramDescription setFillColor:](v9, "setFillColor:", v14);

  -[VUIMonogramDescription gradientStartColor](self, "gradientStartColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMonogramDescription setGradientStartColor:](v9, "setGradientStartColor:", v15);

  -[VUIMonogramDescription gradientEndColor](self, "gradientEndColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMonogramDescription setGradientEndColor:](v9, "setGradientEndColor:", v16);

  -[VUIMonogramDescription setShouldFallBackToSilhouette:](v9, "setShouldFallBackToSilhouette:", -[VUIMonogramDescription shouldFallBackToSilhouette](self, "shouldFallBackToSilhouette"));
  -[VUIMonogramDescription borderWidth](self, "borderWidth");
  -[VUIMonogramDescription setBorderWidth:](v9, "setBorderWidth:");
  -[VUIMonogramDescription borderColor](self, "borderColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMonogramDescription setBorderColor:](v9, "setBorderColor:", v17);

  -[VUIMonogramDescription requestLoader](self, "requestLoader");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMonogramDescription setRequestLoader:](v9, "setRequestLoader:", v18);

  -[VUIMonogramDescription setOptimizedImageRendering:](v9, "setOptimizedImageRendering:", -[VUIMonogramDescription optimizedImageRendering](self, "optimizedImageRendering"));
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
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
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
  void *v37;
  void *v38;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  BOOL v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  int64_t v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;

  v4 = a3;
  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[VUIMonogramDescription firstName](self, "firstName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 != v7)
    {
      -[VUIMonogramDescription firstName](self, "firstName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "firstName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v8, "isEqual:", v9))
      {
        v10 = 0;
        goto LABEL_41;
      }
      v117 = v9;
      v118 = v8;
    }
    -[VUIMonogramDescription lastName](self, "lastName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 != v12)
    {
      -[VUIMonogramDescription lastName](self, "lastName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "isEqual:", v14) & 1) == 0)
      {

        v10 = 0;
        goto LABEL_40;
      }
      v111 = v14;
      v112 = v13;
    }
    -[VUIMonogramDescription text](self, "text");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 != v16)
    {
      -[VUIMonogramDescription text](self, "text");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "text");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = v17;
      if (!objc_msgSend(v17, "isEqual:"))
      {
        v18 = 0;
        goto LABEL_36;
      }
    }
    -[VUIMonogramDescription imageURL](self, "imageURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageURL");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19 != v116)
    {
      v106 = v7;
      v20 = v12;
      v21 = v11;
      v22 = v16;
      v23 = v15;
      -[VUIMonogramDescription imageURL](self, "imageURL");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "imageURL");
      v110 = v24;
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v24, "isEqual:"))
      {
        v113 = v19;
        v18 = 0;
        v15 = v23;
        v16 = v22;
        v11 = v21;
        v12 = v20;
        v7 = v106;
        goto LABEL_33;
      }
      v15 = v23;
      v16 = v22;
      v11 = v21;
      v12 = v20;
      v7 = v106;
    }
    -[VUIMonogramDescription size](self, "size");
    v26 = v25;
    v28 = v27;
    objc_msgSend(v5, "size");
    if (v26 == v30 && v28 == v29)
    {
      -[VUIMonogramDescription defaultImageSize](self, "defaultImageSize");
      v32 = v31;
      v34 = v33;
      objc_msgSend(v5, "defaultImageSize");
      if (v32 == v36 && v34 == v35)
      {
        v113 = v19;
        -[VUIMonogramDescription specialOffsetByFirstLetter](self, "specialOffsetByFirstLetter");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "specialOffsetByFirstLetter");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37 != v38)
          goto LABEL_22;
        v104 = v38;
        v107 = v37;
        -[VUIMonogramDescription padding](self, "padding");
        v41 = v40;
        v43 = v42;
        v45 = v44;
        v47 = v46;
        objc_msgSend(v5, "padding");
        if (v43 != v51 || v41 != v48 || v47 != v50)
        {

          goto LABEL_23;
        }
        v38 = v104;
        if (v45 != v49
          || (v102 = -[VUIMonogramDescription scaleMode](self, "scaleMode"),
              v52 = v102 == objc_msgSend(v5, "scaleMode"),
              v38 = v104,
              !v52))
        {
LABEL_22:

LABEL_23:
          v18 = 0;
          v10 = 0;
          goto LABEL_24;
        }
        -[VUIMonogramDescription backgroundColor](self, "backgroundColor");
        v53 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "backgroundColor");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v105 = (void *)v53;
        if ((void *)v53 != v103)
        {
          -[VUIMonogramDescription backgroundColor](self, "backgroundColor");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "backgroundColor");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          v99 = v54;
          if (!objc_msgSend(v54, "isEqual:"))
          {
            v18 = 0;
            v55 = v107;
            goto LABEL_85;
          }
        }
        -[VUIMonogramDescription textColor](self, "textColor");
        v56 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "textColor");
        v100 = objc_claimAutoreleasedReturnValue();
        v101 = (void *)v56;
        if (v56 != v100)
        {
          -[VUIMonogramDescription textColor](self, "textColor");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "textColor");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          v97 = v57;
          if (!objc_msgSend(v57, "isEqual:"))
          {
            v18 = 0;
            v68 = (void *)v100;
LABEL_83:

LABEL_84:
            v55 = v107;
            if (v105 == v103)
            {
LABEL_86:

              v10 = v18;
LABEL_24:
              if (v113 == v116)
              {

                if (v15 != v16)
                {

                }
                if (v11 != v12)
                {

                }
LABEL_40:
                v9 = v117;
                v8 = v118;
                if (v6 == v7)
                {
LABEL_42:

                  goto LABEL_43;
                }
LABEL_41:

                goto LABEL_42;
              }
              goto LABEL_33;
            }
LABEL_85:

            goto LABEL_86;
          }
          v56 = (uint64_t)v101;
        }
        -[VUIMonogramDescription upscaleAdjustment](self, "upscaleAdjustment");
        v59 = v58;
        objc_msgSend(v5, "upscaleAdjustment");
        if (v59 != v60
          || (-[VUIMonogramDescription cornerRadius](self, "cornerRadius"),
              v62 = v61,
              objc_msgSend(v5, "cornerRadius"),
              v62 != v63))
        {
          v67 = (void *)v56;
          v18 = 0;
          v68 = (void *)v100;
          goto LABEL_82;
        }
        -[VUIMonogramDescription fillColor](self, "fillColor");
        v64 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "fillColor");
        v94 = objc_claimAutoreleasedReturnValue();
        v95 = (void *)v64;
        if (v64 != v94)
        {
          -[VUIMonogramDescription fillColor](self, "fillColor");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "fillColor");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          v91 = v65;
          if (!objc_msgSend(v65, "isEqual:"))
          {
            v66 = (void *)v94;
            v18 = 0;
            goto LABEL_80;
          }
        }
        -[VUIMonogramDescription gradientStartColor](self, "gradientStartColor");
        v69 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "gradientStartColor");
        v92 = objc_claimAutoreleasedReturnValue();
        v93 = (void *)v69;
        if (v69 != v92)
        {
          -[VUIMonogramDescription gradientStartColor](self, "gradientStartColor");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "gradientStartColor");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          v89 = v70;
          if (!objc_msgSend(v70, "isEqual:"))
          {
            v71 = (void *)v92;
            v18 = 0;
LABEL_78:

LABEL_79:
            v66 = (void *)v94;
            if (v95 == (void *)v94)
            {
LABEL_81:

              v68 = (void *)v100;
              v67 = v101;
LABEL_82:
              if (v67 == v68)
                goto LABEL_84;
              goto LABEL_83;
            }
LABEL_80:

            goto LABEL_81;
          }
        }
        -[VUIMonogramDescription gradientEndColor](self, "gradientEndColor");
        v72 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "gradientEndColor");
        v86 = objc_claimAutoreleasedReturnValue();
        v87 = (void *)v72;
        v108 = v4;
        if (v72 != v86)
        {
          -[VUIMonogramDescription gradientEndColor](self, "gradientEndColor");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "gradientEndColor");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          v85 = v73;
          if (!objc_msgSend(v73, "isEqual:"))
          {
            v18 = 0;
            v75 = (void *)v86;
            v74 = v87;
            goto LABEL_76;
          }
        }
        v76 = -[VUIMonogramDescription shouldFallBackToSilhouette](self, "shouldFallBackToSilhouette");
        if (v76 == objc_msgSend(v5, "shouldFallBackToSilhouette")
          && (-[VUIMonogramDescription borderWidth](self, "borderWidth"),
              v78 = v77,
              objc_msgSend(v5, "borderWidth"),
              v78 == v79))
        {
          -[VUIMonogramDescription borderColor](self, "borderColor");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "borderColor");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          if (v80 == v83)
          {

            v18 = 1;
            v75 = (void *)v86;
            v74 = v87;
            if (v87 == (void *)v86)
            {
LABEL_77:

              v71 = (void *)v92;
              v4 = v108;
              if (v93 == (void *)v92)
                goto LABEL_79;
              goto LABEL_78;
            }
LABEL_76:

            goto LABEL_77;
          }
          -[VUIMonogramDescription borderColor](self, "borderColor");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "borderColor");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v82, "isEqual:", v81);

        }
        else
        {
          v18 = 0;
        }
        v75 = (void *)v86;
        v74 = v87;
        if (v87 == (void *)v86)
          goto LABEL_77;
        goto LABEL_76;
      }
    }
    if (v19 == v116)
    {

      v18 = 0;
LABEL_35:
      if (v15 == v16)
      {
LABEL_37:

        if (v11 != v12)
        {

        }
        v10 = v18;
        goto LABEL_40;
      }
LABEL_36:

      goto LABEL_37;
    }
    v113 = v19;
    v18 = 0;
LABEL_33:

    goto LABEL_35;
  }
  v10 = 0;
LABEL_43:

  return v10;
}

- (CGPoint)specialOffsetForString:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  v4 = a3;
  v5 = *MEMORY[0x1E0C9D538];
  v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[VUIMonogramDescription specialOffsetByFirstLetter](self, "specialOffsetByFirstLetter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && objc_msgSend(v4, "length"))
  {
    objc_msgSend(v4, "substringToIndex:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "CGPointValue");
    v5 = v10;
    v6 = v11;

  }
  v12 = v5;
  v13 = v6;
  result.y = v13;
  result.x = v12;
  return result;
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

  -[VUIMonogramDescription lastName](self, "lastName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[VUIMonogramDescription firstName](self, "firstName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[VUIMonogramDescription firstName](self, "firstName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "hash");
LABEL_11:

      goto LABEL_12;
    }
    -[VUIMonogramDescription text](self, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[VUIMonogramDescription text](self, "text");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (id)objc_msgSend(v7, "hash");
    }
    else
    {
      -[VUIMonogramDescription imageURL](self, "imageURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[VUIMonogramDescription imageURL](self, "imageURL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v9, "hash");

        goto LABEL_10;
      }
      v11.receiver = self;
      v11.super_class = (Class)VUIMonogramDescription;
      v8 = -[VUIMonogramDescription hash](&v11, sel_hash);
    }
    v5 = (unint64_t)v8;
LABEL_10:

    goto LABEL_11;
  }
  -[VUIMonogramDescription lastName](self, "lastName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
LABEL_12:

  return v5;
}

- (unint64_t)preferedMonogramType
{
  void *v3;
  void *v4;
  char v5;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  -[VUIMonogramDescription imageURL](self, "imageURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

    goto LABEL_4;
  }
  if (!-[VUIMonogramDescription isUsingLibraryImageLoader](self, "isUsingLibraryImageLoader"))
  {
    -[VUIMonogramDescription firstName](self, "firstName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "length"))
    {
      -[VUIMonogramDescription lastName](self, "lastName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v10, "length"))
      {
        -[VUIMonogramDescription text](self, "text");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "length");

        if (!v12)
          return -[VUIMonogramDescription shouldFallBackToSilhouette](self, "shouldFallBackToSilhouette");
        return 2;
      }

    }
    return 2;
  }
LABEL_4:
  -[VUIMonogramDescription imageURL](self, "imageURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "vuicore_isResourceOrSymbolURL");

  if ((v5 & 1) != 0)
    return 3;
  -[VUIMonogramDescription imageURL](self, "imageURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[_VUIMonogramAppleAccountImageGenerator isAppleAccountsURL:](_VUIMonogramAppleAccountImageGenerator, "isAppleAccountsURL:", v7);

  if (v8)
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

- (CGSize)defaultImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_defaultImageSize.width;
  height = self->_defaultImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setDefaultImageSize:(CGSize)a3
{
  self->_defaultImageSize = a3;
}

- (NSDictionary)specialOffsetByFirstLetter
{
  return self->_specialOffsetByFirstLetter;
}

- (void)setSpecialOffsetByFirstLetter:(id)a3
{
  objc_storeStrong((id *)&self->_specialOffsetByFirstLetter, a3);
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

- (UIColor)gradientStartColor
{
  return self->_gradientStartColor;
}

- (void)setGradientStartColor:(id)a3
{
  objc_storeStrong((id *)&self->_gradientStartColor, a3);
}

- (UIColor)gradientEndColor
{
  return self->_gradientEndColor;
}

- (void)setGradientEndColor:(id)a3
{
  objc_storeStrong((id *)&self->_gradientEndColor, a3);
}

- (BOOL)shouldFallBackToSilhouette
{
  return self->_shouldFallBackToSilhouette;
}

- (void)setShouldFallBackToSilhouette:(BOOL)a3
{
  self->_shouldFallBackToSilhouette = a3;
}

- (BOOL)isUsingLibraryImageLoader
{
  return self->_isUsingLibraryImageLoader;
}

- (void)setIsUsingLibraryImageLoader:(BOOL)a3
{
  self->_isUsingLibraryImageLoader = a3;
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

- (VUINetworkRequestLoader)requestLoader
{
  return (VUINetworkRequestLoader *)objc_loadWeakRetained((id *)&self->_requestLoader);
}

- (void)setRequestLoader:(id)a3
{
  objc_storeWeak((id *)&self->_requestLoader, a3);
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (void)setPlaceholderImage:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderImage, a3);
}

- (BOOL)optimizedImageRendering
{
  return self->_optimizedImageRendering;
}

- (void)setOptimizedImageRendering:(BOOL)a3
{
  self->_optimizedImageRendering = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_destroyWeak((id *)&self->_requestLoader);
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_gradientEndColor, 0);
  objc_storeStrong((id *)&self->_gradientStartColor, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_specialOffsetByFirstLetter, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
}

@end

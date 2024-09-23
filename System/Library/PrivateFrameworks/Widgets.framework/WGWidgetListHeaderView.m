@implementation WGWidgetListHeaderView

- (WGWidgetListHeaderView)initWithContentView:(id)a3
{
  void *v3;
  void *v4;
  id v7;
  WGWidgetListHeaderView *v8;
  id *p_contentView;
  int v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t (*__ptr32 *v24)();
  int v25;
  int v26;
  int v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  WGWidgetListHeaderView *v47;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  int v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t (*__ptr32 *v61)();
  void *v62;
  void *v63;
  void *v64;
  int v65;
  int v66;
  void *v67;
  int v68;
  void *v69;
  int v70;
  int v71;
  int v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  void *v77;
  int v78;
  int v79;
  void *v80;
  int v81;
  int v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  int v89;
  void *v90;
  int v91;
  void *v92;
  void *v93;
  int v94;
  int v95;
  int v96;
  void *v97;
  id v98;
  objc_super v99;
  _QWORD v100[5];
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;

  v100[3] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v99.receiver = self;
  v99.super_class = (Class)WGWidgetListHeaderView;
  v8 = -[WGWidgetListHeaderView init](&v99, sel_init);

  if (!v8)
    goto LABEL_96;
  v98 = v7;
  p_contentView = (id *)&v8->_contentView;
  objc_storeStrong((id *)&v8->_contentView, a3);
  v10 = -[WGWidgetListHeaderView _shouldReverseLayoutDirection](v8, "_shouldReverseLayoutDirection");
  if (v10)
    v11 = 1.0;
  else
    v11 = 0.0;
  objc_msgSend(*p_contentView, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAnchorPoint:", v11, 0.5);

  objc_msgSend(*p_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[WGWidgetListHeaderView addSubview:](v8, "addSubview:", *p_contentView);
  objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = objc_msgSend(v97, "deviceClass");
  if (v96 == 2)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "_referenceBounds");
    if (CGRectGetHeight(v101) <= 1194.0)
    {
      v15 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "homeButtonType") == 2)
      {

        v14 = 0.5;
LABEL_86:

        goto LABEL_87;
      }
      v88 = v13;
      v15 = 1;
    }
  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = objc_msgSend(v16, "deviceClass");
  if (v95 == 2)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_referenceBounds");
    if (CGRectGetHeight(v102) <= 1024.0)
    {
      v94 = v10;
      v18 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "homeButtonType") == 2)
      {

        v14 = 8.0;
        if ((v15 & 1) == 0)
          goto LABEL_85;
LABEL_84:

        goto LABEL_85;
      }
      v87 = v17;
      v94 = v10;
      v18 = 1;
    }
  }
  else
  {
    v94 = v10;
    v18 = 0;
  }
  objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "deviceClass");
  v21 = v20;
  if ((_DWORD)v20 == 2)
  {
    v4 = (void *)v20;
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_referenceBounds");
    if (CGRectGetHeight(v103) > 1194.0)
    {

      v14 = 0.5;
      if ((v18 & 1) == 0)
        goto LABEL_81;
LABEL_80:

      goto LABEL_81;
    }
    v86 = v22;
    v21 = (int)v4;
  }
  objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = objc_msgSend(v93, "deviceClass");
  if (v91 != 2)
  {
LABEL_32:
    objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = objc_msgSend(v90, "deviceClass");
    if (v89 == 2)
    {
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_referenceBounds");
      if (CGRectGetHeight(v105) > 1024.0)
      {

        if (v91 == 2)
        if (v21 == 2)

        v14 = 2.5;
        if ((v18 & 1) != 0)
          goto LABEL_80;
        goto LABEL_81;
      }
      v75 = v4;
    }
    v4 = v3;
    objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "deviceClass") == 2)
    {
LABEL_73:

      if (v89 == 2)
      v3 = v4;
      if (v91 == 2)

      if (v21 == 2)
      v14 = 0.0;
      if (v18)
        goto LABEL_80;
      goto LABEL_81;
    }
    v84 = v23;
    v79 = v18;
    v80 = v4;
    v81 = v15;
    objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = &off_21732B000;
    v82 = objc_msgSend(v83, "deviceClass");
    if (!v82
      || (objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance"),
          v74 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v74, "deviceClass") == 1))
    {
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "_referenceBounds");
      if (CGRectGetHeight(v106) <= 812.0)
      {
        v26 = 0;
        v25 = 1;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v59, "homeButtonType") == 2 && _BSUI_Private_IsN84())
        {

          if (v82)
          v15 = v81;
          v3 = v4;
          if (v89 == 2)

          if (v91 == 2)
          if (v21 == 2)

          v14 = 0.0;
          if ((v18 & 1) != 0)
            goto LABEL_80;
          goto LABEL_81;
        }
        v25 = 1;
        v26 = 1;
      }
    }
    else
    {
      v25 = 0;
      v26 = 0;
    }
    objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v77, "deviceClass");
    v78 = v26;
    if (!v76
      || (objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance"),
          v69 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v69, "deviceClass") == 1))
    {
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "_referenceBounds");
      if (CGRectGetHeight(v107) <= 812.0)
      {
        v72 = 0;
        v70 = 1;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
        v24 = (uint64_t (*__ptr32 *)())objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "homeButtonType") == 2)
        {
          v27 = v25;

          if (v76)
          v15 = v81;
          v4 = v80;
          if ((v78 & 1) != 0)
          {
LABEL_112:

            if ((v27 & 1) == 0)
              goto LABEL_70;
            goto LABEL_69;
          }
LABEL_68:
          if (!v27)
          {
LABEL_70:
            if (v82)

            v23 = v84;
            goto LABEL_73;
          }
LABEL_69:

          goto LABEL_70;
        }
        v70 = 1;
        v72 = 1;
      }
    }
    else
    {
      v70 = 0;
      v72 = 0;
    }
    objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v73, "deviceClass");
    v61 = v24;
    if (!v71
      || (objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance"),
          v63 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v63, "deviceClass") == 1))
    {
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "_referenceBounds");
      if (CGRectGetHeight(v108) <= 736.0)
      {
        v68 = 0;
        v65 = 1;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v49, "homeButtonType") == 2)
        {
          v27 = v25;

          if (v71)
          v15 = v81;
          v4 = v80;
          v18 = v79;
          if ((v72 & 1) != 0)
          {
LABEL_140:

            if ((v70 & 1) == 0)
            {
LABEL_109:
              if (v76)

              if (v78)
                goto LABEL_112;
              goto LABEL_68;
            }
LABEL_108:

            goto LABEL_109;
          }
LABEL_107:
          if (!v70)
            goto LABEL_109;
          goto LABEL_108;
        }
        v53 = v49;
        v65 = 1;
        v68 = 1;
      }
    }
    else
    {
      v65 = 0;
      v68 = 0;
    }
    objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v67, "deviceClass");
    if (!v66
      || (objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance"),
          v55 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v55, "deviceClass") == 1))
    {
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "_referenceBounds");
      if (CGRectGetHeight(v109) > 667.0)
      {
        v27 = v25;
        v15 = v81;
        v4 = v80;
        v18 = v79;
LABEL_127:

        goto LABEL_130;
      }
      v56 = 1;
      v57 = v21;
    }
    else
    {
      v56 = 0;
      v57 = v21;
    }
    objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "deviceClass");
    if (v51
      && (objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance"),
          v54 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v54, "deviceClass") != 1)
      || (objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"),
          v52 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v52, "_referenceBounds"),
          CGRectGetHeight(v110),
          v52,
          v51))
    {
      v27 = v25;

      if ((v56 & 1) != 0)
      {
LABEL_126:
        v15 = v81;
        v4 = v80;
        v18 = v79;
        v21 = v57;
        goto LABEL_127;
      }
    }
    else
    {
      v27 = v25;

      if (v56)
        goto LABEL_126;
    }
    v15 = v81;
    v4 = v80;
    v18 = v79;
    v21 = v57;
LABEL_130:
    if (v66)

    if (v68)
    {

      if ((v65 & 1) == 0)
      {
LABEL_137:
        if (v71)

        if (v72)
          goto LABEL_140;
        goto LABEL_107;
      }
    }
    else if (!v65)
    {
      goto LABEL_137;
    }

    goto LABEL_137;
  }
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_referenceBounds");
  if (CGRectGetHeight(v104) <= 1080.0)
  {
    v85 = v4;
    goto LABEL_32;
  }

  if (v21 == 2)
  v14 = 8.0;
  if ((v18 & 1) != 0)
    goto LABEL_80;
LABEL_81:
  v10 = v94;
  if (v95 == 2)

  if (v15)
    goto LABEL_84;
LABEL_85:
  if (v96 == 2)
    goto LABEL_86;
LABEL_87:

  objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "deviceClass");
  if (v29)
  {
    objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "deviceClass") != 1)
    {
      objc_msgSend(*p_contentView, "layoutMarginsGuide");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "topAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[WGWidgetListHeaderView topAnchor](v8, "topAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, v14);
      v33 = (id)objc_claimAutoreleasedReturnValue();

LABEL_91:
      goto LABEL_92;
    }
  }
  objc_msgSend(*p_contentView, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGWidgetListHeaderView topAnchor](v8, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v35);
  v33 = (id)objc_claimAutoreleasedReturnValue();

  if (v29)
    goto LABEL_91;
LABEL_92:

  objc_msgSend(*p_contentView, "layoutMargins");
  if (v10)
    v38 = v37;
  else
    v38 = v36;
  v39 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(*p_contentView, "centerXAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGWidgetListHeaderView leadingAnchor](v8, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:constant:", v41, v38);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v100[0] = v42;
  v100[1] = v33;
  -[WGWidgetListHeaderView bottomAnchor](v8, "bottomAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*p_contentView, "bottomAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v100[2] = v45;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v100, 3);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "activateConstraints:", v46);

  v7 = v98;
LABEL_96:
  v47 = v8;

  return v47;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end

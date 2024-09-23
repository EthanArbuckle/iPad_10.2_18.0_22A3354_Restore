@implementation TSKCenterTilingButton

- (TSKCenterTilingButton)initWithFrame:(CGRect)a3
{
  return -[TSKCenterTilingButton initWithFrame:andTilingType:](self, "initWithFrame:andTilingType:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (TSKCenterTilingButton)initWithFrame:(CGRect)a3 andTilingType:(int)a4
{
  TSKCenterTilingButton *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSKCenterTilingButton;
  result = -[TSKCenterTilingButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->mTilingType = a4;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  self->mLeftCapImage_Normal = 0;
  self->mLeftCapImage_Disabled = 0;

  self->mLeftCapImage_Active = 0;
  self->mLeftCapImage_Selected = 0;

  self->mLeftCapImage_ActiveSelected = 0;
  self->mRightCapImage_Normal = 0;

  self->mRightCapImage_Disabled = 0;
  self->mRightCapImage_Active = 0;

  self->mRightCapImage_Selected = 0;
  self->mRightCapImage_ActiveSelected = 0;

  self->mCenterTileImage_Normal = 0;
  self->mCenterTileImage_Disabled = 0;

  self->mCenterTileImage_Active = 0;
  self->mCenterTileImage_Selected = 0;

  self->mCenterTileImage_ActiveSelected = 0;
  self->mLeftCenterTileImage_Normal = 0;

  self->mLeftCenterTileImage_Disabled = 0;
  self->mLeftCenterTileImage_Active = 0;

  self->mLeftCenterTileImage_Selected = 0;
  self->mLeftCenterTileImage_ActiveSelected = 0;

  self->mRightCenterTileImage_Normal = 0;
  self->mRightCenterTileImage_Disabled = 0;

  self->mRightCenterTileImage_Active = 0;
  self->mRightCenterTileImage_Selected = 0;

  self->mRightCenterTileImage_ActiveSelected = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSKCenterTilingButton;
  -[TSKCenterTilingButton dealloc](&v3, sel_dealloc);
}

- (id)leftCapImageForState:(unint64_t)a3
{
  UIImage *mLeftCapImage_Disabled;
  unint64_t v4;
  uint64_t v5;

  if ((a3 & 2) != 0)
  {
    mLeftCapImage_Disabled = self->mLeftCapImage_Disabled;
    if (mLeftCapImage_Disabled)
      return mLeftCapImage_Disabled;
  }
  v4 = a3 & 5;
  switch(v4)
  {
    case 5uLL:
      mLeftCapImage_Disabled = self->mLeftCapImage_ActiveSelected;
      if (mLeftCapImage_Disabled)
        return mLeftCapImage_Disabled;
      mLeftCapImage_Disabled = self->mLeftCapImage_Active;
      if (mLeftCapImage_Disabled)
        return mLeftCapImage_Disabled;
      break;
    case 4uLL:
      break;
    case 1uLL:
      v5 = 768;
      goto LABEL_10;
    default:
      return self->mLeftCapImage_Normal;
  }
  v5 = 776;
LABEL_10:
  mLeftCapImage_Disabled = *(UIImage **)((char *)&self->super.super.super.super.super.isa + v5);
  if (!mLeftCapImage_Disabled)
    return self->mLeftCapImage_Normal;
  return mLeftCapImage_Disabled;
}

- (id)rightCapImageForState:(unint64_t)a3
{
  UIImage *mRightCapImage_Disabled;
  unint64_t v4;
  uint64_t v5;

  if ((a3 & 2) != 0)
  {
    mRightCapImage_Disabled = self->mRightCapImage_Disabled;
    if (mRightCapImage_Disabled)
      return mRightCapImage_Disabled;
  }
  v4 = a3 & 5;
  switch(v4)
  {
    case 5uLL:
      mRightCapImage_Disabled = self->mRightCapImage_ActiveSelected;
      if (mRightCapImage_Disabled)
        return mRightCapImage_Disabled;
      mRightCapImage_Disabled = self->mRightCapImage_Active;
      if (mRightCapImage_Disabled)
        return mRightCapImage_Disabled;
      break;
    case 4uLL:
      break;
    case 1uLL:
      v5 = 808;
      goto LABEL_10;
    default:
      return self->mRightCapImage_Normal;
  }
  v5 = 816;
LABEL_10:
  mRightCapImage_Disabled = *(UIImage **)((char *)&self->super.super.super.super.super.isa + v5);
  if (!mRightCapImage_Disabled)
    return self->mRightCapImage_Normal;
  return mRightCapImage_Disabled;
}

- (id)centerTileImageForState:(unint64_t)a3
{
  UIImage *mCenterTileImage_Disabled;
  unint64_t v4;
  uint64_t v5;

  if ((a3 & 2) != 0)
  {
    mCenterTileImage_Disabled = self->mCenterTileImage_Disabled;
    if (mCenterTileImage_Disabled)
      return mCenterTileImage_Disabled;
  }
  v4 = a3 & 5;
  switch(v4)
  {
    case 5uLL:
      mCenterTileImage_Disabled = self->mCenterTileImage_ActiveSelected;
      if (mCenterTileImage_Disabled)
        return mCenterTileImage_Disabled;
      mCenterTileImage_Disabled = self->mCenterTileImage_Active;
      if (mCenterTileImage_Disabled)
        return mCenterTileImage_Disabled;
      break;
    case 4uLL:
      break;
    case 1uLL:
      v5 = 848;
      goto LABEL_10;
    default:
      return self->mCenterTileImage_Normal;
  }
  v5 = 856;
LABEL_10:
  mCenterTileImage_Disabled = *(UIImage **)((char *)&self->super.super.super.super.super.isa + v5);
  if (!mCenterTileImage_Disabled)
    return self->mCenterTileImage_Normal;
  return mCenterTileImage_Disabled;
}

- (id)leftCenterTileImageForState:(unint64_t)a3
{
  UIImage *mLeftCenterTileImage_ActiveSelected;
  unint64_t v4;
  uint64_t v5;

  if (self->mTilingType != 3)
    return 0;
  if ((a3 & 2) == 0 || (mLeftCenterTileImage_ActiveSelected = self->mLeftCenterTileImage_Disabled) == 0)
  {
    v4 = a3 & 5;
    switch(v4)
    {
      case 5uLL:
        mLeftCenterTileImage_ActiveSelected = self->mLeftCenterTileImage_ActiveSelected;
        if (mLeftCenterTileImage_ActiveSelected)
          return mLeftCenterTileImage_ActiveSelected;
        mLeftCenterTileImage_ActiveSelected = self->mLeftCenterTileImage_Active;
        if (mLeftCenterTileImage_ActiveSelected)
          return mLeftCenterTileImage_ActiveSelected;
        break;
      case 4uLL:
        break;
      case 1uLL:
        v5 = 888;
        goto LABEL_12;
      default:
        return self->mLeftCenterTileImage_Normal;
    }
    v5 = 896;
LABEL_12:
    mLeftCenterTileImage_ActiveSelected = *(UIImage **)((char *)&self->super.super.super.super.super.isa + v5);
    if (!mLeftCenterTileImage_ActiveSelected)
      return self->mLeftCenterTileImage_Normal;
  }
  return mLeftCenterTileImage_ActiveSelected;
}

- (id)rightCenterTileImageForState:(unint64_t)a3
{
  UIImage *mRightCenterTileImage_ActiveSelected;
  unint64_t v4;
  uint64_t v5;

  if (self->mTilingType != 3)
    return 0;
  if ((a3 & 2) == 0 || (mRightCenterTileImage_ActiveSelected = self->mRightCenterTileImage_Disabled) == 0)
  {
    v4 = a3 & 5;
    switch(v4)
    {
      case 5uLL:
        mRightCenterTileImage_ActiveSelected = self->mRightCenterTileImage_ActiveSelected;
        if (mRightCenterTileImage_ActiveSelected)
          return mRightCenterTileImage_ActiveSelected;
        mRightCenterTileImage_ActiveSelected = self->mRightCenterTileImage_Active;
        if (mRightCenterTileImage_ActiveSelected)
          return mRightCenterTileImage_ActiveSelected;
        break;
      case 4uLL:
        break;
      case 1uLL:
        v5 = 928;
        goto LABEL_12;
      default:
        return self->mRightCenterTileImage_Normal;
    }
    v5 = 936;
LABEL_12:
    mRightCenterTileImage_ActiveSelected = *(UIImage **)((char *)&self->super.super.super.super.super.isa + v5);
    if (!mRightCenterTileImage_ActiveSelected)
      return self->mRightCenterTileImage_Normal;
  }
  return mRightCenterTileImage_ActiveSelected;
}

- (void)setLeftCapImage:(id)a3 forState:(unint64_t)a4
{
  unint64_t v7;
  int *v8;
  id v9;
  uint64_t v10;

  if ((a4 & 2) != 0)
  {
    v8 = &OBJC_IVAR___TSKCenterTilingButton_mLeftCapImage_Disabled;
  }
  else
  {
    v7 = (a4 & 5) - 1;
    if (v7 > 4)
      v8 = &OBJC_IVAR___TSKCenterTilingButton_mLeftCapImage_Normal;
    else
      v8 = off_24D82AA78[v7];
  }
  v9 = a3;
  v10 = *v8;

  *(Class *)((char *)&self->super.super.super.super.super.isa + v10) = (Class)a3;
  -[TSKCenterTilingButton p_resetBackgroundImageForState:](self, "p_resetBackgroundImageForState:", a4);
}

- (void)setRightCapImage:(id)a3 forState:(unint64_t)a4
{
  unint64_t v7;
  int *v8;
  id v9;
  uint64_t v10;

  if ((a4 & 2) != 0)
  {
    v8 = &OBJC_IVAR___TSKCenterTilingButton_mRightCapImage_Disabled;
  }
  else
  {
    v7 = (a4 & 5) - 1;
    if (v7 > 4)
      v8 = &OBJC_IVAR___TSKCenterTilingButton_mRightCapImage_Normal;
    else
      v8 = off_24D82AAA0[v7];
  }
  v9 = a3;
  v10 = *v8;

  *(Class *)((char *)&self->super.super.super.super.super.isa + v10) = (Class)a3;
  -[TSKCenterTilingButton p_resetBackgroundImageForState:](self, "p_resetBackgroundImageForState:", a4);
}

- (void)setCenterTileImage:(id)a3 forState:(unint64_t)a4
{
  unint64_t v7;
  int *v8;
  id v9;
  uint64_t v10;

  if ((a4 & 2) != 0)
  {
    v8 = &OBJC_IVAR___TSKCenterTilingButton_mCenterTileImage_Disabled;
  }
  else
  {
    v7 = (a4 & 5) - 1;
    if (v7 > 4)
      v8 = &OBJC_IVAR___TSKCenterTilingButton_mCenterTileImage_Normal;
    else
      v8 = off_24D82AAC8[v7];
  }
  v9 = a3;
  v10 = *v8;

  *(Class *)((char *)&self->super.super.super.super.super.isa + v10) = (Class)a3;
  -[TSKCenterTilingButton p_resetBackgroundImageForState:](self, "p_resetBackgroundImageForState:", a4);
}

- (void)setLeftCenterTileImage:(id)a3 forState:(unint64_t)a4
{
  unint64_t v7;
  int *v8;
  id v9;
  uint64_t v10;

  if ((a4 & 2) != 0)
  {
    v8 = &OBJC_IVAR___TSKCenterTilingButton_mLeftCenterTileImage_Disabled;
  }
  else
  {
    v7 = (a4 & 5) - 1;
    if (v7 > 4)
      v8 = &OBJC_IVAR___TSKCenterTilingButton_mLeftCenterTileImage_Normal;
    else
      v8 = off_24D82AAF0[v7];
  }
  v9 = a3;
  v10 = *v8;

  *(Class *)((char *)&self->super.super.super.super.super.isa + v10) = (Class)a3;
  -[TSKCenterTilingButton p_resetBackgroundImageForState:](self, "p_resetBackgroundImageForState:", a4);
}

- (void)setRightCenterTileImage:(id)a3 forState:(unint64_t)a4
{
  unint64_t v7;
  int *v8;
  id v9;
  uint64_t v10;

  if ((a4 & 2) != 0)
  {
    v8 = &OBJC_IVAR___TSKCenterTilingButton_mRightCenterTileImage_Disabled;
  }
  else
  {
    v7 = (a4 & 5) - 1;
    if (v7 > 4)
      v8 = &OBJC_IVAR___TSKCenterTilingButton_mRightCenterTileImage_Normal;
    else
      v8 = off_24D82AB18[v7];
  }
  v9 = a3;
  v10 = *v8;

  *(Class *)((char *)&self->super.super.super.super.super.isa + v10) = (Class)a3;
  -[TSKCenterTilingButton p_resetBackgroundImageForState:](self, "p_resetBackgroundImageForState:", a4);
}

- (void)p_resetBackgroundImageForState:(unint64_t)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _BOOL4 v18;
  double v19;
  double v20;
  double v21;
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
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CGFloat v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  void *v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  CGFloat v101;
  CGFloat v102;
  double v103;
  int mTilingType;
  TSKCenterTilingButton *v105;
  id v106;
  id v107;
  double v108;
  double v109;
  double v110;
  UIImage *ImageFromCurrentImageContext;
  CGSize v112;

  v5 = -[TSKCenterTilingButton leftCapImageForState:](self, "leftCapImageForState:");
  v6 = -[TSKCenterTilingButton rightCapImageForState:](self, "rightCapImageForState:", a3);
  v7 = -[TSKCenterTilingButton centerTileImageForState:](self, "centerTileImageForState:", a3);
  v8 = -[TSKCenterTilingButton leftCenterTileImageForState:](self, "leftCenterTileImageForState:", a3);
  v9 = -[TSKCenterTilingButton rightCenterTileImageForState:](self, "rightCenterTileImageForState:", a3);
  v10 = 1.0;
  v11 = 1.0;
  if (v5)
  {
    objc_msgSend(v5, "scale");
    v11 = v12;
  }
  if (v6)
  {
    objc_msgSend(v6, "scale");
    v10 = v13;
  }
  if (v9)
  {
    objc_msgSend(v9, "scale");
    v15 = v14;
    if (v8)
      goto LABEL_7;
LABEL_12:
    if (v7)
    {
      objc_msgSend(v7, "scale");
      if (v23 >= 1.0)
      {
        objc_msgSend(v7, "scale");
        if (v15 > v29)
          goto LABEL_15;
      }
      else if (v15 > 1.0)
      {
        goto LABEL_15;
      }
      objc_msgSend(v7, "scale");
      v31 = v30;
      v27 = 1.0;
      if (v31 < 1.0)
      {
LABEL_29:
        v18 = 0;
        goto LABEL_37;
      }
LABEL_28:
      objc_msgSend(v7, "scale");
      goto LABEL_29;
    }
    v27 = 1.0;
    v18 = 1;
    if (v15 <= 1.0)
      goto LABEL_37;
    goto LABEL_23;
  }
  v15 = 1.0;
  if (!v8)
    goto LABEL_12;
LABEL_7:
  objc_msgSend(v8, "scale");
  v17 = v16;
  v18 = v7 == 0;
  if (v7)
  {
    objc_msgSend(v7, "scale");
    if (v17 <= v19)
    {
      objc_msgSend(v7, "scale");
      if (v15 <= v20)
      {
        objc_msgSend(v8, "scale");
        v22 = v21;
        goto LABEL_20;
      }
LABEL_15:
      v18 = 0;
      if (!v9)
      {
LABEL_32:
        v32 = 1.0;
        if (v10 > 1.0)
          goto LABEL_38;
LABEL_43:
        if (v8)
          goto LABEL_44;
        goto LABEL_56;
      }
LABEL_24:
      objc_msgSend(v9, "scale");
      if (v10 > v28)
        goto LABEL_38;
LABEL_42:
      objc_msgSend(v9, "scale");
      v32 = v35;
      goto LABEL_43;
    }
  }
  else if (v16 <= 1.0)
  {
    if (v15 > 1.0)
    {
      v18 = 1;
      if (!v9)
        goto LABEL_32;
      goto LABEL_24;
    }
    objc_msgSend(v8, "scale");
    v22 = v33;
LABEL_35:
    v27 = 1.0;
    v18 = 1;
    if (v22 <= 1.0)
      goto LABEL_37;
    goto LABEL_36;
  }
  objc_msgSend(v8, "scale");
  if (v15 > v24)
  {
LABEL_23:
    if (!v9)
      goto LABEL_32;
    goto LABEL_24;
  }
  objc_msgSend(v8, "scale");
  v22 = v25;
  if (!v7)
    goto LABEL_35;
LABEL_20:
  objc_msgSend(v7, "scale");
  if (v22 <= v26)
    goto LABEL_28;
  v18 = 0;
LABEL_36:
  objc_msgSend(v8, "scale");
LABEL_37:
  if (v10 > v27)
  {
LABEL_38:
    if (v6)
    {
      objc_msgSend(v6, "scale");
      if (v11 <= v34)
      {
LABEL_78:
        objc_msgSend(v6, "scale");
        v40 = v55;
        goto LABEL_79;
      }
    }
    else
    {
      v40 = 1.0;
      if (v11 <= 1.0)
      {
LABEL_79:
        if (v9)
          goto LABEL_80;
        goto LABEL_93;
      }
    }
    goto LABEL_75;
  }
  if (v9)
    goto LABEL_42;
  v32 = 1.0;
  if (v8)
  {
LABEL_44:
    objc_msgSend(v8, "scale");
    v37 = v36;
    if (v18)
    {
      if (v36 <= 1.0)
      {
        if (v32 <= 1.0)
        {
          objc_msgSend(v8, "scale");
          v39 = v38;
          goto LABEL_53;
        }
        goto LABEL_68;
      }
    }
    else
    {
      objc_msgSend(v7, "scale");
      if (v37 <= v41)
      {
        objc_msgSend(v7, "scale");
        if (v32 <= v46)
        {
          objc_msgSend(v8, "scale");
          v39 = v47;
LABEL_65:
          objc_msgSend(v7, "scale");
          if (v39 > v48)
          {
LABEL_66:
            v49 = v8;
LABEL_73:
            objc_msgSend(v49, "scale");
            goto LABEL_74;
          }
LABEL_72:
          v49 = v7;
          goto LABEL_73;
        }
LABEL_68:
        if (!v9)
        {
          v44 = 1.0;
          goto LABEL_74;
        }
        goto LABEL_69;
      }
    }
    objc_msgSend(v8, "scale");
    if (v32 <= v42)
    {
      objc_msgSend(v8, "scale");
      v39 = v43;
      if (v18)
      {
LABEL_53:
        v44 = 1.0;
        if (v39 <= 1.0)
          goto LABEL_74;
        goto LABEL_66;
      }
      goto LABEL_65;
    }
    goto LABEL_68;
  }
LABEL_56:
  if (!v18)
  {
    objc_msgSend(v7, "scale");
    if (v45 >= 1.0)
    {
      objc_msgSend(v7, "scale");
      if (v32 > v50)
        goto LABEL_68;
    }
    else if (v32 > 1.0)
    {
      goto LABEL_68;
    }
    objc_msgSend(v7, "scale");
    v52 = v51;
    v44 = 1.0;
    if (v52 < 1.0)
      goto LABEL_74;
    goto LABEL_72;
  }
  v44 = 1.0;
  if (v9 && v32 > 1.0)
  {
LABEL_69:
    v49 = v9;
    goto LABEL_73;
  }
LABEL_74:
  if (v11 <= v44)
  {
    if (!v6)
    {
      v40 = 1.0;
      if (v9)
      {
LABEL_80:
        objc_msgSend(v9, "scale");
        v57 = v56;
        if (v8)
          goto LABEL_81;
        goto LABEL_94;
      }
LABEL_93:
      v57 = 1.0;
      if (v8)
      {
LABEL_81:
        objc_msgSend(v8, "scale");
        v59 = v58;
        if (v18)
        {
          if (v58 <= 1.0)
          {
            if (v57 <= 1.0)
            {
              objc_msgSend(v8, "scale");
              v61 = v60;
              goto LABEL_90;
            }
LABEL_105:
            if (!v9)
            {
              v74 = 1.0;
              if (v40 > 1.0)
                goto LABEL_114;
LABEL_118:
              if (v8)
                goto LABEL_119;
              goto LABEL_129;
            }
            objc_msgSend(v9, "scale");
            if (v40 > v73)
              goto LABEL_114;
LABEL_117:
            objc_msgSend(v9, "scale");
            v74 = v78;
            goto LABEL_118;
          }
        }
        else
        {
          objc_msgSend(v7, "scale");
          if (v59 <= v63)
          {
            objc_msgSend(v7, "scale");
            if (v57 > v68)
              goto LABEL_105;
            objc_msgSend(v8, "scale");
            v61 = v69;
LABEL_102:
            objc_msgSend(v7, "scale");
            if (v61 > v70)
            {
LABEL_103:
              v71 = v8;
LABEL_112:
              objc_msgSend(v71, "scale");
              goto LABEL_113;
            }
            goto LABEL_111;
          }
        }
        objc_msgSend(v8, "scale");
        if (v57 > v64)
          goto LABEL_105;
        objc_msgSend(v8, "scale");
        v61 = v65;
        if (v18)
        {
LABEL_90:
          v66 = 1.0;
          if (v61 <= 1.0)
            goto LABEL_113;
          goto LABEL_103;
        }
        goto LABEL_102;
      }
LABEL_94:
      if (v18)
      {
        v66 = 1.0;
        if (v57 <= 1.0)
        {
LABEL_113:
          if (v40 > v66)
          {
LABEL_114:
            if (v6)
            {
              v77 = v6;
LABEL_146:
              objc_msgSend(v77, "scale");
              v54 = v92;
              goto LABEL_147;
            }
LABEL_143:
            v54 = 1.0;
            goto LABEL_147;
          }
          if (!v9)
          {
            v74 = 1.0;
            if (v8)
            {
LABEL_119:
              objc_msgSend(v8, "scale");
              v80 = v79;
              if (v18)
              {
                if (v79 <= 1.0)
                {
                  if (v74 <= 1.0)
                  {
                    objc_msgSend(v8, "scale");
                    v82 = v81;
                    goto LABEL_126;
                  }
                  goto LABEL_141;
                }
              }
              else
              {
                objc_msgSend(v7, "scale");
                if (v80 <= v83)
                {
                  objc_msgSend(v7, "scale");
                  if (v74 <= v87)
                  {
                    objc_msgSend(v8, "scale");
                    v82 = v88;
LABEL_138:
                    objc_msgSend(v7, "scale");
                    if (v82 > v89)
                      goto LABEL_139;
LABEL_145:
                    v77 = v7;
                    goto LABEL_146;
                  }
LABEL_141:
                  if (!v9)
                    goto LABEL_143;
                  goto LABEL_142;
                }
              }
              objc_msgSend(v8, "scale");
              if (v74 <= v84)
              {
                objc_msgSend(v8, "scale");
                v82 = v85;
                if (v18)
                {
LABEL_126:
                  v54 = 1.0;
                  if (v82 <= 1.0)
                    goto LABEL_147;
LABEL_139:
                  v77 = v8;
                  goto LABEL_146;
                }
                goto LABEL_138;
              }
              goto LABEL_141;
            }
LABEL_129:
            if (v18)
            {
              v54 = 1.0;
              if (!v9 || v74 <= 1.0)
              {
LABEL_147:
                if (!v5)
                {
                  v62 = 0.0;
                  if (v6)
                    goto LABEL_149;
                  goto LABEL_151;
                }
                goto LABEL_148;
              }
LABEL_142:
              v77 = v9;
              goto LABEL_146;
            }
            objc_msgSend(v7, "scale");
            if (v86 >= 1.0)
            {
              objc_msgSend(v7, "scale");
              if (v74 > v90)
                goto LABEL_141;
            }
            else if (v74 > 1.0)
            {
              goto LABEL_141;
            }
            objc_msgSend(v7, "scale");
            v54 = 1.0;
            if (v91 < 1.0)
              goto LABEL_147;
            goto LABEL_145;
          }
          goto LABEL_117;
        }
        goto LABEL_105;
      }
      objc_msgSend(v7, "scale");
      if (v67 >= 1.0)
      {
        objc_msgSend(v7, "scale");
        if (v57 > v72)
          goto LABEL_105;
      }
      else if (v57 > 1.0)
      {
        goto LABEL_105;
      }
      objc_msgSend(v7, "scale");
      v76 = v75;
      v66 = 1.0;
      if (v76 < 1.0)
        goto LABEL_113;
LABEL_111:
      v71 = v7;
      goto LABEL_112;
    }
    goto LABEL_78;
  }
LABEL_75:
  if (v5)
  {
    objc_msgSend(v5, "scale");
    v54 = v53;
LABEL_148:
    objc_msgSend(v5, "size");
    v62 = v93;
    if (v6)
      goto LABEL_149;
    goto LABEL_151;
  }
  v62 = 0.0;
  v54 = 1.0;
  if (v6)
  {
LABEL_149:
    objc_msgSend(v6, "size");
    v95 = v94;
    goto LABEL_152;
  }
LABEL_151:
  v95 = 0.0;
LABEL_152:
  -[TSKCenterTilingButton bounds](self, "bounds");
  v97 = v96;
  v99 = v98;
  v100 = v62 + v95;
  -[TSKCenterTilingButton bounds](self, "bounds");
  v112.width = v101;
  v112.height = v102;
  UIGraphicsBeginImageContextWithOptions(v112, 0, v54);
  if (v5)
    objc_msgSend(v5, "drawAtPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  v103 = v97 - v100;
  mTilingType = self->mTilingType;
  if (v18)
  {
    if (v9 && v8 && mTilingType == 3)
    {
      v105 = self;
      v106 = v8;
      v107 = v9;
      goto LABEL_165;
    }
  }
  else
  {
    v105 = self;
    if (mTilingType == 3)
    {
      v106 = v7;
      v107 = v7;
LABEL_165:
      -[TSKCenterTilingButton p_tileHorizCenterOutwardwithLeft:andRight:inRect:](v105, "p_tileHorizCenterOutwardwithLeft:andRight:inRect:", v106, v107, v62, 0.0, v103, v99);
      if (!v6)
        goto LABEL_170;
      goto LABEL_169;
    }
    if (mTilingType != 2)
    {
      if (mTilingType == 1)
      {
        -[TSKCenterTilingButton p_tileButtedToCapLtoR:inRect:](self, "p_tileButtedToCapLtoR:inRect:", v7, v62, 0.0, v103, v99);
        if (!v6)
          goto LABEL_170;
      }
      else
      {
        -[TSKCenterTilingButton p_tileSimple:inRect:](self, "p_tileSimple:inRect:", v7, v62, 0.0, v103, v99);
        if (!v6)
          goto LABEL_170;
      }
      goto LABEL_169;
    }
    -[TSKCenterTilingButton p_tileButtedToCapRtoL:inRect:](self, "p_tileButtedToCapRtoL:inRect:", v7, v62, 0.0, v103, v99);
  }
  if (v6)
  {
LABEL_169:
    -[TSKCenterTilingButton bounds](self, "bounds");
    v109 = v108;
    objc_msgSend(v6, "size");
    objc_msgSend(v6, "drawAtPoint:", v109 - v110, 0.0);
  }
LABEL_170:
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  -[TSKCenterTilingButton setBackgroundImage:forState:](self, "setBackgroundImage:forState:", ImageFromCurrentImageContext, a3);
}

- (void)p_tileSimple:(id)a3 inRect:(CGRect)a4
{
  if (a3)
    objc_msgSend(a3, "drawAsPatternInRect:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (void)p_tileButtedToCapLtoR:(id)a3 inRect:(CGRect)a4
{
  CGFloat height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  CGContext *CurrentContext;
  double v12;
  CGRect rects;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    height = a4.size.height;
    width = a4.size.width;
    y = a4.origin.y;
    x = a4.origin.x;
    objc_msgSend(a3, "size");
    v10 = v9;
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    rects.origin.x = x;
    rects.origin.y = y;
    rects.size.width = width;
    rects.size.height = height;
    CGContextClipToRects(CurrentContext, &rects, 1uLL);
    v12 = x + width;
    while (x < v12)
    {
      objc_msgSend(a3, "drawAtPoint:", x, y);
      x = v10 + x;
    }
    CGContextRestoreGState(CurrentContext);
  }
}

- (void)p_tileButtedToCapRtoL:(id)a3 inRect:(CGRect)a4
{
  CGFloat height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  double v12;
  CGContext *CurrentContext;
  double v14;
  CGRect rects;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    height = a4.size.height;
    width = a4.size.width;
    y = a4.origin.y;
    x = a4.origin.x;
    objc_msgSend(a3, "size");
    v10 = v9;
    objc_msgSend(a3, "size");
    v12 = x + width - v11;
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    rects.origin.x = x;
    rects.origin.y = y;
    rects.size.width = width;
    rects.size.height = height;
    CGContextClipToRects(CurrentContext, &rects, 1uLL);
    while (1)
    {
      objc_msgSend(a3, "size");
      if (v12 <= x - v14)
        break;
      objc_msgSend(a3, "drawAtPoint:", v12, y);
      v12 = v12 - v10;
    }
    CGContextRestoreGState(CurrentContext);
  }
}

- (void)p_tileHorizCenterOutwardwithLeft:(id)a3 andRight:(id)a4 inRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  double v12;
  double v13;
  double v14;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  -[TSKCenterTilingButton bounds](self, "bounds");
  v13 = round(v12 * 0.5);
  v14 = v13 - x;
  -[TSKCenterTilingButton p_tileButtedToCapLtoR:inRect:](self, "p_tileButtedToCapLtoR:inRect:", a4, v13, y, x + width - v13, height);
  -[TSKCenterTilingButton p_tileButtedToCapRtoL:inRect:](self, "p_tileButtedToCapRtoL:inRect:", a3, x, y, v14, height);
}

@end

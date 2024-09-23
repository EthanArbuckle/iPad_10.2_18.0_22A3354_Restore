@implementation ODILinear

+ (BOOL)mapIdentifier:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  ODIAccentedImageLinear *v10;
  double v11;
  void *v12;
  int v13;
  BOOL v14;
  double v15;
  void *v16;
  int v17;
  double v18;
  void *v19;
  int v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  int v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  int v32;
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
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "hasPrefix:", CFSTR("process")))
  {
    objc_msgSend(v6, "substringFromIndex:", objc_msgSend(CFSTR("process"), "length"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "intValue");

    switch(v9)
    {
      case 1:
      case 3:
        v10 = (ODIAccentedImageLinear *)objc_msgSend(objc_alloc((Class)a1), "initWithState:", v7);
        -[ODILinear setWithConnectors:](v10, "setWithConnectors:", 1);
        LODWORD(v11) = 0.75;
        -[ODILinear setPointHeight:](v10, "setPointHeight:", v11);
        goto LABEL_45;
      case 2:
        v10 = (ODIAccentedImageLinear *)objc_msgSend(objc_alloc((Class)a1), "initWithState:", v7);
        -[ODILinear setIsHorizontal:](v10, "setIsHorizontal:", 0);
        -[ODILinear setWithConnectors:](v10, "setWithConnectors:", 1);
        LODWORD(v22) = 1057971241;
        -[ODILinear setPointHeight:](v10, "setPointHeight:", v22);
        LODWORD(v23) = 1025758986;
        -[ODILinear setPadding:](v10, "setPadding:", v23);
        goto LABEL_45;
      case 4:
        v10 = -[ODILinear initWithState:]([ODIVerticalProcess2 alloc], "initWithState:", v7);
        -[ODILinear setIsHorizontal:](v10, "setIsHorizontal:", 0);
        -[ODILinear setStretch:](v10, "setStretch:", 1);
        -[ODILinear setWithConnectors:](v10, "setWithConnectors:", 1);
        LODWORD(v24) = 0;
        -[ODILinear setPadding:](v10, "setPadding:", v24);
        LODWORD(v25) = 1031127695;
        -[ODILinear setConnectorWidth:](v10, "setConnectorWidth:", v25);
        goto LABEL_45;
      default:
        goto LABEL_69;
    }
  }
  if (!objc_msgSend(v6, "hasPrefix:", CFSTR("hProcess")))
  {
    if (objc_msgSend(v6, "hasPrefix:", CFSTR("hList")))
    {
      objc_msgSend(v6, "substringFromIndex:", objc_msgSend(CFSTR("hList"), "length"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "intValue");

      switch(v17)
      {
        case 2:
          v10 = -[ODIImageLinear initWithImagePresentationName:state:]([ODIImageLinear alloc], "initWithImagePresentationName:state:", CFSTR("image"), v7);
          -[ODILinear setStretch:](v10, "setStretch:", 1);
          objc_msgSend(v7, "setPresentationName:forPointType:", CFSTR("childNode"), 2);
          break;
        case 6:
          v10 = (ODIAccentedImageLinear *)objc_msgSend(objc_alloc((Class)a1), "initWithState:", v7);
          -[ODILinear setStretch:](v10, "setStretch:", 1);
          LODWORD(v38) = 1031127695;
          -[ODILinear setPadding:](v10, "setPadding:", v38);
          break;
        case 7:
          v10 = -[ODIImageLinear initWithImagePresentationName:state:]([ODIImageLinear alloc], "initWithImagePresentationName:state:", CFSTR("imagNode"), v7);
          -[ODILinear setStretch:](v10, "setStretch:", 1);
          LODWORD(v18) = 1025758986;
          -[ODILinear setPadding:](v10, "setPadding:", v18);
          -[ODILinear setIsTextCentered:](v10, "setIsTextCentered:", 1);
          objc_msgSend(v7, "setPresentationName:forPointType:", CFSTR("bkgdShape"), 2);
          break;
        default:
LABEL_69:
          v14 = 0;
          v10 = 0;
          goto LABEL_70;
      }
    }
    else
    {
      if (objc_msgSend(v6, "hasPrefix:", CFSTR("vList")))
      {
        objc_msgSend(v6, "substringFromIndex:", objc_msgSend(CFSTR("vList"), "length"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "intValue");

        switch(v20)
        {
          case 2:
          case 5:
          case 6:
            v10 = (ODIAccentedImageLinear *)objc_msgSend(objc_alloc((Class)a1), "initWithState:", v7);
            -[ODILinear setIsHorizontal:](v10, "setIsHorizontal:", 0);
            -[ODILinear setStretch:](v10, "setStretch:", 1);
            LODWORD(v21) = 1017370378;
            -[ODILinear setPadding:](v10, "setPadding:", v21);
            goto LABEL_45;
          case 3:
            v10 = -[ODIImageLinear initWithImagePresentationName:state:]([ODIImageLinear alloc], "initWithImagePresentationName:state:", CFSTR("imgShp"), v7);
            -[ODILinear setIsHorizontal:](v10, "setIsHorizontal:", 0);
            -[ODILinear setStretch:](v10, "setStretch:", 1);
            LODWORD(v40) = 1017370378;
            -[ODILinear setPadding:](v10, "setPadding:", v40);
            objc_msgSend(v7, "setPresentationName:forPointType:", CFSTR("txShp"), 2);
            goto LABEL_45;
          case 4:
            v10 = -[ODIImageLinear initWithImagePresentationName:state:]([ODIImageLinear alloc], "initWithImagePresentationName:state:", CFSTR("img"), v7);
            -[ODILinear setIsHorizontal:](v10, "setIsHorizontal:", 0);
            -[ODILinear setStretch:](v10, "setStretch:", 1);
            LODWORD(v41) = 1017370378;
            -[ODILinear setPadding:](v10, "setPadding:", v41);
            objc_msgSend(v7, "setPresentationName:forPointType:", CFSTR("box"), 2);
            goto LABEL_45;
          case 7:
            v10 = -[ODIImageLinear initWithImagePresentationName:state:]([ODIImageLinear alloc], "initWithImagePresentationName:state:", CFSTR("rect1"), v7);
            -[ODILinear setIsHorizontal:](v10, "setIsHorizontal:", 0);
            -[ODILinear setStretch:](v10, "setStretch:", 1);
            LODWORD(v42) = 1017370378;
            -[ODILinear setPadding:](v10, "setPadding:", v42);
            objc_msgSend(v7, "setPresentationName:forPointType:", CFSTR("rect2"), 2);
            goto LABEL_45;
          case 8:
            v10 = -[ODIImageLinear initWithImagePresentationName:state:]([ODIImageLinear alloc], "initWithImagePresentationName:state:", CFSTR("horz1"), v7);
            -[ODILinear setIsHorizontal:](v10, "setIsHorizontal:", 0);
            -[ODILinear setStretch:](v10, "setStretch:", 1);
            LODWORD(v43) = 1017370378;
            -[ODILinear setPadding:](v10, "setPadding:", v43);
            objc_msgSend(v7, "setPresentationName:forPointType:", CFSTR("tx1"), 2);
            goto LABEL_45;
          case 9:
            v10 = -[ODIImageLinear initWithImagePresentationName:state:]([ODIAccentedImageLinear alloc], "initWithImagePresentationName:state:", CFSTR("desPictures"), v7);
            -[ODILinear setIsHorizontal:](v10, "setIsHorizontal:", 0);
            -[ODILinear setStretch:](v10, "setStretch:", 1);
            LODWORD(v44) = 1017370378;
            -[ODILinear setPadding:](v10, "setPadding:", v44);
            objc_msgSend(v7, "setPresentationName:forPointType:", CFSTR("desText"), 2);
            goto LABEL_45;
          default:
            goto LABEL_69;
        }
      }
      if (objc_msgSend(v6, "hasPrefix:", CFSTR("pList")))
      {
        objc_msgSend(v6, "substringFromIndex:", objc_msgSend(CFSTR("pList"), "length"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "intValue");

        if (v27 == 1)
        {
          v10 = -[ODIImageLinear initWithImagePresentationName:state:]([ODIImageLinear alloc], "initWithImagePresentationName:state:", CFSTR("pictRect"), v7);
          LODWORD(v39) = 2.0;
          -[ODILinear setPointHeight:](v10, "setPointHeight:", v39);
          objc_msgSend(v7, "setPresentationName:forPointType:", CFSTR("pictRect"), 2);
        }
        else
        {
          if (v27 != 2)
            goto LABEL_69;
          v10 = -[ODIImageLinear initWithImagePresentationName:state:]([ODIImageLinear alloc], "initWithImagePresentationName:state:", CFSTR("imagNode"), v7);
          -[ODILinear setStretch:](v10, "setStretch:", 1);
          LODWORD(v28) = 1017370378;
          -[ODILinear setPadding:](v10, "setPadding:", v28);
        }
      }
      else if (objc_msgSend(v6, "hasPrefix:", CFSTR("lProcess")))
      {
        objc_msgSend(v6, "substringFromIndex:", objc_msgSend(CFSTR("lProcess"), "length"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "intValue");

        switch(v32)
        {
          case 1:
            v10 = (ODIAccentedImageLinear *)objc_msgSend(objc_alloc((Class)a1), "initWithState:", v7);
            objc_msgSend(v7, "setPresentationName:forPointType:", CFSTR("header"), 2);
            break;
          case 2:
            v10 = (ODIAccentedImageLinear *)objc_msgSend(objc_alloc((Class)a1), "initWithState:", v7);
            -[ODILinear setStretch:](v10, "setStretch:", 1);
            LODWORD(v45) = 1025758986;
            -[ODILinear setPadding:](v10, "setPadding:", v45);
            objc_msgSend(v7, "setPresentationName:forPointType:", CFSTR("textNode"), 2);
            break;
          case 3:
            v10 = (ODIAccentedImageLinear *)objc_msgSend(objc_alloc((Class)a1), "initWithState:", v7);
            -[ODILinear setIsHorizontal:](v10, "setIsHorizontal:", 0);
            LODWORD(v33) = 0.5;
            -[ODILinear setPointHeight:](v10, "setPointHeight:", v33);
            LODWORD(v34) = 1025758986;
            -[ODILinear setPadding:](v10, "setPadding:", v34);
            objc_msgSend(v7, "setPresentationName:forPointType:", CFSTR("bigChev"), 2);
            break;
          default:
            goto LABEL_69;
        }
      }
      else if (objc_msgSend(v6, "isEqualToString:", CFSTR("arrow2")))
      {
        v10 = -[ODILinear initWithState:]([ODIArrow2 alloc], "initWithState:", v7);
        -[ODILinear setWithConnectors:](v10, "setWithConnectors:", 1);
      }
      else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("equation1")) & 1) != 0
             || objc_msgSend(v6, "isEqualToString:", CFSTR("equation2")))
      {
LABEL_37:
        v10 = (ODIAccentedImageLinear *)objc_msgSend(objc_alloc((Class)a1), "initWithState:", v7);
        -[ODILinear setWithConnectors:](v10, "setWithConnectors:", 1);
      }
      else if (objc_msgSend(v6, "isEqualToString:", CFSTR("funnel1")))
      {
        v10 = (ODIAccentedImageLinear *)objc_msgSend(objc_alloc((Class)a1), "initWithState:", v7);
        -[ODILinear setIsHorizontal:](v10, "setIsHorizontal:", 0);
        -[ODILinear setWithConnectors:](v10, "setWithConnectors:", 1);
        -[ODILinear setMaxPointCount:](v10, "setMaxPointCount:", 4);
      }
      else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("hChevron1")) & 1) != 0
             || objc_msgSend(v6, "isEqualToString:", CFSTR("hChevron3")))
      {
        v10 = (ODIAccentedImageLinear *)objc_msgSend(objc_alloc((Class)a1), "initWithState:", v7);
        -[ODILinear setWithConnectors:](v10, "setWithConnectors:", 1);
        -[ODILinear setMaxPointCount:](v10, "setMaxPointCount:", 4);
      }
      else if (objc_msgSend(v6, "isEqualToString:", CFSTR("target1")))
      {
        v10 = -[ODILinear initWithState:]([ODITarget1 alloc], "initWithState:", v7);
        -[ODILinear setMaxPointCount:](v10, "setMaxPointCount:", 5);
      }
      else if (objc_msgSend(v6, "isEqualToString:", CFSTR("target2")))
      {
        v10 = -[ODILinear initWithState:]([ODITarget2 alloc], "initWithState:", v7);
        -[ODILinear setMaxPointCount:](v10, "setMaxPointCount:", 3);
        -[ODILinear setStretch:](v10, "setStretch:", 1);
        -[ODILinear setIsTextCentered:](v10, "setIsTextCentered:", 0);
      }
      else if (objc_msgSend(v6, "isEqualToString:", CFSTR("target3")))
      {
        v10 = -[ODILinear initWithState:]([ODITarget3 alloc], "initWithState:", v7);
        -[ODILinear setStretch:](v10, "setStretch:", 1);
        -[ODILinear setIsHorizontal:](v10, "setIsHorizontal:", 0);
        LODWORD(v46) = 0;
        -[ODILinear setPadding:](v10, "setPadding:", v46);
      }
      else if (objc_msgSend(v6, "isEqualToString:", CFSTR("venn2")))
      {
        v10 = -[ODILinear initWithState:]([ODIVenn2 alloc], "initWithState:", v7);
        -[ODILinear setStretch:](v10, "setStretch:", 1);
        -[ODILinear setIsHorizontal:](v10, "setIsHorizontal:", 0);
        LODWORD(v47) = 0;
        -[ODILinear setPadding:](v10, "setPadding:", v47);
        -[ODILinear setMaxPointCount:](v10, "setMaxPointCount:", 7);
      }
      else if (objc_msgSend(v6, "isEqualToString:", CFSTR("chevron2")))
      {
        v10 = (ODIAccentedImageLinear *)objc_msgSend(objc_alloc((Class)a1), "initWithState:", v7);
        -[ODILinear setStretch:](v10, "setStretch:", 1);
        -[ODILinear setIsHorizontal:](v10, "setIsHorizontal:", 0);
        LODWORD(v48) = 1031127695;
        -[ODILinear setPadding:](v10, "setPadding:", v48);
        objc_msgSend(v7, "setPresentationName:forPointType:", CFSTR("parentText"), 2);
      }
      else if (objc_msgSend(v6, "isEqualToString:", CFSTR("list1")))
      {
        v10 = -[ODILinear initWithState:]([ODIList1 alloc], "initWithState:", v7);
        -[ODILinear setStretch:](v10, "setStretch:", 1);
        -[ODILinear setIsHorizontal:](v10, "setIsHorizontal:", 0);
        -[ODILinear setIsTextCenteredHorizontally:](v10, "setIsTextCenteredHorizontally:", 0);
        -[ODILinear setIsTextCenteredVertically:](v10, "setIsTextCenteredVertically:", 1);
        LODWORD(v49) = 1017370378;
        -[ODILinear setPadding:](v10, "setPadding:", v49);
        objc_msgSend(v7, "setPresentationName:forPointType:", CFSTR("parentText"), 2);
      }
      else if (objc_msgSend(v6, "isEqualToString:", CFSTR("balance1")))
      {
        v10 = -[ODILinear initWithState:]([ODILinear alloc], "initWithState:", v7);
        -[ODILinear setIsHorizontal:](v10, "setIsHorizontal:", 0);
        -[ODILinear setWithConnectors:](v10, "setWithConnectors:", 0);
        LODWORD(v50) = 1057971241;
        -[ODILinear setPointHeight:](v10, "setPointHeight:", v50);
        LODWORD(v51) = 1025758986;
        -[ODILinear setPadding:](v10, "setPadding:", v51);
      }
      else
      {
        if (!objc_msgSend(v6, "isEqualToString:", CFSTR("vProcess5")))
          goto LABEL_69;
        v10 = -[ODILinear initWithState:]([ODILinear alloc], "initWithState:", v7);
        -[ODILinear setIsHorizontal:](v10, "setIsHorizontal:", 0);
        -[ODILinear setWithConnectors:](v10, "setWithConnectors:", 1);
        LODWORD(v52) = 1057971241;
        -[ODILinear setPointHeight:](v10, "setPointHeight:", v52);
        LODWORD(v53) = 1025758986;
        -[ODILinear setPadding:](v10, "setPadding:", v53);
      }
    }
LABEL_45:
    if (v10)
    {
      -[ODILinear map](v10, "map");
      v14 = 1;
    }
    else
    {
      v14 = 0;
    }
    goto LABEL_70;
  }
  objc_msgSend(v6, "substringFromIndex:", objc_msgSend(CFSTR("hProcess"), "length"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "intValue");

  v10 = 0;
  v14 = 0;
  switch(v13)
  {
    case 3:
      v10 = -[ODILinear initWithState:]([ODIHorizontalProcess3 alloc], "initWithState:", v7);
      LODWORD(v15) = 1066611507;
      -[ODILinear setPointHeight:](v10, "setPointHeight:", v15);
      -[ODILinear setWithConnectors:](v10, "setWithConnectors:", 1);
      goto LABEL_45;
    case 4:
    case 9:
      v10 = (ODIAccentedImageLinear *)objc_msgSend(objc_alloc((Class)a1), "initWithState:", v7);
      LODWORD(v29) = 1.0;
      -[ODILinear setPointHeight:](v10, "setPointHeight:", v29);
      -[ODILinear setWithConnectors:](v10, "setWithConnectors:", 1);
      goto LABEL_45;
    case 6:
      goto LABEL_37;
    case 7:
      v10 = (ODIAccentedImageLinear *)objc_msgSend(objc_alloc((Class)a1), "initWithState:", v7);
      LODWORD(v35) = 1067114824;
      -[ODILinear setPointHeight:](v10, "setPointHeight:", v35);
      LODWORD(v36) = 1025758986;
      -[ODILinear setPadding:](v10, "setPadding:", v36);
      goto LABEL_45;
    case 10:
      v10 = -[ODIImageLinear initWithImagePresentationName:state:]([ODIImageLinear alloc], "initWithImagePresentationName:state:", CFSTR("imagSh"), v7);
      -[ODILinear setWithConnectors:](v10, "setWithConnectors:", 1);
      LODWORD(v30) = 2.0;
      -[ODILinear setPointHeight:](v10, "setPointHeight:", v30);
      -[ODILinear setIsTextCentered:](v10, "setIsTextCentered:", 1);
      goto LABEL_45;
    case 11:
      v10 = -[ODILinear initWithState:]([ODIHorizontalProcess11 alloc], "initWithState:", v7);
      LODWORD(v37) = 1066611507;
      -[ODILinear setPointHeight:](v10, "setPointHeight:", v37);
      -[ODILinear setWithConnectors:](v10, "setWithConnectors:", 1);
      goto LABEL_45;
    default:
      break;
  }
LABEL_70:

  return v14;
}

+ (void)mapUnknownWithState:(id)a3
{
  objc_msgSend(a1, "mapIdentifier:state:", CFSTR("process1"), a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mState, 0);
}

- (ODILinear)initWithState:(id)a3
{
  id v5;
  ODILinear *v6;
  ODILinear *v7;

  v5 = a3;
  v6 = -[ODILinear init](self, "init");
  v7 = v6;
  if (v6)
  {
    *(_WORD *)&v6->mIsHorizontal = 1;
    v6->mStretch = 0;
    *(_QWORD *)&v6->mPointHeight = 0x3E6147AE3F800000;
    v6->mPadding = 0.11;
    objc_storeStrong((id *)&v6->mState, a3);
    v7->mMaxPointCount = -1;
    *(_WORD *)&v7->mIsTextCenteredHorizontally = 257;
  }

  return v7;
}

- (void)setIsHorizontal:(BOOL)a3
{
  self->mIsHorizontal = a3;
}

- (void)setWithConnectors:(BOOL)a3
{
  self->mWithConnectors = a3;
}

- (void)setStretch:(BOOL)a3
{
  self->mStretch = a3;
}

- (void)setPointHeight:(float)a3
{
  self->mPointHeight = a3;
}

- (void)setConnectorWidth:(float)a3
{
  self->mConnectorWidth = a3;
}

- (void)setPadding:(float)a3
{
  self->mPadding = a3;
}

- (void)setIsTextCentered:(BOOL)a3
{
  self->mIsTextCenteredHorizontally = a3;
  self->mIsTextCenteredVertically = a3;
}

- (void)setIsTextCenteredHorizontally:(BOOL)a3
{
  self->mIsTextCenteredHorizontally = a3;
}

- (void)setIsTextCenteredVertically:(BOOL)a3
{
  self->mIsTextCenteredVertically = a3;
}

- (void)setMaxPointCount:(unsigned int)a3
{
  self->mMaxPointCount = a3;
}

- (void)map
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  unsigned int mMaxPointCount;
  uint64_t v8;
  double mPointHeight;
  unint64_t i;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;

  -[ODIState diagram](self->mState, "diagram");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "documentPoint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "count");
  mMaxPointCount = self->mMaxPointCount;
  if (mMaxPointCount >= v6)
    v8 = v6;
  else
    v8 = mMaxPointCount;
  -[ODIState setPointCount:](self->mState, "setPointCount:", v8);
  -[ODILinear setLogicalBounds](self, "setLogicalBounds");
  mPointHeight = self->mPointHeight;
  v13 = 0.0;
  v14 = 0.0;
  v15 = 1.0;
  v16 = mPointHeight;
  if ((_DWORD)v8)
  {
    for (i = 0; i != v8; ++i)
    {
      objc_msgSend(v5, "objectAtIndex:", i, *(_QWORD *)&v13, *(_QWORD *)&v14, *(_QWORD *)&v15, *(_QWORD *)&v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ODIState setPointIndex:](self->mState, "setPointIndex:", i);
      -[ODILinear mapPoint:bounds:](self, "mapPoint:bounds:", v11, v13, v14, v15, v16);
      if (i < (v8 - 1) && self->mWithConnectors)
      {
        objc_msgSend(v11, "siblingTransition");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[ODILinear mapTransition:pointBounds:](self, "mapTransition:pointBounds:", v12, v13, v14, v15, v16);

      }
      -[ODILinear nextPointBounds:](self, "nextPointBounds:", &v13);

    }
  }

}

- (void)setLogicalBounds
{
  float v3;
  float mPadding;
  double v5;
  double v6;
  float v7;
  double v8;
  double v9;
  double v10;
  float mPointHeight;
  double v12;
  double v13;
  float v14;
  id v15;

  -[ODIState diagram](self->mState, "diagram");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (float)-[ODIState pointCount](self->mState, "pointCount");
  if (self->mWithConnectors)
    mPadding = self->mConnectorWidth + (float)(self->mPadding * 2.0);
  else
    mPadding = self->mPadding;
  v5 = *MEMORY[0x24BDBEFB0];
  v6 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v7 = (float)(v3 + -1.0) * mPadding;
  if (self->mIsHorizontal)
  {
    v8 = (float)(v7 + v3);
    if (self->mStretch)
    {
      +[ODIDrawable sizeOfDiagram:](ODIDrawable, "sizeOfDiagram:", v15);
      mPointHeight = v9 * v8 / v10;
      self->mPointHeight = mPointHeight;
    }
    else
    {
      mPointHeight = self->mPointHeight;
    }
  }
  else
  {
    if (self->mStretch)
    {
      +[ODIDrawable sizeOfDiagram:](ODIDrawable, "sizeOfDiagram:", v15);
      v14 = (v13 / v12 - v7) / v3;
      self->mPointHeight = v14;
    }
    else
    {
      v14 = self->mPointHeight;
    }
    mPointHeight = v7 + (float)(v3 * v14);
    v8 = 1.0;
  }
  -[ODIState setLogicalBounds:](self->mState, "setLogicalBounds:", v5, v6, v8, mPointHeight);

}

- (void)nextPointBounds:(CGRect *)a3
{
  float mPadding;
  double v4;

  if (self->mWithConnectors)
    mPadding = self->mConnectorWidth + (float)(self->mPadding * 2.0);
  else
    mPadding = self->mPadding;
  if (self->mIsHorizontal)
  {
    v4 = (float)(mPadding + 1.0);
  }
  else
  {
    v4 = a3->size.height + mPadding;
    a3 = (CGRect *)((char *)a3 + 8);
  }
  a3->origin.x = a3->origin.x + v4;
}

- (void)mapPoint:(id)a3 bounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  void *v10;
  double v11;
  void *v12;
  id v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3;
  LODWORD(v9) = 1033476506;
  +[ODIDrawable shapeGeometryForRoundedRectangleWithRadius:](ODIDrawable, "shapeGeometryForRoundedRectangleWithRadius:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = 0;
  +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v10, self->mState, x, y, width, height, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODILinear mapStyleFromPoint:shape:](self, "mapStyleFromPoint:shape:", v13, v12);
  +[ODIText mapTextFromPoint:toShape:isCenteredHorizontally:isCenteredVertically:includeChildren:state:](ODIText, "mapTextFromPoint:toShape:isCenteredHorizontally:isCenteredVertically:includeChildren:state:", v13, v12, self->mIsTextCenteredHorizontally, self->mIsTextCenteredVertically, 1, self->mState);

}

- (void)mapStyleFromPoint:(id)a3 shape:(id)a4
{
  +[ODIDrawable mapStyleFromPoint:shape:state:](ODIDrawable, "mapStyleFromPoint:shape:state:", a3, a4, self->mState);
}

- (void)mapTransition:(id)a3 pointBounds:(CGRect)a4
{
  double height;
  double y;
  double x;
  id v8;
  float mConnectorWidth;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  id v16;

  height = a4.size.height;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3;
  mConnectorWidth = self->mConnectorWidth;
  v10 = mConnectorWidth;
  v16 = v8;
  if (self->mIsHorizontal)
  {
    v11 = x + 1.0 + self->mPadding;
    v12 = y + (height - v10) * 0.5;
  }
  else
  {
    v11 = x + (float)((float)(1.0 - mConnectorWidth) * 0.5);
    v12 = y + height + self->mPadding;
  }
  +[ODIDrawable shapeGeometryForRightArrowWithControlPoint:](ODIDrawable, "shapeGeometryForRightArrowWithControlPoint:", 0.5, 0.180000007);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->mIsHorizontal)
    *(float *)&v14 = 0.0;
  else
    *(float *)&v14 = -270.0;
  +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v13, self->mState, v11, v12, v10, v10, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODILinear mapStyleFromTransition:shape:](self, "mapStyleFromTransition:shape:", v16, v15);

}

- (void)mapStyleFromTransition:(id)a3 shape:(id)a4
{
  +[ODIDrawable mapStyleFromPoint:shape:state:](ODIDrawable, "mapStyleFromPoint:shape:state:", a3, a4, self->mState);
}

@end

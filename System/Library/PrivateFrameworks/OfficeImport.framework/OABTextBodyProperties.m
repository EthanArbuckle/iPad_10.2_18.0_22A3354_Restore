@implementation OABTextBodyProperties

+ (void)readTextBodyProperties:(id)a3 textBox:(const EshTextBox *)a4 useDefaults:(BOOL)a5 state:(id)a6
{
  _BOOL4 v7;
  id v10;
  int v11;
  EshTextBox *isInsetLeftSet;
  int InsetLeft;
  double v14;
  EshTextBox *isInsetRightSet;
  int InsetRight;
  double v17;
  EshTextBox *isInsetTopSet;
  int InsetTop;
  double v20;
  EshTextBox *isInsetBottomSet;
  int InsetBottom;
  double v23;
  EshContentProperties *isColumnCountSet;
  uint64_t ColumnCount;
  EshTextBox *isColumnMarginSet;
  int ColumnMargin;
  double v28;
  EshContentProperties *isRotateSet;
  uint64_t DefaultPositionHorizontal;
  uint64_t v31;
  EshContentProperties *isFlowSet;
  uint64_t Flow;
  EshContentProperties *isDirectionSet;
  uint64_t Direction;
  EshContentProperties *isFitShapeToTextSet;
  uint64_t FitShapeToText;
  EshContentProperties *isWrapStyleSet;
  uint64_t WrapStyle;
  uint64_t v40;
  uint64_t v41;
  EshContentProperties *isAnchorSet;
  uint64_t Anchor;
  uint64_t v44;
  id v45;

  v7 = a5;
  v45 = a3;
  v10 = a6;
  v11 = objc_msgSend((id)objc_msgSend(v10, "client"), "escherIsFullySupported");
  objc_msgSend(v45, "setIsUpright:", v11 ^ 1u);
  isInsetLeftSet = (EshTextBox *)EshTextBox::isInsetLeftSet((EshTextBox *)a4);
  if ((_DWORD)isInsetLeftSet)
  {
    InsetLeft = EshTextBox::getInsetLeft((EshTextBox *)a4);
  }
  else
  {
    if (!v7)
      goto LABEL_6;
    InsetLeft = EshTextBox::getDefaultInsetLeft(isInsetLeftSet);
  }
  v14 = (double)InsetLeft / 12700.0;
  *(float *)&v14 = v14;
  objc_msgSend(v45, "setLeftInset:", v14);
LABEL_6:
  isInsetRightSet = (EshTextBox *)EshTextBox::isInsetRightSet((EshTextBox *)a4);
  if ((_DWORD)isInsetRightSet)
  {
    InsetRight = EshTextBox::getInsetRight((EshTextBox *)a4);
  }
  else
  {
    if (!v7)
      goto LABEL_11;
    InsetRight = EshTextBox::getDefaultInsetLeft(isInsetRightSet);
  }
  v17 = (double)InsetRight / 12700.0;
  *(float *)&v17 = v17;
  objc_msgSend(v45, "setRightInset:", v17);
LABEL_11:
  isInsetTopSet = (EshTextBox *)EshTextBox::isInsetTopSet((EshTextBox *)a4);
  if ((_DWORD)isInsetTopSet)
  {
    InsetTop = EshTextBox::getInsetTop((EshTextBox *)a4);
  }
  else
  {
    if (!v7)
      goto LABEL_16;
    InsetTop = EshTextBox::getDefaultInsetTop(isInsetTopSet);
  }
  v20 = (double)InsetTop / 12700.0;
  *(float *)&v20 = v20;
  objc_msgSend(v45, "setTopInset:", v20);
LABEL_16:
  isInsetBottomSet = (EshTextBox *)EshTextBox::isInsetBottomSet((EshTextBox *)a4);
  if ((_DWORD)isInsetBottomSet)
  {
    InsetBottom = EshTextBox::getInsetBottom((EshTextBox *)a4);
  }
  else
  {
    if (!v7)
      goto LABEL_21;
    InsetBottom = EshTextBox::getDefaultInsetTop(isInsetBottomSet);
  }
  v23 = (double)InsetBottom / 12700.0;
  *(float *)&v23 = v23;
  objc_msgSend(v45, "setBottomInset:", v23);
LABEL_21:
  isColumnCountSet = (EshContentProperties *)EshTextBox::isColumnCountSet((EshTextBox *)a4);
  if ((_DWORD)isColumnCountSet)
  {
    ColumnCount = EshTextBox::getColumnCount((EshTextBox *)a4);
  }
  else
  {
    if (!v7)
      goto LABEL_26;
    ColumnCount = EshContentProperties::getDefaultAllowOverlap(isColumnCountSet);
  }
  objc_msgSend(v45, "setColumnCount:", ColumnCount);
LABEL_26:
  isColumnMarginSet = (EshTextBox *)EshTextBox::isColumnMarginSet((EshTextBox *)a4);
  if ((_DWORD)isColumnMarginSet)
  {
    ColumnMargin = EshTextBox::getColumnMargin((EshTextBox *)a4);
  }
  else
  {
    if (!v7)
      goto LABEL_31;
    ColumnMargin = EshTextBox::getDefaultInsetLeft(isColumnMarginSet);
  }
  v28 = (double)ColumnMargin / 12700.0;
  *(float *)&v28 = v28;
  objc_msgSend(v45, "setColumnSpacing:", v28);
LABEL_31:
  isRotateSet = (EshContentProperties *)EshTextBox::isRotateSet((EshTextBox *)a4);
  if (!(_DWORD)isRotateSet)
  {
    if (!v7)
      goto LABEL_40;
    if (v11)
    {
      DefaultPositionHorizontal = EshContentProperties::getDefaultPositionHorizontal(isRotateSet);
      goto LABEL_37;
    }
LABEL_38:
    v31 = 0;
    goto LABEL_39;
  }
  if (!v11)
    goto LABEL_38;
  DefaultPositionHorizontal = EshTextBox::getRotate((EshTextBox *)a4);
LABEL_37:
  v31 = DefaultPositionHorizontal;
LABEL_39:
  objc_msgSend(a1, "setTextRotation:textBodyProperties:", v31, v45);
LABEL_40:
  isFlowSet = (EshContentProperties *)EshTextBox::isFlowSet((EshTextBox *)a4);
  if ((_DWORD)isFlowSet)
    Flow = EshTextBox::getFlow((EshTextBox *)a4);
  else
    Flow = EshContentProperties::getDefaultPositionHorizontal(isFlowSet);
  objc_msgSend(a1, "setTextFlow:textBodyProperties:", Flow, v45);
  isDirectionSet = (EshContentProperties *)EshTextBox::isDirectionSet((EshTextBox *)a4);
  if ((_DWORD)isDirectionSet)
  {
    Direction = EshTextBox::getDirection((EshTextBox *)a4);
  }
  else
  {
    if (!v7)
      goto LABEL_48;
    Direction = EshContentProperties::getDefaultPositionHorizontal(isDirectionSet);
  }
  objc_msgSend(a1, "setTextDirection:textBodyProperties:", Direction, v45);
LABEL_48:
  isFitShapeToTextSet = (EshContentProperties *)EshTextBox::isFitShapeToTextSet((EshTextBox *)a4);
  if ((_DWORD)isFitShapeToTextSet)
  {
    FitShapeToText = EshTextBox::getFitShapeToText((EshTextBox *)a4);
  }
  else
  {
    if (!v7)
      goto LABEL_53;
    FitShapeToText = EshContentProperties::getDefaultPositionHorizontal(isFitShapeToTextSet);
  }
  objc_msgSend(a1, "setAutoFit:textBodyProperties:", FitShapeToText, v45);
LABEL_53:
  isWrapStyleSet = (EshContentProperties *)EshTextBox::isWrapStyleSet((EshTextBox *)a4);
  if (!(_DWORD)isWrapStyleSet)
  {
    if (!v7)
      goto LABEL_62;
    if (v11)
    {
      WrapStyle = EshContentProperties::getDefaultPositionHorizontal(isWrapStyleSet);
      goto LABEL_59;
    }
LABEL_60:
    v40 = 0;
    goto LABEL_61;
  }
  if (!v11)
    goto LABEL_60;
  WrapStyle = EshTextBox::getWrapStyle((EshTextBox *)a4);
LABEL_59:
  v40 = WrapStyle;
LABEL_61:
  objc_msgSend(a1, "setWrap:textBodyProperties:", v40, v45);
LABEL_62:
  if (v11)
  {
    objc_msgSend(v45, "setHorizontalOverflowType:", 0);
    v41 = 0;
  }
  else
  {
    objc_msgSend(v45, "setHorizontalOverflowType:", 1);
    v41 = 2;
  }
  objc_msgSend(v45, "setVerticalOverflowType:", v41);
  if ((EshTextBox::isAnchorSet((EshTextBox *)a4) | v7) == 1)
  {
    if (v11)
    {
      isAnchorSet = (EshContentProperties *)EshTextBox::isAnchorSet((EshTextBox *)a4);
      if ((_DWORD)isAnchorSet)
        Anchor = EshTextBox::getAnchor((EshTextBox *)a4);
      else
        Anchor = EshContentProperties::getDefaultPositionHorizontal(isAnchorSet);
      v44 = Anchor;
    }
    else
    {
      v44 = 0;
    }
    objc_msgSend(a1, "setTextAnchor:textBodyProperties:", v44, v45);
    objc_msgSend(a1, "setIsAnchorCenter:textBodyProperties:", v44, v45);
  }

}

+ (void)setTextRotation:(int)a3 textBodyProperties:(id)a4
{
  id v5;
  double v6;
  id v7;

  v5 = a4;
  LODWORD(v6) = 0;
  if ((a3 - 1) <= 2)
    LODWORD(v6) = dword_22A4BE4E4[a3 - 1];
  v7 = v5;
  objc_msgSend(v5, "setRotation:", v6);

}

+ (void)setTextFlow:(int)a3 textBodyProperties:(id)a4
{
  id v5;
  unint64_t v6;
  id v7;

  v5 = a4;
  v6 = 0x40102030600uLL >> (8 * a3);
  if (a3 >= 6)
    LOBYTE(v6) = 0;
  v7 = v5;
  objc_msgSend(v5, "setFlowType:", v6 & 7);

}

+ (void)setTextDirection:(int)a3 textBodyProperties:(id)a4
{
  uint64_t v5;
  id v6;

  v6 = a4;
  if (!a3)
  {
    v5 = 0;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v5 = 1;
LABEL_5:
    objc_msgSend(v6, "setIsLeftToRightColumns:", v5);
  }

}

+ (void)setAutoFit:(BOOL)a3 textBodyProperties:(id)a4
{
  _BOOL8 v4;
  OADTextBodyAutoFit *v5;
  id v6;

  v4 = a3;
  v6 = a4;
  v5 = -[OADTextBodyAutoFit initWithType:]([OADTextBodyAutoFit alloc], "initWithType:", v4);
  objc_msgSend(v6, "setAutoFit:", v5);

}

+ (void)setWrap:(int)a3 textBodyProperties:(id)a4
{
  objc_msgSend(a4, "setWrapType:", a3 < 2);
}

+ (void)setTextAnchor:(int)a3 textBodyProperties:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a4;
  if ((a3 - 1) > 8)
    v6 = 0;
  else
    v6 = byte_22A4BE4F0[a3 - 1];
  v7 = v5;
  objc_msgSend(v5, "setTextAnchorType:", v6);

}

+ (void)setIsAnchorCenter:(int)a3 textBodyProperties:(id)a4
{
  id v5;

  v5 = a4;
  objc_msgSend(v5, "setIsAnchorCenter:", (a3 < 0xA) & (0x338u >> a3));

}

+ (void)writeTextBodyProperties:(id)a3 toShapeBase:(void *)a4 state:(id)a5
{
  EshTextBox *v6;
  float v7;
  float v8;
  float v9;
  float v10;
  unsigned int v11;
  float v12;
  int v13;
  int v14;
  unsigned int v15;
  _BOOL4 v16;
  int v17;
  void *v18;
  int v19;
  double v20;
  unsigned __int8 v21;
  unsigned __int8 v22;
  float v23;
  double v24;
  unint64_t v25;
  int v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  unsigned int v32;
  id v33;

  v33 = a3;
  objc_msgSend(v33, "leftInset");
  v6 = (EshTextBox *)((char *)a4 + 272);
  objc_msgSend(v33, "topInset", EshTextBox::setInsetLeft(v6, (int)(float)(v7 * 12700.0)));
  objc_msgSend(v33, "rightInset", EshTextBox::setInsetTop(v6, (int)(float)(v8 * 12700.0)));
  objc_msgSend(v33, "bottomInset", EshTextBox::setInsetRight(v6, (int)(float)(v9 * 12700.0)));
  v11 = objc_msgSend(v33, "columnCount", EshTextBox::setInsetBottom(v6, (int)(float)(v10 * 12700.0)));
  objc_msgSend(v33, "columnSpacing", EshTextBox::setColumnCount(v6, v11));
  v13 = objc_msgSend(v33, "isAnchorCenter", EshTextBox::setColumnMargin(v6, (int)(float)(v12 * 12700.0)));
  v14 = objc_msgSend(v33, "textAnchorType");
  if (v14)
  {
    if (v14 == 1)
    {
      if (v13)
        v15 = 4;
      else
        v15 = 1;
    }
    else if (v14 == 2)
    {
      if (v13)
        v15 = 5;
      else
        v15 = 2;
    }
    else
    {
      v15 = 0;
    }
  }
  else if (v13)
  {
    v15 = 3;
  }
  else
  {
    v15 = 0;
  }
  v16 = objc_msgSend(v33, "wrapType", EshTextBox::setAnchor((uint64_t)v6, v15)) != 1;
  v17 = objc_msgSend(v33, "isLeftToRightColumns", EshTextBox::setWrapStyle((uint64_t)v6, 2 * v16));
  objc_msgSend(v33, "autoFit", EshTextBox::setDirection((uint64_t)v6, v17 ^ 1u));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "type");

  if (v19 == 2)
  {
    EshTextBox::setFitShapeToText(v6, 0);
    v22 = 1;
  }
  else
  {
    if (v19 == 1)
    {
      v21 = 1;
    }
    else
    {
      if (v19)
        goto LABEL_22;
      v21 = 0;
    }
    EshTextBox::setFitShapeToText(v6, v21);
    v22 = 0;
  }
  v20 = EshTextBox::setFitTextToShape(v6, v22);
LABEL_22:
  objc_msgSend(v33, "rotation", v20);
  v24 = (double)(int)llroundf(v23) / 360.0;
  v25 = llround((v24 - floor(v24)) * 4.0);
  v26 = v25 & 3;
  v28 = -(uint64_t)v25;
  v27 = v28 < 0;
  v29 = v28 & 3;
  if (v27)
    LODWORD(v30) = v26;
  else
    v30 = -v29;
  v31 = objc_msgSend(v33, "flowType", EshTextBox::setRotate((uint64_t)v6, v30)) - 1;
  if (v31 >= 7)
    v32 = 0;
  else
    v32 = dword_22A4BE4FC[(char)v31];
  EshTextBox::setFlow((uint64_t)v6, v32);

}

@end

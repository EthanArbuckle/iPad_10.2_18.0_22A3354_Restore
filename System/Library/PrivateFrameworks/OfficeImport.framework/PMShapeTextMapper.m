@implementation PMShapeTextMapper

- (PMShapeTextMapper)initWithOadTextBody:(id)a3 bounds:(id)a4 parent:(id)a5
{
  id v9;
  id v10;
  id v11;
  PMShapeTextMapper *v12;
  PMShapeTextMapper *v13;
  CMStyle *v14;
  CMStyle *mStyle;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PMShapeTextMapper;
  v12 = -[CMMapper initWithParent:](&v17, sel_initWithParent_, v11);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->mTextBody, a3);
    objc_storeStrong((id *)&v13->mBounds, a4);
    v14 = objc_alloc_init(CMStyle);
    mStyle = v13->mStyle;
    v13->mStyle = v14;

  }
  return v13;
}

- (void)setRectangular:(BOOL)a3
{
  self->mRectangular = a3;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  OADTextBody *mTextBody;
  void *v9;
  CMStyle *mStyle;
  float v11;
  float v12;
  CMStyle *v13;
  float v14;
  float v15;
  CMStyle *v16;
  float v17;
  CMStyle *v18;
  float v19;
  float v20;
  id WeakRetained;
  float v22;
  int v23;
  _BOOL4 v24;
  char **v25;
  id v26;
  double Width;
  CMStyle *v28;
  CMStyle *v29;
  uint64_t *v30;
  CMStyle *v31;
  void *v32;
  unint64_t i;
  void *v34;
  PMParagraphMapper *v35;
  void *v36;
  id v37;
  objc_super v38;
  objc_super v39;
  CGRect v40;
  CGRect v41;

  v6 = a3;
  v7 = a4;
  mTextBody = self->mTextBody;
  if (!mTextBody)
    goto LABEL_28;
  -[OADTextBody properties](mTextBody, "properties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addChild:", v36);
  v37 = v36;

  if (objc_msgSend(v9, "hasTopInset"))
  {
    mStyle = self->mStyle;
    objc_msgSend(v9, "topInset");
    -[CMStyle appendPropertyForName:length:unit:](mStyle, "appendPropertyForName:length:unit:", 0x24F3D5698, 1, v11);
  }
  v12 = 0.0;
  if (objc_msgSend(v9, "hasLeftInset"))
  {
    v13 = self->mStyle;
    objc_msgSend(v9, "leftInset");
    -[CMStyle appendPropertyForName:length:unit:](v13, "appendPropertyForName:length:unit:", 0x24F3D5678, 1, v14);
    objc_msgSend(v9, "leftInset");
    v12 = 0.0 - v15;
  }
  if (objc_msgSend(v9, "hasBottomInset"))
  {
    v16 = self->mStyle;
    objc_msgSend(v9, "bottomInset");
    -[CMStyle appendPropertyForName:length:unit:](v16, "appendPropertyForName:length:unit:", 0x24F3E6F78, 1, v17);
  }
  if (objc_msgSend(v9, "hasRightInset"))
  {
    v18 = self->mStyle;
    objc_msgSend(v9, "rightInset");
    -[CMStyle appendPropertyForName:length:unit:](v18, "appendPropertyForName:length:unit:", 0x24F3E6F98, 1, v19);
    objc_msgSend(v9, "rightInset");
    v12 = v12 - v20;
  }
  if (-[PMShapeTextMapper isTableCellContent](self, "isTableCellContent"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super.mParent);
    objc_msgSend(WeakRetained, "widthWithState:", v7);
    -[CMStyle appendPropertyForName:length:unit:](self->mStyle, "appendPropertyForName:length:unit:", 0x24F3C93F8, 1, (float)(v12 + v22));
    -[CMStyle appendPropertyForName:stringValue:](self->mStyle, "appendPropertyForName:stringValue:", 0x24F3D3BF8, 0x24F3D5618);

  }
  v23 = objc_msgSend(v9, "textAnchorType");
  v24 = -[PMShapeTextMapper isTableCellContent](self, "isTableCellContent");
  v25 = &selRef_addSlideMaster_;
  if (v24)
  {
    v26 = v37;
  }
  else
  {
    v26 = v37;
    if ((v23 - 1) <= 1u)
    {
      -[CMStyle appendPropertyForName:stringValue:](self->mStyle, "appendPropertyForName:stringValue:");
      if (v23 == 2)
      {
        -[OADOrientedBounds bounds](self->mBounds, "bounds");
        Width = CGRectGetWidth(v40);
        -[OADOrientedBounds bounds](self->mBounds, "bounds");
        -[CMStyle appendPositionInfoFromRect:](self->mStyle, "appendPositionInfoFromRect:", 0.0, -10000.0, Width, CGRectGetHeight(v41) + 10000.0);
        -[CMStyle appendPropertyForName:stringWithColons:](self->mStyle, "appendPropertyForName:stringWithColons:", 0x24F3D4B58, CFSTR(":absolute;"));
      }
      else
      {
        v28 = self->mStyle;
        -[OADOrientedBounds bounds](self->mBounds, "bounds");
        -[CMStyle appendSizeInfoFromRect:](v28, "appendSizeInfoFromRect:");
      }
      +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v29 = objc_alloc_init(CMStyle);
      -[CMStyle appendPropertyForName:stringValue:](v29, "appendPropertyForName:stringValue:", 0x24F3E6F18, CFSTR("table-cell"));
      v30 = (uint64_t *)HUPropValBottom;
      if (v23 == 1)
        v30 = &HUPropValMiddle;
      -[CMStyle appendPropertyForName:stringValue:](v29, "appendPropertyForName:stringValue:", 0x24F3E6698, *v30);
      v39.receiver = self;
      v39.super_class = (Class)PMShapeTextMapper;
      -[CMMapper addStyleUsingGlobalCacheTo:style:](&v39, sel_addStyleUsingGlobalCacheTo_style_, v6, v29);
      objc_msgSend(v37, "addChild:", v6);
      v26 = v37;

      v25 = &selRef_addSlideMaster_;
      goto LABEL_22;
    }
  }
  v6 = v26;
LABEL_22:
  v31 = self->mStyle;
  v38.receiver = self;
  v38.super_class = (Class)PMShapeTextMapper;
  objc_msgSendSuper2(&v38, v25[12], v26, v31);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "listState");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "reset");
    for (i = 0; i < -[OADTextBody paragraphCount](self->mTextBody, "paragraphCount"); ++i)
    {
      -[OADTextBody paragraphAtIndex:](self->mTextBody, "paragraphAtIndex:", i);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[PMParagraphMapper initWithOadParagraph:parent:]([PMParagraphMapper alloc], "initWithOadParagraph:parent:", v34, self);
      -[PMParagraphMapper mapAt:withState:isFirstParagraph:](v35, "mapAt:withState:isFirstParagraph:", v6, v7, i == 0);

    }
  }

LABEL_28:
}

- (BOOL)isTableCellContent
{
  id WeakRetained;
  char isKindOfClass;

  WeakRetained = objc_loadWeakRetained((id *)&self->super.mParent);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unsigned)textAnchor
{
  void *v2;
  unsigned __int8 v3;

  -[OADTextBody properties](self->mTextBody, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "textAnchorType");

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mStyle, 0);
  objc_storeStrong((id *)&self->mBounds, 0);
  objc_storeStrong((id *)&self->mTextBody, 0);
}

@end

@implementation WMOfficeArtMapper

- (WMOfficeArtMapper)initWithWdOfficeArt:(id)a3 parent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  WMOfficeArtMapper *v9;
  WMOfficeArtMapper *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isDrawableOverridden") & 1) != 0)
  {
    self->mIsInsideGroup = 0;
    objc_msgSend(v6, "drawable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[WMOfficeArtMapper initWithOadDrawable:asFloating:parent:](self, "initWithOadDrawable:asFloating:parent:", v8, objc_msgSend(v6, "isFloating"), v7);

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)WMOfficeArtMapper;
    v10 = -[CMDrawableMapper initWithParent:](&v12, sel_initWithParent_, v7);
    if (v10)
      v10->mIsMapped = 0;
    v9 = v10;
  }

  return v9;
}

- (void)setBoundingBox
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  id v7;

  +[OAITOrientedBounds absoluteOrientedBoundsOfDrawable:](OAITOrientedBounds, "absoluteOrientedBoundsOfDrawable:", self->super.mDrawable);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  self->super.mBox.origin.x = v3;
  self->super.mBox.origin.y = v4;
  self->super.mBox.size.width = v5;
  self->super.mBox.size.height = v6;

}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  v7 = v6;
  if (self->mIsMapped)
  {
    self->mCurrentPage = objc_msgSend(v6, "currentPage");
    -[OADDrawable clientData](self->super.mDrawable, "clientData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WMOfficeArtMapper setWithClientData:state:](self, "setWithClientData:state:", v8, v7);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[OADDrawable graphicProperties](self->super.mDrawable, "graphicProperties");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "clickHyperlink");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "targetLocation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "absoluteString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", 0x24F3E6C38, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addAttribute:", v14);

        objc_msgSend(v15, "addChild:", v11);
        v15 = v11;
      }

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WMOfficeArtMapper mapOfficeArtShapeAt:withState:](self, "mapOfficeArtShapeAt:withState:", v15, v7);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[WMOfficeArtMapper mapOfficeArtImageAt:withState:](self, "mapOfficeArtImageAt:withState:", v15, v7);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[WMOfficeArtMapper mapOfficeArtGroupAt:withState:](self, "mapOfficeArtGroupAt:withState:", v15, v7);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            -[WMOfficeArtMapper mapDiagramAt:withState:](self, "mapDiagramAt:withState:", v15, v7);
        }
      }
    }
  }

}

- (void)setWithClientData:(id)a3 state:(id)a4
{
  void *v5;
  id v7;
  WDAContent **p_mContent;
  double v9;
  _BOOL4 v10;
  BOOL v11;
  float v12;
  void *v13;
  int v14;
  double y;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  _BOOL4 mIsInsideGroup;
  float v22;
  void *v23;
  int v24;
  CMDrawableStyle *v25;
  double x;
  double v27;
  double width;
  double v29;
  double v30;
  double v31;
  float v32;
  CGFloat v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  CMDrawableStyle *v38;
  _BOOL4 v39;
  void *v40;
  double v41;
  double v42;
  float v43;
  const __CFString *v44;
  float v45;
  double v46;
  double height;
  float v48;
  CGFloat v49;
  CMDrawableStyle *mStyle;
  void *v51;
  id v52;

  v5 = a3;
  v52 = a3;
  v7 = a4;
  self->mIsMapped = 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_45;
  p_mContent = &self->mContent;
  objc_storeStrong((id *)&self->mContent, v5);
  if (!self->mFloating && !self->mIsInsideGroup)
  {
    -[CMStyle appendPropertyForName:length:unit:](self->super.mStyle, "appendPropertyForName:length:unit:", 0x24F3C93F8, 1, self->super.mBox.size.width);
    -[CMStyle appendPropertyForName:length:unit:](self->super.mStyle, "appendPropertyForName:length:unit:", 0x24F3D5658, 1, self->super.mBox.size.height);
    goto LABEL_45;
  }
  if (objc_msgSend(v7, "isHeaderOrFooter"))
    v9 = -1000.0;
  else
    v9 = 0.0;
  v10 = -[WDAContent isShape](*p_mContent, "isShape");
  v11 = v10;
  if (v10)
  {
    -[WDAContent anchor](*p_mContent, "anchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "relativeVerticalPosition") != 2)
    {
      if (-[WDAContent floating](*p_mContent, "floating"))
      {

LABEL_11:
        objc_msgSend(v7, "pageOffset");
        self->super.mBox.origin.y = self->super.mBox.origin.y + v12;
        -[WDAContent anchor](*p_mContent, "anchor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "relativeVerticalPosition");

        if (v14)
        {
          y = self->super.mBox.origin.y;
        }
        else
        {
          objc_msgSend(v7, "topMargin");
          y = v45 / 20.0 + self->super.mBox.origin.y;
          self->super.mBox.origin.y = y;
        }
        -[CMDrawableStyle addPositionProperties:](self->super.mStyle, "addPositionProperties:", self->super.mBox.origin.x, y, self->super.mBox.size.width, self->super.mBox.size.height);
        v46 = self->super.mBox.origin.y;
        height = self->super.mBox.size.height;
        objc_msgSend(v7, "totalPageHeight");
        if (v46 + height > v48)
        {
          v49 = self->super.mBox.origin.y + self->super.mBox.size.height;
          *(float *)&v49 = v49;
          objc_msgSend(v7, "setTotalPageHeight:", v49);
        }
        mStyle = self->super.mStyle;
        -[WDAContent anchor](*p_mContent, "anchor");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[CMStyle appendPropertyForName:intValue:](mStyle, "appendPropertyForName:intValue:", 0x24F3E3858, (int)(v9 + (double)objc_msgSend(v51, "zIndex")));

        goto LABEL_45;
      }
    }
  }
  if (!-[WDAContent isShape](*p_mContent, "isShape"))
    goto LABEL_18;
  -[WDAContent anchor](*p_mContent, "anchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v16, "zIndex") & 0x8000000000000000) == 0)
  {
LABEL_17:

LABEL_18:
    if (v11)

    goto LABEL_20;
  }
  -[WDAContent anchor](*p_mContent, "anchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "relativeVerticalPosition") == 2)
  {

    goto LABEL_17;
  }
  v39 = -[WDAContent floating](*p_mContent, "floating");

  if (v11)
  {

    if (v39)
      goto LABEL_11;
  }
  else if (v39)
  {
    goto LABEL_11;
  }
LABEL_20:
  -[WDAContent anchor](*p_mContent, "anchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "textWrappingMode");

  if (v19 == 1)
  {
    -[CMStyle appendPropertyForName:stringValue:](self->super.mStyle, "appendPropertyForName:stringValue:", 0x24F3D3678, 0x24F3DA4B8);
    -[CMStyle appendSizeInfoFromRect:](self->super.mStyle, "appendSizeInfoFromRect:", self->super.mBox.origin.x, self->super.mBox.origin.y, self->super.mBox.size.width, self->super.mBox.size.height);
    self->mFloating = 0;
    goto LABEL_45;
  }
  -[WDAContent anchor](*p_mContent, "anchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "textWrappingMode") == 3)
  {

  }
  else
  {
    mIsInsideGroup = self->mIsInsideGroup;

    if (!mIsInsideGroup)
    {
      -[CMMapper root](self, "root");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "contentSizeForDevice");
      v42 = v41;

      -[CMStyle appendPositionInfoFromRect:](self->super.mStyle, "appendPositionInfoFromRect:", self->super.mBox.origin.x, self->super.mBox.origin.y, self->super.mBox.size.width, self->super.mBox.size.height);
      v43 = v42;
      self->mFloating = 0;
      if (self->super.mBox.origin.x <= v43 - self->super.mBox.origin.x - self->super.mBox.size.width)
        v44 = CFSTR(":left;");
      else
        v44 = CFSTR(":right;");
      -[CMStyle appendPropertyForName:stringWithColons:](self->super.mStyle, "appendPropertyForName:stringWithColons:", 0x24F3E4518, v44);
      goto LABEL_45;
    }
  }
  objc_msgSend(v7, "pageOffset");
  self->super.mBox.origin.y = self->super.mBox.origin.y + v22;
  -[WDAContent anchor](*p_mContent, "anchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "relativeHorizontalPosition");

  v25 = self->super.mStyle;
  x = self->super.mBox.origin.x;
  v27 = self->super.mBox.origin.y;
  width = self->super.mBox.size.width;
  v29 = self->super.mBox.size.height;
  if (v24 == 2)
    -[CMDrawableStyle addPositionUsingOffsets:](v25, "addPositionUsingOffsets:", x, v27, width, v29);
  else
    -[CMDrawableStyle addPositionProperties:](v25, "addPositionProperties:", x, v27, width, v29);
  v30 = self->super.mBox.origin.y;
  v31 = self->super.mBox.size.height;
  objc_msgSend(v7, "totalPageHeight");
  if (v30 + v31 > v32)
  {
    v33 = self->super.mBox.origin.y + self->super.mBox.size.height;
    *(float *)&v33 = v33;
    objc_msgSend(v7, "setTotalPageHeight:", v33);
  }
  -[WDAContent anchor](*p_mContent, "anchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "zIndex");

  -[WDAContent anchor](*p_mContent, "anchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "zIndex");

  v38 = self->super.mStyle;
  if (v37 < 0)
  {
    -[CMStyle appendPropertyForName:stringWithColons:](v38, "appendPropertyForName:stringWithColons:", 0x24F3E3858, CFSTR(":-1;"));
    -[CMStyle appendPropertyForName:stringWithColons:](self->super.mStyle, "appendPropertyForName:stringWithColons:", 0x24F3E7018, CFSTR(":0.25;"));
  }
  else
  {
    -[CMStyle appendPropertyForName:intValue:](v38, "appendPropertyForName:intValue:", 0x24F3E3858, (int)(v9 + (double)v35));
  }
LABEL_45:

}

- (void)mapOfficeArtShapeAt:(id)a3 withState:(id)a4
{
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  double Width;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CMDrawableStyle *v27;
  double v28;
  double v29;
  float v30;
  double v31;
  CMBordersProperty *v32;
  void *v33;
  CMBordersProperty *v34;
  void *v35;
  CMDrawableStyle *mStyle;
  void *v37;
  float v38;
  OADDrawable *v39;
  id v40;
  id v41;
  objc_super v42;
  objc_super v43;

  v40 = a3;
  v41 = a4;
  v39 = self->super.mDrawable;
  v6 = -[OADDrawable type](v39, "type");
  -[OADDrawable shapeProperties](v39, "shapeProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fill");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    v9 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v7, "stroke");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fill");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_opt_class();
    v12 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    v12 = 0;
  }
  v13 = objc_msgSend(v7, "isTextBox");
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == 202)
    v15 = 1;
  else
    v15 = v13;
  if ((v15 & 1) != 0 || v6 == 1 || v6 == 75 || ((v9 | v12) & 1) == 0)
  {
    -[WMOfficeArtMapper mapOfficeArtTextboxAt:withState:](self, "mapOfficeArtTextboxAt:withState:", v14, v41);
    if ((v12 & 1) != 0)
    {
      v32 = [CMBordersProperty alloc];
      objc_msgSend(v7, "stroke");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = -[CMBordersProperty initWithOADStroke:](v32, "initWithOADStroke:", v33);

      -[CMStyle addProperty:forKey:](self->super.mStyle, "addProperty:forKey:", v34, 0x24F3E6CF8);
    }
    if ((v9 & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v8, "color");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        mStyle = self->super.mStyle;
        +[CMColorProperty cssStringFromOADColor:](CMColorProperty, "cssStringFromOADColor:", v35);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[CMStyle appendPropertyForName:stringWithColons:](mStyle, "appendPropertyForName:stringWithColons:", 0x24F3E6CB8, v37);

        +[CMColorProperty transformedAlphaFromOADColor:](CMColorProperty, "transformedAlphaFromOADColor:", v35);
        if (v38 != 1.0)
          -[CMStyle appendPropertyForName:floatValue:](self->super.mStyle, "appendPropertyForName:floatValue:", 0x24F3E7018);

      }
    }
    -[CMMapper addStyleUsingGlobalCacheTo:style:](self, "addStyleUsingGlobalCacheTo:style:", v14, self->super.mStyle);
    objc_msgSend(v40, "addChild:", v14);
  }
  else
  {
    -[CMMapper addStyleUsingGlobalCacheTo:style:](self, "addStyleUsingGlobalCacheTo:style:", v14, self->super.mStyle);
    v43.receiver = self;
    v43.super_class = (Class)WMOfficeArtMapper;
    -[CMDrawableMapper mapShapeGraphicsAt:withState:](&v43, sel_mapShapeGraphicsAt_withState_, v14, v41);
    objc_msgSend(v40, "addChild:", v14);
    -[WDAContent textBox](self->mContent, "textBox");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      Width = CGRectGetWidth(self->super.mBox);

      if (Width > 0.0)
      {
        +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[WMOfficeArtMapper mapTextBoxAt:withState:](self, "mapTextBoxAt:withState:", v18, v41);
        v42.receiver = self;
        v42.super_class = (Class)WMOfficeArtMapper;
        -[CMDrawableMapper shapeTextBoxRect](&v42, sel_shapeTextBoxRect);
        v20 = v19;
        v22 = v21;
        v24 = v23;
        v26 = v25;
        v27 = objc_alloc_init(CMDrawableStyle);
        v28 = v20 - self->super.mBox.origin.x;
        v29 = v22 - self->super.mBox.origin.y;
        -[CMDrawableStyle addPositionUsingOffsets:](v27, "addPositionUsingOffsets:", v28, v29, v24, v26);
        objc_msgSend(v41, "totalPageHeight");
        v31 = v30;
        if (v26 + v29 > v31)
        {
          *(float *)&v31 = v26 + v29;
          objc_msgSend(v41, "setTotalPageHeight:", v31);
        }
        -[CMMapper addStyleUsingGlobalCacheTo:style:](self, "addStyleUsingGlobalCacheTo:style:", v18, v27);
        objc_msgSend(v14, "addChild:", v18);

      }
    }
  }

}

- (void)mapOfficeArtTextboxAt:(id)a3 withState:(id)a4
{
  id v6;
  void *v7;
  id WeakRetained;
  char isKindOfClass;
  CGFloat v10;
  double v11;
  CGFloat v12;
  WMSectionContentMapper *v13;
  void *v14;
  WMSectionContentMapper *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  -[WDAContent textBox](self->mContent, "textBox");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "nextTextBoxId"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super.super.mParent);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[WMOfficeArtMapper expandedSizeForTextBox:withState:](self, "expandedSizeForTextBox:withState:", v7, v6);
      v11 = v10;
      self->super.mBox.size.width = v12;
      self->super.mBox.size.height = v10;
      -[CMStyle appendPropertyForName:length:unit:](self->super.mStyle, "appendPropertyForName:length:unit:", 0x24F3C93F8, 1);
      -[CMStyle appendPropertyForName:length:unit:](self->super.mStyle, "appendPropertyForName:length:unit:", 0x24F3D5658, 1, v11);
    }
  }
  v13 = [WMSectionContentMapper alloc];
  objc_msgSend(v7, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[WMSectionContentMapper initWithWDText:parent:](v13, "initWithWDText:parent:", v14, self);

  -[WMSectionContentMapper mapAt:withState:](v15, "mapAt:withState:", v16, v6);
}

- (id)blipAtIndex:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *(_QWORD *)&a3;
  -[CMMapper root](self, "root");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "blipAtIndex:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)mapOfficeArtImageAt:(id)a3 withState:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CMDrawableStyle *v10;
  id v11;
  NSData *mImageBinaryData;
  uint64_t mResourceType;
  void *v14;
  objc_super v15;
  objc_super v16;

  v5 = a3;
  -[OADDrawable imageProperties](self->super.mDrawable, "imageProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageFill");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)WMOfficeArtMapper;
  -[CMDrawableMapper calculateUncroppedBox:](&v16, sel_calculateUncroppedBox_, v7);
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CMDrawableMapper isCropped](self, "isCropped") && self->super.mIsSupported)
  {
    +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(CMDrawableStyle);
    -[CMStyle appendPropertyForName:stringWithColons:](self->super.mStyle, "appendPropertyForName:stringWithColons:", 0x24F3D3BF8, CFSTR(":hidden;"));
    -[CMDrawableMapper uncroppedBox](self, "uncroppedBox");
    -[CMStyle appendPositionInfoFromRect:](v10, "appendPositionInfoFromRect:");
    -[CMMapper addStyleUsingGlobalCacheTo:style:](self, "addStyleUsingGlobalCacheTo:style:", v8, v10);
    objc_msgSend(v9, "addChild:", v8);

    v11 = v9;
  }
  else
  {
    v11 = v8;
  }
  if (self->super.mIsSupported)
  {
    mImageBinaryData = self->super.mImageBinaryData;
    mResourceType = self->super.mResourceType;
    v15.receiver = self;
    v15.super_class = (Class)WMOfficeArtMapper;
    -[CMDrawableMapper saveResourceAndReturnPath:withType:](&v15, sel_saveResourceAndReturnPath_withType_, mImageBinaryData, mResourceType);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMMapper addAttribute:toNode:value:](self, "addAttribute:toNode:value:", 0x24F3E6C78, v8, v14);

  }
  else
  {
    -[CMStyle appendDefaultBorderStyle](self->super.mStyle, "appendDefaultBorderStyle");
  }
  -[CMMapper addStyleUsingGlobalCacheTo:style:](self, "addStyleUsingGlobalCacheTo:style:", v11, self->super.mStyle);
  objc_msgSend(v5, "addChild:", v11);

}

- (void)mapOfficeArtGroupAt:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  OADDrawable *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  void *v14;
  WMOfficeArtMapper *v15;
  BOOL v16;
  void *v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = self->super.mDrawable;
  v9 = -[OADDrawable childCount](v8, "childCount");
  v10 = v9;
  if (self->mFloating || self->mIsInsideGroup)
  {
    v18 = v6;
    if (!v9)
      goto LABEL_7;
  }
  else
  {
    +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addChild:", v17);
    v18 = v17;

    -[CMMapper addStyleUsingGlobalCacheTo:style:](self, "addStyleUsingGlobalCacheTo:style:");
    -[OADDrawable logicalBounds](v8, "logicalBounds");

    if (!v10)
      goto LABEL_7;
  }
  v11 = 0;
  v12 = 0;
  v13 = 1;
  do
  {
    -[OADDrawable childAtIndex:](v8, "childAtIndex:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = -[WMOfficeArtMapper initWithOadDrawable:asFloating:parent:]([WMOfficeArtMapper alloc], "initWithOadDrawable:asFloating:parent:", v14, self->mFloating, self);
    -[WMOfficeArtMapper setIsInsideGroup:](v15, "setIsInsideGroup:", 1);
    -[WMOfficeArtMapper mapAt:withState:](v15, "mapAt:withState:", v18, v7);

    v11 = v13;
    v16 = v10 > v13++;
    v12 = v14;
  }
  while (v16);

LABEL_7:
}

- (void)setIsInsideGroup:(BOOL)a3
{
  self->mIsInsideGroup = a3;
}

- (CGSize)expandedSizeForTextBox:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  CGRect *p_mBox;
  double width;
  double height;
  uint64_t v11;
  float v12;
  float v13;
  void *v14;
  CMMapper **p_mParent;
  double v16;
  void *v17;
  id WeakRetained;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double x;
  int v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  uint64_t v37;
  CGSize result;

  v6 = a3;
  v7 = a4;
  p_mBox = &self->super.mBox;
  width = self->super.mBox.size.width;
  height = self->super.mBox.size.height;
  v11 = objc_msgSend(v7, "runIndex");
  objc_msgSend(v7, "pageOffset");
  v13 = v12;
  v37 = objc_msgSend(v6, "nextTextBoxId");
  v14 = 0;
  p_mParent = &self->super.super.mParent;
  v16 = v13;
LABEL_2:
  v17 = v14;
  while (1)
  {
    ++v11;
    WeakRetained = objc_loadWeakRetained((id *)p_mParent);
    objc_msgSend(WeakRetained, "runAtIndex:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      break;
    v17 = v14;
    if (objc_msgSend(v14, "runType") == 3)
    {
      objc_msgSend(v14, "drawable");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        objc_msgSend(v19, "clientData");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21 && v37 != objc_msgSend(v20, "id"))
        {
          v32 = 0;
        }
        else
        {
          objc_msgSend(v20, "clientData");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "bounds");
          v24 = v23;
          v26 = v25;
          v28 = v27;
          v30 = v29;

          x = v26 + v16;
          if (v26 + v16 == p_mBox->origin.y)
          {
            width = width + v28;
          }
          else
          {
            x = p_mBox->origin.x;
            if (v24 == p_mBox->origin.x)
              height = height + v30;
          }
          objc_msgSend(v21, "textBox", x);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v33;
          if (v33 && objc_msgSend(v33, "nextTextBoxId"))
          {
            v37 = objc_msgSend(v34, "nextTextBoxId");
            v32 = 0;
          }
          else
          {
            v32 = 3;
          }

        }
      }
      else
      {
        v32 = 2;
      }

      if (v32 != 3)
        goto LABEL_2;
      break;
    }
  }

  v35 = width;
  v36 = height;
  result.height = v36;
  result.width = v35;
  return result;
}

- (void)mapTextBoxAt:(id)a3 withState:(id)a4
{
  id v6;
  void *v7;
  WMSectionContentMapper *v8;
  void *v9;
  WMSectionContentMapper *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[WDAContent textBox](self->mContent, "textBox");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [WMSectionContentMapper alloc];
  objc_msgSend(v7, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[WMSectionContentMapper initWithWDText:parent:](v8, "initWithWDText:parent:", v9, self);

  -[WMSectionContentMapper mapAt:withState:](v10, "mapAt:withState:", v11, v6);
}

- (BOOL)isInsideGroup
{
  return self->mIsInsideGroup;
}

- (WMOfficeArtMapper)initWithOadDrawable:(id)a3 asFloating:(BOOL)a4 parent:(id)a5
{
  id v8;
  id v9;
  WMOfficeArtMapper *v10;
  WMOfficeArtMapper *v11;
  WDAContent *mContent;
  OADDrawable *mDrawable;
  objc_super v15;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)WMOfficeArtMapper;
  v10 = -[CMDrawableMapper initWithOadDrawable:parent:](&v16, sel_initWithOadDrawable_parent_, v8, v9);
  v11 = v10;
  if (v10)
  {
    mContent = v10->mContent;
    v10->mContent = 0;

    v11->mFloating = a4;
    v11->mIsMapped = 1;
    -[WMOfficeArtMapper setBoundingBox](v11, "setBoundingBox");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      mDrawable = v11->super.mDrawable;
      v15.receiver = v11;
      v15.super_class = (Class)WMOfficeArtMapper;
      -[CMDrawableMapper setWithOadImage:](&v15, sel_setWithOadImage_, mDrawable);
    }
  }

  return v11;
}

- (void)setCurrentPage:(unsigned int)a3
{
  self->mCurrentPage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mContent, 0);
}

- (void)mapDiagramAt:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CMDrawableStyle *v9;
  void *v10;
  CMDrawingContext *v11;
  OADOrientedBounds *v12;
  OADOrientedBounds *mOrientedBounds;
  CMDiagramMapper *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMStyle appendPropertyString:](self->super.mStyle, "appendPropertyString:", CFSTR("display:inline-block;"));
  -[CMMapper addStyleUsingGlobalCacheTo:style:](self, "addStyleUsingGlobalCacheTo:style:", v8, self->super.mStyle);
  objc_msgSend(v6, "addChild:", v8);
  v15 = v8;

  v9 = objc_alloc_init(CMDrawableStyle);
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMStyle appendPropertyString:](v9, "appendPropertyString:", CFSTR(" position:absolute;"));
  -[CMMapper addStyleUsingGlobalCacheTo:style:](self, "addStyleUsingGlobalCacheTo:style:", v10, v9);
  v11 = -[CMDrawingContext initWithFrame:]([CMDrawingContext alloc], "initWithFrame:", self->super.mBox.origin.x, self->super.mBox.origin.y, self->super.mBox.size.width, self->super.mBox.size.height);
  +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:", self->super.mBox.origin.x, self->super.mBox.origin.y, self->super.mBox.size.width, self->super.mBox.size.height);
  v12 = (OADOrientedBounds *)objc_claimAutoreleasedReturnValue();
  mOrientedBounds = self->super.mOrientedBounds;
  self->super.mOrientedBounds = v12;

  v14 = -[CMDiagramMapper initWithOddDiagram:drawingContext:orientedBounds:parent:]([CMDiagramMapper alloc], "initWithOddDiagram:drawingContext:orientedBounds:parent:", self->super.mDrawable, v11, self->super.mOrientedBounds, self);
  -[CMDiagramMapper mapAt:withState:](v14, "mapAt:withState:", v10, v7);
  -[CMDrawableMapper mapDrawingContext:at:relative:withState:](self, "mapDrawingContext:at:relative:withState:", v11, v15, 1, v7);
  objc_msgSend(v15, "addChild:", v10);
  +[WMParagraphMapper mapPlaceholderAt:rect:withState:](WMParagraphMapper, "mapPlaceholderAt:rect:withState:", v15, v7, self->super.mBox.origin.x, self->super.mBox.origin.y, self->super.mBox.size.width, self->super.mBox.size.height);

}

@end

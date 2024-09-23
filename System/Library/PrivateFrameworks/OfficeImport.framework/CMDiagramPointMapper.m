@implementation CMDiagramPointMapper

- (CMDiagramPointMapper)initWithPoint:(id)a3 drawingContext:(id)a4 orientedBounds:(id)a5 parent:(id)a6
{
  id v11;
  id v12;
  id v13;
  CMDiagramPointMapper *v14;
  CMDiagramPointMapper *v15;
  NSString *mPresentationName;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CMDiagramPointMapper;
  v14 = -[CMMapper initWithParent:](&v18, sel_initWithParent_, a6);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->mPoint, a3);
    objc_storeStrong((id *)&v15->mDrawingContext, a4);
    objc_storeStrong((id *)&v15->mOrientedBounds, a5);
    mPresentationName = v15->mPresentationName;
    v15->mPresentationName = 0;

  }
  return v15;
}

- (id)transformPresentationName
{
  return 0;
}

- (id)transformForPresentationWithName:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double Width;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect v22;
  CGRect v23;

  -[CMDiagramPointMapper presentationWithName:](self, "presentationWithName:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertySet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "customScaleX");
  v7 = v6;

  objc_msgSend(v4, "propertySet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "customScaleY");
  v10 = v9;

  objc_msgSend(MEMORY[0x24BDD1438], "transform");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scaleXBy:yBy:", v7, v10);
  objc_msgSend(v4, "propertySet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "customOffsetX");
  v14 = v13;
  -[OADOrientedBounds bounds](self->mOrientedBounds, "bounds");
  Width = CGRectGetWidth(v22);

  objc_msgSend(v4, "propertySet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "customOffsetY");
  v18 = v17;
  -[OADOrientedBounds bounds](self->mOrientedBounds, "bounds");
  v19 = v14 * Width;
  v20 = v18 * CGRectGetHeight(v23);

  objc_msgSend(v11, "translateXBy:yBy:", v19, v20);
  return v11;
}

- (id)presentationWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ODDPoint presentations](self->mPoint, "presentations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && objc_msgSend(v5, "count"))
    {
      if (v4)
      {
        objc_msgSend(v6, "objectEnumerator");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        while (1)
        {
          objc_msgSend(v7, "nextObject");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v8;
          if (!v8)
          {

            goto LABEL_12;
          }
          objc_msgSend(v8, "propertySet");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "presentationName");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v4, "isEqualToString:", v11);

          if (v12)
            break;

        }
      }
      else
      {
LABEL_12:
        objc_msgSend(v6, "objectAtIndex:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)plainText
{
  void *v2;
  void *v3;

  -[ODDPoint text](self->mPoint, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "plainText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  OADOrientedBounds *v10;
  void *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  -[CMDiagramPointMapper transformPresentationName](self, "transformPresentationName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[CMDiagramPointMapper transformForPresentationWithName:](self, "transformForPresentationWithName:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CMShapeUtils transformedBoundsWithBounds:transform:](CMShapeUtils, "transformedBoundsWithBounds:transform:", self->mOrientedBounds, v9);
    v10 = (OADOrientedBounds *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = self->mOrientedBounds;
  }
  -[CMDiagramPointMapper applyDiagramStyleToShapeProperties](self, "applyDiagramStyleToShapeProperties");
  -[CMDiagramPointMapper renderShapeAsBackgroundInBounds:](self, "renderShapeAsBackgroundInBounds:", v10);
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADOrientedBounds bounds](v10, "bounds");
  -[CMDiagramPointMapper mapStyledRectangle:at:withState:](self, "mapStyledRectangle:at:withState:", v11, v7);
  objc_msgSend(v6, "addChild:", v11);
  v12 = v11;

  -[CMDiagramPointMapper mapTextAt:withBounds:isCentered:includeChildren:withState:](self, "mapTextAt:withBounds:isCentered:includeChildren:withState:");
  -[CMDiagramPointMapper mapChlidrenAt:withState:](self, "mapChlidrenAt:withState:");

}

- (void)applyDiagramStyleToShapeProperties
{
  void *v3;
  void *v4;
  id v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CMDiagramPointMapper shapeStyle](self, "shapeStyle");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[CMDiagramPointMapper styleMatrix](self, "styleMatrix");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[ODDPoint shapeProperties](self->mPoint, "shapeProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "applyToGraphicProperties:styleMatrix:", v4, v3);

  }
}

- (id)shapeStyle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  -[CMDiagramPointMapper diagram](self, "diagram");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "styleDefinition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CMDiagramPointMapper presentationName](self, "presentationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMDiagramPointMapper presentationWithName:](self, "presentationWithName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "propertySet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentationStyleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "labelForName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "shapeStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CMDiagramPointMapper diagram](self, "diagram");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "colorTransform");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "labelForName:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "propertySet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "presentationStyleIndex");

    if (v13)
    {
      v16 = objc_msgSend(v10, "copy");

      v10 = (void *)v16;
      objc_msgSend(v13, "applyToShapeStyle:index:count:state:", v16, v15, 0, 0);
    }

  }
  return v10;
}

- (id)diagram
{
  uint64_t v2;
  void *v3;
  void *v4;

  -[CMMapper parent](self, "parent");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v3, "parent");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = v4;
      if (!v4)
        return v4;
    }
    objc_msgSend(v3, "diagram");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)presentationName
{
  NSString *mPresentationName;
  int v4;
  __CFString *v5;

  mPresentationName = self->mPresentationName;
  if (mPresentationName)
    return mPresentationName;
  v4 = -[ODDPoint type](self->mPoint, "type");
  v5 = CFSTR("node0");
  if (v4 == 2)
    v5 = CFSTR("node1");
  if (v4)
    return v5;
  else
    return CFSTR("asst0");
}

- (id)styleMatrix
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  -[CMMapper parent](self, "parent");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    while ((objc_opt_respondsToSelector() & 1) == 0)
    {
      objc_msgSend(v3, "parent");
      v4 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v4;
      if (!v4)
        goto LABEL_5;
    }
    objc_msgSend(v3, "styleMatrix");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_5:
    v5 = 0;
  }
  return v5;
}

- (void)mapStyledRectangle:(CGRect)a3 at:(id)a4 withState:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  CMDrawableStyle *v13;
  void *v14;
  void *v15;
  void *v16;
  CMBordersProperty *v17;
  void *v18;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v12 = a5;
  v13 = objc_alloc_init(CMDrawableStyle);
  -[CMDrawableStyle addPositionProperties:](v13, "addPositionProperties:", x, y, width, height);
  -[CMDiagramPointMapper applyDiagramStyleToShapeProperties](self, "applyDiagramStyleToShapeProperties");
  -[CMDiagramPointMapper fill](self, "fill");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMColorProperty nsColorFromOADFill:state:](CMColorProperty, "nsColorFromOADFill:state:", v14, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[CMStyle appendPropertyForName:color:](v13, "appendPropertyForName:color:", 0x24F3E6CB8, v15);
  -[CMDiagramPointMapper stroke](self, "stroke");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = [CMBordersProperty alloc];
  -[CMBordersProperty setFromOadStroke:atLocation:state:](v17, "setFromOadStroke:atLocation:state:", v16, 0, v12);
  -[CMBordersProperty cssString](v17, "cssString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMStyle appendPropertyString:](v13, "appendPropertyString:", v18);

  v19.receiver = self;
  v19.super_class = (Class)CMDiagramPointMapper;
  -[CMMapper addStyleUsingGlobalCacheTo:style:](&v19, sel_addStyleUsingGlobalCacheTo_style_, v11, v13);

}

- (id)fill
{
  void *v3;
  void *v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ODDPoint shapeProperties](self->mPoint, "shapeProperties");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fill");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)stroke
{
  void *v3;
  void *v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ODDPoint shapeProperties](self->mPoint, "shapeProperties");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stroke");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)mapTextAt:(id)a3 withBounds:(id)a4 isCentered:(BOOL)a5 includeChildren:(BOOL)a6 withState:(id)a7
{
  _BOOL8 v8;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  CMStyle *v16;
  CMStyle *v17;
  void *v18;
  objc_super v19;
  objc_super v20;

  v8 = a5;
  v11 = a3;
  v12 = a4;
  v13 = a7;
  -[CMDiagramPointMapper baseTextListStyleWithBounds:isCentered:](self, "baseTextListStyleWithBounds:isCentered:", v12, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addChild:", v18);
    v15 = v18;

    v16 = objc_alloc_init(CMStyle);
    -[CMStyle appendPropertyForName:stringValue:](v16, "appendPropertyForName:stringValue:", 0x24F3E6F18, CFSTR("table"));
    objc_msgSend(v12, "bounds");
    -[CMStyle appendSizeInfoFromRect:](v16, "appendSizeInfoFromRect:");
    v20.receiver = self;
    v20.super_class = (Class)CMDiagramPointMapper;
    -[CMMapper addStyleUsingGlobalCacheTo:style:](&v20, sel_addStyleUsingGlobalCacheTo_style_, v15, v16);
    +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc_init(CMStyle);
    -[CMStyle appendPropertyForName:stringValue:](v17, "appendPropertyForName:stringValue:", 0x24F3E6F18, CFSTR("table-cell"));
    -[CMStyle appendPropertyForName:stringValue:](v17, "appendPropertyForName:stringValue:", 0x24F3E6698, 0x24F3D6018);
    v19.receiver = self;
    v19.super_class = (Class)CMDiagramPointMapper;
    -[CMMapper addStyleUsingGlobalCacheTo:style:](&v19, sel_addStyleUsingGlobalCacheTo_style_, v11, v17);
    objc_msgSend(v15, "addChild:", v11);

  }
  -[CMDiagramPointMapper mapPointTextAt:style:level:withState:](self, "mapPointTextAt:style:level:withState:", v11, v14, 0, v13);

}

- (id)baseTextListStyleWithBounds:(id)a3 isCentered:(BOOL)a4
{
  _BOOL4 v4;
  OADTextListStyle *v6;
  float v7;
  float v8;
  _BOOL8 v9;
  void *v10;
  uint64_t i;
  void *v12;
  double v13;
  double v14;
  double v15;
  OADCharacterBulletProperties *v16;

  v4 = a4;
  v6 = objc_alloc_init(OADTextListStyle);
  -[CMDiagramPointMapper defaultFontSize](self, "defaultFontSize");
  v8 = v7;
  v9 = 0;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = 1;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &HUChDisc, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = -1; i != 8; ++i)
  {
    -[OADTextListStyle propertiesForListLevel:](v6, "propertiesForListLevel:", i + 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v13 = v8;
    objc_msgSend(v12, "setSize:", v13);
    objc_msgSend(v12, "setAlign:", v9);
    if (i != -1)
    {
      v8 = v8 * 0.8;
      if (i)
      {
        v14 = v8 * 0.8 * (double)i;
        *(float *)&v14 = v14;
        objc_msgSend(v12, "setLeftMargin:", v14);
        *(float *)&v15 = v8;
        objc_msgSend(v12, "setIndent:", v15);
      }
      v16 = -[OADCharacterBulletProperties initWithBullet:]([OADCharacterBulletProperties alloc], "initWithBullet:", v10);
      objc_msgSend(v12, "setBulletProperties:", v16);

    }
  }

  return v6;
}

- (float)defaultFontSize
{
  void *v2;
  float v3;
  uint64_t v4;
  float v5;

  -[CMMapper parent](self, "parent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0.0;
  if (v2)
  {
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v2, "parent");
      v4 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v4;
      if (!v4)
        goto LABEL_6;
    }
    objc_msgSend(v2, "defaultFontSize");
    v3 = v5;
  }
LABEL_6:

  return v3;
}

- (void)mapPointTextAt:(id)a3 style:(id)a4 level:(int)a5 withState:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  PMState *v18;
  uint64_t i;
  void *v20;
  PMParagraphMapper *v21;
  void *v22;
  id v23;

  v7 = *(_QWORD *)&a5;
  v23 = a3;
  v10 = a4;
  v11 = a6;
  -[ODDPoint text](self->mPoint, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[CMDiagramPointMapper shapeStyle](self, "shapeStyle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "applyToTextBody:", v12);
    v13 = objc_msgSend(v12, "paragraphCount");
    if (v13)
    {
      v14 = 0;
      do
      {
        objc_msgSend(v12, "paragraphAtIndex:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "properties");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setLevel:", v7);
        objc_msgSend(v10, "propertiesForListLevel:", (int)objc_msgSend(v16, "level"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setParent:", v17);

        ++v14;
      }
      while (v13 != v14);
    }
    v18 = objc_alloc_init(PMState);
    -[CMState copyFromCMStateWithoutComponents:](v18, "copyFromCMStateWithoutComponents:", v11);
    if (v13)
    {
      for (i = 0; i != v13; ++i)
      {
        objc_msgSend(v12, "paragraphAtIndex:", i);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[PMParagraphMapper initWithOadParagraph:parent:]([PMParagraphMapper alloc], "initWithOadParagraph:parent:", v20, self);
        -[PMParagraphMapper mapAt:withState:isFirstParagraph:](v21, "mapAt:withState:isFirstParagraph:", v23, v18, i == 0);

      }
    }

  }
}

- (void)mapSiblingTextAt:(id)a3 style:(id)a4 level:(int)a5 withState:(id)a6
{
  uint64_t v7;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t i;
  void *v15;
  CMDiagramPointMapper *v16;
  id v17;
  id v18;

  v7 = *(_QWORD *)&a5;
  v18 = a3;
  v10 = a4;
  v17 = a6;
  -[CMDiagramPointMapper mapPointTextAt:style:level:withState:](self, "mapPointTextAt:style:level:withState:", v18, v10, v7);
  -[ODDPoint parent](self->mPoint, "parent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "children");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "count");
  if (v13 >= 2)
  {
    for (i = 1; i != v13; ++i)
    {
      objc_msgSend(v12, "objectAtIndex:", i);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[CMDiagramPointMapper initWithPoint:drawingContext:orientedBounds:parent:]([CMDiagramPointMapper alloc], "initWithPoint:drawingContext:orientedBounds:parent:", v15, self->mDrawingContext, self->mOrientedBounds, self);
      -[CMDiagramPointMapper mapChildrenTextAt:style:level:withState:](v16, "mapChildrenTextAt:style:level:withState:", v18, v10, v7, v17);

    }
  }

}

- (void)mapChildrenTextAt:(id)a3 style:(id)a4 level:(int)a5 withState:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  CMDiagramPointMapper *v17;
  id v18;

  v7 = *(_QWORD *)&a5;
  v18 = a3;
  v10 = a4;
  v11 = a6;
  -[CMDiagramPointMapper mapPointTextAt:style:level:withState:](self, "mapPointTextAt:style:level:withState:", v18, v10, v7, v11);
  -[ODDPoint children](self->mPoint, "children");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  if (v13)
  {
    v14 = 0;
    v15 = (v7 + 1);
    do
    {
      objc_msgSend(v12, "objectAtIndex:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[CMDiagramPointMapper initWithPoint:drawingContext:orientedBounds:parent:]([CMDiagramPointMapper alloc], "initWithPoint:drawingContext:orientedBounds:parent:", v16, self->mDrawingContext, self->mOrientedBounds, self);
      -[CMDiagramPointMapper mapChildrenTextAt:style:level:withState:](v17, "mapChildrenTextAt:style:level:withState:", v18, v10, v15, v11);

      ++v14;
    }
    while (v13 != v14);
  }

}

- (void)setPresentationName:(id)a3
{
  objc_storeStrong((id *)&self->mPresentationName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mPresentationName, 0);
  objc_storeStrong((id *)&self->mOrientedBounds, 0);
  objc_storeStrong((id *)&self->mDrawingContext, 0);
  objc_storeStrong((id *)&self->mPoint, 0);
}

@end

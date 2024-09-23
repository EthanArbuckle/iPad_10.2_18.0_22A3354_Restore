@implementation PMDrawableMapper

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  CMDrawingContext *v12;
  CMDrawingContext *v13;
  PMTableMapper *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CMDrawableStyle *v28;
  objc_super v29;
  objc_super v30;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "childrenCount");
  if (self->mDrawingContext)
  {
    v9 = 0;
  }
  else
  {
    +[CMGlobalCache drawableElementCache](CMGlobalCache, "drawableElementCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self->super.mDrawable);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[PMDrawableMapper mapBounds](self, "mapBounds");
  if (!self->mDrawingContext)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      -[PMDrawableMapper setTopLevelMapper:](self, "setTopLevelMapper:", 1);
      v12 = [CMDrawingContext alloc];
      -[OADOrientedBounds bounds](self->super.mOrientedBounds, "bounds");
      v13 = -[CMDrawingContext initWithFrame:](v12, "initWithFrame:");
      -[CMDrawingContext setMapper:](v13, "setMapper:", self);
      -[PMDrawableMapper setDrawingContext:](self, "setDrawingContext:", v13);

    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PMDrawableMapper mapOfficeArtImageAt:withState:](self, "mapOfficeArtImageAt:withState:", v6, v7);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PMDrawableMapper mapDiagramAt:withState:](self, "mapDiagramAt:withState:", v6, v7);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[PMDrawableMapper mapOfficeArtShapeAt:withState:](self, "mapOfficeArtShapeAt:withState:", v6, v7);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[PMDrawableMapper mapOfficeArtGroupAt:withState:](self, "mapOfficeArtGroupAt:withState:", v6, v7);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = -[PMTableMapper initWithOadTable:bounds:parent:]([PMTableMapper alloc], "initWithOadTable:bounds:parent:", self->super.mDrawable, self->super.mOrientedBounds, self);
            -[PMTableMapper mapAt:withState:](v14, "mapAt:withState:", v6, v7);

          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[PMDrawableMapper mapChartAt:withState:](self, "mapChartAt:withState:", v6, v7);
          }
        }
      }
    }
  }
  if (v9)
  {
    objc_msgSend(v6, "addChild:", v9);
  }
  else if (-[PMDrawableMapper isTopLevelMapper](self, "isTopLevelMapper"))
  {
    v15 = -[CMDrawingContext copyPDF](self->mDrawingContext, "copyPDF");
    if (v15)
    {
      +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 9);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "insertChild:atIndex:", v9, v8);
      +[CMGlobalCache drawableElementCache](CMGlobalCache, "drawableElementCache");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self->super.mDrawable);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKey:", v9, v17);

      v30.receiver = self;
      v30.super_class = (Class)PMDrawableMapper;
      -[CMMapper archiver](&v30, sel_archiver);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addResourceForDrawable:withType:drawable:", v15, 7, self->super.mDrawable);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMMapper addAttribute:toNode:value:](self, "addAttribute:toNode:value:", 0x24F3E6C78, v9, v19);
      -[CMDrawingContext pdfFrame](self->mDrawingContext, "pdfFrame");
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v27 = v26;
      v28 = objc_alloc_init(CMDrawableStyle);
      -[CMDrawableStyle addPositionProperties:](v28, "addPositionProperties:", v21, v23, v25, v27);
      v29.receiver = self;
      v29.super_class = (Class)PMDrawableMapper;
      -[CMMapper addStyleUsingGlobalCacheTo:style:embedStyle:](&v29, sel_addStyleUsingGlobalCacheTo_style_embedStyle_, v9, v28, 1);

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

}

- (void)mapBounds
{
  OADOrientedBounds *v3;
  OADOrientedBounds *mOrientedBounds;
  OADOrientedBounds *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  OADOrientedBounds *v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;

  +[OAITOrientedBounds relativeOrientedBoundsOfDrawable:](OAITOrientedBounds, "relativeOrientedBoundsOfDrawable:", self->super.mDrawable);
  v3 = (OADOrientedBounds *)objc_claimAutoreleasedReturnValue();
  mOrientedBounds = self->super.mOrientedBounds;
  self->super.mOrientedBounds = v3;

  -[OADOrientedBounds rotation](self->super.mOrientedBounds, "rotation");
  if (+[OADOrientedBounds directionCloserToVerticalThanToHorizontal:](OADOrientedBounds, "directionCloserToVerticalThanToHorizontal:"))
  {
    v5 = self->super.mOrientedBounds;
    -[OADOrientedBounds bounds](v5, "bounds");
    -[OADOrientedBounds setBounds:](v5, "setBounds:", NSTransposedRectWithSameCenter(v6, v7, v8, v9));
  }
  v10 = self->super.mOrientedBounds;
  if (v10)
  {
    -[OADOrientedBounds bounds](v10, "bounds");
    self->super.mBox.origin.x = v11;
    self->super.mBox.origin.y = v12;
    self->super.mBox.size.width = v13;
    self->super.mBox.size.height = v14;
  }
}

- (void)setTopLevelMapper:(BOOL)a3
{
  self->mTopLevelMapper = a3;
}

- (void)setDrawingContext:(id)a3
{
  objc_storeStrong((id *)&self->mDrawingContext, a3);
}

- (void)mapOfficeArtShapeAt:(id)a3 withState:(id)a4
{
  id v6;
  OADShape **p_mShape;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  char v13;
  float v14;
  float v15;
  float v16;
  float v17;
  void *v18;
  float v19;
  BOOL v20;
  void *v21;
  void *v22;
  char v23;
  double v24;
  double v25;
  void *v26;
  CMDrawableStyle *mStyle;
  CMDrawableStyle *v28;
  PMShapeTextMapper *v29;
  void *v30;
  PMShapeTextMapper *v31;
  void *v32;
  id v33;
  objc_super v34;

  v33 = a3;
  v6 = a4;
  p_mShape = &self->mShape;
  objc_storeStrong((id *)&self->mShape, self->super.mDrawable);
  v8 = -[OADShape type](self->mShape, "type");
  -[OADShape shapeProperties](self->mShape, "shapeProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "orientedBounds");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fill");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isTextBox");
  if (v8 == 202)
    v13 = 1;
  else
    v13 = v12;
  objc_msgSend(v10, "rotation");
  v15 = v14;
  objc_msgSend(v11, "alpha");
  v17 = v16;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "color");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[CMColorProperty transformedAlphaFromOADColor:](CMColorProperty, "transformedAlphaFromOADColor:", v18);
    v17 = v17 * v19;

  }
  if (((v13 & 1) != 0 || v8 == 75 || v8 == 1)
    && (v15 == 0.0 ? (v20 = v17 == 1.0) : (v20 = 0),
        v20 && -[PMDrawableMapper isTopLevelMapper](self, "isTopLevelMapper")))
  {
    -[PMDrawableMapper mapRectangularShapeAt:withState:](self, "mapRectangularShapeAt:withState:", v33, v6);
  }
  else
  {
    -[PMDrawableMapper mapShapeAsBackgroundAt:withState:](self, "mapShapeAsBackgroundAt:withState:", v33, v6);
    -[OADShape textBody](*p_mShape, "textBody");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      -[OADShape textBody](*p_mShape, "textBody");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isEmpty");

      if ((v23 & 1) == 0)
      {
        +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[PMDrawableMapper shapeTextBoxWithState:](self, "shapeTextBoxWithState:", v6);
        if (v25 <= 0.0 || v24 <= 0.0)
        {
          objc_msgSend(v10, "bounds");
          -[PMDrawableMapper transformRectToPage:](self, "transformRectToPage:");
        }
        else
        {
          -[PMDrawableMapper transformRectToPage:](self, "transformRectToPage:");
        }
        +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        mStyle = self->super.mStyle;
        objc_msgSend(v26, "bounds");
        -[CMDrawableStyle addPositionProperties:](mStyle, "addPositionProperties:");
        objc_msgSend(v33, "addChild:", v32);
        v28 = self->super.mStyle;
        v34.receiver = self;
        v34.super_class = (Class)PMDrawableMapper;
        -[CMMapper addStyleUsingGlobalCacheTo:style:embedStyle:](&v34, sel_addStyleUsingGlobalCacheTo_style_embedStyle_, v32, v28, 1);
        v29 = [PMShapeTextMapper alloc];
        -[OADShape textBody](*p_mShape, "textBody");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = -[PMShapeTextMapper initWithOadTextBody:bounds:parent:](v29, "initWithOadTextBody:bounds:parent:", v30, v26, self);

        -[PMShapeTextMapper mapAt:withState:](v31, "mapAt:withState:", v32, v6);
      }
    }
  }

}

- (BOOL)isTopLevelMapper
{
  return self->mTopLevelMapper;
}

- (void)mapRectangularShapeAt:(id)a3 withState:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  CMDrawableStyle *mStyle;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  CMBordersProperty *v14;
  void *v15;
  CMBordersProperty *v16;
  CMImageFillMapper *v17;
  CMImageFillMapper *v18;
  void *v19;
  CMDrawableStyle *v20;
  PMShapeTextMapper *v21;
  void *v22;
  PMShapeTextMapper *v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  -[OADShape shapeProperties](self->mShape, "shapeProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "orientedBounds");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  -[PMDrawableMapper transformRectToPage:](self, "transformRectToPage:");
  +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  mStyle = self->super.mStyle;
  objc_msgSend(v8, "bounds");
  -[CMDrawableStyle addPositionProperties:](mStyle, "addPositionProperties:");
  objc_msgSend(v6, "fill");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_opt_class();
    v11 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v6, "stroke");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fill");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = [CMBordersProperty alloc];
      objc_msgSend(v6, "stroke");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[CMBordersProperty initWithOADStroke:](v14, "initWithOADStroke:", v15);

      -[CMStyle addProperty:forKey:](self->super.mStyle, "addProperty:forKey:", v16, 0x24F3E6CF8);
    }
  }
  if ((v11 & 1) != 0)
  {
    v17 = [CMImageFillMapper alloc];
    -[OADOrientedBounds bounds](self->super.mOrientedBounds, "bounds");
    v18 = -[CMImageFillMapper initWithOadFill:bounds:parent:](v17, "initWithOadFill:bounds:parent:", v10, self);
    -[CMImageFillMapper mapNonImageFillAt:toStyle:withState:](v18, "mapNonImageFillAt:toStyle:withState:", v25, self->super.mStyle, v24);

  }
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addChild:", v19);
  v20 = self->super.mStyle;
  v26.receiver = self;
  v26.super_class = (Class)PMDrawableMapper;
  -[CMMapper addStyleUsingGlobalCacheTo:style:embedStyle:](&v26, sel_addStyleUsingGlobalCacheTo_style_embedStyle_, v19, v20, 1);
  v21 = [PMShapeTextMapper alloc];
  -[OADShape textBody](self->mShape, "textBody");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[PMShapeTextMapper initWithOadTextBody:bounds:parent:](v21, "initWithOadTextBody:bounds:parent:", v22, v8, self);

  -[PMShapeTextMapper setRectangular:](v23, "setRectangular:", 1);
  -[PMShapeTextMapper mapAt:withState:](v23, "mapAt:withState:", v19, v24);

}

- (CGRect)transformRectToPage:(CGRect)result
{
  CMDrawingContext *mDrawingContext;

  mDrawingContext = self->mDrawingContext;
  if (mDrawingContext)
    -[CMDrawingContext transformRectToPage:](mDrawingContext, "transformRectToPage:", result.origin.x, result.origin.y, result.size.width, result.size.height);
  return result;
}

- (void)mapOfficeArtImageAt:(id)a3 withState:(id)a4
{
  OADDrawable *v6;
  void *v7;
  void *v8;
  CMImageFillMapper *v9;
  CMImageFillMapper *v10;
  id v11;
  CMDrawableStyle *v12;
  CMDrawableStyle *mStyle;
  void *v14;
  CMDrawableStyle *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v18 = a3;
  v19 = a4;
  v6 = self->super.mDrawable;
  -[OADDrawable movie](v6, "movie");

  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADDrawable imageProperties](self->super.mDrawable, "imageProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "hasImageFill") & 1) != 0)
  {
    objc_msgSend(v8, "imageFill");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = [CMImageFillMapper alloc];
    -[OADOrientedBounds bounds](self->super.mOrientedBounds, "bounds");
    -[PMDrawableMapper transformRectToPage:](self, "transformRectToPage:");
    v10 = -[CMImageFillMapper initWithOadFill:bounds:parent:](v9, "initWithOadFill:bounds:parent:", v17, self);
    if (-[CMImageFillMapper isCropped](v10, "isCropped"))
    {
      +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = objc_alloc_init(CMDrawableStyle);
      -[CMStyle appendPropertyForName:stringWithColons:](self->super.mStyle, "appendPropertyForName:stringWithColons:", 0x24F3D3BF8, CFSTR(":hidden;"));
      -[CMImageFillMapper uncroppedBox](v10, "uncroppedBox");
      -[CMDrawableStyle addPositionProperties:](v12, "addPositionProperties:");
      -[CMMapper addStyleUsingGlobalCacheTo:style:embedStyle:](self, "addStyleUsingGlobalCacheTo:style:embedStyle:", v7, v12, 1);
      objc_msgSend(v11, "addChild:", v7);
      mStyle = self->super.mStyle;
      objc_msgSend(v8, "orientedBounds");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bounds");
      -[PMDrawableMapper transformRectToPage:](self, "transformRectToPage:");
      -[CMDrawableStyle addPositionProperties:](mStyle, "addPositionProperties:");

    }
    else
    {
      v11 = v7;
      v15 = self->super.mStyle;
      objc_msgSend(v8, "orientedBounds");
      v12 = (CMDrawableStyle *)objc_claimAutoreleasedReturnValue();
      -[CMDrawableStyle bounds](v12, "bounds");
      -[PMDrawableMapper transformRectToPage:](self, "transformRectToPage:");
      -[CMDrawableStyle addPositionProperties:](v15, "addPositionProperties:");
    }

    -[CMImageFillMapper mapImageFill:withState:](v10, "mapImageFill:withState:", v7, v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      -[CMMapper addAttribute:toNode:value:](self, "addAttribute:toNode:value:", 0x24F3E6C78, v7, v16);
    else
      -[CMStyle appendPropertyForName:stringWithColons:](self->super.mStyle, "appendPropertyForName:stringWithColons:", 0x24F3E6CF8, CFSTR(":1px solid black;"));
    -[CMMapper addStyleUsingGlobalCacheTo:style:embedStyle:](self, "addStyleUsingGlobalCacheTo:style:embedStyle:", v11, self->super.mStyle, 1);
    objc_msgSend(v18, "addChild:", v11);

  }
  else
  {
    v11 = 0;
  }

}

- (void)mapShapeAsBackgroundAt:(id)a3 withState:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  __int128 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  char isKindOfClass;
  void *v19;
  id v20;
  _OWORD v21[2];

  v20 = a4;
  v5 = -[OADShape type](self->mShape, "type");
  if (!(_DWORD)v5)
  {
    if (+[CMShapeUtils isShapeALine:](CMShapeUtils, "isShapeALine:", self->mShape))
      v5 = 20;
    else
      v5 = 0;
  }
  -[OADShape shapeProperties](self->mShape, "shapeProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "orientedBounds");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
  v21[0] = *MEMORY[0x24BDBF090];
  v21[1] = v8;
  switch((int)v5)
  {
    case 0:
      -[OADShape geometry](self->mShape, "geometry");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        -[OADShape geometry](self->mShape, "geometry");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PMDrawableMapper mapFreeForm:orientedBounds:transformedBounds:state:](self, "mapFreeForm:orientedBounds:transformedBounds:state:", v19, v7, v21, v20);

      }
      goto LABEL_8;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 15:
    case 16:
    case 22:
    case 47:
    case 55:
    case 56:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
    case 63:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 92:
    case 96:
    case 97:
    case 99:
    case 106:
    case 110:
      goto LABEL_6;
    case 14:
    case 17:
    case 18:
    case 19:
    case 21:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 57:
    case 64:
    case 65:
    case 71:
    case 72:
    case 73:
    case 74:
    case 84:
    case 85:
    case 86:
    case 87:
    case 88:
    case 89:
    case 90:
    case 91:
    case 93:
    case 94:
    case 95:
    case 98:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 107:
    case 108:
    case 109:
      goto LABEL_8;
    case 20:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
      -[OADShape shapeProperties](self->mShape, "shapeProperties");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stroke");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADShape geometry](self->mShape, "geometry");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "adjustValues");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[CMShapeRenderer renderLine:stroke:adjustValues:orientedBounds:state:drawingContext:](CMShapeRenderer, "renderLine:stroke:adjustValues:orientedBounds:state:drawingContext:", v5, v10, v15, v7, v20, self->mDrawingContext);

      goto LABEL_7;
    default:
      if ((v5 - 176) > 0x23 || ((1 << (v5 + 80)) & 0xF04000841) == 0)
        goto LABEL_8;
LABEL_6:
      -[OADShape shapeProperties](self->mShape, "shapeProperties");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "fill");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADShape shapeProperties](self->mShape, "shapeProperties");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stroke");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADShape geometry](self->mShape, "geometry");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "adjustValues");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[CMShapeRenderer renderCanonicalShape:fill:stroke:adjustValues:orientedBounds:state:drawingContext:](CMShapeRenderer, "renderCanonicalShape:fill:stroke:adjustValues:orientedBounds:state:drawingContext:", v5, v10, v12, v14, v7, v20, self->mDrawingContext);

LABEL_7:
LABEL_8:

      return;
  }
}

- (CGRect)shapeTextBoxWithState:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  float v16;
  float v17;
  double v18;
  float v19;
  double width;
  float v21;
  double x;
  float v23;
  float v24;
  double v25;
  double y;
  float v27;
  double v28;
  double height;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGRect result;

  v4 = a3;
  -[OADShape geometry](self->mShape, "geometry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
LABEL_5:
    v7 = v6;
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "sourceFormat") == 5)
  {
    objc_msgSend(v5, "equivalentCustomGeometry");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend(v5, "equivalentCustomGeometry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMShapeUtils setCoordSpaceForCustomeGeometry:fromSize:](CMShapeUtils, "setCoordSpaceForCustomeGeometry:fromSize:", self->super.mBox.size.width, self->super.mBox.size.height);
LABEL_7:
  if (objc_msgSend(v7, "textBodyRectCount"))
  {
    objc_msgSend(v7, "textBodyRectAtIndex:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CMShapeUtils mapAdjustCoord:geometry:](CMShapeUtils, "mapAdjustCoord:geometry:", objc_msgSend(v8, "left"), v7);
    v10 = v9;
    +[CMShapeUtils mapAdjustCoord:geometry:](CMShapeUtils, "mapAdjustCoord:geometry:", objc_msgSend(v8, "right"), v7);
    v12 = v11;
    +[CMShapeUtils mapAdjustCoord:geometry:](CMShapeUtils, "mapAdjustCoord:geometry:", objc_msgSend(v8, "top"), v7);
    v14 = v13;
    +[CMShapeUtils mapAdjustCoord:geometry:](CMShapeUtils, "mapAdjustCoord:geometry:", objc_msgSend(v8, "bottom"), v7);
    v15 = v10;
    v16 = v12;
    v17 = v14;
    v19 = v18;
    if (objc_msgSend(v7, "isEscher"))
    {
      if (v7)
        objc_msgSend(v7, "geometryCoordSpace");
      width = self->super.mBox.size.width;
      v21 = width / 21600.0;
      x = self->super.mBox.origin.x + (float)(v15 * v21);
      v23 = self->super.mBox.size.height / 21600.0;
      v24 = (float)(v16 - v15) * v21;
      if (v24 > 0.0)
        width = -0.0;
      v25 = width + v24;
      y = self->super.mBox.origin.y + (float)(v17 * v23);
      v27 = (float)(v19 - v17) * v23;
      v28 = v27;
      if (v27 <= 0.0)
        height = self->super.mBox.size.height;
      else
        height = -0.0;
      v30 = height + v28;
    }
    else
    {
      y = self->super.mBox.origin.y + v17;
      v30 = (float)(v19 - v17);
      x = self->super.mBox.origin.x + v15;
      v25 = (float)(v16 - v15);
    }

  }
  else
  {
    x = self->super.mBox.origin.x;
    y = self->super.mBox.origin.y;
    v25 = self->super.mBox.size.width;
    v30 = self->super.mBox.size.height;
  }

  v31 = x;
  v32 = y;
  v33 = v25;
  v34 = v30;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (void)mapOfficeArtGroupAt:(id)a3 withState:(id)a4
{
  id v6;
  OADDrawable *v7;
  unint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  unsigned int v21;
  void *v22;
  PMDrawableMapper *v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a3;
  v6 = a4;
  v7 = self->super.mDrawable;
  v8 = -[OADDrawable childCount](v7, "childCount");
  -[OADDrawable logicalBounds](v7, "logicalBounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  +[OAITOrientedBounds relativeOrientedBoundsOfDrawable:](OAITOrientedBounds, "relativeOrientedBoundsOfDrawable:", v7);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMShapeUtils transformFromBounds:toOrientedBounds:](CMShapeUtils, "transformFromBounds:toOrientedBounds:", v27, v10, v12, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PMDrawableMapper drawingContext](self, "drawingContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addTransform:", v17);

  if (v8)
  {
    v19 = 0;
    v20 = 0;
    v21 = 1;
    do
    {
      -[OADDrawable childAtIndex:](v7, "childAtIndex:", v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v22, "hidden") & 1) == 0)
      {
        v23 = -[CMDrawableMapper initWithOadDrawable:parent:]([PMDrawableMapper alloc], "initWithOadDrawable:parent:", v22, self);
        -[PMDrawableMapper drawingContext](self, "drawingContext");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[PMDrawableMapper setDrawingContext:](v23, "setDrawingContext:", v24);

        -[PMDrawableMapper mapAt:withState:](v23, "mapAt:withState:", v28, v6);
      }
      v19 = v21;
      v25 = v8 > v21++;
      v20 = v22;
    }
    while (v25);
  }
  else
  {
    v22 = 0;
  }
  -[PMDrawableMapper drawingContext](self, "drawingContext", v19);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "restoreLastTransform");

}

- (id)drawingContext
{
  return self->mDrawingContext;
}

- (void)mapFreeForm:(id)a3 orientedBounds:(id)a4 transformedBounds:(CGRect *)a5 state:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v9 = a4;
  v10 = a6;
  if (objc_msgSend(v15, "pathCount"))
  {
    -[OADShape shapeProperties](self->mShape, "shapeProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fill");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADShape shapeProperties](self->mShape, "shapeProperties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stroke");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[CMShapeRenderer renderFreeForm:fill:stroke:orientedBounds:state:drawingContext:](CMShapeRenderer, "renderFreeForm:fill:stroke:orientedBounds:state:drawingContext:", v15, v12, v14, v9, v10, self->mDrawingContext);

  }
}

- (void)mapDiagramAt:(id)a3 withState:(id)a4
{
  id v6;
  CMDiagramMapper *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = -[CMDiagramMapper initWithOddDiagram:drawingContext:orientedBounds:parent:]([CMDiagramMapper alloc], "initWithOddDiagram:drawingContext:orientedBounds:parent:", self->super.mDrawable, self->mDrawingContext, self->super.mOrientedBounds, self);
  -[CMDiagramMapper mapAt:withState:](v7, "mapAt:withState:", v8, v6);

}

- (void)mapChartAt:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  EMChartMapper *v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v8 = -[EMChartMapper initWithChart:parent:]([EMChartMapper alloc], "initWithChart:parent:", self->super.mDrawable, self);
  -[OADOrientedBounds bounds](self->super.mOrientedBounds, "bounds");
  v11 = -[EMChartMapper copyPdfWithState:withSize:](v8, "copyPdfWithState:withSize:", v7, v9, v10);
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v14.receiver = self;
    v14.super_class = (Class)PMDrawableMapper;
    -[CMDrawableMapper saveResourceAndReturnPath:withType:](&v14, sel_saveResourceAndReturnPath_withType_, v11, 7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMMapper addAttribute:toNode:value:](self, "addAttribute:toNode:value:", 0x24F3E6C78, v12, v13);

  }
  else
  {
    -[CMStyle appendPropertyForName:stringWithColons:](self->super.mStyle, "appendPropertyForName:stringWithColons:", 0x24F3E6CF8, CFSTR(": 1px solid black;"));
  }
  objc_msgSend(v6, "addChild:", v12);
  -[CMDrawableStyle addPositionProperties:](self->super.mStyle, "addPositionProperties:", self->super.mBox.origin.x, self->super.mBox.origin.y, self->super.mBox.size.width, self->super.mBox.size.height);
  -[CMMapper addStyleUsingGlobalCacheTo:style:embedStyle:](self, "addStyleUsingGlobalCacheTo:style:embedStyle:", v12, self->super.mStyle, 1);

}

- (CGRect)slideRect
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  -[CMMapper root](self, "root");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "slideSize");
    v4 = v3;
    v6 = v5;
    v7 = 0.0;
    v8 = 0.0;
  }
  else
  {
    v7 = *MEMORY[0x24BDBF090];
    v8 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v4 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v6 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }

  v9 = v7;
  v10 = v8;
  v11 = v4;
  v12 = v6;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDrawingContext, 0);
  objc_storeStrong((id *)&self->mShape, 0);
}

@end

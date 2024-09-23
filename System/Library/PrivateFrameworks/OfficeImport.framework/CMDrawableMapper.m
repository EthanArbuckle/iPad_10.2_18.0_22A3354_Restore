@implementation CMDrawableMapper

- (CMDrawableMapper)initWithOadDrawable:(id)a3 parent:(id)a4
{
  id v7;
  id v8;
  CMDrawableMapper *v9;
  CMDrawableMapper *v10;
  CMDrawableStyle *v11;
  CMDrawableStyle *mStyle;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CMDrawableMapper;
  v9 = -[CMMapper initWithParent:](&v14, sel_initWithParent_, v8);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mDrawable, a3);
    v11 = objc_alloc_init(CMDrawableStyle);
    mStyle = v10->mStyle;
    v10->mStyle = v11;

  }
  return v10;
}

- (void)setWithOadImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  NSData *v12;
  NSData *mImageBinaryData;
  void *v14;
  uint64_t v15;
  NSString *v16;
  NSData *v17;
  NSData *v18;
  BOOL v19;
  uint64_t v20;
  NSString *v21;
  NSString *mExtension;
  __CFString *v23;
  id v24;

  v4 = a3;
  self->mIsSupported = 0;
  v24 = v4;
  objc_msgSend(v4, "imageProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageFill");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isBlipRefOverridden"))
    goto LABEL_11;
  objc_msgSend(v6, "blipRef");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "blip");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v20 = objc_msgSend(v7, "index");
    if ((int)v20 > 0)
    {
      -[CMDrawableMapper blipAtIndex:](self, "blipAtIndex:", v20);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
        goto LABEL_19;
      goto LABEL_4;
    }

LABEL_11:
    v8 = 0;
    goto LABEL_19;
  }

LABEL_4:
  objc_msgSend(v8, "mainSubBlip");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "load");

  if ((v10 & 1) != 0)
  {
    objc_msgSend(v8, "mainSubBlip");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "data");
    v12 = (NSData *)objc_claimAutoreleasedReturnValue();
    mImageBinaryData = self->mImageBinaryData;
    self->mImageBinaryData = v12;

    objc_msgSend(v8, "mainSubBlip");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "type");

    self->mResourceType = +[CMArchiveManager blipTypeToResourceType:](CMArchiveManager, "blipTypeToResourceType:", v15);
    switch((int)v15)
    {
      case 2:
        mExtension = self->mExtension;
        v23 = CFSTR("jpg");
        goto LABEL_17;
      case 3:
        mExtension = self->mExtension;
        v23 = CFSTR("png");
        goto LABEL_17;
      case 4:
      case 5:
      case 6:
        v16 = self->mExtension;
        self->mExtension = (NSString *)CFSTR("pdf");

        -[CMDrawableMapper convertMetafileToPdf](self, "convertMetafileToPdf");
        v17 = (NSData *)objc_claimAutoreleasedReturnValue();
        v18 = self->mImageBinaryData;
        self->mImageBinaryData = v17;

        v19 = self->mImageBinaryData != 0;
        goto LABEL_18;
      case 7:
        mExtension = self->mExtension;
        v23 = CFSTR("gif");
        goto LABEL_17;
      case 8:
        mExtension = self->mExtension;
        v23 = CFSTR("tiff");
LABEL_17:
        self->mExtension = (NSString *)v23;

        v19 = 1;
LABEL_18:
        self->mIsSupported = v19;
        break;
      default:
        v21 = self->mExtension;
        self->mExtension = 0;

        break;
    }
  }
LABEL_19:

}

- (id)saveResourceAndReturnPath:(id)a3 withType:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[CMMapper archiver](self, "archiver");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addResource:withType:", v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)convertMetafileToPdf
{
  void *v3;
  void *v4;
  double v5;
  double width;
  double v7;
  double height;

  -[OADDrawable drawableProperties](self->mDrawable, "drawableProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orientedBounds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  width = v5;
  height = v7;

  if (width == 0.0 || height == 0.0)
  {
    width = self->mBox.size.width;
    height = self->mBox.size.height;
  }
  +[MFConverter play:frame:colorMap:fillMap:](MFConverter, "play:frame:colorMap:fillMap:", self->mImageBinaryData, 0, 0, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), width, height);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)blipAtIndex:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v3 = *(_QWORD *)&a3;
  -[CMMapper root](self, "root");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "conformsToProtocol:", &unk_255B56AE8);

  if (v6)
  {
    -[CMMapper root](self, "root");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "blipAtIndex:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (CGRect)box
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mBox.origin.x;
  y = self->mBox.origin.y;
  width = self->mBox.size.width;
  height = self->mBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)mapShapeGraphicsAt:(id)a3 withState:(id)a4
{
  OADDrawable *v6;
  uint64_t v7;
  void *v8;
  OADOrientedBounds *mOrientedBounds;
  double x;
  double y;
  double width;
  double height;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CMDrawableStyle *v19;
  double v20;
  double v21;
  void *v22;
  id v23;
  void *v24;
  char v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  CMDrawingContext *v33;
  objc_super v34;

  v31 = a3;
  v30 = a4;
  v6 = self->mDrawable;
  v7 = -[OADDrawable type](v6, "type");
  if (!(_DWORD)v7)
  {
    if (+[CMShapeUtils isShapeALine:](CMShapeUtils, "isShapeALine:", v6))
      v7 = 20;
    else
      v7 = 0;
  }
  -[OADDrawable shapeProperties](v6, "shapeProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "orientedBounds");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  mOrientedBounds = self->mOrientedBounds;
  if (mOrientedBounds)
  {
    -[OADOrientedBounds bounds](mOrientedBounds, "bounds");
  }
  else
  {
    x = self->mBox.origin.x;
    y = self->mBox.origin.y;
    width = self->mBox.size.width;
    height = self->mBox.size.height;
  }
  objc_msgSend(v32, "setBounds:", x, y, width, height);
  v33 = -[CMDrawingContext initWithFrame:]([CMDrawingContext alloc], "initWithFrame:", self->mBox.origin.x, self->mBox.origin.y, self->mBox.size.width, self->mBox.size.height);
  switch((int)v7)
  {
    case 0:
      -[OADDrawable geometry](v6, "geometry");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_12;
      -[OADDrawable geometry](v6, "geometry");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "pathCount");

      if (!v27)
        goto LABEL_13;
      -[OADDrawable geometry](v6, "geometry");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADDrawable shapeProperties](v6, "shapeProperties");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "fill");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADDrawable shapeProperties](v6, "shapeProperties");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stroke");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[CMShapeRenderer renderFreeForm:fill:stroke:orientedBounds:state:drawingContext:](CMShapeRenderer, "renderFreeForm:fill:stroke:orientedBounds:state:drawingContext:", v29, v15, v17, v32, v30, v33);
      goto LABEL_10;
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
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
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
      goto LABEL_9;
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
    case 47:
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
      goto LABEL_16;
    case 20:
      -[OADDrawable geometry](v6, "geometry");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      objc_opt_isKindOfClass();

      -[OADDrawable shapeProperties](v6, "shapeProperties");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stroke");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADDrawable geometry](v6, "geometry");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "adjustValues");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[CMShapeRenderer renderLine:stroke:adjustValues:orientedBounds:state:drawingContext:](CMShapeRenderer, "renderLine:stroke:adjustValues:orientedBounds:state:drawingContext:", 20, v14, v16, v32, v30, v33);
      goto LABEL_11;
    default:
      v25 = v7 + 92;
      if ((v7 - 164) > 0x2F)
        goto LABEL_16;
      if (((1 << v25) & 0xF04000840000) != 0)
        goto LABEL_9;
      if (((1 << v25) & 3) != 0)
      {
        v7 = 1;
LABEL_9:
        -[OADDrawable shapeProperties](v6, "shapeProperties");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "fill");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[OADDrawable shapeProperties](v6, "shapeProperties");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stroke");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[OADDrawable geometry](v6, "geometry");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "adjustValues");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[CMShapeRenderer renderCanonicalShape:fill:stroke:adjustValues:orientedBounds:state:drawingContext:](CMShapeRenderer, "renderCanonicalShape:fill:stroke:adjustValues:orientedBounds:state:drawingContext:", v7, v14, v16, v18, v32, v30, v33);

LABEL_10:
LABEL_11:

LABEL_12:
LABEL_13:
        v19 = objc_alloc_init(CMDrawableStyle);
        -[CMDrawingContext pdfFrame](v33, "pdfFrame");
        -[CMDrawableStyle addPositionUsingOffsets:](v19, "addPositionUsingOffsets:", v20 - self->mBox.origin.x, v21 - self->mBox.origin.y);
        +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 9);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[CMDrawingContext copyPDF](v33, "copyPDF");
        if (v23)
        {
          -[CMDrawableMapper saveResourceAndReturnPath:withType:](self, "saveResourceAndReturnPath:withType:", v23, 7);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[CMMapper addAttribute:toNode:value:](self, "addAttribute:toNode:value:", 0x24F3E6C78, v22, v24);

        }
        v34.receiver = self;
        v34.super_class = (Class)CMDrawableMapper;
        -[CMMapper addStyleUsingGlobalCacheTo:style:embedStyle:](&v34, sel_addStyleUsingGlobalCacheTo_style_embedStyle_, v22, v19, 1);
        objc_msgSend(v31, "addChild:", v22);

      }
LABEL_16:

      return;
  }
}

- (void)calculateUncroppedBox:(id)a3
{
  void *v4;
  void *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  CGRect *p_mBox;
  double width;
  float v12;
  float v13;
  float v14;
  CGRect *p_mUncroppedBox;
  double height;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  id v22;

  v22 = a3;
  if ((objc_msgSend(v22, "isSourceRectOverridden") & 1) != 0)
  {
    objc_msgSend(v22, "sourceRect");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (!v4
      || (objc_msgSend(v4, "left"), v6 == 0.0)
      && (objc_msgSend(v5, "right"), v7 == 0.0)
      && (objc_msgSend(v5, "top"), v8 == 0.0)
      && (objc_msgSend(v5, "bottom"), v9 == 0.0))
    {
      self->mIsCropped = 0;
    }
    else
    {
      self->mIsCropped = 1;
      p_mBox = &self->mBox;
      width = self->mBox.size.width;
      objc_msgSend(v5, "left");
      v13 = v12;
      objc_msgSend(v5, "right");
      p_mUncroppedBox = &self->mUncroppedBox;
      p_mUncroppedBox->size.width = width / (float)((float)(1.0 - v13) - v14);
      height = p_mBox->size.height;
      objc_msgSend(v5, "top");
      v18 = v17;
      objc_msgSend(v5, "bottom");
      p_mUncroppedBox->size.height = height / (float)((float)(1.0 - v18) - v19);
      objc_msgSend(v5, "left");
      p_mUncroppedBox->origin.x = p_mUncroppedBox->size.width * (float)-v20;
      objc_msgSend(v5, "top");
      p_mUncroppedBox->origin.y = p_mUncroppedBox->size.height * (float)-v21;
    }

  }
  else
  {
    self->mIsCropped = 0;
  }

}

- (BOOL)isCropped
{
  return self->mIsCropped;
}

- (CGRect)shapeTextBoxRect
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  double x;
  double y;
  double v9;
  double v10;
  double height;
  double width;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  double v24;
  float v25;
  float v26;
  float v27;
  double v28;
  float v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  CGRect result;

  -[OADDrawable geometry](self->mDrawable, "geometry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(v3, "equivalentCustomGeometry");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  if (objc_msgSend(v4, "textBodyRectCount"))
  {
    objc_msgSend(v5, "textBodyRectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v5, "geometryCoordSpace");
    }
    else
    {
      v34 = 0;
      v35 = 0;
    }
    width = self->mBox.size.width;
    height = self->mBox.size.height;
    +[CMShapeUtils mapAdjustCoord:geometry:](CMShapeUtils, "mapAdjustCoord:geometry:", objc_msgSend(v6, "left", v34, v35), v5);
    v14 = v13;
    +[CMShapeUtils mapAdjustCoord:geometry:](CMShapeUtils, "mapAdjustCoord:geometry:", objc_msgSend(v6, "right"), v5);
    v16 = v15;
    +[CMShapeUtils mapAdjustCoord:geometry:](CMShapeUtils, "mapAdjustCoord:geometry:", objc_msgSend(v6, "top"), v5);
    v18 = v17;
    +[CMShapeUtils mapAdjustCoord:geometry:](CMShapeUtils, "mapAdjustCoord:geometry:", objc_msgSend(v6, "bottom"), v5);
    v19 = width / 21600.0;
    v20 = height / 21600.0;
    v21 = v14;
    v22 = v16;
    v23 = v18;
    v25 = v24;
    v26 = v19 * v21;
    v27 = (float)(v22 - v21) * v19;
    if (v27 <= 0.0)
      v9 = self->mBox.size.width + v27;
    else
      v9 = v27;
    v28 = v26;
    v29 = (float)(v25 - v23) * v20;
    if (v29 <= 0.0)
      v10 = self->mBox.size.height + v29;
    else
      v10 = v29;
    x = self->mBox.origin.x + v28;
    y = self->mBox.origin.y + (float)(v20 * v23);

  }
  else
  {
    x = self->mBox.origin.x;
    y = self->mBox.origin.y;
    v9 = self->mBox.size.width;
    v10 = self->mBox.size.height;
  }

  v30 = x;
  v31 = y;
  v32 = v9;
  v33 = v10;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (CGRect)uncroppedBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mUncroppedBox.origin.x;
  y = self->mUncroppedBox.origin.y;
  width = self->mUncroppedBox.size.width;
  height = self->mUncroppedBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CMDrawableMapper)initWithParent:(id)a3
{
  CMDrawableMapper *v3;
  CMDrawableMapper *v4;
  NSData *mImageBinaryData;
  CGSize v6;
  OADDrawable *mDrawable;
  CMDrawableStyle *mStyle;
  NSString *mSourcePath;
  OADOrientedBounds *mOrientedBounds;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CMDrawableMapper;
  v3 = -[CMMapper initWithParent:](&v12, sel_initWithParent_, a3);
  v4 = v3;
  if (v3)
  {
    v3->mIsSupported = 0;
    v3->mIsCropped = 0;
    mImageBinaryData = v3->mImageBinaryData;
    v3->mImageBinaryData = 0;

    v6 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
    v4->mBox.origin = (CGPoint)*MEMORY[0x24BDBF090];
    v4->mBox.size = v6;
    mDrawable = v4->mDrawable;
    v4->mDrawable = 0;

    mStyle = v4->mStyle;
    v4->mStyle = 0;

    mSourcePath = v4->mSourcePath;
    v4->mSourcePath = 0;

    mOrientedBounds = v4->mOrientedBounds;
    v4->mOrientedBounds = 0;

  }
  return v4;
}

- (float)rotation
{
  return self->mRotation;
}

- (void)setRotation:(float)a3
{
  self->mRotation = a3;
}

- (void)mapDrawingContext:(id)a3 at:(id)a4 relative:(BOOL)a5 withState:(id)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  CMDrawableStyle *v13;
  double v14;
  double v15;
  void *v16;
  objc_super v17;

  v6 = a5;
  v9 = a3;
  v10 = a4;
  v11 = (void *)objc_msgSend(v9, "copyPDF");
  if (v11)
  {
    +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc_init(CMDrawableStyle);
    objc_msgSend(v9, "pdfFrame");
    if (v6)
    {
      v14 = v14 - self->mBox.origin.x;
      v15 = v15 - self->mBox.origin.y;
    }
    -[CMDrawableStyle addPositionUsingOffsets:](v13, "addPositionUsingOffsets:", v14, v15);
    -[CMDrawableMapper saveResourceAndReturnPath:withType:](self, "saveResourceAndReturnPath:withType:", v11, 7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMMapper addAttribute:toNode:value:](self, "addAttribute:toNode:value:", 0x24F3E6C78, v12, v16);
    v17.receiver = self;
    v17.super_class = (Class)CMDrawableMapper;
    -[CMMapper addStyleUsingGlobalCacheTo:style:embedStyle:](&v17, sel_addStyleUsingGlobalCacheTo_style_embedStyle_, v12, v13, 1);
    objc_msgSend(v10, "addChild:", v12);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mOrientedBounds, 0);
  objc_storeStrong((id *)&self->mSourcePath, 0);
  objc_storeStrong((id *)&self->mExtension, 0);
  objc_storeStrong((id *)&self->mName, 0);
  objc_storeStrong((id *)&self->mImageBinaryData, 0);
  objc_storeStrong((id *)&self->mStyle, 0);
  objc_storeStrong((id *)&self->mDrawable, 0);
}

@end

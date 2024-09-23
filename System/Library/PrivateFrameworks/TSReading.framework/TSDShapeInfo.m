@implementation TSDShapeInfo

- (TSDLineEnd)headLineEnd
{
  return self->mHeadLineEnd;
}

- (void)setHeadLineEnd:(id)a3
{
  id v5;

  -[TSPObject willModify](self, "willModify");
  v5 = a3;

  self->mHeadLineEnd = (TSDLineEnd *)a3;
}

- (TSDLineEnd)tailLineEnd
{
  return self->mTailLineEnd;
}

- (void)setTailLineEnd:(id)a3
{
  id v5;

  -[TSPObject willModify](self, "willModify");
  v5 = a3;

  self->mTailLineEnd = (TSDLineEnd *)a3;
}

- (TSDShapeInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5 pathSource:(id)a6
{
  TSDShapeInfo *v8;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TSDShapeInfo;
  v8 = -[TSDDrawableInfo initWithContext:geometry:](&v14, sel_initWithContext_geometry_, a3, a4);
  if (v8)
  {
    if (a5)
    {
      if (a6)
      {
LABEL_4:
        -[TSDShapeInfo setStyle:](v8, "setStyle:", a5);
        -[TSDShapeInfo setPathSource:](v8, "setPathSource:", a6);
        return v8;
      }
    }
    else
    {
      v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDShapeInfo initWithContext:geometry:style:pathSource:]");
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeInfo.m"), 91, CFSTR("invalid nil value for '%s'"), "style");
      if (a6)
        goto LABEL_4;
    }
    v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDShapeInfo initWithContext:geometry:style:pathSource:]");
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeInfo.m"), 92, CFSTR("invalid nil value for '%s'"), "pathSource");
    goto LABEL_4;
  }
  return v8;
}

- (TSDShapeInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5
{
  objc_msgSend(a4, "size");
  return -[TSDShapeInfo initWithContext:geometry:style:pathSource:](self, "initWithContext:geometry:style:pathSource:", a3, a4, a5, +[TSDScalarPathSource rectangleWithNaturalSize:](TSDScalarPathSource, "rectangleWithNaturalSize:"));
}

- (TSDShapeInfo)initWithContext:(id)a3 geometry:(id)a4
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, a4);
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDShapeInfo initWithContext:geometry:]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeInfo.m"), 114, CFSTR("call - (id)initWithContext:(TSPObjectContext*)context geometry:(TSDInfoGeometry *)geometry style:TSDGraphicStyle*)style please."));
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDShapeInfo;
  -[TSDDrawableInfo dealloc](&v3, sel_dealloc);
}

- (id)copyWithContext:(id)a3
{
  _QWORD *v5;
  uint64_t v6;
  TSPObjectContext *v7;
  TSSStylesheet *v8;
  TSSStylesheet *v9;
  void *v10;
  uint64_t v11;
  TSSStyleMapper *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TSDShapeInfo;
  v5 = -[TSDDrawableInfo copyWithContext:](&v14, sel_copyWithContext_);
  if (!v5)
    return v5;
  v6 = -[TSDShapeInfo zone](self, "zone");
  v5[18] = -[TSDPathSource copyWithZone:](self->mPathSource, "copyWithZone:", v6);
  objc_msgSend(a3, "documentObject");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = (TSPObjectContext *)a3;
  }
  else
  {
    -[TSPObjectContext documentObject](-[TSPObject context](self, "context"), "documentObject");
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v8 = -[TSSStyle stylesheet](self->mStyle, "stylesheet");
      goto LABEL_8;
    }
    v7 = -[TSPObject context](self, "context");
  }
  v8 = (TSSStylesheet *)-[TSPObject performSelector:](-[TSPObjectContext documentObject](v7, "documentObject"), "performSelector:", sel_stylesheet);
LABEL_8:
  v9 = v8;
  if (!v8)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDShapeInfo copyWithContext:]");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeInfo.m"), 155, CFSTR("invalid nil value for '%s'"), "stylesheet");
  }
  v12 = -[TSSStyleMapper initWithTargetStylesheet:newStyleDOLCContext:]([TSSStyleMapper alloc], "initWithTargetStylesheet:newStyleDOLCContext:", v9, 0);
  objc_opt_class();
  -[TSSStyleMapper mappedStyleForStyle:](v12, "mappedStyleForStyle:", self->mStyle);
  v5[19] = (id)TSUDynamicCast();

  v5[20] = -[TSDLineEnd copyWithZone:](self->mHeadLineEnd, "copyWithZone:", v6);
  v5[21] = -[TSDLineEnd copyWithZone:](self->mTailLineEnd, "copyWithZone:", v6);
  return v5;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (Class)styleClass
{
  return (Class)objc_opt_class();
}

- (void)setGeometry:(id)a3
{
  _BOOL4 v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  objc_super v13;

  if (-[TSDInfoGeometry heightValid](-[TSDDrawableInfo geometry](self, "geometry"), "heightValid"))
    v5 = -[TSDInfoGeometry widthValid](-[TSDDrawableInfo geometry](self, "geometry"), "widthValid");
  else
    v5 = 0;
  v13.receiver = self;
  v13.super_class = (Class)TSDShapeInfo;
  -[TSDDrawableInfo setGeometry:](&v13, sel_setGeometry_, a3);
  if (-[TSDDrawableInfo geometry](self, "geometry") == a3
    && objc_msgSend(a3, "heightValid")
    && objc_msgSend(a3, "widthValid"))
  {
    objc_msgSend(a3, "size");
    v7 = v6;
    v9 = v8;
    if (!v5
      || ((-[TSDPathSource naturalSize](self->mPathSource, "naturalSize"), v11 == v7) ? (v12 = v10 == v9) : (v12 = 0),
          !v12))
    {
      -[TSDDrawableInfo willChangeProperty:](self, "willChangeProperty:", 526);
      -[TSDPathSource setNaturalSize:](self->mPathSource, "setNaturalSize:", v7, v9);
    }
  }
}

- (void)setPathSource:(id)a3
{
  if (self->mPathSource != a3)
  {
    -[TSDDrawableInfo willChangeProperty:](self, "willChangeProperty:", 526);

    self->mPathSource = (TSDPathSource *)a3;
  }
}

- (BOOL)supportsTextInset
{
  return 0;
}

- (BOOL)supportsShrinkTextToFit
{
  return 0;
}

- (void)setStyle:(id)a3
{
  id v5;

  if (self->mStyle != a3)
  {
    -[TSDDrawableInfo willChangeProperties:](self, "willChangeProperties:", objc_msgSend((id)objc_opt_class(), "properties"));
    -[TSPObject willModify](self, "willModify");
    v5 = a3;

    self->mStyle = (TSDShapeStyle *)a3;
  }
}

- (TSDFill)fill
{
  void *v3;
  uint64_t v4;
  TSDFill *v5;

  if (!-[TSDShapeInfo style](self, "style"))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDShapeInfo fill]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeInfo.m"), 254, CFSTR("invalid nil value for '%s'"), "self.style");
  }
  v5 = (TSDFill *)objc_msgSend(-[TSDShapeInfo style](self, "style"), "valueForProperty:", 516);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return 0;
  else
    return v5;
}

- (void)setFill:(id)a3
{
  if (!a3)
    a3 = (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  -[TSDStyledInfo i_setValue:forProperty:](self, "i_setValue:forProperty:", a3, 516);
}

- (void)setValuesForProperties:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  if (!-[TSDShapeInfo style](self, "style"))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDShapeInfo setValuesForProperties:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeInfo.m"), 273, CFSTR("invalid nil value for '%s'"), "self.style");
  }
  if (!objc_msgSend(-[TSDShapeInfo style](self, "style"), "stylesheet"))
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDShapeInfo setValuesForProperties:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeInfo.m"), 274, CFSTR("invalid nil value for '%s'"), "self.style.stylesheet");
  }
  -[TSDDrawableInfo willChangeProperties:](self, "willChangeProperties:", objc_msgSend(a3, "allProperties"));
  v9 = objc_msgSend((id)objc_msgSend(-[TSDShapeInfo style](self, "style"), "stylesheet"), "variationOfStyle:propertyMap:", -[TSDShapeInfo style](self, "style"), a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDShapeInfo setValuesForProperties:]");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeInfo.m"), 279, CFSTR("Variation style is not a shape style."));
  }
  -[TSDShapeInfo setStyle:](self, "setStyle:", v9);
}

- (id)imageDatasForReducingFileSizeWithAssociatedHints
{
  TSDFill *v2;
  id v3;
  id result;
  id v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = -[TSDShapeInfo fill](self, "fill");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v3 = (id)-[TSDFill originalImageData](v2, "originalImageData");
  if (v3 || (result = (id)-[TSDFill imageData](v2, "imageData"), (v3 = result) != 0))
  {
    v5 = objc_alloc(MEMORY[0x24BEB3CB8]);
    v6[0] = v3;
    return (id)objc_msgSend(v5, "initWithObjects:forKeys:", &unk_24D8FA278, objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1));
  }
  return result;
}

- (CGSize)targetSizeForImageData:(id)a3 associatedHint:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _QWORD v15[5];
  uint64_t v16;
  double *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  CGSize result;

  objc_opt_class();
  -[TSDShapeInfo fill](self, "fill");
  v6 = (void *)TSUDynamicCast();
  if ((id)objc_msgSend(v6, "originalImageData") != a3 && (id)objc_msgSend(v6, "imageData") != a3)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDShapeInfo targetSizeForImageData:associatedHint:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeInfo.m"), 343, CFSTR("Wrong data for reducing shape fill"));
  }
  v16 = 0;
  v17 = (double *)&v16;
  v18 = 0x3010000000;
  v19 = &unk_217C8B239;
  v20 = *MEMORY[0x24BDBF148];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __54__TSDShapeInfo_targetSizeForImageData_associatedHint___block_invoke;
  v15[3] = &unk_24D82B618;
  v15[4] = &v16;
  -[TSDDrawableInfo performBlockWithTemporaryLayout:](self, "performBlockWithTemporaryLayout:", v15);
  objc_msgSend(v6, "renderedImageSizeForObjectSize:", v17[4], v17[5]);
  v10 = v9;
  v12 = v11;
  _Block_object_dispose(&v16, 8);
  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

uint64_t __54__TSDShapeInfo_targetSizeForImageData_associatedHint___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_opt_class();
  result = objc_msgSend((id)objc_msgSend((id)TSUDynamicCast(), "path"), "bounds");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = v5;
  return result;
}

- (id)animationFilters
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", kTSDAnimationFilterStandard, kTSDAnimationFilterByGlyph, kTSDAnimationFilterByWord, kTSDAnimationFilterByLine, kTSDAnimationFilterNotMovie, 0);
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __37__TSDShapeInfo_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_24D82B868;
  v4[4] = a3;
  v4[5] = self;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __37__TSDShapeInfo_mixingTypeWithObject___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  if (!v2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDShapeInfo mixingTypeWithObject:]_block_invoke");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeInfo.m"), 393, CFSTR("nil object after cast"));
  }
  v5 = TSDMixingTypeBestFromMixingTypes(5, objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "geometry"), "mixingTypeWithObject:", objc_msgSend(v2, "geometry")));
  v6 = TSDMixingTypeWithPossiblyNilObjects(objc_msgSend(*(id *)(a1 + 40), "shapeStyle"), objc_msgSend(v2, "shapeStyle"));
  v7 = TSDMixingTypeBestFromMixingTypes(v5, v6);
  v8 = TSDMixingTypeWithPossiblyNilObjects(objc_msgSend(*(id *)(a1 + 40), "pathSource"), objc_msgSend(v2, "pathSource"));
  return TSDMixingTypeBestFromMixingTypes(v7, v8);
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  _QWORD v5[7];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __49__TSDShapeInfo_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_24D82B890;
  v5[4] = a4;
  v5[5] = self;
  *(double *)&v5[6] = a3;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

TSDShapeInfo *__49__TSDShapeInfo_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
{
  void *v2;

  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  return -[TSDShapeInfo initWithContext:geometry:style:pathSource:]([TSDShapeInfo alloc], "initWithContext:geometry:style:pathSource:", objc_msgSend(*(id *)(a1 + 40), "context"), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "geometry"), "mixedObjectWithFraction:ofObject:", objc_msgSend(v2, "geometry"), *(double *)(a1 + 48)), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "shapeStyle"), "mixedObjectWithFraction:ofObject:", objc_msgSend(v2, "shapeStyle"), *(double *)(a1 + 48)), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "pathSource"), "mixedObjectWithFraction:ofObject:", objc_msgSend(v2, "pathSource"), *(double *)(a1 + 48)));
}

- (id)objectForProperty:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;

  switch(a3)
  {
    case 522:
      return -[TSDShapeInfo headLineEnd](self, "headLineEnd");
    case 523:
      return -[TSDShapeInfo tailLineEnd](self, "tailLineEnd");
    case 526:
      return -[TSDShapeInfo pathSource](self, "pathSource");
  }
  v7 = v3;
  v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)TSDShapeInfo;
  return -[TSDStyledInfo objectForProperty:](&v6, sel_objectForProperty_);
}

- (id)style
{
  return self->mStyle;
}

- (TSDPathSource)pathSource
{
  return self->mPathSource;
}

- (int)elementKind
{
  return 2;
}

@end

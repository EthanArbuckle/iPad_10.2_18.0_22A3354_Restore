@implementation PFXWidgetPlacement

- (PFXWidgetPlacement)initWithInfoGeometry:(id)a3
{
  PFXWidgetPlacement *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFXWidgetPlacement;
  v4 = -[PFXWidgetPlacement init](&v6, "init");
  if (v4)
    v4->mInfoGeometry = (TSDInfoGeometry *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFXWidgetPlacement;
  -[PFXWidgetPlacement dealloc](&v3, "dealloc");
}

- (BOOL)hasChildrenForAdornmentInfo
{
  return -[PFXWidgetPlacement titleShape](self, "titleShape")
      || -[PFXWidgetPlacement captionShape](self, "captionShape")
      || -[PFXWidgetPlacement backgroundShape](self, "backgroundShape") != 0;
}

+ (id)mapBackgroundShapeStyleWithStackEntry:(id)a3 readerState:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  double v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = objc_msgSend(objc_msgSend(a3, "currentEntryMediaState"), "propertySet");
  v6 = objc_alloc_init((Class)TSSPropertyMap);
  v7 = +[PFXGraphicStyle mapStrokeFromStyleProperties:contentState:](PFXGraphicStyle, "mapStrokeFromStyleProperties:contentState:", v5, a4);
  if (v7)
    objc_msgSend(v6, "setObject:forProperty:", v7, 517);
  v8 = +[PFXGraphicStyle mapOpacityFromStyleProperties:](PFXGraphicStyle, "mapOpacityFromStyleProperties:", v5);
  if (v8)
  {
    objc_msgSend(v8, "doubleValue");
    *(float *)&v9 = v9;
    objc_msgSend(v6, "setFloatValue:forProperty:", 518, v9);
  }
  v10 = +[PFXGraphicStyle mapShadowFromStyleProperties:contentState:](PFXGraphicStyle, "mapShadowFromStyleProperties:contentState:", v5, a4);
  if (v10)
    objc_msgSend(v6, "setObject:forProperty:", v10, 520);
  v11 = +[PFXGraphicStyle mapFillFromStyleProperties:contentState:](PFXGraphicStyle, "mapFillFromStyleProperties:contentState:", v5, a4);
  if (v11)
    objc_msgSend(v6, "setObject:forProperty:", v11, 516);
  v12 = objc_msgSend(objc_msgSend(objc_msgSend(a4, "currentHtmlDocMediaState"), "stylesheet"), "styleWithIdentifier:", CFSTR("TSWWidgetBackgroundShapeStyle"));
  if (!v12)
  {
    v12 = objc_msgSend(objc_alloc((Class)TSDShapeStyle), "initWithContext:", objc_msgSend(a4, "tspContext"));
    objc_msgSend(v12, "setValue:forProperty:", +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", 0.88627451, 0.91372549, 0.921568627, 1.0), 516);
    objc_msgSend(v12, "setValue:forProperty:", +[TSDStroke strokeWithColor:width:](TSDStroke, "strokeWithColor:width:", +[TSUColor colorWithRed:green:blue:alpha:](TSUColor, "colorWithRed:green:blue:alpha:", 0.682352941, 0.729411765, 0.745098039, 1.0), 1.0), 517);
    objc_msgSend(objc_msgSend(objc_msgSend(a4, "currentHtmlDocMediaState"), "stylesheet"), "addStyle:withIdentifier:", v12, CFSTR("TSWWidgetBackgroundShapeStyle"));
  }
  v13 = objc_msgSend(objc_msgSend(objc_msgSend(a4, "currentHtmlDocMediaState"), "stylesheet"), "variationOfStyle:propertyMap:", v12, v6);

  return v13;
}

+ (id)mapDefaultBackgroundShapeWithPlacement:(id)a3 readerState:(id)a4
{
  id v7;
  id v8;
  double v9;
  double v10;
  id v11;
  id v12;
  id v13;
  double v14;
  double v15;
  THWWidgetBackgroundInfo *v16;

  v7 = objc_msgSend(a4, "currentHtmlStackEntry");
  v8 = objc_msgSend(v7, "valueForAttribute:", PFXWidgetConstantDataCornerRadius[0]);
  if (v8)
  {
    objc_msgSend(v8, "doubleValue");
    v10 = v9;
  }
  else
  {
    v10 = 8.0;
  }
  v11 = objc_msgSend(a1, "mapBackgroundShapeStyleWithStackEntry:readerState:", v7, a4);
  v12 = objc_alloc((Class)TSDInfoGeometry);
  objc_msgSend(objc_msgSend(a3, "infoGeometry"), "size");
  v13 = objc_msgSend(v12, "initWithSize:");
  objc_msgSend(v13, "size");
  v16 = -[THWWidgetBackgroundInfo initWithContext:geometry:style:pathSource:]([THWWidgetBackgroundInfo alloc], "initWithContext:geometry:style:pathSource:", objc_msgSend(a4, "tspContext"), v13, v11, +[TSDScalarPathSource roundedRectangleWithScalar:naturalSize:](TSDScalarPathSource, "roundedRectangleWithScalar:naturalSize:", v10, v14, v15));

  return v16;
}

+ (id)widgetPlacementWithDrawablePlacement:(id)a3 readerState:(id)a4
{
  id v6;
  id v7;
  PFXWidgetPlacement *v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  _UNKNOWN **v13;
  uint64_t i;
  uint64_t v15;
  THWWidgetBackgroundInfo *v16;
  double v17;
  THWWidgetBackgroundInfo *v18;
  const xmlChar *v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  void *v26;
  THWWidgetBackgroundInfo *v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  void *v45;
  id v46;
  TSDInfo *v47;
  id v48;
  id v49;
  void *v50;
  double v51;
  uint64_t v52;
  double v53;
  uint64_t v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v64;
  THWWidgetBackgroundInfo *v65;
  char v66;
  id v67;
  id v69;

  v6 = objc_msgSend(a4, "currentHtmlStackEntry");
  v7 = objc_msgSend(v6, "currentEntryMediaState");
  v8 = -[PFXWidgetPlacement initWithInfoGeometry:]([PFXWidgetPlacement alloc], "initWithInfoGeometry:", objc_msgSend(a3, "infoGeometry"));
  -[PFXWidgetPlacement setStageGeometry:](v8, "setStageGeometry:", PFXTSDInfoGeometry((const char *)objc_msgSend(v6, "xmlValueForAttribute:", PFXWidgetConstantDataStageGeometry[0])));
  -[PFXWidgetPlacement setExteriorTextWrap:](v8, "setExteriorTextWrap:", objc_msgSend(a3, "exteriorTextWrap"));
  -[PFXWidgetPlacement setExpandedOnly:](v8, "setExpandedOnly:", +[PFXWidget isWidgetExpandedOnly:](PFXWidget, "isWidgetExpandedOnly:", a4));
  v9 = objc_msgSend(v7, "childResultCount");
  v69 = a4;
  objc_msgSend(a4, "applePubVersion");
  v11 = (__PAIR128__((unint64_t)v9, v10) - COERCE_UNSIGNED_INT64(1.00999999)) >> 64;
  if (xmlStrEqual((const xmlChar *)objc_msgSend(v6, "xmlValueForAttribute:", PFXWidgetConstantDataBackgroundEnabled[0]), (const xmlChar *)"yes"))
  {
    -[PFXWidgetPlacement setUseBackgroundShape:](v8, "setUseBackgroundShape:", 1);
  }
  v12 = +[NSMutableArray array](NSMutableArray, "array");
  v13 = TSDGroupInfo_ptr;
  if (v11)
  {
    v66 = 0;
    for (i = 0; v11 != i; ++i)
    {
      v15 = objc_opt_class(TSDDrawableInfo);
      *(_QWORD *)&v17 = TSUDynamicCast(v15, objc_msgSend(v7, "childResultAtIndex:", i)).n128_u64[0];
      if (v16)
      {
        v18 = v16;
        v19 = (const xmlChar *)objc_msgSend(objc_msgSend(v7, "xmlAttributeValueForResult:attributeName:", v16, PFXWidgetConstantDataWidgetObjectType[0], v17), "xmlString");
        if (xmlStrEqual(v19, (const xmlChar *)PFXWidgetConstantObjectValueTitle[0]))
        {
          v20 = objc_opt_class(TSWPShapeInfo);
          *(_QWORD *)&v21 = TSUDynamicCast(v20, v18).n128_u64[0];
          -[PFXWidgetPlacement setTitleShape:](v8, "setTitleShape:", v22, v21);
          goto LABEL_10;
        }
        if (xmlStrEqual(v19, (const xmlChar *)PFXWidgetConstantObjectValueCaption[0]))
        {
          v23 = objc_opt_class(TSWPShapeInfo);
          *(_QWORD *)&v24 = TSUDynamicCast(v23, v18).n128_u64[0];
          -[PFXWidgetPlacement setCaptionShape:](v8, "setCaptionShape:", v25, v24);
          goto LABEL_10;
        }
        if (xmlStrEqual(v19, (const xmlChar *)PFXWidgetConstantObjectValueBackground[0]))
        {
          v28 = objc_opt_class(THWWidgetBackgroundInfo);
          *(_QWORD *)&v29 = TSUDynamicCast(v28, v18).n128_u64[0];
          -[PFXWidgetPlacement setBackgroundShape:](v8, "setBackgroundShape:", v30, v29);
          if (!-[PFXWidgetPlacement backgroundShape](v8, "backgroundShape"))
          {
            v31 = objc_opt_class(TSDShapeInfo);
            TSUDynamicCast(v31, v18);
            if (v32)
            {
              v33 = v32;
              v65 = [THWWidgetBackgroundInfo alloc];
              v64 = objc_msgSend(v69, "tspContext");
              v34 = objc_msgSend(v33, "geometry");
              v35 = v6;
              v36 = objc_msgSend(v33, "shapeStyle");
              v37 = objc_msgSend(v33, "pathSource");
              v38 = v34;
              v13 = TSDGroupInfo_ptr;
              v39 = v36;
              v6 = v35;
              -[PFXWidgetPlacement setBackgroundShape:](v8, "setBackgroundShape:", -[THWWidgetBackgroundInfo initWithContext:geometry:style:pathSource:](v65, "initWithContext:geometry:style:pathSource:", v64, v38, v39, v37));
            }
          }
          if (!-[PFXWidgetPlacement useBackgroundShape](v8, "useBackgroundShape")
            || !-[PFXWidgetPlacement backgroundShape](v8, "backgroundShape"))
          {
            continue;
          }
          v27 = -[PFXWidgetPlacement backgroundShape](v8, "backgroundShape");
          v26 = v12;
          goto LABEL_11;
        }
        if (xmlStrEqual(v19, (const xmlChar *)PFXWidgetConstantObjectValueStageThumb[0]))
        {
          -[PFXWidgetPlacement setStageThumb:](v8, "setStageThumb:", v18);
LABEL_10:
          v26 = v12;
          v27 = v18;
LABEL_11:
          objc_msgSend(v26, "addObject:", v27);
          continue;
        }
        if (!v19)
        {
          if (xmlStrEqual((const xmlChar *)objc_msgSend(objc_msgSend(v7, "xmlAttributeValueForResult:attributeName:", v18, PFXWidgetConstantDataFallbackImage[0]), "xmlString"), (const xmlChar *)"yes"))
          {
            v40 = objc_opt_class(v13[2]);
            *(_QWORD *)&v41 = TSUDynamicCast(v40, v18).n128_u64[0];
            -[PFXWidgetPlacement setFallbackImage:](v8, "setFallbackImage:", v42, v41);
            continue;
          }
          if (-[PFXWidgetPlacement stageDrawable](v8, "stageDrawable"))
          {
            if ((v66 & 1) != 0)
            {
              v43 = objc_opt_class(TSDGroupInfo);
              *(_QWORD *)&v44 = TSUDynamicCast(v43, -[PFXWidgetPlacement stageDrawable](v8, "stageDrawable")).n128_u64[0];
              v46 = v45;
            }
            else
            {
              v67 = v6;
              v46 = objc_msgSend(objc_alloc((Class)TSDGroupInfo), "initWithContext:geometry:", objc_msgSend(v69, "tspContext"), -[TSDInfo geometry](-[PFXWidgetPlacement stageDrawable](v8, "stageDrawable"), "geometry"));
              v47 = -[PFXWidgetPlacement stageDrawable](v8, "stageDrawable");
              objc_msgSend(v12, "removeObjectIdenticalTo:", v47);
              -[PFXWidgetPlacement setStageDrawable:](v8, "setStageDrawable:", v46);
              objc_msgSend(v12, "addObject:", v46);
              v48 = -[TSDInfo geometry](v47, "geometry");
              v49 = objc_msgSend(v46, "geometry");
              v50 = v48;
              v6 = v67;
              -[TSDInfo setGeometry:](v47, "setGeometry:", objc_msgSend(v50, "geometryRelativeToGeometry:", v49));
              objc_msgSend(v46, "addChildInfo:", v47);

            }
            -[THWWidgetBackgroundInfo setGeometry:](v18, "setGeometry:", objc_msgSend(-[THWWidgetBackgroundInfo geometry](v18, "geometry", v44), "geometryRelativeToGeometry:", objc_msgSend(v46, "geometry")));
            objc_msgSend(v46, "addChildInfo:", v18);
            v66 = 1;
            v13 = TSDGroupInfo_ptr;
            continue;
          }
          -[PFXWidgetPlacement setStageDrawable:](v8, "setStageDrawable:", v18);
          if (!-[PFXWidgetPlacement expandedOnly](v8, "expandedOnly"))
            goto LABEL_10;
        }
      }
    }
  }
  objc_msgSend(v69, "applePubVersion");
  if (v51 < 1.00999999)
  {
    v52 = objc_opt_class(v13[2]);
    *(_QWORD *)&v53 = TSUDynamicCast(v52, objc_msgSend(v7, "childResultAtIndex:", v11)).n128_u64[0];
    -[PFXWidgetPlacement setFallbackImage:](v8, "setFallbackImage:", v54, v53);
  }
  -[PFXWidgetPlacement setContentLayout:](v8, "setContentLayout:", objc_msgSend(v6, "valueForAttribute:", PFXWidgetConstantDataContentLayout[0]));
  if (-[PFXWidgetPlacement useBackgroundShape](v8, "useBackgroundShape"))
  {
    if (!-[PFXWidgetPlacement backgroundShape](v8, "backgroundShape"))
    {
      -[PFXWidgetPlacement setBackgroundShape:](v8, "setBackgroundShape:", objc_msgSend(a1, "mapDefaultBackgroundShapeWithPlacement:readerState:", a3, v69));
      objc_msgSend(v12, "insertObject:atIndex:", -[PFXWidgetPlacement backgroundShape](v8, "backgroundShape"), 0);
    }
    if ((objc_opt_respondsToSelector(-[PFXWidgetPlacement backgroundShape](v8, "backgroundShape"), "setExteriorTextWrap:") & 1) != 0)-[THWWidgetBackgroundInfo performSelector:withObject:](-[PFXWidgetPlacement backgroundShape](v8, "backgroundShape"), "performSelector:withObject:", "setExteriorTextWrap:", objc_msgSend(a3, "exteriorTextWrap"));
  }
  -[PFXWidgetPlacement setOrderedChildDrawables:](v8, "setOrderedChildDrawables:", v12);
  if (-[PFXWidgetPlacement expandedOnly](v8, "expandedOnly"))
  {
    -[PFXWidgetPlacement setExpandedStageDrawable:](v8, "setExpandedStageDrawable:", -[PFXWidgetPlacement stageDrawable](v8, "stageDrawable"));
    -[TSDInfo setGeometry:](-[PFXWidgetPlacement expandedStageDrawable](v8, "expandedStageDrawable"), "setGeometry:", objc_msgSend(-[TSDInfo geometry](-[PFXWidgetPlacement stageDrawable](v8, "stageDrawable"), "geometry"), "copy"));
    if (-[PFXWidgetPlacement stageThumb](v8, "stageThumb"))
      -[PFXWidgetPlacement setStageDrawable:](v8, "setStageDrawable:", -[PFXWidgetPlacement stageThumb](v8, "stageThumb"));
  }
  else if (-[PFXWidgetPlacement fallbackImage](v8, "fallbackImage"))
  {
    v55 = -[TSDInfoGeometry geometryRelativeToGeometry:](-[PFXWidgetPlacement stageGeometry](v8, "stageGeometry"), "geometryRelativeToGeometry:", -[TSDImageInfo geometry](-[PFXWidgetPlacement fallbackImage](v8, "fallbackImage"), "geometry"));
    v56 = v6;
    objc_msgSend(v55, "size");
    v57 = +[TSDScalarPathSource rectangleWithNaturalSize:](TSDScalarPathSource, "rectangleWithNaturalSize:");
    v58 = objc_alloc((Class)TSDMaskInfo);
    v59 = objc_msgSend(v69, "tspContext");
    v60 = v57;
    v6 = v56;
    v61 = objc_msgSend(v58, "initWithContext:geometry:pathSource:", v59, v55, v60);
    -[TSDImageInfo setMaskInfo:](-[PFXWidgetPlacement fallbackImage](v8, "fallbackImage"), "setMaskInfo:", v61);

  }
  if (-[PFXWidgetPlacement fallbackImage](v8, "fallbackImage"))
    -[TSDImageInfo setExteriorTextWrap:](-[PFXWidgetPlacement fallbackImage](v8, "fallbackImage"), "setExteriorTextWrap:", +[TSDExteriorTextWrap exteriorTextWrap](TSDExteriorTextWrap, "exteriorTextWrap"));
  v62 = objc_msgSend(v6, "valueForAttribute:", PFXWidgetConstantDataContentPadding[0]);
  if (v62)
  {
    objc_msgSend(v62, "doubleValue");
    -[PFXWidgetPlacement setContentPadding:](v8, "setContentPadding:");
  }
  return v8;
}

- (TSDInfo)stageDrawable
{
  return self->mStageDrawable;
}

- (void)setStageDrawable:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (TSDInfo)expandedStageDrawable
{
  return self->mExpandedStageDrawable;
}

- (void)setExpandedStageDrawable:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (TSDInfoGeometry)infoGeometry
{
  return self->mInfoGeometry;
}

- (void)setInfoGeometry:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (TSDInfoGeometry)stageGeometry
{
  return self->mStageGeometry;
}

- (void)setStageGeometry:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (TSWPShapeInfo)titleShape
{
  return self->mTitleShape;
}

- (void)setTitleShape:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (TSWPShapeInfo)captionShape
{
  return self->mCaptionShape;
}

- (void)setCaptionShape:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (THWWidgetBackgroundInfo)backgroundShape
{
  return self->mBackgroundShape;
}

- (void)setBackgroundShape:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (BOOL)useBackgroundShape
{
  return self->mUseBackgroundShape;
}

- (void)setUseBackgroundShape:(BOOL)a3
{
  self->mUseBackgroundShape = a3;
}

- (TSDDrawableInfo)stageThumb
{
  return self->mStageThumb;
}

- (void)setStageThumb:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (TSDImageInfo)fallbackImage
{
  return self->mFallbackImage;
}

- (void)setFallbackImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (NSArray)orderedChildDrawables
{
  return &self->mOrderedChildDrawables->super;
}

- (void)setOrderedChildDrawables:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (double)contentPadding
{
  return self->mContentPadding;
}

- (void)setContentPadding:(double)a3
{
  self->mContentPadding = a3;
}

- (TSDExteriorTextWrap)exteriorTextWrap
{
  return self->mExteriorTextWrap;
}

- (void)setExteriorTextWrap:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (NSString)contentLayout
{
  return self->mContentLayout;
}

- (void)setContentLayout:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (BOOL)expandedOnly
{
  return self->_expandedOnly;
}

- (void)setExpandedOnly:(BOOL)a3
{
  self->_expandedOnly = a3;
}

@end

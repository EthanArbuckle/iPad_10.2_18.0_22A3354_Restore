@implementation PFEIViewport

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFEIViewport;
  -[PFEIViewport dealloc](&v3, "dealloc");
}

- (PFXDrawablePlacement)placement
{
  return self->_drawablePlacement;
}

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5;
  id v6;
  id v7;
  PFXDrawablePlacement *v8;

  v5 = objc_msgSend(a3, "currentHtmlStackEntry");
  v6 = objc_msgSend(v5, "currentEntryMediaState");
  objc_msgSend(v6, "setOriginalStorage:", objc_msgSend(v6, "storage"));
  v7 = objc_msgSend(objc_alloc((Class)TSWPStorage), "initWithContext:string:stylesheet:kind:", +[THTemporaryObjectContext context](THTemporaryObjectContext, "context"), &stru_43D7D8, objc_msgSend(objc_msgSend(a3, "orientationState"), "stylesheet"), 3);
  objc_msgSend(v6, "setOverriddenStorage:", v7);
  objc_msgSend(v7, "setParagraphLevel:forCharRange:undoTransaction:", 0, objc_msgSend(v7, "length"), 0, 0);
  objc_msgSend(v7, "setParagraphStyle:forCharRange:undoTransaction:", objc_msgSend(objc_msgSend(a3, "orientationState"), "defaultParagraphStyle"), objc_msgSend(v7, "length"), 0, 0);

  v8 = (PFXDrawablePlacement *)objc_msgSend(objc_alloc((Class)objc_msgSend(a3, "drawablePlacementClass")), "initWithDrawable:", self);
  self->_drawablePlacement = v8;
  -[PFXDrawablePlacement mapStartElementWithState:](v8, "mapStartElementWithState:", a3);
  -[PFXDrawablePlacement setInfoGeometry:](self->_drawablePlacement, "setInfoGeometry:", PFXTSDInfoGeometry((const char *)objc_msgSend(objc_msgSend(v5, "valueForAttribute:", PFXWidgetConstantDataGeometry[0]), "UTF8String")));
  return 1;
}

- (id)_backgroundShapeInfoCanvasSize:(CGSize)a3 readerState:(id)a4
{
  return objc_msgSend(objc_alloc((Class)TSDShapeInfo), "initWithContext:geometry:style:", objc_msgSend(a4, "tspContext"), objc_msgSend(objc_alloc((Class)TSDInfoGeometry), "initWithSize:", a3.width, a3.height), +[PFXWidgetPlacement mapBackgroundShapeStyleWithStackEntry:readerState:](PFXWidgetPlacement, "mapBackgroundShapeStyleWithStackEntry:readerState:", objc_msgSend(a4, "currentHtmlStackEntry"), a4));
}

- (void)mapEndElementWithState:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  id v11;
  double v12;
  double v13;
  id v14;
  double v15;
  double v16;
  id v17;
  double v18;
  double v19;
  id v20;
  id v21;
  id v22;
  NSString *v23;
  double width;
  double height;
  CGSize v26;
  id v27;
  THWViewportInfo *v28;
  id v29;

  v5 = objc_msgSend(a3, "currentHtmlStackEntry");
  v6 = objc_msgSend(v5, "currentEntryMediaState");
  v7 = objc_opt_class(TSWPStorage);
  *(_QWORD *)&v9 = TSUDynamicCast(v7, objc_msgSend(v6, "childResultAtIndex:", 0)).n128_u64[0];
  if (v8)
  {
    v10 = v8;
    v11 = objc_msgSend(v5, "valueForAttribute:", PFXWidgetConstantDataContentPadding[0], v9);
    if (v11)
    {
      objc_msgSend(v11, "doubleValue");
      v13 = v12;
    }
    else
    {
      v13 = 0.0;
    }
    v14 = objc_msgSend(v5, "valueForAttribute:", PFXWidgetConstantDataCanvasWidth[0]);
    if (v14)
    {
      objc_msgSend(v14, "doubleValue");
      v16 = v15;
    }
    else
    {
      v16 = 180.0;
    }
    v17 = objc_msgSend(v5, "valueForAttribute:", PFXWidgetConstantDataCanvasHeight[0]);
    if (v17)
    {
      objc_msgSend(v17, "doubleValue");
      v19 = v18;
    }
    else
    {
      v19 = 200.0;
    }
    v20 = objc_msgSend(objc_alloc((Class)TSDInfoGeometry), "initWithPosition:size:", CGPointZero.x, CGPointZero.y, v16, v19);
    v21 = objc_msgSend(objc_alloc((Class)TSWPShapeStyle), "initWithContext:", objc_msgSend(a3, "tspContext"));
    objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentHtmlDocMediaState"), "stylesheet"), "addStyle:", v21);
    v22 = objc_msgSend(objc_alloc((Class)TSWPShapeInfo), "initWithContext:geometry:style:wpStorage:", objc_msgSend(a3, "tspContext"), v20, v21, v10);
    objc_msgSend(v22, "setStroke:", +[TSDStroke emptyStroke](TSDStroke, "emptyStroke"));
    v23 = (NSString *)objc_msgSend(v5, "valueForAttribute:", PFXWidgetConstantDataViewportSize[0]);
    width = v16;
    height = v19;
    if (v23)
    {
      v26 = CGSizeFromString(v23);
      width = v26.width;
      height = v26.height;
    }
    v27 = objc_msgSend(objc_alloc((Class)TSDInfoGeometry), "initWithPosition:size:", CGPointZero.x, CGPointZero.y, width, height);
    v28 = -[THWViewportInfo initWithContext:geometry:]([THWViewportInfo alloc], "initWithContext:geometry:", objc_msgSend(a3, "tspContext"), v27);
    -[THWViewportInfo setCanvasSize:](v28, "setCanvasSize:", v16, v19);
    -[THWViewportInfo setContentPadding:](v28, "setContentPadding:", v13);
    -[THWViewportInfo setBackgroundShape:](v28, "setBackgroundShape:", -[PFEIViewport _backgroundShapeInfoCanvasSize:readerState:](self, "_backgroundShapeInfoCanvasSize:readerState:", a3, v16, v19));
    -[THWViewportInfo setExteriorTextWrap:](v28, "setExteriorTextWrap:", -[PFXDrawablePlacement exteriorTextWrap](self->_drawablePlacement, "exteriorTextWrap"));
    v29 = v22;
    -[THWViewportInfo setCanvasInfos:](v28, "setCanvasInfos:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
    if (-[THWViewportInfo backgroundShape](v28, "backgroundShape"))
    {
      -[THWViewportInfo setStroke:](v28, "setStroke:", -[TSDShapeInfo stroke](-[THWViewportInfo backgroundShape](v28, "backgroundShape"), "stroke"));
      -[TSDShapeInfo setStroke:](-[THWViewportInfo backgroundShape](v28, "backgroundShape"), "setStroke:", +[TSDStroke emptyStroke](TSDStroke, "emptyStroke"));
      -[TSDShapeInfo setGeometry:](-[THWViewportInfo backgroundShape](v28, "backgroundShape"), "setGeometry:", v27);
    }
    objc_msgSend(v6, "setResult:", v28);

  }
}

@end

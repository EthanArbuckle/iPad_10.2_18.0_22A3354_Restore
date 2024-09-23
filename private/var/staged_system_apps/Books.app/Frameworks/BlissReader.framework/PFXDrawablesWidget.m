@implementation PFXDrawablesWidget

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFXDrawablesWidget;
  -[PFXDrawablesWidget dealloc](&v3, "dealloc");
}

- (BOOL)mapStartElementWithState:(id)a3
{
  PFXDrawablePlacement *v5;
  unsigned __int8 v6;
  id v7;
  id v8;

  v5 = (PFXDrawablePlacement *)objc_msgSend(objc_alloc((Class)objc_msgSend(a3, "drawablePlacementClass")), "initWithDrawable:", self);
  self->mDrawablePlacement = v5;
  v6 = -[PFXDrawablePlacement mapStartElementWithState:](v5, "mapStartElementWithState:", a3);
  v7 = objc_msgSend(a3, "currentHtmlDocMediaState");
  if (-[PFXDrawablePlacement mode](self->mDrawablePlacement, "mode") == 2)
  {
    if (objc_msgSend(v7, "hasHints"))
    {
      if ((objc_msgSend(a3, "inTable") & 1) == 0)
      {
        v8 = objc_msgSend(v7, "nextHintLocation");
        if (v8 == objc_msgSend(a3, "totalTextRead"))
        {
          objc_msgSend(objc_msgSend(a3, "hintCollectorForStorage:", objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "currentEntryMediaState"), "storage")), "addLineBreakHintWithPresentationId:", CFSTR("p"));
          objc_msgSend(v7, "popHint");
        }
      }
    }
  }
  return v6;
}

- (BOOL)isAudioOnlyWithPosterImage:(id)a3
{
  uint64_t v4;
  double v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v4 = objc_opt_class(TSDMovieInfo);
  *(_QWORD *)&v5 = TSUDynamicCast(v4, objc_msgSend(a3, "expandedStageDrawable")).n128_u64[0];
  LODWORD(v7) = objc_msgSend(v6, "isAudioOnly", v5);
  if ((_DWORD)v7)
  {
    v8 = objc_opt_class(TSDImageInfo);
    TSUDynamicCast(v8, objc_msgSend(a3, "stageDrawable"));
    LOBYTE(v7) = v7 != 0;
  }
  return v7;
}

- (void)mapEndElementWithState:(id)a3
{
  THWDrawablesWidgetInfo *v5;
  PFXWidgetPlacement *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  void *v18;
  void *v19;
  TSWPShapeInfo *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  double v25;

  v5 = -[THWDrawablesWidgetInfo initWithContext:geometry:]([THWDrawablesWidgetInfo alloc], "initWithContext:geometry:", objc_msgSend(a3, "tspContext"), -[PFXDrawablePlacement infoGeometry](self->mDrawablePlacement, "infoGeometry"));
  v6 = +[PFXWidgetPlacement widgetPlacementWithDrawablePlacement:readerState:](PFXWidgetPlacement, "widgetPlacementWithDrawablePlacement:readerState:", self->mDrawablePlacement, a3);
  -[THWDrawablesWidgetInfo setContainerWrap:](v5, "setContainerWrap:", -[NSString isEqualToString:](-[PFXWidgetPlacement contentLayout](v6, "contentLayout"), "isEqualToString:", CFSTR("freeform")) ^ 1);
  v7 = objc_msgSend(a3, "currentHtmlStackEntry");
  v8 = objc_msgSend(v7, "valueForAttribute:", "title");
  if (v8)
  {
    v9 = v8;
    v11 = -[THWDrawablesWidgetInfo accessibilityDescriptions](v5, "accessibilityDescriptions");
    if (!v11)
    {
      v11 = (id)objc_opt_new(NSMutableDictionary, v10);
      -[THWDrawablesWidgetInfo setAccessibilityDescriptions:](v5, "setAccessibilityDescriptions:", v11);

    }
    objc_msgSend(v11, "setObject:forKey:", v9, CFSTR("widgetTitle"));
  }
  v12 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THWAutoplayableMedia, -[PFXWidgetPlacement stageDrawable](v6, "stageDrawable"));
  if (v12)
    objc_msgSend(v12, "setAutoplayConfig:", +[PFXAutoplayConfig autoplayConfigWithState:](PFXAutoplayConfig, "autoplayConfigWithState:", a3));
  -[THWDrawablesWidgetInfo setStageDrawable:](v5, "setStageDrawable:", -[PFXWidgetPlacement stageDrawable](v6, "stageDrawable"));
  -[THWDrawablesWidgetInfo setExpandedStageDrawable:](v5, "setExpandedStageDrawable:", -[PFXWidgetPlacement expandedStageDrawable](v6, "expandedStageDrawable"));
  -[THWDrawablesWidgetInfo setExpandedOnly:](v5, "setExpandedOnly:", -[PFXWidgetPlacement expandedOnly](v6, "expandedOnly"));
  if (-[PFXDrawablesWidget isAudioOnlyWithPosterImage:](self, "isAudioOnlyWithPosterImage:", v5))
  {
    v13 = objc_opt_class(THWMovieInfo);
    TSUDynamicCast(v13, -[THWDrawablesWidgetInfo expandedStageDrawable](v5, "expandedStageDrawable"));
    v15 = v14;
    v16 = objc_opt_class(TSDImageInfo);
    *(_QWORD *)&v17 = TSUDynamicCast(v16, -[THWDrawablesWidgetInfo stageDrawable](v5, "stageDrawable")).n128_u64[0];
    v19 = v18;
    objc_msgSend(v15, "setPosterImageData:", objc_msgSend(v18, "imageData", v17));
    objc_msgSend(v15, "setPosterImageInfo:", v19);
    objc_msgSend(v15, "setGeometry:", objc_msgSend(v19, "geometry"));
    -[THWDrawablesWidgetInfo setStageDrawable:](v5, "setStageDrawable:", v15);
    -[THWDrawablesWidgetInfo setExpandedStageDrawable:](v5, "setExpandedStageDrawable:", 0);
  }
  if (-[PFXWidgetPlacement hasChildrenForAdornmentInfo](v6, "hasChildrenForAdornmentInfo")
    || -[THWDrawablesWidgetInfo containerWrap](v5, "containerWrap"))
  {
    -[THWDrawablesWidgetInfo setAdornmentInfo:](v5, "setAdornmentInfo:", objc_msgSend((id)objc_opt_class(self), "adornmentInfoWithWidgetPlacement:readerState:", v6, a3));
    -[THWWidgetAdornmentInfo updateParentInfo:](-[THWDrawablesWidgetInfo adornmentInfo](v5, "adornmentInfo"), "updateParentInfo:", v5);
    v20 = -[THWWidgetAdornmentInfo title](-[THWDrawablesWidgetInfo adornmentInfo](v5, "adornmentInfo"), "title");
    if (v20)
    {
      v21 = -[TSWPShapeInfo containedStorage](v20, "containedStorage");
      v22 = objc_msgSend(a3, "ancestorEntryWithReaderClass:", objc_opt_class(PFAIAnchoredDrawable));
      v23 = objc_opt_class(PFAIAnchoredDrawable);
      *(_QWORD *)&v25 = TSUDynamicCast(v23, objc_msgSend(v22, "reader")).n128_u64[0];
      if (v24)
        objc_msgSend(v24, "setGutterTitleStorage:", v21, v25);
    }
  }
  objc_msgSend(objc_msgSend(v7, "currentEntryMediaState"), "setResult:", v5);
  -[PFXDrawablePlacement mapEndElementWithState:](self->mDrawablePlacement, "mapEndElementWithState:", a3);
}

+ (id)adornmentInfoWithWidgetPlacement:(id)a3 readerState:(id)a4
{
  THWWidgetAdornmentInfo *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v5 = objc_alloc_init(THWWidgetAdornmentInfo);
  objc_msgSend(a3, "contentPadding");
  -[THWWidgetAdornmentInfo setContentPadding:](v5, "setContentPadding:");
  -[THWWidgetAdornmentInfo setExteriorTextWrap:](v5, "setExteriorTextWrap:", objc_msgSend(a3, "exteriorTextWrap"));
  v6 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v7 = objc_msgSend(a3, "orderedChildDrawables");
  v8 = objc_msgSend(a3, "titleShape");
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v6, "setObject:forKey:", v8, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v7, "indexOfObject:", v8)));
    -[THWWidgetAdornmentInfo setTitle:](v5, "setTitle:", v9);
  }
  v10 = objc_msgSend(a3, "captionShape");
  if (v10)
  {
    v11 = v10;
    objc_msgSend(v6, "setObject:forKey:", v10, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v7, "indexOfObject:", v10)));
    -[THWWidgetAdornmentInfo setCaption:](v5, "setCaption:", v11);
  }
  if (objc_msgSend(a3, "useBackgroundShape"))
  {
    v12 = objc_msgSend(a3, "backgroundShape");
    objc_msgSend(v6, "setObject:forKey:", v12, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v7, "indexOfObject:", v12)));
    -[THWWidgetAdornmentInfo setBackground:](v5, "setBackground:", v12);
  }
  -[THWWidgetAdornmentInfo setInsertionOrder:](v5, "setInsertionOrder:", v6);
  return v5;
}

- (PFXDrawablePlacement)placement
{
  return self->mDrawablePlacement;
}

@end

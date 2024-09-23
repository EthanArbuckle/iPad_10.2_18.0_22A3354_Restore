@implementation PFXKeynoteWidget

- (void)mapEndElementWithState:(id)a3
{
  id v5;
  id v6;
  TSWWidgetStyle *v7;
  PFXWidgetPlacement *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  TSWWidgetStyle *v14;
  id v15;
  uint64_t v16;
  void *v17;
  double v18;
  THWKeynoteInfo *v19;
  THWKeynoteInfo *v20;
  id v21;
  PFXWidgetPlacement *v22;
  THWKeynoteShowInfo *v23;

  v5 = objc_msgSend(a3, "currentHtmlStackEntry");
  v6 = +[PFXWidget urlForDataBundleWithState:](PFXWidget, "urlForDataBundleWithState:", a3);
  v7 = -[TSWWidgetStyle initWithContext:]([TSWWidgetStyle alloc], "initWithContext:", objc_msgSend(a3, "tspContext"));
  objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentHtmlDocMediaState"), "stylesheet"), "addStyle:", v7);
  v8 = +[PFXWidgetPlacement widgetPlacementWithDrawablePlacement:readerState:](PFXWidgetPlacement, "widgetPlacementWithDrawablePlacement:readerState:", self->super.super.mPlacement, a3);
  v9 = objc_msgSend(v5, "valueForAttribute:", PFXWidgetConstantDataStageGeometry[0]);
  if (v9)
  {
    v23 = -[THWKeynoteShowInfo initWithContext:geometry:sourceURL:drmContext:]([THWKeynoteShowInfo alloc], "initWithContext:geometry:sourceURL:drmContext:", objc_msgSend(a3, "tspContext"), PFXTSDInfoGeometry((const char *)objc_msgSend(v9, "UTF8String")), v6, objc_msgSend(objc_msgSend(a3, "archive"), "drmContext"));
    v10 = objc_msgSend(v5, "valueForAttribute:", PFXWidgetConstantKeynoteShowTransportControls[0]);
    if (v10)
      v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("yes"));
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
    v23 = 0;
  }
  v22 = v8;
  if (-[PFXWidgetPlacement hasChildrenForAdornmentInfo](v8, "hasChildrenForAdornmentInfo"))
  {
    v12 = +[PFXDrawablesWidget adornmentInfoWithWidgetPlacement:readerState:](PFXDrawablesWidget, "adornmentInfoWithWidgetPlacement:readerState:", v8, a3);
    v13 = objc_msgSend(v12, "title");
    v14 = v7;
    if (v13)
    {
      v21 = objc_msgSend(v13, "containedStorage");
      v15 = objc_msgSend(a3, "ancestorEntryWithReaderClass:", objc_opt_class(PFAIAnchoredDrawable));
      v16 = objc_opt_class(PFAIAnchoredDrawable);
      *(_QWORD *)&v18 = TSUDynamicCast(v16, objc_msgSend(v15, "reader")).n128_u64[0];
      if (v17)
        objc_msgSend(v17, "setGutterTitleStorage:", v21, v18);
    }
  }
  else
  {
    v14 = v7;
    v12 = 0;
  }
  v19 = -[THWKeynoteInfo initWithContext:geometry:style:showInfo:adornmentInfo:showTransportControls:autoPlayConfig:]([THWKeynoteInfo alloc], "initWithContext:geometry:style:showInfo:adornmentInfo:showTransportControls:autoPlayConfig:", objc_msgSend(a3, "tspContext"), -[PFXDrawablePlacement infoGeometry](self->super.super.mPlacement, "infoGeometry"), v14, v23, v12, v11, +[PFXAutoplayConfig autoplayConfigWithState:](PFXAutoplayConfig, "autoplayConfigWithState:", a3));
  -[THWKeynoteInfo setProgressKitID:](v19, "setProgressKitID:", +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", objc_msgSend(v5, "xmlElementId")));
  -[THWKeynoteInfo setProgressKitSectionID:](v19, "setProgressKitSectionID:", objc_msgSend(a3, "nodeGUID"));
  v20 = v19;
  if (+[PFXWidget isWidgetExpandedOnly:](PFXKeynoteWidget, "isWidgetExpandedOnly:", a3))
  {
    v20 = +[PFXWidget drawableWidgetWithContext:infoGeometry:widgetTitle:stageDrawable:widgetInfo:](PFXKeynoteWidget, "drawableWidgetWithContext:infoGeometry:widgetTitle:stageDrawable:widgetInfo:", objc_msgSend(a3, "tspContext"), -[PFXDrawablePlacement infoGeometry](self->super.super.mPlacement, "infoGeometry"), objc_msgSend(v5, "titleAttributeValue"), -[PFXWidgetPlacement stageDrawable](v22, "stageDrawable"), v19);
    -[THWKeynoteInfo setAdornmentInfo:](v20, "setAdornmentInfo:", -[THWKeynoteInfo adornmentInfo](v19, "adornmentInfo"));
    -[THWWidgetAdornmentInfo updateParentInfo:](-[THWKeynoteInfo adornmentInfo](v20, "adornmentInfo"), "updateParentInfo:", v20);
  }
  objc_msgSend(a3, "setUniqueIdForInfo:fromStackEntry:", v20, v5);
  objc_msgSend(objc_msgSend(v5, "currentEntryMediaState"), "setResult:", v20);

  -[PFXDrawablePlacement mapEndElementWithState:](self->super.super.mPlacement, "mapEndElementWithState:", a3);
}

@end

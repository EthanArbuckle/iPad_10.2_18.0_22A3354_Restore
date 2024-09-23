@implementation PFXWebWidget

- (void)mapEndElementWithState:(id)a3
{
  id v5;
  id v6;
  id v7;
  TSWWidgetStyle *v8;
  id v9;
  const xmlChar *v10;
  double v11;
  double v12;
  const xmlChar *v13;
  PFXWebWidget *v14;
  BOOL v15;
  PFXAutoplayConfig *v16;
  THWWebInfo *v17;
  id v18;
  TSDInfoGeometry *v19;
  id v20;
  THWWebInfo *v21;
  PFXWebWidget *v22;
  THWWebInfo *v23;
  PFXWidgetPlacement *v24;
  THWWebInfo *v25;
  TSDDrawableInfo *v26;
  void *v27;
  uint64_t v28;
  _BOOL4 v29;
  id v30;
  id v31;

  v5 = objc_msgSend(a3, "currentHtmlStackEntry");
  v6 = objc_msgSend(v5, "currentEntryMediaState");
  v7 = +[PFXWidget urlForDataBundleWithState:](PFXWidget, "urlForDataBundleWithState:", a3);
  v8 = -[TSWWidgetStyle initWithContext:]([TSWWidgetStyle alloc], "initWithContext:", objc_msgSend(a3, "tspContext"));
  objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentHtmlDocMediaState"), "stylesheet"), "addStyle:", v8);
  v9 = PFXTSDInfoGeometry((const char *)objc_msgSend(objc_msgSend(v5, "valueForAttribute:", PFXWidgetConstantDataStageGeometry[0]), "UTF8String"));
  v10 = (const xmlChar *)objc_msgSend(v5, "xmlValueForAttribute:", PFXWidgetConstantDataNotifiesOnReady[0]);
  v29 = v10 && *v10 && xmlStrEqual(v10, (const xmlChar *)"yes") != 0;
  objc_msgSend(a3, "applePubVersion");
  v12 = v11;
  v13 = (const xmlChar *)objc_msgSend(v5, "xmlValueForAttribute:", PFXWidgetConstantAllowNetworkAccess);
  v30 = v7;
  v31 = v6;
  v14 = self;
  if (v13)
    v15 = xmlStrEqual(v13, (const xmlChar *)"yes") != 0;
  else
    v15 = 1;
  v16 = +[PFXAutoplayConfig autoplayConfigWithState:](PFXAutoplayConfig, "autoplayConfigWithState:", a3);
  v17 = [THWWebInfo alloc];
  v18 = objc_msgSend(a3, "tspContext");
  v19 = -[PFXDrawablePlacement infoGeometry](v14->super.super.mPlacement, "infoGeometry");
  v20 = objc_msgSend(objc_msgSend(a3, "archive"), "drmContext");
  BYTE1(v28) = v15;
  LOBYTE(v28) = v12 <= 1.01;
  v21 = v17;
  v22 = v14;
  v23 = -[THWWebInfo initWithContext:geometry:stageGeometry:sourceURL:drmContext:exposurePolicy:ignoreInfoPlist:allowNetworkAccess:autoplayConfig:](v21, "initWithContext:geometry:stageGeometry:sourceURL:drmContext:exposurePolicy:ignoreInfoPlist:allowNetworkAccess:autoplayConfig:", v18, v19, v9, v30, v20, v29, v28, v16);

  -[THWWebInfo setProgressKitID:](v23, "setProgressKitID:", +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", objc_msgSend(v5, "xmlElementId")));
  -[THWWebInfo setProgressKitSectionID:](v23, "setProgressKitSectionID:", objc_msgSend(a3, "nodeGUID"));
  v24 = +[PFXWidgetPlacement widgetPlacementWithDrawablePlacement:readerState:](PFXWidgetPlacement, "widgetPlacementWithDrawablePlacement:readerState:", v22->super.super.mPlacement, a3);
  if (-[PFXWidgetPlacement hasChildrenForAdornmentInfo](v24, "hasChildrenForAdornmentInfo"))
    -[THWWebInfo setAdornmentInfo:](v23, "setAdornmentInfo:", +[PFXDrawablesWidget adornmentInfoWithWidgetPlacement:readerState:](PFXDrawablesWidget, "adornmentInfoWithWidgetPlacement:readerState:", v24, a3));
  objc_msgSend(a3, "setUniqueIdForInfo:fromStackEntry:", v23, v5);
  objc_msgSend(a3, "setCfiPathForInfo:fromStackEntry:", v23, v5);
  if (+[PFXWidget isWidgetExpandedOnly:](PFXWidget, "isWidgetExpandedOnly:", a3))
  {
    v25 = +[PFXWidget drawableWidgetWithContext:infoGeometry:widgetTitle:stageDrawable:widgetInfo:](PFXWebWidget, "drawableWidgetWithContext:infoGeometry:widgetTitle:stageDrawable:widgetInfo:", objc_msgSend(a3, "tspContext"), -[PFXDrawablePlacement infoGeometry](v22->super.super.mPlacement, "infoGeometry"), objc_msgSend(v5, "titleAttributeValue"), -[PFXWidgetPlacement stageDrawable](v24, "stageDrawable"), v23);
    -[THWWebInfo setAdornmentInfo:](v25, "setAdornmentInfo:", -[THWWebInfo adornmentInfo](v23, "adornmentInfo"));
    -[THWWidgetAdornmentInfo updateParentInfo:](-[THWWebInfo adornmentInfo](v25, "adornmentInfo"), "updateParentInfo:", v25);
    v26 = (TSDDrawableInfo *)-[THWWebInfo stageDrawable](v25, "stageDrawable");
    v27 = v31;
LABEL_14:
    -[THWWebInfo setPlaceholderInfo:](v23, "setPlaceholderInfo:", v26);
    goto LABEL_15;
  }
  -[THWWidgetAdornmentInfo updateParentInfo:](-[THWWebInfo adornmentInfo](v23, "adornmentInfo"), "updateParentInfo:", v23);
  v25 = v23;
  v27 = v31;
  if (-[PFXWidgetPlacement stageThumb](v24, "stageThumb"))
  {
    v26 = -[PFXWidgetPlacement stageThumb](v24, "stageThumb");
    v25 = v23;
    goto LABEL_14;
  }
LABEL_15:
  objc_msgSend(v27, "setResult:", v25);
  objc_msgSend(objc_msgSend(v5, "currentEntryMediaState"), "setResult:", v25);

  -[PFXDrawablePlacement mapEndElementWithState:](v22->super.super.mPlacement, "mapEndElementWithState:", a3);
}

@end

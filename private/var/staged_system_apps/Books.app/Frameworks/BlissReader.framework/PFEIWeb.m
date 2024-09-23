@implementation PFEIWeb

- (void)mapEndElementWithState:(id)a3
{
  id v5;
  id v6;
  id v7;
  const xmlChar *v8;
  _BOOL8 v9;
  double v10;
  double v11;
  const xmlChar *v12;
  BOOL v13;
  THWWebInfo *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  unint64_t v22;
  id v23;
  uint64_t v24;
  double v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  THWWebInfo *v31;
  PFEIWeb *v32;
  id v33;
  uint64_t v34;
  PFEIWeb *v35;
  void *v36;
  id v37;
  objc_super v38;

  -[PFXDrawablePlacement mapEndElementWithState:](-[PFEIWidget placement](self, "placement"), "mapEndElementWithState:", a3);
  v5 = objc_msgSend(a3, "currentHtmlStackEntry");
  v37 = objc_msgSend(v5, "currentEntryMediaState");
  v6 = +[PFXWidget urlForDataBundleWithState:](PFXWidget, "urlForDataBundleWithState:", a3);
  v7 = PFXTSDInfoGeometry((const char *)objc_msgSend(objc_msgSend(v5, "valueForAttribute:", PFXWidgetConstantDataStageGeometry[0]), "UTF8String"));
  v8 = (const xmlChar *)objc_msgSend(v5, "xmlValueForAttribute:", PFXWidgetConstantDataNotifiesOnReady[0]);
  v9 = v8 && *v8 && xmlStrEqual(v8, (const xmlChar *)"yes") != 0;
  objc_msgSend(a3, "applePubVersion");
  v11 = v10;
  v36 = v5;
  v12 = (const xmlChar *)objc_msgSend(v5, "xmlValueForAttribute:", PFXWidgetConstantAllowNetworkAccess);
  if (v12)
    v13 = xmlStrEqual(v12, (const xmlChar *)"yes") != 0;
  else
    v13 = 1;
  v35 = self;
  BYTE1(v34) = v13;
  LOBYTE(v34) = v11 <= 1.01;
  v14 = -[THWWebInfo initWithContext:geometry:stageGeometry:sourceURL:drmContext:exposurePolicy:ignoreInfoPlist:allowNetworkAccess:autoplayConfig:]([THWWebInfo alloc], "initWithContext:geometry:stageGeometry:sourceURL:drmContext:exposurePolicy:ignoreInfoPlist:allowNetworkAccess:autoplayConfig:", objc_msgSend(a3, "tspContext"), -[PFXDrawablePlacement infoGeometry](-[PFEIWidget placement](self, "placement"), "infoGeometry"), v7, v6, objc_msgSend(objc_msgSend(a3, "archive"), "drmContext"), v9, v34, +[PFXAutoplayConfig autoplayConfigWithState:](PFXAutoplayConfig, "autoplayConfigWithState:", a3));
  v15 = objc_opt_class(TSUPair);
  TSUDynamicCast(v15, objc_msgSend(objc_msgSend(v37, "childResults"), "firstObject"));
  v17 = v16;
  v18 = objc_opt_class(NSArray);
  TSUDynamicCast(v18, objc_msgSend(v17, "second"));
  v20 = v19;
  v21 = objc_alloc_init((Class)NSMutableArray);
  if (!objc_msgSend(v20, "count"))
    goto LABEL_18;
  v22 = 0;
  v23 = 0;
  do
  {
    v24 = objc_opt_class(TSUPair);
    *(_QWORD *)&v25 = TSUDynamicCast(v24, objc_msgSend(v20, "objectAtIndexedSubscript:", v22)).n128_u64[0];
    v27 = v26;
    v28 = objc_msgSend(v26, "second", v25);
    v29 = objc_opt_class(TSWPStorage);
    if ((objc_opt_isKindOfClass(v28, v29) & 1) != 0)
    {
      objc_msgSend(v21, "addObject:", v27);
    }
    else
    {
      v30 = objc_opt_class(THImageInfo);
      if ((objc_opt_isKindOfClass(v28, v30) & (v23 == 0)) != 0)
        v23 = v28;
    }
    ++v22;
  }
  while (v22 < (unint64_t)objc_msgSend(v20, "count"));
  if (v23)
  {
    -[THWWebInfo setPlaceholderInfo:](v14, "setPlaceholderInfo:", v23);
    v31 = v14;
    v32 = v35;
    if (+[PFXWidget isWidgetExpandedOnly:](PFXWidget, "isWidgetExpandedOnly:", a3))
    {
      v31 = +[PFXWidget drawableWidgetWithContext:infoGeometry:widgetTitle:stageDrawable:widgetInfo:](PFXWebWidget, "drawableWidgetWithContext:infoGeometry:widgetTitle:stageDrawable:widgetInfo:", objc_msgSend(a3, "tspContext"), -[PFXDrawablePlacement infoGeometry](-[PFEIWidget placement](v35, "placement"), "infoGeometry"), objc_msgSend(v36, "titleAttributeValue"), v23, v14);
      -[THWWebInfo setStageDrawable:](v31, "setStageDrawable:", v23);
      -[THWWebInfo setExpandedStageDrawable:](v31, "setExpandedStageDrawable:", v14);
      -[THWWebInfo setExpandedOnly:](v31, "setExpandedOnly:", 1);
      objc_msgSend(objc_msgSend(objc_msgSend(a3, "orientationState"), "contentNodeBody"), "setExpandedDrawable:forWidgetInfo:", v31, v14);
    }
  }
  else
  {
LABEL_18:
    +[PFXWidget isWidgetExpandedOnly:](PFXWidget, "isWidgetExpandedOnly:", a3);
    v31 = v14;
    v32 = v35;
  }
  v33 = objc_msgSend(objc_alloc((Class)TSUPair), "initWithFirst:second:", CFSTR("web"), v31);
  objc_msgSend(v21, "addObject:", v33);

  objc_msgSend(a3, "setUniqueIdForInfo:fromStackEntry:", v14, v36);
  objc_msgSend(a3, "setCfiPathForInfo:fromStackEntry:", v14, v36);
  objc_msgSend(v37, "setResult:", v21);

  v38.receiver = v32;
  v38.super_class = (Class)PFEIWeb;
  -[PFEIWidget mapEndElementWithState:](&v38, "mapEndElementWithState:", a3);
}

@end

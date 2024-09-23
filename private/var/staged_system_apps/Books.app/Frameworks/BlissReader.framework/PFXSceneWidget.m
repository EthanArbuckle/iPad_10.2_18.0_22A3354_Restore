@implementation PFXSceneWidget

- (void)mapEndElementWithState:(id)a3
{
  id v5;
  TSWWidgetStyle *v6;
  PFXWidgetPlacement *v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  double v14;
  THWSceneInfo *v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  __n128 v25;
  __n128 v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;
  const xmlChar *v33;
  const xmlChar *v34;
  uint64_t v35;
  THWDrawablesWidgetInfo *v36;
  id v37;
  id v38;
  id v39;
  TSWPShapeInfo *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *v44;
  double v45;
  id v46;

  v5 = objc_msgSend(a3, "currentHtmlStackEntry");
  v46 = +[PFXWidget urlForDataBundleWithState:](PFXWidget, "urlForDataBundleWithState:", a3);
  v6 = -[TSWWidgetStyle initWithContext:]([TSWWidgetStyle alloc], "initWithContext:", objc_msgSend(a3, "tspContext"));
  objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentHtmlDocMediaState"), "stylesheet"), "addStyle:", v6);
  v7 = +[PFXWidgetPlacement widgetPlacementWithDrawablePlacement:readerState:](PFXWidgetPlacement, "widgetPlacementWithDrawablePlacement:readerState:", self->super.super.mPlacement, a3);
  v8 = PFXTSDInfoGeometry((const char *)objc_msgSend(objc_msgSend(v5, "valueForAttribute:", PFXWidgetConstantDataStageGeometry[0]), "UTF8String"));
  v9 = objc_msgSend(objc_msgSend(v5, "currentEntryMediaState"), "childResultCount");
  if (v9)
  {
    v10 = 0;
    while (1)
    {
      v11 = objc_msgSend(objc_msgSend(v5, "currentEntryMediaState", v46), "childResultAtIndex:", v10);
      v12 = objc_opt_class(TSDColorFill);
      *(_QWORD *)&v14 = TSUDynamicCast(v12, v11).n128_u64[0];
      if (v13)
        break;
      if (v9 == (id)++v10)
      {
        v9 = 0;
        goto LABEL_7;
      }
    }
    v9 = objc_msgSend(v13, "color", v14);
  }
LABEL_7:
  v15 = -[THWSceneInfo initWithContext:geometry:sourceURL:drmContext:stageColor:]([THWSceneInfo alloc], "initWithContext:geometry:sourceURL:drmContext:stageColor:", objc_msgSend(a3, "tspContext"), v8, v46, objc_msgSend(objc_msgSend(a3, "archive"), "drmContext"), v9);
  -[THWSceneInfo setProgressKitID:](v15, "setProgressKitID:", +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", objc_msgSend(v5, "xmlElementId")));
  -[THWSceneInfo setProgressKitSectionID:](v15, "setProgressKitSectionID:", objc_msgSend(a3, "nodeGUID"));
  if (-[PFXWidgetPlacement fallbackImage](v7, "fallbackImage"))
  {
    v16 = objc_alloc((Class)TSDInfoGeometry);
    objc_msgSend(-[TSDImageInfo geometry](-[PFXWidgetPlacement fallbackImage](v7, "fallbackImage"), "geometry"), "position");
    v18 = v17;
    v20 = v19;
    objc_msgSend(v8, "position");
    v22 = v21;
    v24 = v23;
    v25.n128_u64[0] = v18;
    v26.n128_u64[0] = v20;
    v27 = TSDSubtractPoints(v25, v26, v22, v24);
    v29 = v28;
    objc_msgSend(-[TSDImageInfo geometry](-[PFXWidgetPlacement fallbackImage](v7, "fallbackImage"), "geometry"), "size");
    v32 = objc_msgSend(v16, "initWithPosition:size:", v27, v29, v30, v31);
    -[TSDImageInfo setGeometry:](-[PFXWidgetPlacement fallbackImage](v7, "fallbackImage"), "setGeometry:", v32);
    -[THWSceneInfo setPlaceholderImage:](v15, "setPlaceholderImage:", -[PFXWidgetPlacement fallbackImage](v7, "fallbackImage"));

  }
  v33 = (const xmlChar *)objc_msgSend(v5, "xmlValueForAttribute:", PFXWidgetConstantColladaAutoRotateWhenIdle[0], v46);
  if (v33 && xmlStrEqual(v33, (const xmlChar *)"yes"))
    -[THWSceneInfo setIdleAnimationBehavior:](v15, "setIdleAnimationBehavior:", 1);
  v34 = (const xmlChar *)objc_msgSend(v5, "xmlValueForAttribute:", PFXWidgetConstantColladaRotationType[0]);
  if (xmlStrEqual(v34, (const xmlChar *)PFXWidgetConstantColladaRotationFreeRotate[0]))
  {
    v35 = 0;
  }
  else if (xmlStrEqual(v34, (const xmlChar *)PFXWidgetConstantColladaRotationHorizontal[0]))
  {
    v35 = 2;
  }
  else
  {
    if (!xmlStrEqual(v34, (const xmlChar *)PFXWidgetConstantColladaRotationHorizontalAndVertical[0]))
      goto LABEL_19;
    v35 = 1;
  }
  -[THWSceneInfo setRotationConstraints:](v15, "setRotationConstraints:", v35);
LABEL_19:
  v36 = -[THWDrawablesWidgetInfo initWithContext:geometry:]([THWDrawablesWidgetInfo alloc], "initWithContext:geometry:", objc_msgSend(a3, "tspContext"), -[PFXDrawablePlacement infoGeometry](self->super.super.mPlacement, "infoGeometry"));
  -[THWDrawablesWidgetInfo setStageDrawable:](v36, "setStageDrawable:", v15);
  v37 = objc_msgSend(v5, "valueForAttribute:", "title");
  if (v37)
  {
    v38 = v37;
    v39 = -[THWDrawablesWidgetInfo accessibilityDescriptions](v36, "accessibilityDescriptions");
    if (!v39)
    {
      v39 = objc_alloc_init((Class)NSMutableDictionary);
      -[THWDrawablesWidgetInfo setAccessibilityDescriptions:](v36, "setAccessibilityDescriptions:", v39);

    }
    objc_msgSend(v39, "setObject:forKey:", v38, CFSTR("widgetTitle"));
  }
  if (-[PFXWidgetPlacement hasChildrenForAdornmentInfo](v7, "hasChildrenForAdornmentInfo"))
  {
    -[THWDrawablesWidgetInfo setAdornmentInfo:](v36, "setAdornmentInfo:", +[PFXDrawablesWidget adornmentInfoWithWidgetPlacement:readerState:](PFXDrawablesWidget, "adornmentInfoWithWidgetPlacement:readerState:", v7, a3));
    -[THWWidgetAdornmentInfo updateParentInfo:](-[THWDrawablesWidgetInfo adornmentInfo](v36, "adornmentInfo"), "updateParentInfo:", v36);
    v40 = -[THWWidgetAdornmentInfo title](-[THWDrawablesWidgetInfo adornmentInfo](v36, "adornmentInfo"), "title");
    if (v40)
    {
      v41 = -[TSWPShapeInfo containedStorage](v40, "containedStorage");
      v42 = objc_msgSend(a3, "ancestorEntryWithReaderClass:", objc_opt_class(PFAIAnchoredDrawable));
      v43 = objc_opt_class(PFAIAnchoredDrawable);
      *(_QWORD *)&v45 = TSUDynamicCast(v43, objc_msgSend(v42, "reader")).n128_u64[0];
      if (v44)
        objc_msgSend(v44, "setGutterTitleStorage:", v41, v45);
    }
    -[THWSceneInfo setPanelContentProvider:](v15, "setPanelContentProvider:", -[THWDrawablesWidgetInfo adornmentInfo](v36, "adornmentInfo"));
  }
  objc_msgSend(a3, "setUniqueIdForInfo:fromStackEntry:", v36, v5);
  objc_msgSend(objc_msgSend(v5, "currentEntryMediaState"), "setResult:", v36);

  -[PFXDrawablePlacement mapEndElementWithState:](self->super.super.mPlacement, "mapEndElementWithState:", a3);
}

@end

@implementation PFXInteractiveImageWidget

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFXInteractiveImageWidget;
  -[PFXInteractiveImageWidget dealloc](&v3, "dealloc");
}

- (BOOL)mapStartElementWithState:(id)a3
{
  PFXDrawablePlacement *v5;
  unsigned __int8 v6;
  id v7;
  id v8;

  v5 = (PFXDrawablePlacement *)objc_msgSend(objc_alloc((Class)objc_msgSend(a3, "drawablePlacementClass")), "initWithDrawable:", self);
  self->mPlacement = v5;
  v6 = -[PFXDrawablePlacement mapStartElementWithState:](v5, "mapStartElementWithState:", a3);
  v7 = objc_msgSend(a3, "currentHtmlDocMediaState");
  if (-[PFXDrawablePlacement mode](self->mPlacement, "mode") == 2)
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

- (void)mapEndElementWithState:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  THWInteractiveImageCalloutInfo *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  THWInteractiveImageCalloutInfo *v18;
  const xmlChar *v19;
  double v20;
  float v21;
  const xmlChar *v22;
  id v23;
  id v24;
  char *v25;
  char *i;
  uint64_t v27;
  uint64_t v28;
  double v29;
  id v30;
  id v31;
  uint64_t v32;
  void *j;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  TSWWidgetStyle *v44;
  id v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  THWStageGeometry *v52;
  PFXInteractiveImageWidget *v53;
  THWInteractiveImageWidgetInfo *v54;
  double v55;
  double v56;
  unsigned int v57;
  PFXWidgetPlacement *v58;
  TSWPShapeInfo *v59;
  id v60;
  id v61;
  uint64_t v62;
  void *v63;
  double v64;
  _BOOL4 v65;
  unsigned int v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];

  v4 = objc_msgSend(a3, "currentHtmlStackEntry");
  v5 = objc_msgSend(v4, "currentEntryMediaState");
  v67 = objc_msgSend(a3, "tspContext");
  v6 = objc_alloc_init((Class)NSMutableArray);
  v7 = objc_msgSend(v5, "childResultCount");
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    while (1)
    {
      v10 = objc_opt_class(PFXInteractiveImageWidgetViewObj);
      TSUDynamicCast(v10, objc_msgSend(v5, "childResultAtIndex:", v9));
      if (v11)
        break;
      if (v8 == (id)++v9)
        goto LABEL_5;
    }
    v12 = v11;
  }
  else
  {
LABEL_5:
    v12 = 0;
  }
  v13 = [THWInteractiveImageCalloutInfo alloc];
  objc_msgSend(v12, "scale");
  v15 = v14;
  objc_msgSend(v12, "translation");
  v18 = -[THWInteractiveImageCalloutInfo initWithViewScale:contentOffset:](v13, "initWithViewScale:contentOffset:", v15, v16, v17);
  objc_msgSend(v6, "addObject:", v18);

  v19 = (const xmlChar *)objc_msgSend(v4, "xmlValueForAttribute:", PFXWidgetConstantVisualDictionaryUseCommonDescription[0]);
  v20 = 0.0;
  if (v19 && xmlStrEqual(v19, (const xmlChar *)"yes"))
  {
    objc_msgSend(objc_msgSend(v4, "valueForAttribute:", PFXWidgetConstantVisualDictionaryDescriptionWidth[0]), "floatValue");
    v20 = v21;
    v66 = 1;
  }
  else
  {
    v66 = 0;
  }
  v22 = (const xmlChar *)objc_msgSend(v4, "xmlValueForAttribute:", PFXWidgetConstantVisualDictionaryShowControls[0]);
  v70 = v4;
  v71 = a3;
  v69 = v5;
  if (v22)
    v65 = xmlStrEqual(v22, (const xmlChar *)"yes") != 0;
  else
    v65 = 0;
  v23 = objc_alloc_init((Class)NSMutableArray);
  v24 = objc_msgSend(v12, "children");
  v25 = (char *)objc_msgSend(v24, "count");
  if (v25)
  {
    for (i = 0; i != v25; ++i)
    {
      v27 = objc_opt_class(TSUPair);
      *(_QWORD *)&v29 = TSUDynamicCast(v27, objc_msgSend(v24, "objectAtIndex:", i)).n128_u64[0];
      if (v28)
        objc_msgSend(v23, "addObject:", v28, v29);
    }
  }
  v68 = v12;
  objc_msgSend(v23, "sortUsingSelector:", "sortInteractiveImageChildren:");
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v30 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v74;
    do
    {
      for (j = 0; j != v31; j = (char *)j + 1)
      {
        if (*(_QWORD *)v74 != v32)
          objc_enumerationMutation(v23);
        v34 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)j);
        v35 = objc_opt_class(THWInteractiveImageCalloutInfo);
        *(_QWORD *)&v37 = TSUDynamicCast(v35, objc_msgSend(v34, "first")).n128_u64[0];
        if (v36)
          objc_msgSend(v6, "addObject:", v36, v37);
      }
      v31 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v73, v77, 16, v37);
    }
    while (v31);
  }

  if (v25)
  {
    v38 = 0;
    v39 = v71;
    v40 = v68;
    while (1)
    {
      v41 = objc_opt_class(TSDImageInfo);
      TSUDynamicCast(v41, objc_msgSend(v24, "objectAtIndex:", v38));
      if (v42)
        break;
      if (v25 == (char *)++v38)
      {
        v43 = 0;
        goto LABEL_35;
      }
    }
    v43 = v42;
  }
  else
  {
    v43 = 0;
    v39 = v71;
    v40 = v68;
  }
LABEL_35:
  v44 = -[TSWWidgetStyle initWithContext:]([TSWWidgetStyle alloc], "initWithContext:", v67);
  objc_msgSend(objc_msgSend(objc_msgSend(v39, "currentHtmlDocMediaState"), "stylesheet"), "addStyle:", v44);
  v45 = PFXTSDInfoGeometry((const char *)objc_msgSend(v70, "xmlValueForAttribute:", PFXWidgetConstantDataStageGeometry[0]));
  objc_msgSend(v45, "position");
  v47 = v46;
  v49 = v48;
  objc_msgSend(v45, "size");
  v52 = -[THWStageGeometry initWithFrame:cornerRadius:]([THWStageGeometry alloc], "initWithFrame:cornerRadius:", v47, v49, v50, v51, 0.0);
  v53 = self;
  v54 = -[THWInteractiveImageWidgetInfo initWithContext:geometry:style:stageGeometry:]([THWInteractiveImageWidgetInfo alloc], "initWithContext:geometry:style:stageGeometry:", v67, -[PFXDrawablePlacement infoGeometry](self->mPlacement, "infoGeometry"), v44, v52);

  -[THWInteractiveImageWidgetInfo setProgressKitID:](v54, "setProgressKitID:", +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", objc_msgSend(v70, "xmlElementId")));
  -[THWInteractiveImageWidgetInfo setProgressKitSectionID:](v54, "setProgressKitSectionID:", objc_msgSend(v39, "nodeGUID"));
  objc_msgSend(objc_msgSend(v40, "canvasGeometry"), "boundsBeforeRotation");
  -[THWInteractiveImageWidgetInfo setupWithCallouts:backgroundSize:backgroundImageInfo:useSidebar:showTransportControls:](v54, "setupWithCallouts:backgroundSize:backgroundImageInfo:useSidebar:showTransportControls:", v6, v43, v66, v65, v55, v56);
  -[THWInteractiveImageWidgetInfo setViewportStyle:](v54, "setViewportStyle:", objc_msgSend(v40, "style"));
  -[THWInteractiveImageWidgetInfo setBackgroundFill:](v54, "setBackgroundFill:", objc_msgSend(objc_msgSend(v40, "style"), "valueForProperty:", 516));

  if (v20 == 0.0)
    v57 = 0;
  else
    v57 = v66;
  if (v57 == 1)
    -[THWInteractiveImageWidgetInfo setSidebarWidth:](v54, "setSidebarWidth:", v20);
  v58 = +[PFXWidgetPlacement widgetPlacementWithDrawablePlacement:readerState:](PFXWidgetPlacement, "widgetPlacementWithDrawablePlacement:readerState:", self->mPlacement, v39);
  if (-[PFXWidgetPlacement hasChildrenForAdornmentInfo](v58, "hasChildrenForAdornmentInfo"))
  {
    -[THWInteractiveImageWidgetInfo setAdornmentInfo:](v54, "setAdornmentInfo:", +[PFXDrawablesWidget adornmentInfoWithWidgetPlacement:readerState:](PFXDrawablesWidget, "adornmentInfoWithWidgetPlacement:readerState:", v58, v39));
    -[THWWidgetAdornmentInfo updateParentInfo:](-[THWInteractiveImageWidgetInfo adornmentInfo](v54, "adornmentInfo"), "updateParentInfo:", v54);
    v59 = -[THWWidgetAdornmentInfo title](-[THWInteractiveImageWidgetInfo adornmentInfo](v54, "adornmentInfo"), "title");
    if (v59)
    {
      v60 = -[TSWPShapeInfo containedStorage](v59, "containedStorage");
      v61 = objc_msgSend(v39, "ancestorEntryWithReaderClass:", objc_opt_class(PFAIAnchoredDrawable));
      v53 = self;
      v62 = objc_opt_class(PFAIAnchoredDrawable);
      *(_QWORD *)&v64 = TSUDynamicCast(v62, objc_msgSend(v61, "reader")).n128_u64[0];
      if (v63)
        objc_msgSend(v63, "setGutterTitleStorage:", v60, v64);
    }
  }
  objc_msgSend(v39, "setUniqueIdForInfo:fromStackEntry:", v54, v70);
  objc_msgSend(v69, "setResult:", v54);

  -[PFXDrawablePlacement mapEndElementWithState:](v53->mPlacement, "mapEndElementWithState:", v39);
}

- (PFXDrawablePlacement)placement
{
  return self->mPlacement;
}

@end

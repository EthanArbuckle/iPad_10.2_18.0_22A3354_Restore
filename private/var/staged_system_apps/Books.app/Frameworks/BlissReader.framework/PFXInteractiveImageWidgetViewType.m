@implementation PFXInteractiveImageWidgetViewType

- (BOOL)mapStartElementWithState:(id)a3
{
  return 1;
}

- (void)mapEndElementWithState:(id)a3
{
  id v4;
  id v5;
  id v6;
  PFXInteractiveImageWidgetViewObj *v7;
  id v8;
  char *v9;
  char *v10;
  char *i;
  id v12;
  id v13;
  id v14;
  id v15;
  CGPoint v16;
  double v17;

  v4 = objc_msgSend(a3, "currentHtmlStackEntry");
  v5 = objc_msgSend(v4, "currentEntryMediaState");
  v6 = objc_msgSend(v5, "propertySet");
  v7 = objc_alloc_init(PFXInteractiveImageWidgetViewObj);
  v17 = 1.0;
  v16 = CGPointZero;
  +[PFXInteractiveImageWidgetCalloutType readScaleTranslation:translation:stackEntry:](PFXInteractiveImageWidgetCalloutType, "readScaleTranslation:translation:stackEntry:", &v17, &v16, v4);
  -[PFXInteractiveImageWidgetViewObj setScale:](v7, "setScale:", v17);
  -[PFXInteractiveImageWidgetViewObj setTranslation:](v7, "setTranslation:", v16);
  -[PFXInteractiveImageWidgetViewObj setCanvasGeometry:](v7, "setCanvasGeometry:", PFXTSDInfoGeometry((const char *)objc_msgSend(v4, "xmlValueForAttribute:", PFXWidgetConstantDataCanvasGeometry[0])));
  v8 = objc_alloc_init((Class)NSMutableArray);
  v9 = (char *)objc_msgSend(v5, "childResultCount");
  if (v9)
  {
    v10 = v9;
    for (i = 0; i != v10; ++i)
      objc_msgSend(v8, "addObject:", objc_msgSend(v5, "childResultAtIndex:", i));
  }
  -[PFXInteractiveImageWidgetViewObj setChildren:](v7, "setChildren:", v8);

  v12 = objc_alloc_init((Class)TSSPropertyMap);
  v13 = +[PFXGraphicStyle mapStrokeFromStyleProperties:contentState:](PFXGraphicStyle, "mapStrokeFromStyleProperties:contentState:", v6, a3);
  if (v13)
    objc_msgSend(v12, "setObject:forProperty:", v13, 517);
  v14 = +[PFXGraphicStyle mapFillFromStyleProperties:contentState:](PFXGraphicStyle, "mapFillFromStyleProperties:contentState:", v6, a3);
  if (v14)
    objc_msgSend(v12, "setObject:forProperty:", v14, 516);
  v15 = objc_msgSend(objc_alloc((Class)TSWPShapeStyle), "initWithContext:name:overridePropertyMap:isVariation:", objc_msgSend(a3, "tspContext"), 0, v12, 0);
  objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentHtmlDocMediaState"), "stylesheet"), "addStyle:", v15);
  -[PFXInteractiveImageWidgetViewObj setStyle:](v7, "setStyle:", v15);

  objc_msgSend(v5, "setResult:", v7);
}

@end

@implementation PFEIWidget

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFEIWidget;
  -[PFEIWidget dealloc](&v3, "dealloc");
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
  THWPStorage *v8;
  PFXDrawablePlacement *v9;

  v5 = objc_msgSend(a3, "currentHtmlStackEntry");
  v6 = objc_msgSend(v5, "currentEntryMediaState");
  objc_msgSend(v6, "setCurrentBreakStateSameAsParent");
  +[PFXBlock addBreakIfApplicableToEntry:newBreakState:hintCollector:](PFXBlock, "addBreakIfApplicableToEntry:newBreakState:hintCollector:", v5, 10, 0);
  v7 = objc_msgSend(v6, "storage");
  objc_msgSend(v7, "setParagraphLevel:forCharRange:undoTransaction:", 0, objc_msgSend(v7, "length"), 0, 0);
  objc_msgSend(v7, "setParagraphStyle:forCharRange:undoTransaction:", objc_msgSend(objc_msgSend(a3, "orientationState"), "defaultParagraphStyle"), objc_msgSend(v7, "length"), 0, 0);
  objc_msgSend(v6, "setOriginalStorage:", v7);
  v8 = -[THWPStorage initWithContext:string:stylesheet:kind:]([THWPStorage alloc], "initWithContext:string:stylesheet:kind:", +[THTemporaryObjectContext context](THTemporaryObjectContext, "context"), &stru_43D7D8, objc_msgSend(objc_msgSend(a3, "orientationState"), "stylesheet"), 3);
  objc_msgSend(v6, "setOverriddenStorage:", v8);

  v9 = (PFXDrawablePlacement *)objc_msgSend(objc_alloc((Class)objc_msgSend(a3, "drawablePlacementClass")), "initWithDrawable:", self);
  self->_drawablePlacement = v9;
  -[PFXDrawablePlacement mapStartElementWithState:](v9, "mapStartElementWithState:", a3);
  -[PFXDrawablePlacement setInfoGeometry:](self->_drawablePlacement, "setInfoGeometry:", PFXTSDInfoGeometry((const char *)objc_msgSend(objc_msgSend(v5, "valueForAttribute:", PFXWidgetConstantDataGeometry[0]), "UTF8String")));
  return 1;
}

+ (id)backgroundShapeStyleWithPropertySet:(id)a3 stylesheet:(id)a4 readerState:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v7 = objc_alloc_init((Class)TSSPropertyMap);
  v8 = +[PFXGraphicStyle mapStrokeFromStyleProperties:contentState:](PFXGraphicStyle, "mapStrokeFromStyleProperties:contentState:", a3, a5);
  if (v8)
    objc_msgSend(v7, "setObject:forProperty:", v8, 517);
  v9 = +[PFXGraphicStyle mapShadowFromStyleProperties:contentState:](PFXGraphicStyle, "mapShadowFromStyleProperties:contentState:", a3, a5);
  if (v9)
    objc_msgSend(v7, "setObject:forProperty:", v9, 520);
  v10 = +[PFXGraphicStyle mapFillFromStyleProperties:contentState:](PFXGraphicStyle, "mapFillFromStyleProperties:contentState:", a3, a5);
  if (v10)
    objc_msgSend(v7, "setObject:forProperty:", v10, 516);
  v11 = objc_msgSend(objc_alloc((Class)TSDShapeStyle), "initWithContext:name:overridePropertyMap:isVariation:", objc_msgSend(a5, "tspContext"), 0, v7, 1);

  return v11;
}

- (int)_adornmentLayoutModeFromString:(const char *)a3
{
  if (xmlStrEqual((const xmlChar *)a3, (const xmlChar *)"top-together"))
    return 1;
  else
    return 2 * (xmlStrEqual((const xmlChar *)a3, (const xmlChar *)"bottom") != 0);
}

- (id)_adornmentInfoWithResults:(id)a3 readerState:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  uint64_t v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  double v18;
  void *v19;
  void *v20;
  unsigned int v21;
  id v22;
  id v23;
  THWWidgetAdornmentInfo *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  double v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v37;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];

  v37 = objc_msgSend(a4, "currentHtmlStackEntry");
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v5)
  {
    v6 = v5;
    v40 = 0uLL;
    v7 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v7)
          objc_enumerationMutation(a3);
        v9 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        v10 = objc_opt_class(TSUPair);
        *(_QWORD *)&v11 = TSUDynamicCast(v10, v9).n128_u64[0];
        v13 = v12;
        v14 = objc_msgSend(v12, "second", v11);
        v15 = objc_opt_class(TSWPStorage);
        if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
        {
          v16 = objc_msgSend(v13, "second");
          v17 = objc_opt_class(NSString);
          *(_QWORD *)&v18 = TSUDynamicCast(v17, objc_msgSend(v13, "first")).n128_u64[0];
          v20 = v19;
          if ((objc_msgSend(v19, "isEqualToString:", CFSTR("header"), v18) & 1) != 0)
          {
            *(_QWORD *)&v40 = v16;
          }
          else
          {
            v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("figcaption"));
            v22 = (id)*((_QWORD *)&v40 + 1);
            if (v21)
              v22 = v16;
            *((_QWORD *)&v40 + 1) = v22;
          }
        }
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v6);
  }
  else
  {
    v40 = 0uLL;
  }
  v23 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v24 = objc_alloc_init(THWWidgetAdornmentInfo);
  if (xmlStrEqual((const xmlChar *)objc_msgSend(v37, "xmlValueForAttribute:", PFXWidgetConstantDataBackgroundEnabled[0]), (const xmlChar *)"yes"))
  {
    v25 = a4;
    v26 = +[PFXWidgetPlacement mapDefaultBackgroundShapeWithPlacement:readerState:](PFXWidgetPlacement, "mapDefaultBackgroundShapeWithPlacement:readerState:", self->_drawablePlacement, a4);
    objc_msgSend(v23, "setObject:forKey:", v26, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0));
    -[THWWidgetAdornmentInfo setBackground:](v24, "setBackground:", v26);
    v27 = 1;
  }
  else
  {
    v27 = 0;
    v25 = a4;
  }
  v28 = v40;
  if (v40 != 0)
  {
    *(_QWORD *)&v40 = v23;
    v29 = objc_alloc_init((Class)TSSPropertyMap);
    LODWORD(v30) = 1.0;
    objc_msgSend(v29, "setFloatValue:forProperty:", 518, v30);
    objc_msgSend(v29, "setObject:forProperty:", +[TSWPShapeStyle defaultValueForProperty:](TSWPShapeStyle, "defaultValueForProperty:", 148), 148);
    objc_msgSend(v29, "setObject:forProperty:", +[TSWPShapeStyle defaultValueForProperty:](TSWPShapeStyle, "defaultValueForProperty:", 146), 146);
    objc_msgSend(v29, "setObject:forProperty:", +[TSWPShapeStyle defaultValueForProperty:](TSWPShapeStyle, "defaultValueForProperty:", 516), 516);
    objc_msgSend(v29, "setObject:forProperty:", +[TSWPShapeStyle defaultValueForProperty:](TSWPShapeStyle, "defaultValueForProperty:", 517), 517);
    objc_msgSend(v29, "setObject:forProperty:", +[TSWPShapeStyle defaultValueForProperty:](TSWPShapeStyle, "defaultValueForProperty:", 519), 519);
    objc_msgSend(v29, "setObject:forProperty:", +[TSWPShapeStyle defaultValueForProperty:](TSWPShapeStyle, "defaultValueForProperty:", 520), 520);
    v31 = objc_msgSend(objc_alloc((Class)TSWPShapeStyle), "initWithContext:name:overridePropertyMap:isVariation:", objc_msgSend(v25, "tspContext"), 0, v29, 0);
    v32 = objc_msgSend(objc_alloc((Class)TSDInfoGeometry), "initWithSize:", 50.0, 50.0);
    objc_msgSend(objc_msgSend(objc_msgSend(v25, "orientationState"), "stylesheet"), "addStyle:", v31);
    if (v28)
    {
      v33 = objc_msgSend(objc_alloc((Class)TSWPShapeInfo), "initWithContext:geometry:style:wpStorage:", objc_msgSend(v25, "tspContext"), v32, v31, v28);
      objc_msgSend((id)v40, "setObject:forKey:", v33, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v27));
      -[THWWidgetAdornmentInfo setTitle:](v24, "setTitle:", v33);

      ++v27;
    }
    if (*((_QWORD *)&v40 + 1))
    {
      v34 = objc_msgSend(objc_alloc((Class)TSWPShapeInfo), "initWithContext:geometry:style:wpStorage:", objc_msgSend(a4, "tspContext"), v32, v31, *((_QWORD *)&v40 + 1));
      objc_msgSend((id)v40, "setObject:forKey:", v34, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v27));
      -[THWWidgetAdornmentInfo setCaption:](v24, "setCaption:", v34);

    }
    v23 = (id)v40;
  }
  -[THWWidgetAdornmentInfo setInsertionOrder:](v24, "setInsertionOrder:", v23);
  -[THWWidgetAdornmentInfo setLayoutMode:](v24, "setLayoutMode:", -[PFEIWidget _adornmentLayoutModeFromString:](self, "_adornmentLayoutModeFromString:", objc_msgSend(v37, "xmlValueForAttribute:", PFXWidgetConstantDataContentLayout[0])));
  v35 = objc_msgSend(v37, "valueForAttribute:", PFXWidgetConstantDataContentPadding[0]);
  if (v35)
  {
    objc_msgSend(v35, "doubleValue");
    -[THWWidgetAdornmentInfo setContentPadding:](v24, "setContentPadding:");
  }
  return v24;
}

- (id)_widgetFromResults:(id)a3
{
  id result;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(a3);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v7);
        v9 = objc_opt_class(TSUPair);
        *(_QWORD *)&v10 = TSUDynamicCast(v9, v8).n128_u64[0];
        v12 = v11;
        if (objc_msgSend(objc_msgSend(v11, "second", v10), "conformsToProtocol:", &OBJC_PROTOCOL___THWWidgetInfo))return objc_msgSend(v12, "second");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v5 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

- (void)mapEndElementWithState:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  THWAnchoredWidgetInfo *v16;

  v5 = objc_msgSend(a3, "currentHtmlStackEntry");
  v6 = objc_msgSend(v5, "currentEntryMediaState");
  v7 = objc_opt_class(NSArray);
  *(_QWORD *)&v8 = TSUDynamicCast(v7, objc_msgSend(v6, "result")).n128_u64[0];
  v10 = v9;
  v11 = -[PFEIWidget _widgetFromResults:](self, "_widgetFromResults:", v9, v8);
  v12 = v11;
  if (v10)
  {
    if (v11)
    {
LABEL_3:
      v13 = objc_msgSend(objc_msgSend(v6, "originalStorage"), "length");
      v14 = TSUProtocolCast(&OBJC_PROTOCOL___TSDContainerInfo, v12);
      objc_msgSend(v12, "setAdornmentInfo:", -[PFEIWidget _adornmentInfoWithResults:readerState:](self, "_adornmentInfoWithResults:readerState:", v10, a3));
      objc_msgSend(objc_msgSend(v12, "adornmentInfo"), "updateParentInfo:", v14);
      v16 = -[THWAnchoredWidgetInfo initWithContext:widgetInfo:]([THWAnchoredWidgetInfo alloc], "initWithContext:widgetInfo:", objc_msgSend(a3, "tspContext"), v12);
      v15 = objc_msgSend(objc_alloc((Class)TSWPDrawableAttachment), "initWithContext:drawable:", objc_msgSend(a3, "tspContext"), v16);
      objc_msgSend(objc_msgSend(v6, "originalStorage"), "insertAttachmentOrFootnote:range:", v15, v13, 0);
      -[THWAnchoredWidgetInfo setParentInfo:](v16, "setParentInfo:", objc_msgSend(v6, "originalStorage"));
      objc_msgSend(v6, "setParentBreakStateSameAsCurrent");
      objc_msgSend(a3, "setUniqueIdForInfo:fromStackEntry:", v12, v5);

      return;
    }
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFEIWidget mapEndElementWithState:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/EPUB/PFEIWidget.mm"), 300, CFSTR("invalid nil value for '%s'"), "results");
    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFEIWidget mapEndElementWithState:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/EPUB/PFEIWidget.mm"), 301, CFSTR("invalid nil value for '%s'"), "widgetInfo");
}

- (PFXDrawablePlacement)drawablePlacement
{
  return self->_drawablePlacement;
}

- (void)setDrawablePlacement:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end

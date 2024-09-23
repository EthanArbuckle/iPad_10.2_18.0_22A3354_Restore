@implementation PFXInteractiveImageWidgetCalloutType

- (BOOL)mapStartElementWithState:(id)a3
{
  return 1;
}

+ (void)readScaleTranslation:(double *)a3 translation:(CGPoint *)a4 stackEntry:(id)a5
{
  const char *v8;
  const char *v9;
  CGFloat v10;
  double v11;
  CGFloat v12;

  v8 = (const char *)objc_msgSend(a5, "xmlValueForAttribute:", PFXWidgetConstantVisualDictionaryObjectAttributeScale[0]);
  if (v8)
  {
    v12 = 1.0;
    if (sscanf(v8, "%lgpt", &v12))
      *a3 = v12;
  }
  v9 = (const char *)objc_msgSend(a5, "xmlValueForAttribute:", PFXWidgetConstantVisualDictionaryObjectAttributeTranslate[0]);
  if (v9)
  {
    v11 = 0.0;
    v12 = 0.0;
    if (sscanf(v9, "(%lg,%lg)", &v12, &v11))
    {
      v10 = v11;
      a4->x = v12;
      a4->y = v10;
    }
  }
}

- (void)mapEndElementWithState:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  char *v19;
  char *v20;
  void *v21;
  void *v22;
  id v23;
  char *i;
  id v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  id v29;
  void *v30;
  const xmlChar *v31;
  uint64_t v32;
  void *v33;
  const xmlChar *v34;
  uint64_t v35;
  void *v36;
  id v37;
  id v38;
  CGPoint v39;
  THWInteractiveImageCalloutInfo *v40;
  THWInteractiveImageCalloutInfo *v41;
  NSNumber *v42;
  id v43;
  id v44;
  CGPoint v45;
  double v46;

  v5 = objc_msgSend(a3, "currentHtmlStackEntry");
  v6 = objc_msgSend(v5, "currentEntryMediaState");
  v7 = objc_msgSend(v6, "propertySet");
  v8 = objc_msgSend(a3, "tspContext");
  +[PFXDrawablePlacement boundsWithProperties:readerState:](PFXDrawablePlacement, "boundsWithProperties:readerState:", v7, a3);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v46 = 1.0;
  v45 = CGPointZero;
  objc_msgSend((id)objc_opt_class(self), "readScaleTranslation:translation:stackEntry:", &v46, &v45, v5);
  v17 = objc_msgSend(v5, "valueForAttribute:", PFXWidgetConstantVisualDictionaryCalloutOrder[0]);
  if (v17 && (v18 = v17, objc_msgSend(v17, "length")))
    v42 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v18, "integerValue"));
  else
    v42 = 0;
  v19 = (char *)objc_msgSend(v6, "childResultCount");
  v43 = a3;
  v44 = v8;
  if (v19)
  {
    v20 = v19;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    for (i = 0; i != v20; ++i)
    {
      v25 = objc_msgSend(v6, "childResultAtIndex:", i);
      v26 = objc_opt_class(TSDShapeInfo);
      *(_QWORD *)&v28 = TSUDynamicCast(v26, v25).n128_u64[0];
      if (v27)
      {
        v29 = objc_msgSend(v6, "xmlAttributeValueForResult:attributeName:", v27, PFXWidgetConstantDataWidgetObjectType[0], v28);
        if (v29)
        {
          v30 = v29;
          v31 = (const xmlChar *)objc_msgSend(v29, "xmlString");
          if (xmlStrEqual(v31, (const xmlChar *)PFXWidgetConstantObjectValueTitle[0]))
          {
            if (v21)
              objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFXInteractiveImageWidgetCalloutType mapEndElementWithState:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/Readers/PFXInteractiveImageWidget.mm"), 122, CFSTR("PFXInteractiveImageWidget: title assigned already"));
            v32 = objc_opt_class(TSWPShapeInfo);
            TSUDynamicCast(v32, v25);
            v21 = v33;
          }
          else
          {
            v34 = (const xmlChar *)objc_msgSend(v30, "xmlString");
            if (xmlStrEqual(v34, (const xmlChar *)PFXWidgetConstantObjectValueCaption[0]))
            {
              if (v22)
                objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFXInteractiveImageWidgetCalloutType mapEndElementWithState:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/Readers/PFXInteractiveImageWidget.mm"), 127, CFSTR("PFXInteractiveImageWidget: caption assigned already"));
              v35 = objc_opt_class(TSWPShapeInfo);
              TSUDynamicCast(v35, v25);
              v22 = v36;
            }
          }
        }
        else
        {
          if (v23)
            objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFXInteractiveImageWidgetCalloutType mapEndElementWithState:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/Readers/PFXInteractiveImageWidget.mm"), 133, CFSTR("PFXInteractiveImageWidget: line assigned already"));
          v23 = v25;
        }
      }
    }
    if (v21)
      goto LABEL_26;
  }
  else
  {
    v23 = 0;
    v22 = 0;
    v21 = 0;
  }
  if (v22 || v23)
  {
LABEL_26:
    v37 = objc_msgSend(objc_alloc((Class)TSDShapeStyle), "initWithContext:", objc_msgSend(v43, "tspContext"));
    v38 = objc_msgSend(objc_alloc((Class)TSDShapeInfo), "initWithContext:geometry:style:", v44, objc_msgSend(objc_alloc((Class)TSDInfoGeometry), "initWithPosition:size:", v10, v12, v14, v16), v37);

    v39 = v45;
    v40 = [THWInteractiveImageCalloutInfo alloc];
    v41 = -[THWInteractiveImageCalloutInfo initWithViewScale:contentOffset:groupShape:titleStorage:titleGeometry:descriptionStorage:descriptionGeometry:lineShape:](v40, "initWithViewScale:contentOffset:groupShape:titleStorage:titleGeometry:descriptionStorage:descriptionGeometry:lineShape:", v38, objc_msgSend(v21, "containedStorage"), objc_msgSend(v21, "geometry"), objc_msgSend(v22, "containedStorage"), objc_msgSend(v22, "geometry"), v23, v46, v39);

    objc_msgSend(v6, "setResult:", +[TSUPair pairWithFirst:second:](TSUPair, "pairWithFirst:second:", v41, v42));
  }
}

@end

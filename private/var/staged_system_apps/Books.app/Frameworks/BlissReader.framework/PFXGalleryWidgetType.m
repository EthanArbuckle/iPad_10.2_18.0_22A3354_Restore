@implementation PFXGalleryWidgetType

- (BOOL)mapStartElementWithState:(id)a3
{
  id v4;
  id v5;
  const xmlChar *v6;
  THWPStorage *v7;

  v4 = objc_msgSend(a3, "currentHtmlStackEntry");
  v5 = objc_msgSend(v4, "currentEntryMediaState");
  v6 = (const xmlChar *)objc_msgSend(v4, "xmlValueForAttribute:", PFXWidgetConstantDataWidgetObjectType[0]);
  if (xmlStrEqual(v6, (const xmlChar *)PFXWidgetConstantObjectValueCaption[0]))
  {
    v7 = -[THWPStorage initWithContext:string:stylesheet:kind:]([THWPStorage alloc], "initWithContext:string:stylesheet:kind:", objc_msgSend(a3, "tspContext"), &stru_43D7D8, objc_msgSend(objc_msgSend(a3, "currentHtmlDocMediaState"), "stylesheet"), 3);
    objc_msgSend(v5, "setOverriddenStorage:", v7);

  }
  return 1;
}

- (void)mapEndElementWithState:(id)a3
{
  id v4;
  id v5;
  const xmlChar *v6;
  double x;
  double y;
  double width;
  double height;
  const char *v11;
  id v12;
  id v13;
  unint64_t v14;
  id v15;
  const xmlChar *v16;
  uint64_t v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  double v22;
  id v23;
  uint64_t v24;
  char isKindOfClass;
  id v26;
  double v27;
  CGFloat v28;
  PFXGalleryItem2 *v29;
  id v30;
  id v31;
  CGAffineTransform v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v4 = objc_msgSend(a3, "currentHtmlStackEntry");
  v5 = objc_msgSend(v4, "currentEntryMediaState");
  v6 = (const xmlChar *)objc_msgSend(v4, "xmlValueForAttribute:", PFXWidgetConstantDataWidgetObjectType[0]);
  if (xmlStrEqual(v6, (const xmlChar *)PFXWidgetConstantObjectValueCaption[0]))
  {
    objc_msgSend(v5, "setResult:", objc_msgSend(v5, "storage"));
  }
  else if (xmlStrEqual(v6, (const xmlChar *)PFXWidgetConstantGalleryObjectValueItem[0])
         && objc_msgSend(v5, "childResultCount"))
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v11 = (const char *)objc_msgSend(v4, "xmlValueForAttribute:", PFXWidgetConstantGalleryItemExpandedCropRect[0]);
    if (v11)
    {
      v35 = 0.0;
      v36 = 0.0;
      v33 = 0.0;
      v34 = 0.0;
      if (sscanf(v11, "%lf %lf %lf %lf", &v36, &v35, &v34, &v33) == 4)
      {
        y = v35;
        x = v36;
        height = v33;
        width = v34;
      }
    }
    if (objc_msgSend(v5, "childResultCount"))
    {
      v12 = 0;
      v30 = 0;
      v31 = 0;
      v13 = 0;
      v14 = 0;
      do
      {
        v15 = objc_msgSend(v5, "childResultAtIndex:", v14);
        v16 = (const xmlChar *)objc_msgSend(objc_msgSend(v5, "xmlAttributeValueForResult:attributeName:", v15, PFXWidgetConstantDataWidgetObjectType[0]), "xmlString");
        if (xmlStrEqual(v16, (const xmlChar *)PFXWidgetConstantGalleryObjectValueFullScreen[0]))
        {
          v17 = objc_opt_class(TSDImageInfo);
          *(_QWORD *)&v18 = TSUDynamicCast(v17, v15).n128_u64[0];
          v20 = v19;
          v12 = objc_msgSend(v19, "imageData", v18);
          v13 = objc_msgSend(v20, "accessibilityDescriptions");
        }
        else if (xmlStrEqual(v16, (const xmlChar *)PFXWidgetConstantGalleryObjectValueThumbnail[0]))
        {
          v21 = objc_opt_class(TSDImageInfo);
          *(_QWORD *)&v22 = TSUDynamicCast(v21, v15).n128_u64[0];
          v31 = objc_msgSend(v23, "imageData", v22);
        }
        else if (!v16)
        {
          v24 = objc_opt_class(THWPStorage);
          isKindOfClass = objc_opt_isKindOfClass(v15, v24);
          v26 = v30;
          if ((isKindOfClass & 1) != 0)
            v26 = v15;
          v30 = v26;
        }
        ++v14;
      }
      while (v14 < (unint64_t)objc_msgSend(v5, "childResultCount"));
    }
    else
    {
      v13 = 0;
      v30 = 0;
      v31 = 0;
      v12 = 0;
    }
    objc_msgSend(a3, "thinningScaleForImageData:", v12);
    v28 = v27;
    if (v27 > 1.0)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFXGalleryWidgetType mapEndElementWithState:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/Readers/PFXGalleryWidget.mm"), 126, CFSTR("thinning scale is going the wrong way"));
    if (v28 < 1.0)
    {
      CGAffineTransformMakeScale(&v32, v28, v28);
      v37.origin.x = x;
      v37.origin.y = y;
      v37.size.width = width;
      v37.size.height = height;
      v38 = CGRectApplyAffineTransform(v37, &v32);
      v39 = CGRectIntegral(v38);
      x = v39.origin.x;
      y = v39.origin.y;
      width = v39.size.width;
      height = v39.size.height;
    }
    if (v12)
    {
      v29 = objc_alloc_init(PFXGalleryItem2);
      -[PFXGalleryItem2 setFullres:](v29, "setFullres:", v12);
      -[PFXGalleryItem2 setFullresCropRect:](v29, "setFullresCropRect:", x, y, width, height);
      -[PFXGalleryItem2 setThumbnail:](v29, "setThumbnail:", v31);
      -[PFXGalleryItem2 setCaption:](v29, "setCaption:", v30);
      -[PFXGalleryItem2 setAccessibilityDescriptions:](v29, "setAccessibilityDescriptions:", v13);
      objc_msgSend(v5, "setResult:", v29);

    }
  }
}

@end

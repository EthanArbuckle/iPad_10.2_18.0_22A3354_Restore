@implementation PFXWidget

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5;
  objc_super v7;

  v5 = objc_msgSend(a3, "currentXmlStackEntry");
  -[PFXDrawablePlacement setInfoGeometry:](self->super.mPlacement, "setInfoGeometry:", PFXTSDInfoGeometry((const char *)objc_msgSend(objc_msgSend(v5, "valueForAttribute:", PFXWidgetConstantDataGeometry[0]), "UTF8String")));
  v7.receiver = self;
  v7.super_class = (Class)PFXWidget;
  return -[PFXDrawable mapStartElementWithState:](&v7, "mapStartElementWithState:", a3);
}

- (void)mapEndElementWithState:(id)a3
{
  objc_super v5;

  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFXWidget mapEndElementWithState:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/Readers/PFXWidget.mm"), 126, CFSTR("Shouldn't ever be invoking PFXWidget Any More!"));
  v5.receiver = self;
  v5.super_class = (Class)PFXWidget;
  -[PFXDrawable mapEndElementWithState:](&v5, "mapEndElementWithState:", a3);
}

+ (BOOL)isWidgetExpandedOnly:(id)a3
{
  id v4;
  double v5;
  double v6;
  char **v7;

  v4 = objc_msgSend(a3, "currentHtmlStackEntry");
  objc_msgSend(a3, "applePubVersion");
  if (v5 < 2.2 && (objc_msgSend(a3, "applePubVersion"), vabdd_f64(v6, 2.2) >= 0.00001))
    v7 = PFXWidgetConstantDataFullscreenOnly;
  else
    v7 = PFXWidgetConstantDataExpandedOnly;
  return xmlStrEqual((const xmlChar *)objc_msgSend(v4, "xmlValueForAttribute:", *v7), (const xmlChar *)"yes") != 0;
}

+ (BOOL)isWidgetAutoplay:(id)a3
{
  id v3;
  const xmlChar *v4;

  v3 = objc_msgSend(a3, "currentHtmlStackEntry");
  v4 = (const xmlChar *)objc_msgSend(v3, "xmlValueForAttribute:", PFXWidgetConstantDataAutoplay[0]);
  if (v4)
    LOBYTE(v4) = xmlStrEqual(v4, (const xmlChar *)"yes") != 0;
  return (char)v4;
}

+ (id)drawableWidgetWithContext:(id)a3 infoGeometry:(id)a4 widgetTitle:(id)a5 stageDrawable:(id)a6 widgetInfo:(id)a7
{
  THWDrawablesWidgetInfo *v10;
  THWDrawablesWidgetInfo *v11;
  id v12;

  v10 = -[THWDrawablesWidgetInfo initWithContext:geometry:]([THWDrawablesWidgetInfo alloc], "initWithContext:geometry:", a3, a4);
  v11 = v10;
  if (a5)
  {
    v12 = -[THWDrawablesWidgetInfo accessibilityDescriptions](v10, "accessibilityDescriptions");
    if (!v12)
    {
      v12 = objc_alloc_init((Class)NSMutableDictionary);
      -[THWDrawablesWidgetInfo setAccessibilityDescriptions:](v11, "setAccessibilityDescriptions:", v12);

    }
    objc_msgSend(v12, "setObject:forKey:", a5, CFSTR("widgetTitle"));
  }
  -[THWDrawablesWidgetInfo setStageDrawable:](v11, "setStageDrawable:", a6);
  -[THWDrawablesWidgetInfo setExpandedStageDrawable:](v11, "setExpandedStageDrawable:", a7);
  -[THWDrawablesWidgetInfo setExpandedOnly:](v11, "setExpandedOnly:", 1);
  return v11;
}

+ (id)urlForDataBundleWithState:(id)a3
{
  id v4;
  NSURL *v5;
  id v6;
  id v7;

  v4 = objc_msgSend(a3, "currentHtmlStackEntry");
  v5 = (NSURL *)objc_msgSend(objc_msgSend(v4, "valueForAttribute:", PFXWidgetConstantDataBundlePath[0]), "stringByRemovingPercentEncoding");
  if (v5)
  {
    v6 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "archive"), "rootFolder"), "stringByAppendingPathComponent:", +[PFXCommon absolutePathWithUrl:relativeToFile:](PFXCommon, "absolutePathWithUrl:relativeToFile:", v5, objc_msgSend(a3, "entryURI")));
    v5 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v6);
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(v4, "valueForAttribute:", PFXWidgetConstantDataStartingFile[0]);
  if (v7 && objc_msgSend(v7, "length"))
    return +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", objc_msgSend(v6, "stringByAppendingPathComponent:", objc_msgSend(v4, "valueForAttribute:", PFXWidgetConstantDataStartingFile[0])));
  else
    return v5;
}

@end

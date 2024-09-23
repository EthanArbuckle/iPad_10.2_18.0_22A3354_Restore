@implementation PFXViewport

- (void)mapEndElementWithState:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  id v6;
  const xmlChar *v7;
  const xmlChar *v8;
  uint64_t v9;
  id v10;
  double v11;
  double v12;
  id v13;
  double v14;
  double v15;
  id v16;
  double v17;
  double v18;
  THWViewportInfo *v19;
  id v22;
  id v23;
  objc_super v24;

  v22 = objc_msgSend(a3, "currentHtmlStackEntry");
  v3 = objc_msgSend(v22, "currentEntryMediaState");
  v23 = +[NSMutableArray array](NSMutableArray, "array");
  v4 = 0;
  if (objc_msgSend(v3, "childResultCount"))
  {
    v5 = 0;
    do
    {
      v6 = objc_msgSend(v3, "childResultAtIndex:", v5);
      if (objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___TSDInfo))
      {
        v7 = (const xmlChar *)objc_msgSend(objc_msgSend(v3, "xmlAttributeValueForResult:attributeName:", v6, PFXWidgetConstantDataFallbackImage[0]), "xmlString");
        v8 = (const xmlChar *)objc_msgSend(objc_msgSend(v3, "xmlAttributeValueForResult:attributeName:", v6, PFXWidgetConstantDataWidgetObjectType[0]), "xmlString");
        if (xmlStrEqual(v8, (const xmlChar *)PFXWidgetConstantObjectValueBackground[0])
          && (v9 = objc_opt_class(TSDShapeInfo), (objc_opt_isKindOfClass(v6, v9) & 1) != 0))
        {
          v4 = v6;
        }
        else if (!xmlStrEqual(v7, (const xmlChar *)"yes"))
        {
          objc_msgSend(v23, "addObject:", v6);
        }
      }
      ++v5;
    }
    while (v5 < (unint64_t)objc_msgSend(v3, "childResultCount"));
  }
  v10 = objc_msgSend(v22, "valueForAttribute:", PFXWidgetConstantDataContentPadding[0]);
  if (v10)
  {
    objc_msgSend(v10, "doubleValue");
    v12 = v11;
  }
  else
  {
    v12 = 0.0;
  }
  v13 = objc_msgSend(v22, "valueForAttribute:", PFXWidgetConstantDataCanvasWidth[0]);
  if (v13)
  {
    objc_msgSend(v13, "doubleValue");
    v15 = v14;
  }
  else
  {
    v15 = 180.0;
  }
  v16 = objc_msgSend(v22, "valueForAttribute:", PFXWidgetConstantDataCanvasHeight[0]);
  if (v16)
  {
    objc_msgSend(v16, "doubleValue");
    v18 = v17;
  }
  else
  {
    v18 = 200.0;
  }
  if (!v4)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFXViewport mapEndElementWithState:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/Readers/PFXViewport.mm"), 77, CFSTR("invalid nil value for '%s'"), "backgroundShape");
  v19 = -[THWViewportInfo initWithContext:geometry:]([THWViewportInfo alloc], "initWithContext:geometry:", objc_msgSend(a3, "tspContext"), -[PFXDrawablePlacement infoGeometry](self->super.mPlacement, "infoGeometry"));
  -[THWViewportInfo setProgressKitID:](v19, "setProgressKitID:", +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", objc_msgSend(v22, "xmlElementId")));
  -[THWViewportInfo setProgressKitSectionID:](v19, "setProgressKitSectionID:", objc_msgSend(a3, "nodeGUID"));
  -[THWViewportInfo setBackgroundShape:](v19, "setBackgroundShape:", v4);
  -[THWViewportInfo setCanvasSize:](v19, "setCanvasSize:", v15, v18);
  -[THWViewportInfo setContentPadding:](v19, "setContentPadding:", v12);
  -[THWViewportInfo setExteriorTextWrap:](v19, "setExteriorTextWrap:", -[PFXDrawablePlacement exteriorTextWrap](self->super.mPlacement, "exteriorTextWrap"));
  -[THWViewportInfo setCanvasInfos:](v19, "setCanvasInfos:", v23);
  if (v4)
  {
    -[THWViewportInfo setStroke:](v19, "setStroke:", objc_msgSend(v4, "stroke"));
    objc_msgSend(v4, "setStroke:", +[TSDStroke emptyStroke](TSDStroke, "emptyStroke"));
  }
  objc_msgSend(v3, "setResult:", v19);

  v24.receiver = self;
  v24.super_class = (Class)PFXViewport;
  -[PFXDrawable mapEndElementWithState:](&v24, "mapEndElementWithState:", a3);
}

@end

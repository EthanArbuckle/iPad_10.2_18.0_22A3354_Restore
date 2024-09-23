@implementation PFXGalleryWidget

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFXGalleryWidget;
  -[PFXGalleryWidget dealloc](&v3, "dealloc");
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
  id v5;
  id v6;
  TSWWidgetStyle *v7;
  double v8;
  double v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  THWStageGeometry *v17;
  THWGalleryInfo *v18;
  PFXWidgetPlacement *v19;
  char *v20;
  char *v21;
  char *i;
  uint64_t v23;
  void *v24;
  double v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  THWGalleryItem *v30;
  id v31;
  id v32;
  double v33;
  double v34;
  double v35;
  double v36;
  THWGalleryItem *v37;
  THWGalleryItem *v38;
  PFXGalleryWidget *v39;
  id v40;
  THWGalleryInfo *v41;
  int v42;
  int v43;
  id v44;
  CGRect v45;

  v5 = objc_msgSend(a3, "currentHtmlStackEntry");
  v6 = objc_msgSend(v5, "currentEntryMediaState");
  v7 = -[TSWWidgetStyle initWithContext:]([TSWWidgetStyle alloc], "initWithContext:", objc_msgSend(a3, "tspContext"));
  objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentHtmlDocMediaState"), "stylesheet"), "addStyle:", v7);
  v43 = xmlStrEqual((const xmlChar *)objc_msgSend(v5, "xmlValueForAttribute:", PFXWidgetConstantGalleryShowThumbs[0]), (const xmlChar *)"yes");
  v42 = xmlStrEqual((const xmlChar *)objc_msgSend(v5, "xmlValueForAttribute:", PFXWidgetConstantGalleryShareCaption[0]), (const xmlChar *)"yes");
  objc_msgSend(objc_msgSend(v5, "valueForAttribute:", PFXWidgetConstantDataStageCornerRadius[0]), "doubleValue");
  v9 = v8;
  v10 = PFXTSDInfoGeometry((const char *)objc_msgSend(objc_msgSend(v5, "valueForAttribute:", PFXWidgetConstantDataStageGeometry[0]), "UTF8String"));
  objc_msgSend(v10, "position");
  v12 = v11;
  v14 = v13;
  objc_msgSend(v10, "size");
  v17 = -[THWStageGeometry initWithFrame:cornerRadius:]([THWStageGeometry alloc], "initWithFrame:cornerRadius:", v12, v14, v15, v16, v9);
  v18 = -[THWGalleryInfo initWithContext:geometry:style:stageGeometry:]([THWGalleryInfo alloc], "initWithContext:geometry:style:stageGeometry:", objc_msgSend(a3, "tspContext"), -[PFXDrawablePlacement infoGeometry](self->mPlacement, "infoGeometry"), v7, v17);
  v40 = v5;
  -[THWGalleryInfo setProgressKitID:](v18, "setProgressKitID:", +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", objc_msgSend(v5, "xmlElementId")));
  -[THWGalleryInfo setProgressKitSectionID:](v18, "setProgressKitSectionID:", objc_msgSend(a3, "nodeGUID"));
  -[THWGalleryInfo setThumbnailsVisible:](v18, "setThumbnailsVisible:", v43 != 0);

  v39 = self;
  v44 = a3;
  v19 = +[PFXWidgetPlacement widgetPlacementWithDrawablePlacement:readerState:](PFXWidgetPlacement, "widgetPlacementWithDrawablePlacement:readerState:", self->mPlacement, a3);
  -[PFXWidgetPlacement contentPadding](v19, "contentPadding");
  v41 = v18;
  -[THWGalleryInfo setContentPadding:](v18, "setContentPadding:");
  if (-[PFXWidgetPlacement hasChildrenForAdornmentInfo](v19, "hasChildrenForAdornmentInfo"))
  {
    -[THWGalleryInfo setAdornmentInfo:](v18, "setAdornmentInfo:", +[PFXDrawablesWidget adornmentInfoWithWidgetPlacement:readerState:](PFXDrawablesWidget, "adornmentInfoWithWidgetPlacement:readerState:", v19, a3));
    -[THWWidgetAdornmentInfo updateParentInfo:](-[THWGalleryInfo adornmentInfo](v18, "adornmentInfo"), "updateParentInfo:", v18);
  }
  v20 = (char *)objc_msgSend(v6, "childResultCount");
  if (v20)
  {
    v21 = v20;
    for (i = 0; i != v21; ++i)
    {
      if (objc_msgSend(objc_msgSend(v6, "childElementNameAtIndex:", i), "isEqualToString:", CFSTR("div")))
      {
        v23 = objc_opt_class(PFXGalleryItem2);
        *(_QWORD *)&v25 = TSUDynamicCast(v23, objc_msgSend(v6, "childResultAtIndex:", i)).n128_u64[0];
        if (v24)
        {
          v26 = v24;
          if (v43)
            v27 = objc_msgSend(v24, "thumbnail", v25);
          else
            v27 = 0;
          v28 = objc_msgSend(v26, "caption");
          v29 = v28;
          if (v42)
          {
            if (v28)
            {
              objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFXGalleryWidget mapEndElementWithState:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/Readers/PFXGalleryWidget.mm"), 259, CFSTR("Gallery item with own caption in a widget with shared caption"));
              v29 = 0;
            }
          }
          else if (v28)
          {
            objc_msgSend(v44, "setUniqueIdForInfo:withPostfix:fromStackEntry:", objc_msgSend(v26, "caption"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("caption-%lu"), i + 1), v40);
          }
          v30 = [THWGalleryItem alloc];
          v31 = objc_msgSend(v44, "tspContext");
          v32 = objc_msgSend(v26, "fullres");
          objc_msgSend(v26, "fullresCropRect");
          v37 = -[THWGalleryItem initWithContext:imageData:thumbnailData:captionStorage:cropRect:accessibilityDescriptions:](v30, "initWithContext:imageData:thumbnailData:captionStorage:cropRect:accessibilityDescriptions:", v31, v32, v27, v29, objc_msgSend(v26, "accessibilityDescriptions"), v33, v34, v35, v36);
          if (v37)
          {
            v38 = v37;
            -[THWGalleryItem cropRect](v37, "cropRect");
            if (CGRectIsEmpty(v45))
              objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFXGalleryWidget mapEndElementWithState:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/Readers/PFXGalleryWidget.mm"), 279, CFSTR("No crop rect for a gallery item"));
            -[THWGalleryInfo addItem:](v41, "addItem:", v38);

          }
        }
      }
    }
  }
  objc_msgSend(v44, "setUniqueIdForInfo:fromStackEntry:", v41, v40);
  objc_msgSend(v6, "setResult:", v41);

  -[PFXDrawablePlacement mapEndElementWithState:](v39->mPlacement, "mapEndElementWithState:", v44);
}

- (PFXDrawablePlacement)placement
{
  return self->mPlacement;
}

@end

@implementation PFEIGallery

+ (id)galleryItemFromEntry:(id)a3
{
  id v4;
  id v5;
  double x;
  double y;
  double width;
  double height;
  const char *v10;
  THWGalleryItem *v11;
  unint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  double v25;
  void *v26;
  void *v27;
  NSString *v28;
  id v29;
  double v31;
  double v32;
  double v33;
  double v34;
  CGRect v35;

  v4 = objc_msgSend(a3, "htmlReaderState");
  v5 = objc_msgSend(a3, "currentEntryMediaState");
  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v10 = (const char *)objc_msgSend(a3, "xmlValueForAttribute:", PFXWidgetConstantGalleryItemExpandedCropRect[0]);
  if (v10)
  {
    v33 = 0.0;
    v34 = 0.0;
    v31 = 0.0;
    v32 = 0.0;
    if (sscanf(v10, "%lf %lf %lf %lf", &v34, &v33, &v32, &v31) == 4)
    {
      y = v33;
      x = v34;
      height = v31;
      width = v32;
    }
  }
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  if (CGRectIsEmpty(v35))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[PFEIGallery galleryItemFromEntry:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/EPUB/PFEIGallery.mm"), 49, CFSTR("No crop rect for a gallery item"));
  v11 = (THWGalleryItem *)objc_msgSend(v5, "childResultCount");
  if (v11)
  {
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    do
    {
      v16 = objc_msgSend(v5, "childResultAtIndex:", v12);
      if (v15 || (v17 = objc_opt_class(TSDImageInfo), (objc_opt_isKindOfClass(v16, v17) & 1) == 0))
      {
        if (!v14)
        {
          v22 = objc_opt_class(THWPStorage);
          if ((objc_opt_isKindOfClass(v16, v22) & 1) != 0)
            v14 = v16;
          else
            v14 = 0;
        }
      }
      else
      {
        v18 = objc_opt_class(TSDImageInfo);
        *(_QWORD *)&v19 = TSUDynamicCast(v18, v16).n128_u64[0];
        v21 = v20;
        v15 = objc_msgSend(v20, "imageData", v19);
        v13 = objc_msgSend(v21, "accessibilityDescriptions");
      }
      ++v12;
    }
    while (v12 < (unint64_t)objc_msgSend(v5, "childResultCount"));
    if (v15)
    {
      v23 = objc_opt_class(PFEIGallery);
      v24 = objc_msgSend(objc_msgSend(a3, "readerState"), "ancestorReaderWithClass:", objc_opt_class(PFEIGallery));
      *(_QWORD *)&v25 = TSUDynamicCast(v23, v24).n128_u64[0];
      v27 = v26;
      if (objc_msgSend(v26, "showThumbs", v25))
      {
        v28 = +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", objc_msgSend(a3, "xmlValueForAttribute:", PFXWidgetConstantDataThumbnailSrc[0]));
        if (v28)
          v28 = (NSString *)objc_msgSend(v4, "imageDataForUri:isSharable:", objc_msgSend(+[PFXCommon absolutePathWithUrl:relativeToFile:](PFXCommon, "absolutePathWithUrl:relativeToFile:", v28, objc_msgSend(v4, "entryURI")), "stringByRemovingPercentEncoding"), 0);
      }
      else
      {
        v28 = 0;
      }
      if ((objc_msgSend(v27, "shareCaption") & (v14 != 0)) != 0)
        v29 = 0;
      else
        v29 = v14;
      v11 = -[THWGalleryItem initWithContext:imageData:thumbnailData:captionStorage:cropRect:accessibilityDescriptions:]([THWGalleryItem alloc], "initWithContext:imageData:thumbnailData:captionStorage:cropRect:accessibilityDescriptions:", objc_msgSend(v4, "tspContext"), v15, v28, v29, v13, x, y, width, height);
    }
    else
    {
      v11 = 0;
    }
  }
  return v11;
}

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5;
  objc_super v7;

  v5 = objc_msgSend(a3, "currentHtmlStackEntry");
  -[PFEIGallery setShowThumbs:](self, "setShowThumbs:", xmlStrEqual((const xmlChar *)objc_msgSend(v5, "xmlValueForAttribute:", PFXWidgetConstantGalleryShowThumbs[0]), (const xmlChar *)"yes") != 0);
  -[PFEIGallery setShareCaption:](self, "setShareCaption:", xmlStrEqual((const xmlChar *)objc_msgSend(v5, "xmlValueForAttribute:", PFXWidgetConstantGalleryShareCaption[0]), (const xmlChar *)"yes") != 0);
  v7.receiver = self;
  v7.super_class = (Class)PFEIGallery;
  return -[PFEIWidget mapStartElementWithState:](&v7, "mapStartElementWithState:", a3);
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
  THWGalleryInfo *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  unint64_t v26;
  uint64_t v27;
  double v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  THWGalleryInfo *v35;
  id v36;
  NSString *v37;
  NSString *v38;
  NSString *v39;
  _BOOL8 v40;
  id v41;
  THWStageGeometry *v42;
  TSWWidgetStyle *v43;
  void *v44;
  id v45;
  objc_super v46;
  CGRect v47;

  -[PFXDrawablePlacement mapEndElementWithState:](-[PFEIWidget placement](self, "placement"), "mapEndElementWithState:", a3);
  v5 = objc_msgSend(a3, "currentHtmlStackEntry");
  v6 = objc_msgSend(v5, "currentEntryMediaState");
  v7 = -[TSWWidgetStyle initWithContext:]([TSWWidgetStyle alloc], "initWithContext:", objc_msgSend(a3, "tspContext"));
  objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentHtmlDocMediaState"), "stylesheet"), "addStyle:", v7);
  objc_msgSend(objc_msgSend(v5, "valueForAttribute:", PFXWidgetConstantDataStageCornerRadius[0]), "doubleValue");
  v9 = v8;
  v10 = PFXTSDInfoGeometry((const char *)objc_msgSend(objc_msgSend(v5, "valueForAttribute:", PFXWidgetConstantDataStageGeometry[0]), "UTF8String"));
  objc_msgSend(v10, "position");
  v12 = v11;
  v14 = v13;
  objc_msgSend(v10, "size");
  v42 = -[THWStageGeometry initWithFrame:cornerRadius:]([THWStageGeometry alloc], "initWithFrame:cornerRadius:", v12, v14, v15, v16, v9);
  v43 = v7;
  v17 = -[THWGalleryInfo initWithContext:geometry:style:stageGeometry:]([THWGalleryInfo alloc], "initWithContext:geometry:style:stageGeometry:", objc_msgSend(a3, "tspContext"), -[PFXDrawablePlacement infoGeometry](-[PFEIWidget placement](self, "placement"), "infoGeometry"), v7, v42);
  v45 = v5;
  v18 = objc_msgSend(v5, "valueForAttribute:", PFXWidgetConstantDataContentPadding[0]);
  if (v18)
  {
    objc_msgSend(v18, "doubleValue");
    -[THWGalleryInfo setContentPadding:](v17, "setContentPadding:");
  }
  v19 = objc_opt_class(TSUPair);
  v44 = v6;
  TSUDynamicCast(v19, objc_msgSend(objc_msgSend(v6, "childResults"), "firstObject"));
  v21 = v20;
  v22 = objc_opt_class(NSArray);
  TSUDynamicCast(v22, objc_msgSend(v21, "second"));
  v24 = v23;
  v25 = objc_alloc_init((Class)NSMutableArray);
  if (objc_msgSend(v24, "count"))
  {
    v26 = 0;
    do
    {
      v27 = objc_opt_class(TSUPair);
      *(_QWORD *)&v28 = TSUDynamicCast(v27, objc_msgSend(v24, "objectAtIndexedSubscript:", v26)).n128_u64[0];
      v30 = v29;
      v31 = objc_msgSend(v29, "second", v28);
      v32 = objc_opt_class(TSWPStorage);
      if ((objc_opt_isKindOfClass(v31, v32) & 1) != 0)
      {
        objc_msgSend(v25, "addObject:", v30);
      }
      else
      {
        v33 = objc_opt_class(THWGalleryItem);
        if ((objc_opt_isKindOfClass(v31, v33) & 1) != 0)
        {
          objc_msgSend(v31, "cropRect");
          if (CGRectIsEmpty(v47))
          {
            v34 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
            v35 = v17;
            v36 = v25;
            v37 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFEIGallery mapEndElementWithState:]");
            v38 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/EPUB/PFEIGallery.mm");
            v39 = v37;
            v25 = v36;
            v17 = v35;
            objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v39, v38, 176, CFSTR("No crop rect for a gallery item"));
          }
          -[THWGalleryInfo addItem:](v17, "addItem:", v31);
          objc_msgSend(objc_msgSend(v31, "captionStorage"), "setParentInfo:", v17);
        }
      }
      ++v26;
    }
    while (v26 < (unint64_t)objc_msgSend(v24, "count"));
  }
  v40 = -[PFEIGallery showThumbs](self, "showThumbs")
     && -[NSArray count](-[THWGalleryInfo items](v17, "items"), "count") > 1;
  -[THWGalleryInfo setThumbnailsVisible:](v17, "setThumbnailsVisible:", v40);
  v41 = objc_msgSend(objc_alloc((Class)TSUPair), "initWithFirst:second:", CFSTR("gallery"), v17);
  objc_msgSend(v25, "addObject:", v41);

  objc_msgSend(a3, "setUniqueIdForInfo:fromStackEntry:", v17, v45);
  objc_msgSend(a3, "setCfiPathForInfo:fromStackEntry:", v17, v45);
  objc_msgSend(v44, "setResult:", v25);

  v46.receiver = self;
  v46.super_class = (Class)PFEIGallery;
  -[PFEIWidget mapEndElementWithState:](&v46, "mapEndElementWithState:", a3);
}

- (BOOL)showThumbs
{
  return self->_showThumbs;
}

- (void)setShowThumbs:(BOOL)a3
{
  self->_showThumbs = a3;
}

- (BOOL)shareCaption
{
  return self->_shareCaption;
}

- (void)setShareCaption:(BOOL)a3
{
  self->_shareCaption = a3;
}

@end

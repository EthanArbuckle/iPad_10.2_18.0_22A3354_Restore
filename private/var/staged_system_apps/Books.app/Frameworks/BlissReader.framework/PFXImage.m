@implementation PFXImage

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFXImage;
  -[PFXDrawable dealloc](&v3, "dealloc");
}

+ (id)errorImageInfoForGeometry:(id)a3 readerState:(id)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  CGContext *v11;
  CGImage *Image;
  __CFData *v13;
  CGImageDestination *v14;
  _BOOL4 v15;
  THImageInfo *v16;

  objc_msgSend(a3, "transformedBounds");
  v7 = v6;
  objc_msgSend(a3, "transformedBounds");
  v9 = v8;
  v10 = objc_alloc_init((Class)NSAutoreleasePool);
  v11 = (CGContext *)TSDBitmapContextCreate(TSDBitmapContextOptionsCommonFlipped);
  CGContextSetInterpolationQuality(v11, kCGInterpolationNone);
  CGContextSaveGState(v11);
  -[TSDErrorImageProvider drawImageInContext:rect:](+[TSDErrorImageProvider sharedInstance](TSDErrorImageProvider, "sharedInstance"), "drawImageInContext:rect:", v11, 0.0, 0.0, v7, v9);
  CGContextRestoreGState(v11);
  Image = CGBitmapContextCreateImage(v11);
  CGContextRelease(v11);
  v13 = (__CFData *)objc_alloc_init((Class)NSMutableData);
  v14 = CGImageDestinationCreateWithData(v13, (CFStringRef)objc_msgSend(UTTypePNG, "identifier"), 1uLL, 0);
  CGImageDestinationAddImage(v14, Image, 0);
  v15 = CGImageDestinationFinalize(v14);
  CFRelease(v14);
  CGImageRelease(Image);
  if (!v15)
  {
    v16 = 0;
    goto LABEL_5;
  }
  v16 = (THImageInfo *)+[TSPData dataFromNSData:filename:context:](TSPData, "dataFromNSData:filename:context:", v13, CFSTR("error.png"), +[THTemporaryObjectContext context](THTemporaryObjectContext, "context"));

  if (v16)
  {
    v13 = (__CFData *)objc_msgSend(objc_alloc((Class)TSDMediaStyle), "initWithContext:name:overridePropertyMap:isVariation:", objc_msgSend(a4, "tspContext"), 0, 0, 0);
    v16 = -[THImageInfo initWithContext:geometry:style:imageData:originalImageData:]([THImageInfo alloc], "initWithContext:geometry:style:imageData:originalImageData:", objc_msgSend(a4, "tspContext"), a3, v13, v16, 0);
LABEL_5:

  }
  return v16;
}

+ (void)mapPropertySet:(id)a3 to:(id)a4 readerState:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  double v12;

  v8 = +[PFXGraphicStyle mapStrokeFromStyleProperties:contentState:](PFXGraphicStyle, "mapStrokeFromStyleProperties:contentState:", a3, a5);
  if (v8)
    objc_msgSend(a4, "setObject:forProperty:", v8, 517);
  v9 = +[PFXGraphicStyle mapShadowFromStyleProperties:contentState:](PFXGraphicStyle, "mapShadowFromStyleProperties:contentState:", a3, a5);
  if (v9)
    objc_msgSend(a4, "setObject:forProperty:", v9, 520);
  v10 = +[PFXGraphicStyle mapReflectionFromStyleProperties:](PFXGraphicStyle, "mapReflectionFromStyleProperties:", a3);
  if (v10)
    objc_msgSend(a4, "setObject:forProperty:", v10, 519);
  v11 = +[PFXGraphicStyle mapOpacityFromStyleProperties:](PFXGraphicStyle, "mapOpacityFromStyleProperties:", a3);
  if (v11)
  {
    objc_msgSend(v11, "doubleValue");
    *(float *)&v12 = v12;
    objc_msgSend(a4, "setFloatValue:forProperty:", 518, v12);
  }
}

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5;
  int v6;
  char **v7;
  objc_super v9;

  v5 = objc_msgSend(a3, "currentHtmlStackEntry");
  v6 = xmlStrEqual((const xmlChar *)objc_msgSend(v5, "xmlElementName"), (const xmlChar *)"img");
  self->mIsHtmlImage = v6 != 0;
  v7 = PFXTagSource;
  if (!v6)
    v7 = PFXTagHref;
  self->mImageRelHref = (NSString *)objc_msgSend(v5, "valueForAttribute:", *v7);
  v9.receiver = self;
  v9.super_class = (Class)PFXImage;
  return -[PFXDrawable mapStartElementWithState:](&v9, "mapStartElementWithState:", a3);
}

- (void)mapEndElementWithState:(id)a3
{
  -[PFXImage mapEndElementWithState:forceBoundsComputation:](self, "mapEndElementWithState:forceBoundsComputation:", a3, 0);
}

- (void)mapEndElementWithState:(id)a3 forceBoundsComputation:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  id v8;
  id v9;
  id v10;
  unsigned int v11;
  id v12;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double x;
  double y;
  double v22;
  double v23;
  PFXDrawablePlacement *mPlacement;
  id v25;
  id v26;
  THImageInfo *v27;
  id v28;
  id v29;
  id v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  id v52;
  id v53;
  id v54;
  objc_super v55;
  CGAffineTransform v56;
  CGAffineTransform v57;
  CGAffineTransform v58;
  CGAffineTransform v59;
  _OWORD v60[4];

  v4 = a4;
  v54 = objc_alloc_init((Class)NSAutoreleasePool);
  v7 = objc_msgSend(a3, "currentHtmlDocMediaState");
  v8 = objc_msgSend(a3, "currentHtmlStackEntry");
  v53 = objc_msgSend(v8, "currentEntryMediaState");
  v9 = objc_msgSend(v53, "propertySet");
  v10 = objc_msgSend(+[PFXCommon absolutePathWithUrl:relativeToFile:](PFXCommon, "absolutePathWithUrl:relativeToFile:", self->mImageRelHref, objc_msgSend(a3, "entryURI")), "stringByRemovingPercentEncoding");
  v11 = objc_msgSend(a3, "isInsideWidget");
  v12 = objc_msgSend(a3, "imageDataForUri:isSharable:", v10, v11 ^ 1);
  if (!self->mIsHtmlImage && !v4)
    goto LABEL_17;
  -[PFXDrawablePlacement bounds](self->super.mPlacement, "bounds");
  if (v14 != 0.0)
  {
    -[PFXDrawablePlacement bounds](self->super.mPlacement, "bounds");
    if (v15 != 0.0)
      goto LABEL_17;
  }
  if (!v11)
  {
    objc_msgSend(objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "temporaryProviderForData:shouldValidate:", v12, 0), "naturalSize");
    v17 = v22;
    v19 = v23;
    x = CGPointZero.x;
    y = CGPointZero.y;
    goto LABEL_12;
  }
  -[PFXDrawablePlacement setBounds:](self->super.mPlacement, "setBounds:", 0.0, 0.0, 100.0, 100.0);
  objc_msgSend(objc_msgSend(v8, "valueForAttribute:", "width"), "doubleValue");
  v17 = v16;
  objc_msgSend(objc_msgSend(v8, "valueForAttribute:", "height"), "doubleValue");
  if (v17 != 0.0)
  {
    v19 = v18;
    if (v18 != 0.0)
    {
      -[PFXDrawablePlacement bounds](self->super.mPlacement, "bounds");
LABEL_12:
      -[PFXDrawablePlacement setBounds:](self->super.mPlacement, "setBounds:", x, y, v17, v19);
    }
  }
  mPlacement = self->super.mPlacement;
  if (mPlacement)
  {
    -[PFXDrawablePlacement affineTransform](mPlacement, "affineTransform");
    mPlacement = self->super.mPlacement;
  }
  else
  {
    memset(v60, 0, 48);
  }
  -[PFXDrawablePlacement bounds](mPlacement, "bounds");
  -[PFXDrawablePlacement setInfoGeometry:](self->super.mPlacement, "setInfoGeometry:", +[PFXDrawablePlacement affineGeometryWithAffineTransform:appliedToBounds:](PFXDrawablePlacement, "affineGeometryWithAffineTransform:appliedToBounds:", v60));
LABEL_17:
  v25 = objc_alloc_init((Class)TSSPropertyMap);
  +[PFXImage mapPropertySet:to:readerState:](PFXImage, "mapPropertySet:to:readerState:", v9, v25, a3);
  v26 = objc_msgSend(objc_alloc((Class)TSDMediaStyle), "initWithContext:name:overridePropertyMap:isVariation:", objc_msgSend(a3, "tspContext"), 0, v25, 0);
  objc_msgSend(objc_msgSend(v7, "stylesheet"), "addStyle:", v26);

  v27 = -[THImageInfo initWithContext:geometry:style:imageData:originalImageData:]([THImageInfo alloc], "initWithContext:geometry:style:imageData:originalImageData:", objc_msgSend(a3, "tspContext"), -[PFXDrawablePlacement infoGeometry](self->super.mPlacement, "infoGeometry"), v26, v12, 0);
  v28 = objc_msgSend(v8, "valueForAttribute:", "clip-path");
  if (v28)
  {
    v29 = objc_msgSend(objc_msgSend(a3, "svgDefinitionCache"), "objectForKey:", objc_msgSend(v28, "substringWithRange:", 5, (char *)objc_msgSend(v28, "length") - 6));
    if (v29)
    {
      v30 = objc_msgSend(v29, "copy");
      -[TSDInfoGeometry size](-[PFXDrawablePlacement infoGeometry](self->super.mPlacement, "infoGeometry"), "size");
      v32 = v31;
      v34 = v33;
      memset(&v59, 0, sizeof(v59));
      -[PFXDrawablePlacement bounds](self->super.mPlacement, "bounds");
      v36 = v32 / v35;
      -[PFXDrawablePlacement bounds](self->super.mPlacement, "bounds");
      CGAffineTransformMakeScale(&v59, v36, v34 / v37);
      v58 = v59;
      objc_msgSend(v30, "transformUsingAffineTransform:", &v58);
      objc_msgSend(v30, "bounds");
      v39 = v38;
      v41 = v40;
      v43 = v42;
      v45 = v44;
      memset(&v57, 0, sizeof(v57));
      CGAffineTransformMakeTranslation(&v57, -v38, -v40);
      v56 = v57;
      objc_msgSend(v30, "transformUsingAffineTransform:", &v56);
      v46 = objc_msgSend(objc_alloc((Class)TSDInfoGeometry), "initWithPosition:size:", v39, v41, v43, v45);
      v47 = objc_msgSend(objc_alloc((Class)TSDBezierPathSource), "initWithBezierPath:", v30);

      v48 = objc_msgSend(objc_alloc((Class)TSDMaskInfo), "initWithContext:geometry:pathSource:", objc_msgSend(a3, "tspContext"), v46, v47);
      -[THImageInfo setMaskInfo:](v27, "setMaskInfo:", v48);

    }
  }
  if (self->mIsHtmlImage)
    v49 = objc_msgSend(v8, "valueForAttribute:", "alt");
  else
    v49 = 0;
  v50 = objc_msgSend(objc_msgSend(a3, "ancestorEntryWithElementName:", "object"), "valueForAttribute:", "title");
  if (objc_msgSend(v49, "length") || objc_msgSend(v50, "length"))
  {
    v52 = -[THImageInfo accessibilityDescriptions](v27, "accessibilityDescriptions");
    if (!v52)
    {
      v52 = (id)objc_opt_new(NSMutableDictionary, v51);
      -[THImageInfo setAccessibilityDescriptions:](v27, "setAccessibilityDescriptions:", v52);

    }
    if (v49)
      objc_msgSend(v52, "setObject:forKey:", v49, CFSTR("alternateText"));
    if (v50)
      objc_msgSend(v52, "setObject:forKey:", v50, CFSTR("container"));
  }
  objc_msgSend(v53, "setResult:", v27);

  v55.receiver = self;
  v55.super_class = (Class)PFXImage;
  -[PFXDrawable mapEndElementWithState:](&v55, "mapEndElementWithState:", a3);
  if (v11)
    objc_msgSend(v8, "addChildAttributesToParentForResult:", v27);
}

@end

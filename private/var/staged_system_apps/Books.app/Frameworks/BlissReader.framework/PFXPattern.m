@implementation PFXPattern

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFXPattern;
  -[PFXSvgElement dealloc](&v3, "dealloc");
}

- (void)setImageHref:(id)a3
{
  self->mImageHref = (NSString *)objc_msgSend(a3, "copy");
}

- (void)end
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v3 = objc_msgSend(-[PFXSvgDefsDocument readerState](self->super.mDocument, "readerState"), "imageDataForUri:", -[NSString stringByRemovingPercentEncoding](self->mImageHref, "stringByRemovingPercentEncoding"));
  v4 = -[PFXSvgElement valueForAttributeName:](self, "valueForAttributeName:", "fillTechnique");
  v5 = (id)qword_5436A8;
  if (!qword_5436A8)
  {
    v5 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0), CFSTR("naturalSize"), +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 1), CFSTR("stretch"), +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 2), CFSTR("tile"), +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 3), CFSTR("scaleToFill"), +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 4), CFSTR("scaleToFit"), 0);
    qword_5436A8 = (uint64_t)v5;
  }
  v6 = objc_msgSend(v5, "objectForKey:", v4);
  if (v6)
    v7 = objc_msgSend(v6, "integerValue");
  else
    v7 = 0;
  v8 = +[PFXGraphicStyle newImageFillWithImageData:technique:tintColor:contentState:](PFXGraphicStyle, "newImageFillWithImageData:technique:tintColor:contentState:", v3, v7, +[PFXStyleUtilities htmlStringToColor:](PFXStyleUtilities, "htmlStringToColor:", -[PFXSvgElement valueForAttributeName:](self, "valueForAttributeName:", "tintColor")), -[PFXSvgDefsDocument readerState](self->super.mDocument, "readerState"));
  -[PFXSvgElement cacheDefinition:](self, "cacheDefinition:", v8);

}

@end

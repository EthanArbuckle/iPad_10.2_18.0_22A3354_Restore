@implementation THWReviewChoice

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWReviewChoice;
  -[THWReviewChoice dealloc](&v3, "dealloc");
}

- (TSWPStorage)contentStorage
{
  NSString *v3;
  uint64_t v4;
  TSWPStorage *result;

  v3 = -[THWReviewChoice contentType](self, "contentType");
  if (!-[NSString isEqualToString:](v3, "isEqualToString:", TSWReviewChoiceDescriptionContentTypeTextValue))
    return 0;
  v4 = objc_opt_class(TSWPStorage);
  TSUDynamicCast(v4, -[THWReviewChoice content](self, "content"));
  return result;
}

- (TSUImage)contentImage
{
  NSString *v3;
  uint64_t v4;
  uint64_t v5;
  double v6;

  v3 = -[THWReviewChoice contentType](self, "contentType");
  if (-[NSString isEqualToString:](v3, "isEqualToString:", TSWReviewChoiceDescriptionContentTypeImageValue)
    && (v4 = objc_opt_class(TSPData),
        *(_QWORD *)&v6 = TSUDynamicCast(v4, -[THWReviewChoice content](self, "content")).n128_u64[0],
        v5))
  {
    return (TSUImage *)+[TSDBitmapImageProvider TSUImageForImageData:](TSDBitmapImageProvider, "TSUImageForImageData:", v5, v6);
  }
  else
  {
    return 0;
  }
}

- (void)setContent:(id)a3
{
  id content;
  uint64_t v6;
  void *v7;
  double v8;
  void *v9;

  content = self->_content;
  if (content != a3)
  {

    self->_content = a3;
    v6 = objc_opt_class(TSWPStorage);
    *(_QWORD *)&v8 = TSUDynamicCast(v6, self->_content).n128_u64[0];
    if (v7)
    {
      v9 = v7;
      if (!objc_msgSend(v7, "length", v8))
        objc_msgSend(v9, "insertString:atCharIndex:undoTransaction:", CFSTR(" "), 0, 0);
    }
  }
}

- (double)fraction
{
  return self->_fraction;
}

- (void)setFraction:(double)a3
{
  self->_fraction = a3;
}

- (int)placardPlacement
{
  return self->_placardPlacement;
}

- (void)setPlacardPlacement:(int)a3
{
  self->_placardPlacement = a3;
}

- (TSDBezierPath)targetRegion
{
  return self->_targetRegion;
}

- (void)setTargetRegion:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (id)content
{
  return self->_content;
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)accessibilityDescription
{
  return self->_accessibilityDescription;
}

- (void)setAccessibilityDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)targetAccesibilityDescription
{
  return self->_targetAccesibilityDescription;
}

- (void)setTargetAccesibilityDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

@end

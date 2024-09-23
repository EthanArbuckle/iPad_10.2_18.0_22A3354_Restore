@implementation PFXReviewWidgetQuestion2

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFXReviewWidgetQuestion2;
  -[PFXReviewWidgetQuestion2 dealloc](&v3, "dealloc");
}

- (BOOL)answersAreText
{
  id v3;
  uint64_t v4;
  char isKindOfClass;

  if (-[NSArray count](self->_answers, "count"))
  {
    v3 = -[NSArray objectAtIndex:](self->_answers, "objectAtIndex:", 0);
    v4 = objc_opt_class(PFXReviewWidgetText2);
    isKindOfClass = objc_opt_isKindOfClass(v3, v4);
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFXReviewWidgetQuestion2 answersAreText]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/Readers/PFXReviewWidget.mm"), 184, CFSTR("PFXReviewWidget:: bad answer array"));
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (PFXReviewWidgetText2)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)titleAccessibilityDescription
{
  return self->_titleAccessibilityDescription;
}

- (void)setTitleAccessibilityDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (TSDImageInfo)imageInfo
{
  return self->_imageInfo;
}

- (void)setImageInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSString)imageAccessibilityDescription
{
  return self->_imageAccessibilityDescription;
}

- (void)setImageAccessibilityDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)answers
{
  return self->_answers;
}

- (void)setAnswers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (int)contentRefPlacement
{
  return self->_contentRefPlacement;
}

- (void)setContentRefPlacement:(int)a3
{
  self->_contentRefPlacement = a3;
}

- (TSWPParagraphStyle)numberParagraphStyle
{
  return self->_numberParagraphStyle;
}

- (void)setNumberParagraphStyle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (TSDInfoGeometry)dropAreaGeometry
{
  return self->_dropAreaGeometry;
}

- (void)setDropAreaGeometry:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

@end

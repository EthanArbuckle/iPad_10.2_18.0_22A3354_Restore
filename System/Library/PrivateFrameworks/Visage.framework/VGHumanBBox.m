@implementation VGHumanBBox

- (VGHumanBBox)initWithBBox:(CGRect)a3 confidence:(double)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  VGHumanBBox *result;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)VGHumanBBox;
  result = -[VGHumanBBox init](&v10, sel_init);
  if (result)
  {
    result->_bbox.origin.y = y;
    result->_bbox.size.width = width;
    result->_bbox.size.height = height;
    result->_confidence = a4;
    result->_bbox.origin.x = x;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double v4;
  double v5;
  double v6;
  id v7;

  v7 = a3;
  -[VGHumanBBox bbox](self, "bbox");
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("bboxOriginX"));
  -[VGHumanBBox bbox](self, "bbox");
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("bboxOriginY"), v4);
  -[VGHumanBBox bbox](self, "bbox");
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("bboxSizeH"), v5);
  -[VGHumanBBox bbox](self, "bbox");
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("bboxSizeW"), v6);
  -[VGHumanBBox confidence](self, "confidence");
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("confidence"));

}

- (VGHumanBBox)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("bboxOriginX"));
  v6 = v5;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("bboxOriginY"));
  v8 = v7;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("bboxSizeH"));
  v10 = v9;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("bboxSizeW"));
  v12 = v11;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("confidence"));
  v14 = v13;

  return -[VGHumanBBox initWithBBox:confidence:](self, "initWithBBox:confidence:", v6, v8, v12, v10, v14);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double confidence;
  double v11;
  BOOL v12;
  CGRect v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "bbox");
    v14.origin.x = v6;
    v14.origin.y = v7;
    v14.size.width = v8;
    v14.size.height = v9;
    if (CGRectEqualToRect(self->_bbox, v14))
    {
      confidence = self->_confidence;
      objc_msgSend(v5, "confidence");
      v12 = confidence == v11;
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (CGRect)bbox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bbox.origin.x;
  y = self->_bbox.origin.y;
  width = self->_bbox.size.width;
  height = self->_bbox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBbox:(CGRect)a3
{
  self->_bbox = a3;
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

@end

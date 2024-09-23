@implementation VGFaceMetadata

- (VGFaceMetadata)initWithFaceId:(int64_t)a3 bounds:(CGRect)a4 yawAngle:(double)a5 rollAngle:(double)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  VGFaceMetadata *result;
  objc_super v14;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)VGFaceMetadata;
  result = -[VGFaceMetadata init](&v14, sel_init);
  if (result)
  {
    result->_bounds.origin.x = x;
    result->_bounds.origin.y = y;
    result->_bounds.size.width = width;
    result->_bounds.size.height = height;
    result->_faceID = a3;
    result->_rollAngle = a6;
    result->_yawAngle = a5;
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
  objc_msgSend(v7, "encodeInt64:forKey:", -[VGFaceMetadata faceID](self, "faceID"), CFSTR("faceID"));
  -[VGFaceMetadata bounds](self, "bounds");
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("boundsOriginX"));
  -[VGFaceMetadata bounds](self, "bounds");
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("boundsOriginY"), v4);
  -[VGFaceMetadata bounds](self, "bounds");
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("boundsSizeH"), v5);
  -[VGFaceMetadata bounds](self, "bounds");
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("boundsSizeW"), v6);
  -[VGFaceMetadata rollAngle](self, "rollAngle");
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("rollAngle"));
  -[VGFaceMetadata yawAngle](self, "yawAngle");
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("yawAngle"));

}

- (VGFaceMetadata)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v4 = a3;
  v5 = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("faceID"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("boundsOriginX"));
  v7 = v6;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("boundsOriginY"));
  v9 = v8;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("boundsSizeH"));
  v11 = v10;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("boundsSizeW"));
  v13 = v12;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("rollAngle"));
  v15 = v14;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("yawAngle"));
  v17 = v16;

  return -[VGFaceMetadata initWithFaceId:bounds:yawAngle:rollAngle:](self, "initWithFaceId:bounds:yawAngle:rollAngle:", v5, v7, v9, v13, v11, v17, v15);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t faceID;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double yawAngle;
  double v12;
  double rollAngle;
  double v14;
  BOOL v15;
  CGRect v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    faceID = self->_faceID;
    if (faceID == objc_msgSend(v5, "faceID")
      && (objc_msgSend(v5, "bounds"),
          v17.origin.x = v7,
          v17.origin.y = v8,
          v17.size.width = v9,
          v17.size.height = v10,
          CGRectEqualToRect(self->_bounds, v17))
      && (yawAngle = self->_yawAngle, objc_msgSend(v5, "yawAngle"), yawAngle == v12))
    {
      rollAngle = self->_rollAngle;
      objc_msgSend(v5, "rollAngle");
      v15 = rollAngle == v14;
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int64_t)faceID
{
  return self->_faceID;
}

- (double)rollAngle
{
  return self->_rollAngle;
}

- (double)yawAngle
{
  return self->_yawAngle;
}

@end

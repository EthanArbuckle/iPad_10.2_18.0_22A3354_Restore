@implementation VIReducePersonOverTriggerRegionalAnnotation

- (VIReducePersonOverTriggerRegionalAnnotation)initWithLabel:(id)a3 boundingBox:(CGRect)a4 confidence:(float)a5 faceCount:(int)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v14;
  VIReducePersonOverTriggerRegionalAnnotation *v15;
  VIReducePersonOverTriggerRegionalAnnotation *v16;
  objc_super v18;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v14 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VIReducePersonOverTriggerRegionalAnnotation;
  v15 = -[VIReducePersonOverTriggerRegionalAnnotation init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_label, a3);
    v16->_boundingBox.origin.x = x;
    v16->_boundingBox.origin.y = y;
    v16->_boundingBox.size.width = width;
    v16->_boundingBox.size.height = height;
    v16->_confidence = a5;
    v16->_faceCount = a6;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  VIReducePersonOverTriggerRegionalAnnotation *v4;
  VIReducePersonOverTriggerRegionalAnnotation *v5;
  VIReducePersonOverTriggerRegionalAnnotation *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  NSString *label;
  NSString *v12;
  BOOL v13;
  float confidence;
  float v15;
  int faceCount;
  CGRect v18;

  v4 = (VIReducePersonOverTriggerRegionalAnnotation *)a3;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    -[VIReducePersonOverTriggerRegionalAnnotation boundingBox](v6, "boundingBox");
    v18.origin.x = v7;
    v18.origin.y = v8;
    v18.size.width = v9;
    v18.size.height = v10;
    if (CGRectEqualToRect(self->_boundingBox, v18))
    {
      label = self->_label;
      -[VIReducePersonOverTriggerRegionalAnnotation label](v6, "label");
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (label == v12
        && (confidence = self->_confidence,
            -[VIReducePersonOverTriggerRegionalAnnotation confidence](v6, "confidence"),
            confidence == v15))
      {
        faceCount = self->_faceCount;
        v13 = faceCount == -[VIReducePersonOverTriggerRegionalAnnotation faceCount](v6, "faceCount");
      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

- (NSString)label
{
  return self->_label;
}

- (CGRect)boundingBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_boundingBox.origin.x;
  y = self->_boundingBox.origin.y;
  width = self->_boundingBox.size.width;
  height = self->_boundingBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (float)confidence
{
  return self->_confidence;
}

- (int)faceCount
{
  return self->_faceCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end

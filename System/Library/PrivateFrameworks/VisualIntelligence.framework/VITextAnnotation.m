@implementation VITextAnnotation

- (VITextAnnotation)initWithText:(id)a3 normalizedBoundingBox:(CGRect)a4 confidence:(float)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  VITextAnnotation *v12;
  uint64_t v13;
  NSString *text;
  objc_super v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VITextAnnotation;
  v12 = -[VITextAnnotation init](&v16, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v11, "copy");
    text = v12->_text;
    v12->_text = (NSString *)v13;

    v12->_normalizedBoundingBox.origin.x = x;
    v12->_normalizedBoundingBox.origin.y = y;
    v12->_normalizedBoundingBox.size.width = width;
    v12->_normalizedBoundingBox.size.height = height;
    v12->_confidence = a5;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  VITextAnnotation *v4;
  VITextAnnotation *v5;
  VITextAnnotation *v6;
  float confidence;
  float v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  NSString *text;
  void *v14;
  char IsEqual;
  CGRect v17;

  v4 = (VITextAnnotation *)a3;
  if (v4 == self)
  {
    IsEqual = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    confidence = self->_confidence;
    -[VITextAnnotation confidence](v6, "confidence");
    if (confidence == v8
      && (-[VITextAnnotation normalizedBoundingBox](v6, "normalizedBoundingBox"),
          v17.origin.x = v9,
          v17.origin.y = v10,
          v17.size.width = v11,
          v17.size.height = v12,
          CGRectEqualToRect(self->_normalizedBoundingBox, v17)))
    {
      text = self->_text;
      -[VITextAnnotation text](v6, "text");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      IsEqual = VIObjectIsEqual((unint64_t)text, (uint64_t)v14);

    }
    else
    {
      IsEqual = 0;
    }

  }
  return IsEqual;
}

- (unint64_t)hash
{
  float confidence;
  float v4;
  float v5;
  float v6;
  unint64_t v7;
  unint64_t v8;
  float v9;
  unint64_t v10;
  unint64_t v11;
  double x;
  double y;
  double height;
  double width;
  double v16;
  long double v17;
  double v18;
  double v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  double v24;
  long double v25;
  double v26;
  double v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  double v32;
  long double v33;
  double v34;
  double v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  double v40;
  long double v41;
  double v42;
  double v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;

  confidence = self->_confidence;
  v4 = -confidence;
  if (confidence >= 0.0)
    v4 = self->_confidence;
  v5 = floorf(v4 + 0.5);
  v6 = (float)(v4 - v5) * 1.8447e19;
  v7 = 2654435761u * (unint64_t)fmodf(v5, 1.8447e19);
  v8 = v7 + (unint64_t)v6;
  v9 = fabsf(v6);
  if (v6 <= 0.0)
    v8 = v7;
  v10 = v7 - (unint64_t)v9;
  if (v6 < 0.0)
    v11 = v10;
  else
    v11 = v8;
  x = self->_normalizedBoundingBox.origin.x;
  y = self->_normalizedBoundingBox.origin.y;
  width = self->_normalizedBoundingBox.size.width;
  height = self->_normalizedBoundingBox.size.height;
  v16 = -x;
  if (x >= 0.0)
    v16 = self->_normalizedBoundingBox.origin.x;
  v17 = floor(v16 + 0.5);
  v18 = (v16 - v17) * 1.84467441e19;
  v19 = fmod(v17, 1.84467441e19);
  v20 = 2654435761u * (unint64_t)v19;
  v21 = v20 + (unint64_t)v18;
  if (v18 <= 0.0)
    v21 = 2654435761u * (unint64_t)v19;
  v22 = v20 - (unint64_t)fabs(v18);
  if (v18 < 0.0)
    v23 = v22;
  else
    v23 = v21;
  if (y >= 0.0)
    v24 = y;
  else
    v24 = -y;
  v25 = floor(v24 + 0.5);
  v26 = (v24 - v25) * 1.84467441e19;
  v27 = fmod(v25, 1.84467441e19);
  v28 = 2654435761u * (unint64_t)v27;
  v29 = v28 + (unint64_t)v26;
  if (v26 <= 0.0)
    v29 = 2654435761u * (unint64_t)v27;
  v30 = v28 - (unint64_t)fabs(v26);
  if (v26 < 0.0)
    v31 = v30;
  else
    v31 = v29;
  if (width >= 0.0)
    v32 = width;
  else
    v32 = -width;
  v33 = floor(v32 + 0.5);
  v34 = (v32 - v33) * 1.84467441e19;
  v35 = fmod(v33, 1.84467441e19);
  v36 = 2654435761u * (unint64_t)v35;
  v37 = v36 + (unint64_t)v34;
  if (v34 <= 0.0)
    v37 = 2654435761u * (unint64_t)v35;
  v38 = v36 - (unint64_t)fabs(v34);
  if (v34 < 0.0)
    v39 = v38;
  else
    v39 = v37;
  if (height >= 0.0)
    v40 = height;
  else
    v40 = -height;
  v41 = floor(v40 + 0.5);
  v42 = (v40 - v41) * 1.84467441e19;
  v43 = fmod(v41, 1.84467441e19);
  v44 = 2654435761u * (unint64_t)v43;
  v45 = v44 + (unint64_t)v42;
  if (v42 <= 0.0)
    v45 = 2654435761u * (unint64_t)v43;
  v46 = v44 - (unint64_t)fabs(v42);
  if (v42 >= 0.0)
    v46 = v45;
  return v23 ^ v11 ^ v31 ^ v39 ^ v46;
}

- (NSString)text
{
  return self->_text;
}

- (CGRect)normalizedBoundingBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizedBoundingBox.origin.x;
  y = self->_normalizedBoundingBox.origin.y;
  width = self->_normalizedBoundingBox.size.width;
  height = self->_normalizedBoundingBox.size.height;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

- (NSString)description
{
  return (NSString *)sub_1D481EFD4(self, (uint64_t)a2, (void (*)(void))VITextAnnotation.description.getter);
}

@end

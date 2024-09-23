@implementation VIBarcodeAnnotationItem

- (VIBarcodeAnnotationItem)initWithSymbology:(id)a3 payloadStringValue:(id)a4 normalizedBoundingBox:(CGRect)a5 confidence:(float)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v13;
  id v14;
  VIBarcodeAnnotationItem *v15;
  uint64_t v16;
  NSString *symbology;
  uint64_t v18;
  NSString *payloadStringValue;
  objc_super v21;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = a3;
  v14 = a4;
  v21.receiver = self;
  v21.super_class = (Class)VIBarcodeAnnotationItem;
  v15 = -[VIBarcodeAnnotationItem init](&v21, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v13, "copy");
    symbology = v15->_symbology;
    v15->_symbology = (NSString *)v16;

    v18 = objc_msgSend(v14, "copy");
    payloadStringValue = v15->_payloadStringValue;
    v15->_payloadStringValue = (NSString *)v18;

    v15->_normalizedBoundingBox.origin.x = x;
    v15->_normalizedBoundingBox.origin.y = y;
    v15->_normalizedBoundingBox.size.width = width;
    v15->_normalizedBoundingBox.size.height = height;
    v15->_confidence = a6;
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  VIBarcodeAnnotationItem *v4;
  VIBarcodeAnnotationItem *v5;
  VIBarcodeAnnotationItem *v6;
  NSString *symbology;
  void *v8;
  NSString *payloadStringValue;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  float confidence;
  float v16;
  BOOL v17;
  CGRect v19;

  v4 = (VIBarcodeAnnotationItem *)a3;
  if (v4 == self)
  {
    v17 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    symbology = self->_symbology;
    -[VIBarcodeAnnotationItem symbology](v6, "symbology");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (VIObjectIsEqual((unint64_t)symbology, (uint64_t)v8))
    {
      payloadStringValue = self->_payloadStringValue;
      -[VIBarcodeAnnotationItem payloadStringValue](v6, "payloadStringValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (VIObjectIsEqual((unint64_t)payloadStringValue, (uint64_t)v10)
        && (-[VIBarcodeAnnotationItem normalizedBoundingBox](v6, "normalizedBoundingBox"),
            v19.origin.x = v11,
            v19.origin.y = v12,
            v19.size.width = v13,
            v19.size.height = v14,
            CGRectEqualToRect(self->_normalizedBoundingBox, v19)))
      {
        confidence = self->_confidence;
        -[VIBarcodeAnnotationItem confidence](v6, "confidence");
        v17 = confidence == v16;
      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  return v17;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  double x;
  double y;
  double height;
  double width;
  double v9;
  long double v10;
  double v11;
  double v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  double v17;
  long double v18;
  double v19;
  double v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  double v25;
  long double v26;
  double v27;
  double v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  double v33;
  long double v34;
  double v35;
  double v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  float confidence;
  float v42;
  float v43;
  float v44;
  float v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;

  v3 = -[NSString hash](self->_symbology, "hash");
  v4 = -[NSString hash](self->_payloadStringValue, "hash");
  x = self->_normalizedBoundingBox.origin.x;
  y = self->_normalizedBoundingBox.origin.y;
  width = self->_normalizedBoundingBox.size.width;
  height = self->_normalizedBoundingBox.size.height;
  v9 = -x;
  if (x >= 0.0)
    v9 = self->_normalizedBoundingBox.origin.x;
  v10 = floor(v9 + 0.5);
  v11 = (v9 - v10) * 1.84467441e19;
  v12 = fmod(v10, 1.84467441e19);
  v13 = 2654435761u * (unint64_t)v12;
  v14 = v13 + (unint64_t)v11;
  if (v11 <= 0.0)
    v14 = 2654435761u * (unint64_t)v12;
  v15 = v13 - (unint64_t)fabs(v11);
  if (v11 < 0.0)
    v16 = v15;
  else
    v16 = v14;
  if (y >= 0.0)
    v17 = y;
  else
    v17 = -y;
  v18 = floor(v17 + 0.5);
  v19 = (v17 - v18) * 1.84467441e19;
  v20 = fmod(v18, 1.84467441e19);
  v21 = 2654435761u * (unint64_t)v20;
  v22 = v21 + (unint64_t)v19;
  if (v19 <= 0.0)
    v22 = 2654435761u * (unint64_t)v20;
  v23 = v21 - (unint64_t)fabs(v19);
  if (v19 < 0.0)
    v24 = v23;
  else
    v24 = v22;
  if (width >= 0.0)
    v25 = width;
  else
    v25 = -width;
  v26 = floor(v25 + 0.5);
  v27 = (v25 - v26) * 1.84467441e19;
  v28 = fmod(v26, 1.84467441e19);
  v29 = 2654435761u * (unint64_t)v28;
  v30 = v29 + (unint64_t)v27;
  if (v27 <= 0.0)
    v30 = 2654435761u * (unint64_t)v28;
  v31 = v29 - (unint64_t)fabs(v27);
  if (v27 < 0.0)
    v32 = v31;
  else
    v32 = v30;
  if (height >= 0.0)
    v33 = height;
  else
    v33 = -height;
  v34 = floor(v33 + 0.5);
  v35 = (v33 - v34) * 1.84467441e19;
  v36 = fmod(v34, 1.84467441e19);
  v37 = 2654435761u * (unint64_t)v36;
  v38 = v37 + (unint64_t)v35;
  if (v35 <= 0.0)
    v38 = 2654435761u * (unint64_t)v36;
  v39 = v37 - (unint64_t)fabs(v35);
  if (v35 < 0.0)
    v40 = v39;
  else
    v40 = v38;
  confidence = self->_confidence;
  v42 = -confidence;
  if (confidence >= 0.0)
    v42 = self->_confidence;
  v43 = floorf(v42 + 0.5);
  v44 = (float)(v42 - v43) * 1.8447e19;
  v45 = fmodf(v43, 1.8447e19);
  v46 = 2654435761u * (unint64_t)v45;
  v47 = v46 + (unint64_t)v44;
  if (v44 <= 0.0)
    v47 = 2654435761u * (unint64_t)v45;
  v48 = v46 - (unint64_t)fabsf(v44);
  if (v44 >= 0.0)
    v48 = v47;
  return v4 ^ v3 ^ v32 ^ v16 ^ v24 ^ v40 ^ v48;
}

+ (id)annotationItemFromObservation:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int v15;
  int v16;
  double v17;
  void *v18;

  v3 = a3;
  v4 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(v3, "symbology");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "payloadStringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "boundingBox");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v3, "confidence");
  v16 = v15;

  LODWORD(v17) = v16;
  v18 = (void *)objc_msgSend(v4, "initWithSymbology:payloadStringValue:normalizedBoundingBox:confidence:", v5, v6, v8, v10, v12, v14, v17);

  return v18;
}

- (NSString)symbology
{
  return self->_symbology;
}

- (NSString)payloadStringValue
{
  return self->_payloadStringValue;
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
  objc_storeStrong((id *)&self->_payloadStringValue, 0);
  objc_storeStrong((id *)&self->_symbology, 0);
}

@end

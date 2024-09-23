@implementation VIVisualUnderstanding

- (VIVisualUnderstanding)initWithImageRegions:(id)a3 payload:(id)a4
{
  return -[VIVisualUnderstanding initWithImageRegions:annotation:payload:](self, "initWithImageRegions:annotation:payload:", a3, 0, a4);
}

- (VIVisualUnderstanding)initWithImageRegions:(id)a3 textBlockAnnotation:(id)a4 payload:(id)a5
{
  id v8;
  id v9;
  id v10;
  VIVisualUnderstanding *v11;

  v8 = a3;
  v9 = a5;
  if (a4)
  {
    v10 = a4;
    a4 = -[VIAnnotation initWithTextAnnotations:]([VIAnnotation alloc], "initWithTextAnnotations:", v10);

  }
  v11 = -[VIVisualUnderstanding initWithImageRegions:annotation:payload:](self, "initWithImageRegions:annotation:payload:", v8, a4, v9);

  return v11;
}

- (VIVisualUnderstanding)initWithImageRegions:(id)a3 annotation:(id)a4 payload:(id)a5
{
  id v8;
  id v9;
  id v10;
  VIVisualUnderstanding *v11;
  uint64_t v12;
  NSArray *imageRegions;
  uint64_t v14;
  VIAnnotation *annotation;
  uint64_t v16;
  NSData *payload;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)VIVisualUnderstanding;
  v11 = -[VIVisualUnderstanding init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    imageRegions = v11->_imageRegions;
    v11->_imageRegions = (NSArray *)v12;

    v14 = objc_msgSend(v9, "copy");
    annotation = v11->_annotation;
    v11->_annotation = (VIAnnotation *)v14;

    v16 = objc_msgSend(v10, "copy");
    payload = v11->_payload;
    v11->_payload = (NSData *)v16;

  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  VIVisualUnderstanding *v4;
  VIVisualUnderstanding *v5;
  VIVisualUnderstanding *v6;
  NSArray *imageRegions;
  void *v8;
  VIAnnotation *annotation;
  void *v10;
  NSData *payload;
  void *v12;
  char IsEqual;

  v4 = (VIVisualUnderstanding *)a3;
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
    imageRegions = self->_imageRegions;
    -[VIVisualUnderstanding imageRegions](v6, "imageRegions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (VIObjectIsEqual((unint64_t)imageRegions, (uint64_t)v8))
    {
      annotation = self->_annotation;
      -[VIVisualUnderstanding annotation](v6, "annotation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (VIObjectIsEqual((unint64_t)annotation, (uint64_t)v10))
      {
        payload = self->_payload;
        -[VIVisualUnderstanding payload](v6, "payload");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        IsEqual = VIObjectIsEqual((unint64_t)payload, (uint64_t)v12);

      }
      else
      {
        IsEqual = 0;
      }

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
  uint64_t v3;
  unint64_t v4;

  v3 = -[NSArray hash](self->_imageRegions, "hash");
  v4 = -[VIAnnotation hash](self->_annotation, "hash") ^ v3;
  return v4 ^ -[NSData hash](self->_payload, "hash");
}

- (NSArray)imageRegions
{
  return self->_imageRegions;
}

- (NSData)payload
{
  return self->_payload;
}

- (VIAnnotation)annotation
{
  return self->_annotation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotation, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_imageRegions, 0);
}

@end

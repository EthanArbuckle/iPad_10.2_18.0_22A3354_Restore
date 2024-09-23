@implementation VIParsedVisualQuery

- (VIParsedVisualQuery)initWithImage:(id)a3 imageRegions:(id)a4 textBlockAnnotation:(id)a5 queryContext:(id)a6 payload:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  VIVisualUnderstanding *v17;
  VIParsedVisualQuery *v18;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = -[VIVisualUnderstanding initWithImageRegions:textBlockAnnotation:payload:]([VIVisualUnderstanding alloc], "initWithImageRegions:textBlockAnnotation:payload:", v15, v14, v12);

  v18 = -[VIParsedVisualQuery initWithImage:visualUnderstanding:queryContext:](self, "initWithImage:visualUnderstanding:queryContext:", v16, v17, v13);
  return v18;
}

- (VIParsedVisualQuery)initWithImage:(id)a3 visualUnderstanding:(id)a4 queryContext:(id)a5
{
  id v9;
  id v10;
  id v11;
  VIParsedVisualQuery *v12;
  VIParsedVisualQuery *v13;
  uint64_t v14;
  VIVisualUnderstanding *visualUnderstanding;
  uint64_t v16;
  VIQueryContext *queryContext;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)VIParsedVisualQuery;
  v12 = -[VIParsedVisualQuery init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_image, a3);
    v14 = objc_msgSend(v10, "copy");
    visualUnderstanding = v13->_visualUnderstanding;
    v13->_visualUnderstanding = (VIVisualUnderstanding *)v14;

    v16 = objc_msgSend(v11, "copy");
    queryContext = v13->_queryContext;
    v13->_queryContext = (VIQueryContext *)v16;

  }
  return v13;
}

+ (id)queryWithPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 imageRegions:(id)a5 payload:(id)a6
{
  uint64_t v7;
  id v9;
  id v10;
  void *v11;

  v7 = *(_QWORD *)&a4;
  v9 = a6;
  v10 = a5;
  objc_msgSend((id)objc_opt_class(), "queryWithPixelBuffer:orientation:imageRegions:textBlockAnnotation:queryContext:payload:", a3, v7, v10, 0, 0, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)queryWithPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 imageRegions:(id)a5 textBlockAnnotation:(id)a6 queryContext:(id)a7 payload:(id)a8
{
  uint64_t v11;
  id v13;
  id v14;
  id v15;
  id v16;
  VIVisualUnderstanding *v17;
  void *v18;
  void *v19;

  v11 = *(_QWORD *)&a4;
  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = -[VIVisualUnderstanding initWithImageRegions:textBlockAnnotation:payload:]([VIVisualUnderstanding alloc], "initWithImageRegions:textBlockAnnotation:payload:", v16, v15, v13);

  +[VIImage imageWithPixelBuffer:orientation:](VIImage, "imageWithPixelBuffer:orientation:", a3, v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithImage:visualUnderstanding:queryContext:", v18, v17, v14);

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  VIParsedVisualQuery *v4;
  VIParsedVisualQuery *v5;
  VIParsedVisualQuery *v6;
  VIImageContent *image;
  void *v8;
  VIVisualUnderstanding *visualUnderstanding;
  void *v10;
  char IsEqual;

  v4 = (VIParsedVisualQuery *)a3;
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
    image = self->_image;
    -[VIParsedVisualQuery image](v6, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (VIObjectIsEqual((unint64_t)image, (uint64_t)v8))
    {
      visualUnderstanding = self->_visualUnderstanding;
      -[VIParsedVisualQuery visualUnderstanding](v6, "visualUnderstanding");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      IsEqual = VIObjectIsEqual((unint64_t)visualUnderstanding, (uint64_t)v10);

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

  v3 = -[VIImageContent hash](self->_image, "hash");
  return -[VIVisualUnderstanding hash](self->_visualUnderstanding, "hash") ^ v3;
}

- (VIImageContent)image
{
  return self->_image;
}

- (VIVisualUnderstanding)visualUnderstanding
{
  return self->_visualUnderstanding;
}

- (VIQueryContext)queryContext
{
  return self->_queryContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryContext, 0);
  objc_storeStrong((id *)&self->_visualUnderstanding, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end

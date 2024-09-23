@implementation VIVisualQuery

- (VIVisualQuery)initWithImage:(id)a3 textBlockAnnotation:(id)a4 normalizedRegionOfInterest:(CGRect)a5 domainsOfInterest:(id)a6 queryContext:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  id v17;
  id v18;
  VIVisualQuery *v19;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v15 = a3;
  v16 = a6;
  v17 = a7;
  if (a4)
  {
    v18 = a4;
    a4 = -[VIAnnotation initWithTextAnnotations:]([VIAnnotation alloc], "initWithTextAnnotations:", v18);

  }
  v19 = -[VIVisualQuery initWithImage:annotation:normalizedRegionOfInterest:domainsOfInterest:queryContext:](self, "initWithImage:annotation:normalizedRegionOfInterest:domainsOfInterest:queryContext:", v15, a4, v16, v17, x, y, width, height);

  return v19;
}

- (VIVisualQuery)initWithImage:(id)a3 annotation:(id)a4 normalizedRegionOfInterest:(CGRect)a5 domainsOfInterest:(id)a6 queryContext:(id)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v16;
  id v17;
  id v18;
  id v19;
  VIVisualQuery *v20;
  VIVisualQuery *v21;
  uint64_t v22;
  NSSet *domainsOfInterest;
  uint64_t v24;
  VIQueryContext *queryContext;
  uint64_t v26;
  VIAnnotation *annotation;
  objc_super v29;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a7;
  v29.receiver = self;
  v29.super_class = (Class)VIVisualQuery;
  v20 = -[VIVisualQuery init](&v29, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_image, a3);
    v21->_normalizedRegionOfInterest.origin.x = x;
    v21->_normalizedRegionOfInterest.origin.y = y;
    v21->_normalizedRegionOfInterest.size.width = width;
    v21->_normalizedRegionOfInterest.size.height = height;
    v22 = objc_msgSend(v18, "copy");
    domainsOfInterest = v21->_domainsOfInterest;
    v21->_domainsOfInterest = (NSSet *)v22;

    v24 = objc_msgSend(v19, "copy");
    queryContext = v21->_queryContext;
    v21->_queryContext = (VIQueryContext *)v24;

    v26 = objc_msgSend(v17, "copy");
    annotation = v21->_annotation;
    v21->_annotation = (VIAnnotation *)v26;

  }
  return v21;
}

+ (id)queryWithPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4
{
  return (id)objc_msgSend((id)objc_opt_class(), "queryWithPixelBuffer:orientation:normalizedRegionOfInterest:", a3, *(_QWORD *)&a4, *(double *)&VIIdentityRect, unk_1EFEA9B60, *(double *)&qword_1EFEA9B68, unk_1EFEA9B70);
}

+ (id)queryWithPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 normalizedRegionOfInterest:(CGRect)a5
{
  return (id)objc_msgSend((id)objc_opt_class(), "queryWithPixelBuffer:orientation:normalizedRegionOfInterest:textBlockAnnotation:queryContext:", a3, *(_QWORD *)&a4, 0, 0, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

+ (id)queryWithPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 normalizedRegionOfInterest:(CGRect)a5 textBlockAnnotation:(id)a6 queryContext:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v12 = *(_QWORD *)&a4;
  v14 = a7;
  v15 = a6;
  v16 = objc_alloc((Class)objc_opt_class());
  +[VIImage imageWithPixelBuffer:orientation:](VIImage, "imageWithPixelBuffer:orientation:", a3, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  VIAllVisualSearchDomains();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v16, "initWithImage:textBlockAnnotation:normalizedRegionOfInterest:domainsOfInterest:queryContext:", v17, v15, v18, v14, x, y, width, height);

  return v19;
}

+ (id)queryWithPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 normalizedRegionOfInterest:(CGRect)a5 annotation:(id)a6 queryContext:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v12 = *(_QWORD *)&a4;
  v14 = a7;
  v15 = a6;
  v16 = objc_alloc((Class)objc_opt_class());
  +[VIImage imageWithPixelBuffer:orientation:](VIImage, "imageWithPixelBuffer:orientation:", a3, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  VIAllVisualSearchDomains();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v16, "initWithImage:annotation:normalizedRegionOfInterest:domainsOfInterest:queryContext:", v17, v15, v18, v14, x, y, width, height);

  return v19;
}

- (VIImageContent)image
{
  return self->_image;
}

- (VIAnnotation)annotation
{
  return self->_annotation;
}

- (CGRect)normalizedRegionOfInterest
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizedRegionOfInterest.origin.x;
  y = self->_normalizedRegionOfInterest.origin.y;
  width = self->_normalizedRegionOfInterest.size.width;
  height = self->_normalizedRegionOfInterest.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSSet)domainsOfInterest
{
  return self->_domainsOfInterest;
}

- (VIQueryContext)queryContext
{
  return self->_queryContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryContext, 0);
  objc_storeStrong((id *)&self->_domainsOfInterest, 0);
  objc_storeStrong((id *)&self->_annotation, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end

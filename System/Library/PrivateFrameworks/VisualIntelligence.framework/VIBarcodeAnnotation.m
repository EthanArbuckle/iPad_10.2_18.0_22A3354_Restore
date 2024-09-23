@implementation VIBarcodeAnnotation

- (VIBarcodeAnnotation)initWithAnnotationItems:(id)a3
{
  id v4;
  VIBarcodeAnnotation *v5;
  uint64_t v6;
  NSArray *annotationItems;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VIBarcodeAnnotation;
  v5 = -[VIBarcodeAnnotation init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    annotationItems = v5->_annotationItems;
    v5->_annotationItems = (NSArray *)v6;

  }
  return v5;
}

+ (id)annotationFromObservations:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)VICompactMapArray(a3, &__block_literal_global_2);
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAnnotationItems:", v3);

  return v4;
}

id __50__VIBarcodeAnnotation_annotationFromObservations___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[VIBarcodeAnnotationItem annotationItemFromObservation:](VIBarcodeAnnotationItem, "annotationItemFromObservation:", a2);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v10;
  void *v11;
  NSArray *annotationItems;
  void *v13;
  uint64_t v15;
  uint64_t v16;

  if (a3 == self)
    return 1;
  v15 = v5;
  v16 = v3;
  v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  annotationItems = self->_annotationItems;
  objc_msgSend(v11, "annotationItems", v6, v15, v4, v16, v7, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(annotationItems) = VIObjectIsEqual((unint64_t)annotationItems, (uint64_t)v13);

  return (char)annotationItems;
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_annotationItems, "hash");
}

- (NSArray)annotationItems
{
  return self->_annotationItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotationItems, 0);
}

@end

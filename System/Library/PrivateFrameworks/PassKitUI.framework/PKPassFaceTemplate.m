@implementation PKPassFaceTemplate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bucketTemplates, 0);
  objc_storeStrong((id *)&self->_defaultFieldTemplate, 0);
}

- (PKPassFieldTemplate)defaultFieldTemplate
{
  PKPassFieldTemplate *defaultFieldTemplate;
  PKPassFieldTemplate *v4;
  PKPassFieldTemplate *v5;

  defaultFieldTemplate = self->_defaultFieldTemplate;
  if (!defaultFieldTemplate)
  {
    v4 = objc_alloc_init(PKPassFieldTemplate);
    v5 = self->_defaultFieldTemplate;
    self->_defaultFieldTemplate = v4;

    defaultFieldTemplate = self->_defaultFieldTemplate;
  }
  return defaultFieldTemplate;
}

- (void)setBarcodeMaxSize:(CGSize)a3
{
  self->_barcodeMaxSize = a3;
}

- (void)setBarcodeBottomInset:(double)a3
{
  self->_barcodeBottomInset = a3;
}

- (double)barcodeBottomInset
{
  return self->_barcodeBottomInset;
}

- (CGSize)barcodeMaxSize
{
  double width;
  double height;
  CGSize result;

  width = self->_barcodeMaxSize.width;
  height = self->_barcodeMaxSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)addBucketTemplate:(id)a3
{
  id v4;
  NSMutableArray *bucketTemplates;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  bucketTemplates = self->_bucketTemplates;
  v8 = v4;
  if (!bucketTemplates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_bucketTemplates;
    self->_bucketTemplates = v6;

    v4 = v8;
    bucketTemplates = self->_bucketTemplates;
  }
  -[NSMutableArray addObject:](bucketTemplates, "addObject:", v4);

}

- (id)templateForBucketAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  if (-[NSMutableArray count](self->_bucketTemplates, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_bucketTemplates, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "defaultFieldTemplate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPassFieldTemplate _templateByResolvingTemplate:withDefault:](PKPassFieldTemplate, "_templateByResolvingTemplate:withDefault:", v6, self->_defaultFieldTemplate);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setDefaultFieldTemplate:", v7);
  }
  return v5;
}

- (void)setDefaultFieldTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_defaultFieldTemplate, a3);
}

- (NSMutableArray)bucketTemplates
{
  return self->_bucketTemplates;
}

- (void)setBucketTemplates:(id)a3
{
  objc_storeStrong((id *)&self->_bucketTemplates, a3);
}

@end

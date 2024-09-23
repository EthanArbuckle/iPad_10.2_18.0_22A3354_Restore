@implementation PXLayoutMetrics

- (CGSize)referenceSize
{
  double width;
  double height;
  CGSize result;

  width = self->_referenceSize.width;
  height = self->_referenceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setReferenceSize:(CGSize)a3
{
  self->_referenceSize = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_alloc_init((Class)objc_opt_class());
  *(CGSize *)((char *)result + 8) = self->_referenceSize;
  return result;
}

- (unint64_t)hash
{
  double v2;

  -[PXLayoutMetrics referenceSize](self, "referenceSize");
  return (unint64_t)v2;
}

- (BOOL)isEqual:(id)a3
{
  PXLayoutMetrics *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;

  v4 = (PXLayoutMetrics *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PXLayoutMetrics referenceSize](v4, "referenceSize");
      v6 = v5;
      v8 = v7;
      -[PXLayoutMetrics referenceSize](self, "referenceSize");
      v11 = v8 == v10 && v6 == v9;
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (NSString)diagnosticDescription
{
  id v3;
  void *v4;
  void *v5;
  CGSize v7;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[PXLayoutMetrics referenceSize](self, "referenceSize");
  NSStringFromCGSize(v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("referenceSize=%@"), v4);

  return (NSString *)v5;
}

@end

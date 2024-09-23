@implementation PKPassBucketTemplate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldTemplates, 0);
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

- (void)setMaxFields:(unint64_t)a3
{
  self->_maxFields = a3;
}

- (void)setBucketRect:(CGRect)a3
{
  self->_bucketRect = a3;
}

- (void)setBucketAlignment:(int64_t)a3
{
  self->_bucketAlignment = a3;
}

- (void)setSitsOnStripImage:(BOOL)a3
{
  self->_sitsOnStripImage = a3;
}

- (void)setMinFieldPadding:(double)a3
{
  self->_minFieldPadding = a3;
}

- (CGRect)bucketRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bucketRect.origin.x;
  y = self->_bucketRect.origin.y;
  width = self->_bucketRect.size.width;
  height = self->_bucketRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int64_t)bucketAlignment
{
  return self->_bucketAlignment;
}

- (double)minFieldPadding
{
  return self->_minFieldPadding;
}

- (BOOL)sitsOnStripImage
{
  return self->_sitsOnStripImage;
}

- (void)setDefaultFieldTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_defaultFieldTemplate, a3);
}

- (id)templateForFieldAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;

  if (-[PKPassBucketTemplate maxFields](self, "maxFields") >= a3)
  {
    if (-[NSMutableArray count](self->_fieldTemplates, "count") <= a3)
    {
      v6 = 0;
    }
    else
    {
      -[NSMutableArray objectAtIndex:](self->_fieldTemplates, "objectAtIndex:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    +[PKPassFieldTemplate _templateByResolvingTemplate:withDefault:](PKPassFieldTemplate, "_templateByResolvingTemplate:withDefault:", v6, self->_defaultFieldTemplate);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (unint64_t)maxFields
{
  return self->_maxFields;
}

- (void)addFieldTemplate:(id)a3
{
  id v4;
  NSMutableArray *fieldTemplates;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  fieldTemplates = self->_fieldTemplates;
  v8 = v4;
  if (!fieldTemplates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_fieldTemplates;
    self->_fieldTemplates = v6;

    v4 = v8;
    fieldTemplates = self->_fieldTemplates;
  }
  -[NSMutableArray addObject:](fieldTemplates, "addObject:", v4);

}

- (NSMutableArray)fieldTemplates
{
  return self->_fieldTemplates;
}

- (void)setFieldTemplates:(id)a3
{
  objc_storeStrong((id *)&self->_fieldTemplates, a3);
}

@end

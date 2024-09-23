@implementation BKPaginationRecordJob

+ (id)jobName
{
  return CFSTR("Record-One");
}

- (BKPaginationRecordJob)init
{
  BKPaginationRecordJob *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKPaginationRecordJob;
  v2 = -[BKPaginationLayoutJob init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKPaginationRecordJob jobName](BKPaginationRecordJob, "jobName"));
    -[BKJob setName:](v2, "setName:", v3);

  }
  return v2;
}

- (unint64_t)pageCount
{
  return self->_pageCount;
}

- (void)setPageCount:(unint64_t)a3
{
  self->_pageCount = a3;
}

- (NSDictionary)cfiLocationRects
{
  return self->_cfiLocationRects;
}

- (void)setCfiLocationRects:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (CGSize)estimatedSize
{
  double width;
  double height;
  CGSize result;

  width = self->_estimatedSize.width;
  height = self->_estimatedSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setEstimatedSize:(CGSize)a3
{
  self->_estimatedSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cfiLocationRects, 0);
}

@end

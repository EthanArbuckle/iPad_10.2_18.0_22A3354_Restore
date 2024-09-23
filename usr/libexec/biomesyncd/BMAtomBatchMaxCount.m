@implementation BMAtomBatchMaxCount

- (BMAtomBatchMaxCount)initWithMaxCount:(unint64_t)a3
{
  BMAtomBatchMaxCount *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BMAtomBatchMaxCount;
  result = -[BMAtomBatchMaxCount init](&v5, "init");
  if (result)
  {
    result->_maxCount = a3;
    result->_atomCount = 0;
  }
  return result;
}

- (BOOL)canAddAtomWithData:(id)a3
{
  return self->_atomCount < self->_maxCount;
}

- (void)didAddAtomWithData:(id)a3
{
  ++self->_atomCount;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BMAtomBatchMaxCount *v3;

  v3 = self;
  return -[BMAtomBatchMaxCount initWithMaxCount:](v3, "initWithMaxCount:", v3->_maxCount);
}

@end

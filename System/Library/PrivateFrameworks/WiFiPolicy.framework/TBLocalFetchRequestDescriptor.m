@implementation TBLocalFetchRequestDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localFetchRequest, 0);
  objc_storeStrong((id *)&self->_fetchRequest, 0);
}

- (NSFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (TBLocalFetchRequestDescriptor)initWithFetchRequest:(id)a3
{
  NSFetchRequest *v4;
  TBLocalFetchRequestDescriptor *v5;
  NSFetchRequest *fetchRequest;
  objc_super v8;

  v4 = (NSFetchRequest *)a3;
  v8.receiver = self;
  v8.super_class = (Class)TBLocalFetchRequestDescriptor;
  v5 = -[TBLocalFetchRequestDescriptor init](&v8, sel_init);
  fetchRequest = v5->_fetchRequest;
  v5->_fetchRequest = v4;

  return v5;
}

- (NSFetchRequest)localFetchRequest
{
  return self->_localFetchRequest;
}

- (void)setLocalFetchRequest:(id)a3
{
  objc_storeStrong((id *)&self->_localFetchRequest, a3);
}

@end

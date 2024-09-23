@implementation ISProcessPropertyListOperation

- (ISProcessPropertyListOperation)initWithPropertyList:(id)a3
{
  ISProcessPropertyListOperation *v5;

  __ISRecordSPIClassUsage(self);
  v5 = -[ISOperation init](self, "init");
  if (v5)
  {
    v5->_dataProvider = objc_alloc_init(ISPropertyListProvider);
    v5->_propertyList = (NSDictionary *)a3;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  self->_dataProvider = 0;
  self->_propertyList = 0;
  v3.receiver = self;
  v3.super_class = (Class)ISProcessPropertyListOperation;
  -[ISProcessPropertyListOperation dealloc](&v3, sel_dealloc);
}

- (void)run
{
  uint64_t v3;

  v3 = 0;
  -[ISOperation setSuccess:](self, "setSuccess:", -[ISPropertyListProvider processPropertyList:returningError:](-[ISProcessPropertyListOperation dataProvider](self, "dataProvider"), "processPropertyList:returningError:", self->_propertyList, &v3));
  -[ISOperation setError:](self, "setError:", v3);
}

- (ISPropertyListProvider)dataProvider
{
  return (ISPropertyListProvider *)objc_getProperty(self, a2, 336, 1);
}

- (void)setDataProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

@end

@implementation WMTop

- (Class)readerClassForBinaryDocuments
{
  return (Class)objc_opt_class();
}

- (Class)readerClassForXMLDocuments
{
  return (Class)objc_opt_class();
}

- (void)initializeClasses
{
  objc_super v3;

  objc_opt_class();
  objc_opt_class();
  v3.receiver = self;
  v3.super_class = (Class)WMTop;
  -[QLTop initializeClasses](&v3, sel_initializeClasses);
}

- (Class)stateClass
{
  return (Class)objc_opt_class();
}

- (Class)mapperClassForIndexing:(BOOL)a3
{
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

@end

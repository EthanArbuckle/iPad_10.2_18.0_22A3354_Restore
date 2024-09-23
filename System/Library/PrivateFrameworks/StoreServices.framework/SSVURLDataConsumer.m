@implementation SSVURLDataConsumer

+ (id)consumer
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  return a3;
}

@end

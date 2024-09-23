@implementation SystemHealthClient

- (SystemHealthClient)init
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Please use initWithComponentType"));

  return 0;
}

- (SystemHealthClient)initWithComponentType:(unint64_t)a3
{
  SystemHealthClient *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SystemHealthClient;
  result = -[SystemHealthClient init](&v5, sel_init);
  if (result)
    result->componentType = a3;
  return result;
}

- (unint64_t)getComponentStatusWithError:(id *)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("You must override %@ in a subclass"), v5);

  return 0;
}

- (unint64_t)componentType
{
  return self->componentType;
}

- (void)setComponentType:(unint64_t)a3
{
  self->componentType = a3;
}

@end

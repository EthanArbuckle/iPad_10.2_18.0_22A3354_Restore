@implementation WFURLParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (id)autocapitalizationType
{
  return (id)*MEMORY[0x1E0DC8320];
}

- (id)autocorrectionType
{
  return (id)*MEMORY[0x1E0DC8338];
}

- (id)keyboardType
{
  return (id)*MEMORY[0x1E0DC8368];
}

- (id)textContentType
{
  return (id)*MEMORY[0x1E0DC83B0];
}

@end

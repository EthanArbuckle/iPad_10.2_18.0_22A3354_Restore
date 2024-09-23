@implementation REImage(UIImageExtensions)

+ (REImageImage)imageWithImage:()UIImageExtensions
{
  id v3;
  REImageImage *v4;

  v3 = a3;
  v4 = -[REImageImage initWithImage:]([REImageImage alloc], "initWithImage:", v3);

  return v4;
}

- (id)image
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return objc_alloc_init(MEMORY[0x24BDF6AC8]);
}

@end

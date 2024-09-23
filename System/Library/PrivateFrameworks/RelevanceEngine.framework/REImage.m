@implementation REImage

+ (id)imageNamed:(id)a3 inBundle:(id)a4
{
  id v5;
  id v6;
  RENamedImage *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[RENamedImage initWithName:inBundle:]([RENamedImage alloc], "initWithName:inBundle:", v6, v5);

  return v7;
}

+ (REImage)imageWithContentsOfFileAtPath:(id)a3 scale:(double)a4
{
  id v5;
  REFileImage *v6;

  v5 = a3;
  v6 = -[REFileImage initWithPath:scale:]([REFileImage alloc], "initWithPath:scale:", v5, a4);

  return (REImage *)v6;
}

+ (REImage)imageWithData:(id)a3 scale:(double)a4
{
  id v5;
  REDataImage *v6;

  v5 = a3;
  v6 = -[REDataImage initWithData:scale:]([REDataImage alloc], "initWithData:scale:", v5, a4);

  return (REImage *)v6;
}

+ (REImage)imageWithCGImage:(CGImage *)a3 scale:(double)a4
{
  return (REImage *)-[RECGImageImage initWithImage:scale:]([RECGImageImage alloc], "initWithImage:scale:", a3, a4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return self;
}

- (REImage)initWithCoder:(id)a3
{
  void *v3;
  objc_super v5;

  OUTLINED_FUNCTION_0_2();
  NSRequestConcreteImplementation();
  v5.receiver = v3;
  v5.super_class = (Class)REImage;
  return -[REImage init](&v5, sel_init);
}

- (void)encodeWithCoder:(id)a3
{
  OUTLINED_FUNCTION_0_2();
  NSRequestConcreteImplementation();
}

@end

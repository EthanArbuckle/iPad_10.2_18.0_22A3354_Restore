@implementation THSimpleCFIChild

- (THSimpleCFIChild)initWithIndex:(unint64_t)a3
{
  THSimpleCFIChild *v4;
  THSimpleCFIChild *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THSimpleCFIChild;
  v4 = -[THSimpleCFIChild init](&v7, "init");
  v5 = v4;
  if (v4)
    -[THSimpleCFIChild setIndex:](v4, "setIndex:", a3);
  return v5;
}

- (BOOL)isAcceptableLeaf
{
  return 1;
}

+ (id)childWithIndex:(unint64_t)a3
{
  return -[THSimpleCFIChild initWithIndex:]([THSimpleCFIChild alloc], "initWithIndex:", a3);
}

- (id)cfiString
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/%lu"), -[THSimpleCFIChild index](self, "index"));
}

- (unint64_t)index
{
  return self->index;
}

- (void)setIndex:(unint64_t)a3
{
  self->index = a3;
}

@end

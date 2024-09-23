@implementation THSimpleCFICharacterOffset

- (THSimpleCFICharacterOffset)initWithOffset:(unint64_t)a3
{
  THSimpleCFICharacterOffset *v4;
  THSimpleCFICharacterOffset *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THSimpleCFICharacterOffset;
  v4 = -[THSimpleCFICharacterOffset init](&v7, "init");
  v5 = v4;
  if (v4)
    -[THSimpleCFICharacterOffset setOffset:](v4, "setOffset:", a3);
  return v5;
}

- (BOOL)isAcceptableLeaf
{
  return 1;
}

+ (id)characterOffsetWithOffset:(unint64_t)a3
{
  return -[THSimpleCFICharacterOffset initWithOffset:]([THSimpleCFICharacterOffset alloc], "initWithOffset:", a3);
}

- (id)cfiString
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(":%lu"), -[THSimpleCFICharacterOffset offset](self, "offset"));
}

- (unint64_t)offset
{
  return self->offset;
}

- (void)setOffset:(unint64_t)a3
{
  self->offset = a3;
}

@end

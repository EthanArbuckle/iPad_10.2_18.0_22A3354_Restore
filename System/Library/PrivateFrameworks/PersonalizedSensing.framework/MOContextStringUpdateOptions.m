@implementation MOContextStringUpdateOptions

- (MOContextStringUpdateOptions)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MOContextStringUpdateOptions;
  return -[MOContextStringUpdateOptions init](&v3, sel_init);
}

- (MOContextStringUpdateOptions)initWithAppendMusicString:(BOOL)a3
{
  MOContextStringUpdateOptions *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MOContextStringUpdateOptions;
  result = -[MOContextStringUpdateOptions init](&v5, sel_init);
  if (result)
    result->_appendMusicString = a3;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MOContextStringUpdateOptions initWithAppendMusicString:]([MOContextStringUpdateOptions alloc], "initWithAppendMusicString:", -[MOContextStringUpdateOptions appendMusicString](self, "appendMusicString"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeBool:forKey:", self->_appendMusicString, CFSTR("appendMusicString"));
}

- (MOContextStringUpdateOptions)initWithCoder:(id)a3
{
  return -[MOContextStringUpdateOptions initWithAppendMusicString:](self, "initWithAppendMusicString:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("appendMusicString")));
}

- (BOOL)appendMusicString
{
  return self->_appendMusicString;
}

- (void)setAppendMusicString:(BOOL)a3
{
  self->_appendMusicString = a3;
}

@end

@implementation BKJob

- (BKJob)init
{
  BKJob *v2;
  BKJob *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKJob;
  v2 = -[BKJob init](&v5, "init");
  v3 = v2;
  if (v2)
    -[BKJob setSentinel:](v2, "setSentinel:", 0);
  return v3;
}

- (BOOL)isSentinel
{
  return self->_sentinel;
}

- (void)setSentinel:(BOOL)a3
{
  self->_sentinel = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end

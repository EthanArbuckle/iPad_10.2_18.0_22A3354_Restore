@implementation VUIProductBadgeResource

- (VUIProductBadgeResource)init
{
  VUIProductBadgeResource *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIProductBadgeResource;
  result = -[VUIProductBadgeResource init](&v3, sel_init);
  if (result)
    result->_templated = 1;
  return result;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isTemplated
{
  return self->_templated;
}

- (void)setTemplated:(BOOL)a3
{
  self->_templated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end

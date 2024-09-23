@implementation VFXShaderArgument

- (NSString)name
{
  return self->name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSString)type
{
  return self->type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end

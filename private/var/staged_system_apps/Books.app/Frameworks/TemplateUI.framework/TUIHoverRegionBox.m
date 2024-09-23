@implementation TUIHoverRegionBox

- (Class)layoutClass
{
  return (Class)objc_opt_class(TUIHoverRegionLayout, a2);
}

- (NSString)regionName
{
  return self->_regionName;
}

- (void)setRegionName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionName, 0);
}

@end

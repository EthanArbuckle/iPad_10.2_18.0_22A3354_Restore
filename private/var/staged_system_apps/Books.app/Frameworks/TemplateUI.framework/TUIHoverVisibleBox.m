@implementation TUIHoverVisibleBox

- (Class)layoutClass
{
  return (Class)objc_opt_class(TUIHoverVisibleLayout, a2);
}

- (NSString)regionName
{
  return self->_regionName;
}

- (void)setRegionName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unint64_t)whenUnavailable
{
  return self->_whenUnavailable;
}

- (void)setWhenUnavailable:(unint64_t)a3
{
  self->_whenUnavailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionName, 0);
}

@end

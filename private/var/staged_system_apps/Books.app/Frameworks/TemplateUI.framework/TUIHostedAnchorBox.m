@implementation TUIHostedAnchorBox

- (Class)layoutClass
{
  return (Class)objc_opt_class(TUIHostedAnchorLayout, a2);
}

- (TUIHostingIdentifier)hostingIdentifier
{
  return self->_hostingIdentifier;
}

- (void)setHostingIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (TUIHostingProperties)hostingProperties
{
  return self->_hostingProperties;
}

- (void)setHostingProperties:(id)a3
{
  objc_storeStrong((id *)&self->_hostingProperties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostingProperties, 0);
  objc_storeStrong((id *)&self->_hostingIdentifier, 0);
}

@end

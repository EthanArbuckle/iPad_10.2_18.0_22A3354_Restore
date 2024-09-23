@implementation PLProcessNetworkSource

- (PLProcessNetworkSource)initWithSource:(__NStatSource *)a3
{
  self->_source = a3;
  return self;
}

- (NSDictionary)descriptionDictionary
{
  return self->_descriptionDictionary;
}

- (void)setDescriptionDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)countsDictionary
{
  return self->_countsDictionary;
}

- (void)setCountsDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (__NStatSource)source
{
  return self->_source;
}

- (void)setSource:(__NStatSource *)a3
{
  self->_source = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countsDictionary, 0);
  objc_storeStrong((id *)&self->_descriptionDictionary, 0);
}

@end

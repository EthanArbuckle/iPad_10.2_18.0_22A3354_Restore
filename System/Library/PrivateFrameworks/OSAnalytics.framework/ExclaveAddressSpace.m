@implementation ExclaveAddressSpace

- (NSNumber)addressSpaceId
{
  return self->_addressSpaceId;
}

- (void)setAddressSpaceId:(id)a3
{
  objc_storeStrong((id *)&self->_addressSpaceId, a3);
}

- (NSNumber)layoutId
{
  return self->_layoutId;
}

- (void)setLayoutId:(id)a3
{
  objc_storeStrong((id *)&self->_layoutId, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_layoutId, 0);
  objc_storeStrong((id *)&self->_addressSpaceId, 0);
}

@end

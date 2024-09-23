@implementation RAPAddressFields

- (NSString)freeformAddress
{
  return self->_freeformAddress;
}

- (void)setFreeformAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)floor
{
  return self->_floor;
}

- (void)setFloor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)unit
{
  return self->_unit;
}

- (void)setUnit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)building
{
  return self->_building;
}

- (void)setBuilding:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_building, 0);
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_floor, 0);
  objc_storeStrong((id *)&self->_freeformAddress, 0);
}

@end

@implementation TVRCSiriRemote

- (CBPeripheral)peripheral
{
  return self->_peripheral;
}

- (void)setPeripheral:(id)a3
{
  objc_storeStrong((id *)&self->_peripheral, a3);
}

- (CBCharacteristic)findMyCharacteristic
{
  return self->_findMyCharacteristic;
}

- (void)setFindMyCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_findMyCharacteristic, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_findMyCharacteristic, 0);
  objc_storeStrong((id *)&self->_peripheral, 0);
}

@end

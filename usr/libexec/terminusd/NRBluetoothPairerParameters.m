@implementation NRBluetoothPairerParameters

- (int64_t)pairingType
{
  return self->_pairingType;
}

- (void)setPairingType:(int64_t)a3
{
  self->_pairingType = a3;
}

- (NSUUID)bluetoothUUID
{
  return self->_bluetoothUUID;
}

- (void)setBluetoothUUID:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothUUID, 0);
}

@end

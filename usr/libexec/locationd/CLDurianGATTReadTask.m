@implementation CLDurianGATTReadTask

- (CLDurianGATTReadTask)initWithCommand:(id)a3 serviceUUID:(id)a4 characteristicUUID:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLDurianGATTReadTask;
  return -[CLDurianGATTTask initWithCommand:serviceUUID:characteristicUUID:payload:](&v6, "initWithCommand:serviceUUID:characteristicUUID:payload:", a3, a4, a5, 0);
}

- (void)setReadData:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLDurianGATTReadTask;
  -[CLDurianGATTTask setPayloadData:](&v3, "setPayloadData:", a3);
}

@end

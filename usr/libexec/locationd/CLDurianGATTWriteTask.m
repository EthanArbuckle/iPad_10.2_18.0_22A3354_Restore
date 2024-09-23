@implementation CLDurianGATTWriteTask

- (CLDurianGATTWriteTask)initWithCommand:(id)a3 serviceUUID:(id)a4 characteristicUUID:(id)a5 payload:(id)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLDurianGATTWriteTask;
  return -[CLDurianGATTTask initWithCommand:serviceUUID:characteristicUUID:payload:](&v7, "initWithCommand:serviceUUID:characteristicUUID:payload:", a3, a4, a5, a6);
}

- (int64_t)timeoutSeconds
{
  unsigned int v2;

  v2 = -[CLDurianCommand opcode](-[CLDurianTask command](self, "command"), "opcode") - 2049;
  if (v2 > 0xC)
    return 60;
  else
    return qword_101CC5DD8[(__int16)v2];
}

@end

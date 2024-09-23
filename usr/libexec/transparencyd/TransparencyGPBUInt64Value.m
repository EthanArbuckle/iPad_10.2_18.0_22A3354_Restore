@implementation TransparencyGPBUInt64Value

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_1002A7430;
  if (!qword_1002A7430)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBUInt64Value, CFSTR("UInt64Value"), off_1002A1BC8, &off_1002A1C20, 1, 16, v3);
    qword_1002A7430 = (uint64_t)result;
  }
  return result;
}

@end

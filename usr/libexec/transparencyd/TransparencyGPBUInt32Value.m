@implementation TransparencyGPBUInt32Value

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_1002A7440;
  if (!qword_1002A7440)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBUInt32Value, CFSTR("UInt32Value"), off_1002A1BC8, &off_1002A1C60, 1, 8, v3);
    qword_1002A7440 = (uint64_t)result;
  }
  return result;
}

@end

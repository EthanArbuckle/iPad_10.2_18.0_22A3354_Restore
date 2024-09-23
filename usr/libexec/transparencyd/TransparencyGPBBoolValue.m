@implementation TransparencyGPBBoolValue

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_1002A7448;
  if (!qword_1002A7448)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBBoolValue, CFSTR("BoolValue"), off_1002A1BC8, &off_1002A1C80, 1, 4, v3);
    qword_1002A7448 = (uint64_t)result;
  }
  return result;
}

@end

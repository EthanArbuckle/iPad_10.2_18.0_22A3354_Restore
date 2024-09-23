@implementation TransparencyGPBEnum

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_1002A73F0;
  if (!qword_1002A73F0)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBEnum, CFSTR("Enum"), off_1002A1910, &off_1002A1A68, 5, 40, v3);
    qword_1002A73F0 = (uint64_t)result;
  }
  return result;
}

@end

@implementation TransparencyGPBEnumValue

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_1002A73F8;
  if (!qword_1002A73F8)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBEnumValue, CFSTR("EnumValue"), off_1002A1910, &off_1002A1B08, 3, 24, v3);
    qword_1002A73F8 = (uint64_t)result;
  }
  return result;
}

@end

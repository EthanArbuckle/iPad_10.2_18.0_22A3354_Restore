@implementation TransparencyGPBEnumValue

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_100131390;
  if (!qword_100131390)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBEnumValue, CFSTR("EnumValue"), off_100129F88, &off_10012A180, 3, 24, v3);
    qword_100131390 = (uint64_t)result;
  }
  return result;
}

@end

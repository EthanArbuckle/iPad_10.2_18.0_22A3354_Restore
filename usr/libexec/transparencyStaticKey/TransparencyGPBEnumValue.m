@implementation TransparencyGPBEnumValue

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_10008AB58;
  if (!qword_10008AB58)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBEnumValue, CFSTR("EnumValue"), off_100089D28, &off_100089F20, 3, 24, v3);
    qword_10008AB58 = (uint64_t)result;
  }
  return result;
}

@end

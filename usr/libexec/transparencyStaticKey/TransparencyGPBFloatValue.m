@implementation TransparencyGPBFloatValue

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_10008A9F8;
  if (!qword_10008A9F8)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBFloatValue, CFSTR("FloatValue"), off_100089560, &off_100089578, 1, 8, v3);
    qword_10008A9F8 = (uint64_t)result;
  }
  return result;
}

@end

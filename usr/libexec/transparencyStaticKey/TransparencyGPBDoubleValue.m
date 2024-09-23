@implementation TransparencyGPBDoubleValue

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_10008A9F0;
  if (!qword_10008A9F0)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBDoubleValue, CFSTR("DoubleValue"), off_100089560, &off_100089540, 1, 16, v3);
    qword_10008A9F0 = (uint64_t)result;
  }
  return result;
}

@end

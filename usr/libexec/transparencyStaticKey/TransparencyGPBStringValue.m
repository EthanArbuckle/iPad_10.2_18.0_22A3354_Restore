@implementation TransparencyGPBStringValue

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_10008AA28;
  if (!qword_10008AA28)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBStringValue, CFSTR("StringValue"), off_100089560, &off_100089638, 1, 16, v3);
    qword_10008AA28 = (uint64_t)result;
  }
  return result;
}

@end

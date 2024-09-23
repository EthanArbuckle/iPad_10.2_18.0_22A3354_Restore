@implementation TransparencyGPBBoolValue

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_10008AA20;
  if (!qword_10008AA20)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBBoolValue, CFSTR("BoolValue"), off_100089560, &off_100089618, 1, 4, v3);
    qword_10008AA20 = (uint64_t)result;
  }
  return result;
}

@end

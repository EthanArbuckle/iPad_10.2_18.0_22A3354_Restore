@implementation TransparencyGPBBytesValue

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_10008AA30;
  if (!qword_10008AA30)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBBytesValue, CFSTR("BytesValue"), off_100089560, &off_100089658, 1, 16, v3);
    qword_10008AA30 = (uint64_t)result;
  }
  return result;
}

@end

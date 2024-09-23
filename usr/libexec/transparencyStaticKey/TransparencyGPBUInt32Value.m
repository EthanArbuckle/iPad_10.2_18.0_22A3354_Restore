@implementation TransparencyGPBUInt32Value

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_10008AA18;
  if (!qword_10008AA18)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBUInt32Value, CFSTR("UInt32Value"), off_100089560, &off_1000895F8, 1, 8, v3);
    qword_10008AA18 = (uint64_t)result;
  }
  return result;
}

@end

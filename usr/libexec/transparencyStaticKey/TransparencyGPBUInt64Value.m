@implementation TransparencyGPBUInt64Value

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_10008AA08;
  if (!qword_10008AA08)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBUInt64Value, CFSTR("UInt64Value"), off_100089560, &off_1000895B8, 1, 16, v3);
    qword_10008AA08 = (uint64_t)result;
  }
  return result;
}

@end

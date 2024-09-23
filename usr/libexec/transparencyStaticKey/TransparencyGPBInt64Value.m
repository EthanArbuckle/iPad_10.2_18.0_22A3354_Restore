@implementation TransparencyGPBInt64Value

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_10008AA00;
  if (!qword_10008AA00)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBInt64Value, CFSTR("Int64Value"), off_100089560, &off_100089598, 1, 16, v3);
    qword_10008AA00 = (uint64_t)result;
  }
  return result;
}

@end

@implementation BatchQueryRequest

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_1002A76C8;
  if (!qword_1002A76C8)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", BatchQueryRequest, CFSTR("BatchQueryRequest"), &unk_1002A3550, &off_1002A35E8, 3, 24, v3);
    qword_1002A76C8 = (uint64_t)result;
  }
  return result;
}

@end

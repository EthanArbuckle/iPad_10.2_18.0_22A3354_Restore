@implementation TransparencyGPBEmpty

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_10008AAA0;
  if (!qword_10008AAA0)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBEmpty, CFSTR("Empty"), off_1000899F0, 0, 0, 4, v3);
    qword_10008AAA0 = (uint64_t)result;
  }
  return result;
}

@end

@implementation TransparencyGPBEmpty

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_1002A7360;
  if (!qword_1002A7360)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBEmpty, CFSTR("Empty"), off_1002A14D0, 0, 0, 4, v3);
    qword_1002A7360 = (uint64_t)result;
  }
  return result;
}

@end

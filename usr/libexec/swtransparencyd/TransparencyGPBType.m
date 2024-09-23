@implementation TransparencyGPBType

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_100131378;
  if (!qword_100131378)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBType, CFSTR("Type"), off_100129F88, &off_100129EC8, 6, 48, v3);
    qword_100131378 = (uint64_t)result;
  }
  return result;
}

@end

@implementation TransparencyGPBEnum

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_10008AB50;
  if (!qword_10008AB50)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBEnum, CFSTR("Enum"), off_100089D28, &off_100089E80, 5, 40, v3);
    qword_10008AB50 = (uint64_t)result;
  }
  return result;
}

@end

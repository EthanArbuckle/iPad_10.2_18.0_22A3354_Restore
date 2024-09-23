@implementation TransparencyGPBOption

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_10008AB60;
  if (!qword_10008AB60)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBOption, CFSTR("Option"), off_100089D28, &off_100089F80, 2, 24, v3);
    qword_10008AB60 = (uint64_t)result;
  }
  return result;
}

@end

@implementation TransparencyGPBOption

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_1002A7400;
  if (!qword_1002A7400)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBOption, CFSTR("Option"), off_1002A1910, &off_1002A1B68, 2, 24, v3);
    qword_1002A7400 = (uint64_t)result;
  }
  return result;
}

@end

@implementation TransparencyGPBOption

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_100131398;
  if (!qword_100131398)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBOption, CFSTR("Option"), off_100129F88, &off_10012A1E0, 2, 24, v3);
    qword_100131398 = (uint64_t)result;
  }
  return result;
}

@end

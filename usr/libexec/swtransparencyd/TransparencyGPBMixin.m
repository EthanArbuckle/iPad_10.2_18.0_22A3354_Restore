@implementation TransparencyGPBMixin

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_100131410;
  if (!qword_100131410)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBMixin, CFSTR("Mixin"), off_10012A490, &off_10012A588, 2, 24, v3);
    qword_100131410 = (uint64_t)result;
  }
  return result;
}

@end

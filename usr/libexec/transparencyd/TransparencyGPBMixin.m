@implementation TransparencyGPBMixin

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_1002A7478;
  if (!qword_1002A7478)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBMixin, CFSTR("Mixin"), off_1002A1E18, &off_1002A1F10, 2, 24, v3);
    qword_1002A7478 = (uint64_t)result;
  }
  return result;
}

@end

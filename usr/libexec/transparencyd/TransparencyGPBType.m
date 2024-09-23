@implementation TransparencyGPBType

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_1002A73E0;
  if (!qword_1002A73E0)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBType, CFSTR("Type"), off_1002A1910, &off_1002A1850, 6, 48, v3);
    qword_1002A73E0 = (uint64_t)result;
  }
  return result;
}

@end

@implementation TransparencyGPBFloatValue

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_1002A7420;
  if (!qword_1002A7420)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBFloatValue, CFSTR("FloatValue"), off_1002A1BC8, &off_1002A1BE0, 1, 8, v3);
    qword_1002A7420 = (uint64_t)result;
  }
  return result;
}

@end

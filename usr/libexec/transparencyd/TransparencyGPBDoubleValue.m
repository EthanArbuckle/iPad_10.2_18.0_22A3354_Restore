@implementation TransparencyGPBDoubleValue

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_1002A7418;
  if (!qword_1002A7418)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBDoubleValue, CFSTR("DoubleValue"), off_1002A1BC8, &off_1002A1BA8, 1, 16, v3);
    qword_1002A7418 = (uint64_t)result;
  }
  return result;
}

@end

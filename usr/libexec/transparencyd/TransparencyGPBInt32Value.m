@implementation TransparencyGPBInt32Value

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_1002A7438;
  if (!qword_1002A7438)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBInt32Value, CFSTR("Int32Value"), off_1002A1BC8, &off_1002A1C40, 1, 8, v3);
    qword_1002A7438 = (uint64_t)result;
  }
  return result;
}

@end

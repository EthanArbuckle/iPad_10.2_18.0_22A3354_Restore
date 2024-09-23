@implementation TransparencyGPBStringValue

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_1002A7450;
  if (!qword_1002A7450)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBStringValue, CFSTR("StringValue"), off_1002A1BC8, &off_1002A1CA0, 1, 16, v3);
    qword_1002A7450 = (uint64_t)result;
  }
  return result;
}

@end

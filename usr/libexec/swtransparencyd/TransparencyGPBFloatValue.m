@implementation TransparencyGPBFloatValue

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_1001313B8;
  if (!qword_1001313B8)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBFloatValue, CFSTR("FloatValue"), off_10012A240, &off_10012A258, 1, 8, v3);
    qword_1001313B8 = (uint64_t)result;
  }
  return result;
}

@end

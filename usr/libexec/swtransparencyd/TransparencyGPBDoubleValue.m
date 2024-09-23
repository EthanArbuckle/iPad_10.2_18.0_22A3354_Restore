@implementation TransparencyGPBDoubleValue

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_1001313B0;
  if (!qword_1001313B0)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBDoubleValue, CFSTR("DoubleValue"), off_10012A240, &off_10012A220, 1, 16, v3);
    qword_1001313B0 = (uint64_t)result;
  }
  return result;
}

@end

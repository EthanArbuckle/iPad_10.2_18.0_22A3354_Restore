@implementation TransparencyGPBStringValue

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_1001313E8;
  if (!qword_1001313E8)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBStringValue, CFSTR("StringValue"), off_10012A240, &off_10012A318, 1, 16, v3);
    qword_1001313E8 = (uint64_t)result;
  }
  return result;
}

@end

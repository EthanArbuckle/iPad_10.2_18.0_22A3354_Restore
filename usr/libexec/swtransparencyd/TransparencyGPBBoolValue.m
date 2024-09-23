@implementation TransparencyGPBBoolValue

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_1001313E0;
  if (!qword_1001313E0)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBBoolValue, CFSTR("BoolValue"), off_10012A240, &off_10012A2F8, 1, 4, v3);
    qword_1001313E0 = (uint64_t)result;
  }
  return result;
}

@end

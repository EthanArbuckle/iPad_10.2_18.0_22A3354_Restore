@implementation TransparencyGPBInt64Value

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_1001313C0;
  if (!qword_1001313C0)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBInt64Value, CFSTR("Int64Value"), off_10012A240, &off_10012A278, 1, 16, v3);
    qword_1001313C0 = (uint64_t)result;
  }
  return result;
}

@end

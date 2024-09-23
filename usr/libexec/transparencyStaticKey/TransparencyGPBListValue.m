@implementation TransparencyGPBListValue

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_10008AC10;
  if (!qword_10008AC10)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBListValue, CFSTR("ListValue"), off_10008A780, &off_10008A860, 1, 16, v3);
    qword_10008AC10 = (uint64_t)result;
  }
  return result;
}

@end

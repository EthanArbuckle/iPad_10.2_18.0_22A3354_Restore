@implementation TransparencyGPBListValue

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_100131350;
  if (!qword_100131350)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBListValue, CFSTR("ListValue"), off_100129D70, &off_100129E50, 1, 16, v3);
    qword_100131350 = (uint64_t)result;
  }
  return result;
}

@end

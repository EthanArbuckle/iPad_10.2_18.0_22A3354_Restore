@implementation TransparencyGPBSourceContext

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_1002A7398;
  if (!qword_1002A7398)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBSourceContext, CFSTR("SourceContext"), off_1002A16C0, &off_1002A16A0, 1, 16, v3);
    qword_1002A7398 = (uint64_t)result;
  }
  return result;
}

@end

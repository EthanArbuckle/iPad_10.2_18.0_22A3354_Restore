@implementation TransparencyGPBSourceContext

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_10008AA58;
  if (!qword_10008AA58)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBSourceContext, CFSTR("SourceContext"), off_100089850, &off_100089830, 1, 16, v3);
    qword_10008AA58 = (uint64_t)result;
  }
  return result;
}

@end

@implementation TransparencyGPBSourceContext

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_100131330;
  if (!qword_100131330)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBSourceContext, CFSTR("SourceContext"), off_100129D38, &off_100129D18, 1, 16, v3);
    qword_100131330 = (uint64_t)result;
  }
  return result;
}

@end

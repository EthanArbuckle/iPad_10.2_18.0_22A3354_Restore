@implementation TransparencyGPBApi

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_100131400;
  if (!qword_100131400)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBApi, CFSTR("Api"), off_10012A490, &off_10012A3B0, 7, 56, v3);
    qword_100131400 = (uint64_t)result;
  }
  return result;
}

@end

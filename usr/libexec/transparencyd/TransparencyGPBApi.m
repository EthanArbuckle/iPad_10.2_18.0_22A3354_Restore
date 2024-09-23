@implementation TransparencyGPBApi

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_1002A7468;
  if (!qword_1002A7468)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBApi, CFSTR("Api"), off_1002A1E18, &off_1002A1D38, 7, 56, v3);
    qword_1002A7468 = (uint64_t)result;
  }
  return result;
}

@end

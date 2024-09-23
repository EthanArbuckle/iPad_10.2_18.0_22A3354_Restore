@implementation TransparencyGPBApi

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_10008AB80;
  if (!qword_10008AB80)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBApi, CFSTR("Api"), off_10008A220, &off_10008A140, 7, 56, v3);
    qword_10008AB80 = (uint64_t)result;
  }
  return result;
}

@end

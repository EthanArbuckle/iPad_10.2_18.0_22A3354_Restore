@implementation TransparencyGPBEmpty

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_1001312F8;
  if (!qword_1001312F8)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBEmpty, CFSTR("Empty"), off_100129B48, 0, 0, 4, v3);
    qword_1001312F8 = (uint64_t)result;
  }
  return result;
}

@end

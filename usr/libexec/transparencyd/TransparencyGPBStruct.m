@implementation TransparencyGPBStruct

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_1002A73A8;
  if (!qword_1002A73A8)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBStruct, CFSTR("Struct"), off_1002A16F8, &off_1002A16D8, 1, 16, v3);
    qword_1002A73A8 = (uint64_t)result;
  }
  return result;
}

@end

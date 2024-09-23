@implementation TransparencyGPBStruct

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_100131340;
  if (!qword_100131340)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBStruct, CFSTR("Struct"), off_100129D70, &off_100129D50, 1, 16, v3);
    qword_100131340 = (uint64_t)result;
  }
  return result;
}

@end

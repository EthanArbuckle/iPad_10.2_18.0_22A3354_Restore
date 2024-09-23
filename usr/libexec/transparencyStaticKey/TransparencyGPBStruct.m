@implementation TransparencyGPBStruct

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_10008AC00;
  if (!qword_10008AC00)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBStruct, CFSTR("Struct"), off_10008A780, &off_10008A760, 1, 16, v3);
    qword_10008AC00 = (uint64_t)result;
  }
  return result;
}

@end

@implementation SignedObject

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_1002A75C0;
  if (!qword_1002A75C0)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", SignedObject, CFSTR("SignedObject"), &unk_1002A2BE0, &off_1002A2C98, 2, 24, v3);
    qword_1002A75C0 = (uint64_t)result;
  }
  return result;
}

@end

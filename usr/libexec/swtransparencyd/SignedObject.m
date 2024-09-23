@implementation SignedObject

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_10012A648;
  if (!qword_10012A648)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", SignedObject, CFSTR("SignedObject"), &unk_1001259B0, &off_100125A68, 2, 24, v3);
    qword_10012A648 = (uint64_t)result;
  }
  return result;
}

@end

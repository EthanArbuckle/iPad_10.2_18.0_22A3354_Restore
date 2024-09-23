@implementation PublicKeysRequest

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_1002A7540;
  if (!qword_1002A7540)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", PublicKeysRequest, CFSTR("PublicKeysRequest"), &unk_1002A2750, &off_1002A2968, 3, 24, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_100216EAA);
    qword_1002A7540 = (uint64_t)v2;
  }
  return v2;
}

@end

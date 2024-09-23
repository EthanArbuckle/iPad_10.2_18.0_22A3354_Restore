@implementation PublicKeysRequest

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_10012A6E0;
  if (!qword_10012A6E0)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", PublicKeysRequest, CFSTR("PublicKeysRequest"), &unk_100126088, &off_1001262A0, 3, 24, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_1000DB422);
    qword_10012A6E0 = (uint64_t)v2;
  }
  return v2;
}

@end

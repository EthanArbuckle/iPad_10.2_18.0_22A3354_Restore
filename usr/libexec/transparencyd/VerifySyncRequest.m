@implementation VerifySyncRequest

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_1002A74F8;
  if (!qword_1002A74F8)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", VerifySyncRequest, CFSTR("VerifySyncRequest"), &unk_1002A1FD0, &off_1002A2450, 8, 56, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_100216E3C);
    qword_1002A74F8 = (uint64_t)v2;
  }
  return v2;
}

@end

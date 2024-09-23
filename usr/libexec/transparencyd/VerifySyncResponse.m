@implementation VerifySyncResponse

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_1002A7508;
  if (!qword_1002A7508)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", VerifySyncResponse, CFSTR("VerifySyncResponse"), &unk_1002A1FD0, &off_1002A2650, 3, 16, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_100216E2C);
    qword_1002A7508 = (uint64_t)v2;
  }
  return v2;
}

@end

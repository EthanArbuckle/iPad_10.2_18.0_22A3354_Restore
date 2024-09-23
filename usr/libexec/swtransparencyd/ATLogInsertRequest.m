@implementation ATLogInsertRequest

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_10012A728;
  if (!qword_10012A728)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", ATLogInsertRequest, CFSTR("ATLogInsertRequest"), &unk_1001264E0, &off_100126460, 4, 32, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_1000DB4F8);
    qword_10012A728 = (uint64_t)v2;
  }
  return v2;
}

@end

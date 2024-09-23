@implementation ATLogProofs

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_10012A748;
  if (!qword_10012A748)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", ATLogProofs, CFSTR("ATLogProofs"), &unk_1001264E0, &off_100126598, 2, 24, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_1000DB520);
    qword_10012A748 = (uint64_t)v2;
  }
  return v2;
}

@end

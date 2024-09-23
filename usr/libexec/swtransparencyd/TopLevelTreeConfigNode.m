@implementation TopLevelTreeConfigNode

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_10012A6A0;
  if (!qword_10012A6A0)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TopLevelTreeConfigNode, CFSTR("TopLevelTreeConfigNode"), &unk_1001259B0, &off_100125F68, 2, 16, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_1000DB3E0);
    qword_10012A6A0 = (uint64_t)v2;
  }
  return v2;
}

@end

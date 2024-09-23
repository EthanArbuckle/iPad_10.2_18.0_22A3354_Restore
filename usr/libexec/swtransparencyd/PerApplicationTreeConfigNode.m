@implementation PerApplicationTreeConfigNode

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_10012A698;
  if (!qword_10012A698)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", PerApplicationTreeConfigNode, CFSTR("PerApplicationTreeConfigNode"), &unk_1001259B0, &off_100125F08, 3, 24, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_1000DB3C8);
    qword_10012A698 = (uint64_t)v2;
  }
  return v2;
}

@end

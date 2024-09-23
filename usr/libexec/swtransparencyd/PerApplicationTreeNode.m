@implementation PerApplicationTreeNode

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_10012A688;
  if (!qword_10012A688)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", PerApplicationTreeNode, CFSTR("PerApplicationTreeNode"), &unk_1001259B0, &off_100125EC8, 1, 16, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_1000DB3BE);
    qword_10012A688 = (uint64_t)v2;
  }
  return v2;
}

@end

@implementation TopLevelTreeNode

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_10012A690;
  if (!qword_10012A690)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TopLevelTreeNode, CFSTR("TopLevelTreeNode"), &unk_1001259B0, &off_100125EE8, 1, 16, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_1000DB3C3);
    qword_10012A690 = (uint64_t)v2;
  }
  return v2;
}

@end

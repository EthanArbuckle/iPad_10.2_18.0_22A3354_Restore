@implementation PerApplicationTreeNode

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_1002A7600;
  if (!qword_1002A7600)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", PerApplicationTreeNode, CFSTR("PerApplicationTreeNode"), &unk_1002A2BE0, &off_1002A30F8, 1, 16, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_100217272);
    qword_1002A7600 = (uint64_t)v2;
  }
  return v2;
}

@end

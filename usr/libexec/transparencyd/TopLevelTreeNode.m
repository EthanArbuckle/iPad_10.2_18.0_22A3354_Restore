@implementation TopLevelTreeNode

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_1002A7608;
  if (!qword_1002A7608)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TopLevelTreeNode, CFSTR("TopLevelTreeNode"), &unk_1002A2BE0, &off_1002A3118, 1, 16, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_100217277);
    qword_1002A7608 = (uint64_t)v2;
  }
  return v2;
}

@end

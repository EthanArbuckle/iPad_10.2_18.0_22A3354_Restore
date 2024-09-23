@implementation TopLevelTreeConfigNode

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_1002A7618;
  if (!qword_1002A7618)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TopLevelTreeConfigNode, CFSTR("TopLevelTreeConfigNode"), &unk_1002A2BE0, &off_1002A3198, 2, 16, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_100217290);
    qword_1002A7618 = (uint64_t)v2;
  }
  return v2;
}

@end

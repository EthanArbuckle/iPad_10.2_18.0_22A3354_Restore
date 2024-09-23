@implementation PerApplicationTreeConfigNode

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_1002A7610;
  if (!qword_1002A7610)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", PerApplicationTreeConfigNode, CFSTR("PerApplicationTreeConfigNode"), &unk_1002A2BE0, &off_1002A3138, 3, 24, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_10021727C);
    qword_1002A7610 = (uint64_t)v2;
  }
  return v2;
}

@end

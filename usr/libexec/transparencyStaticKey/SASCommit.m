@implementation SASCommit

+ (id)descriptor
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v2 = (id)qword_10008AAC8;
  if (!qword_10008AAC8)
  {
    v3 = objc_opt_class(SASCommit, a2);
    v5 = objc_opt_class(StaticKeyProtocolRoot, v4);
    LODWORD(v7) = 12;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:", v3, v5, sub_100014C28(), &off_100089A68, 3, 32, v7);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_10006BED5);
    qword_10008AAC8 = (uint64_t)v2;
  }
  return v2;
}

@end

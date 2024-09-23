@implementation SASSetupB

+ (id)descriptor
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v2 = (id)qword_10008AAE0;
  if (!qword_10008AAE0)
  {
    v3 = objc_opt_class(SASSetupB, a2);
    v5 = objc_opt_class(StaticKeyProtocolRoot, v4);
    LODWORD(v7) = 12;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:", v3, v5, sub_100014C28(), &off_100089B28, 4, 40, v7);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_10006BF20);
    qword_10008AAE0 = (uint64_t)v2;
  }
  return v2;
}

@end

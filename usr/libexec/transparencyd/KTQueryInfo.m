@implementation KTQueryInfo

+ (id)descriptor
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v2 = (id)qword_1002A7998;
  if (!qword_1002A7998)
  {
    v3 = objc_opt_class(KTQueryInfo, a2);
    v5 = objc_opt_class(KtsmdataStoreMessagesRoot, v4);
    if (!qword_1002A79A0)
      qword_1002A79A0 = -[TransparencyGPBFileDescriptor initWithPackage:syntax:]([TransparencyGPBFileDescriptor alloc], "initWithPackage:syntax:", &stru_1002508B8, 3);
    LODWORD(v7) = 12;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:", v3, v5, v7);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_100217358);
    qword_1002A7998 = (uint64_t)v2;
  }
  return v2;
}

@end

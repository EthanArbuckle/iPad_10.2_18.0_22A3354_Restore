@implementation CSHWProtoMessageHeader

+ (id)descriptor
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = (id)qword_1003893D0;
  if (!qword_1003893D0)
  {
    v3 = objc_opt_class(CSHWProtoMessageHeader);
    v4 = objc_opt_class(CSHWProtoRoot);
    LODWORD(v6) = 12;
    v2 = +[GPBDescriptor allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:](GPBDescriptor, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:", v3, v4, sub_10029C108(), &off_100388C78, 10, 72, v6);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_1002EE320);
    qword_1003893D0 = (uint64_t)v2;
  }
  return v2;
}

@end

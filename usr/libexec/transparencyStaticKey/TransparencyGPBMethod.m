@implementation TransparencyGPBMethod

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_10008AB88;
  if (!qword_10008AB88)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBMethod, CFSTR("Method"), off_10008A220, &off_10008A238, 7, 40, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_10006C0F0);
    qword_10008AB88 = (uint64_t)v2;
  }
  return v2;
}

@end

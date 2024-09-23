@implementation MarkForDeletionResponse

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_1002A74E8;
  if (!qword_1002A74E8)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", MarkForDeletionResponse, CFSTR("MarkForDeletionResponse"), &unk_1002A1FD0, &off_1002A2350, 4, 32, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_100216E70);
    qword_1002A74E8 = (uint64_t)v2;
  }
  return v2;
}

@end

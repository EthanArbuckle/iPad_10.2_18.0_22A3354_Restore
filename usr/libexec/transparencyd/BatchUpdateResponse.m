@implementation BatchUpdateResponse

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_1002A74D0;
  if (!qword_1002A74D0)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", BatchUpdateResponse, CFSTR("BatchUpdateResponse"), &unk_1002A1FD0, &off_1002A2208, 3, 24, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_100216E2C);
    qword_1002A74D0 = (uint64_t)v2;
  }
  return v2;
}

@end

@implementation BatchUpdateRequest_UpdateData

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_1002A74C0;
  if (!qword_1002A74C0)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", BatchUpdateRequest_UpdateData, CFSTR("UpdateData"), &unk_1002A1FD0, &off_1002A1FE8, 12, 72, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_100216E01);
    objc_msgSend(v2, "setupContainingMessageClass:", BatchUpdateRequest);
    qword_1002A74C0 = (uint64_t)v2;
  }
  return v2;
}

@end

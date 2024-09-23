@implementation BatchUpdateResponse_UpdateResponseData

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_1002A74D8;
  if (!qword_1002A74D8)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", BatchUpdateResponse_UpdateResponseData, CFSTR("UpdateResponseData"), &unk_1002A1FD0, &off_1002A2268, 3, 32, v4);
    objc_msgSend(v2, "setupOneofs:count:firstHasIndex:", off_1002A22C8, 1, 0xFFFFFFFFLL);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_100216E31);
    objc_msgSend(v2, "setupContainingMessageClass:", BatchUpdateResponse);
    qword_1002A74D8 = (uint64_t)v2;
  }
  return v2;
}

@end

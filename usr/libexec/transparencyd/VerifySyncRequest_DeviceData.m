@implementation VerifySyncRequest_DeviceData

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_1002A7500;
  if (!qword_1002A7500)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", VerifySyncRequest_DeviceData, CFSTR("DeviceData"), &unk_1002A1FD0, &off_1002A2550, 8, 56, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_100216E4A);
    objc_msgSend(v2, "setupContainingMessageClass:", VerifySyncRequest);
    qword_1002A7500 = (uint64_t)v2;
  }
  return v2;
}

@end

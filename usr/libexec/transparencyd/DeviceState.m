@implementation DeviceState

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_1002A74C8;
  if (!qword_1002A74C8)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", DeviceState, CFSTR("DeviceState"), &unk_1002A1FD0, &off_1002A2168, 5, 48, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_100216E1B);
    qword_1002A74C8 = (uint64_t)v2;
  }
  return v2;
}

@end

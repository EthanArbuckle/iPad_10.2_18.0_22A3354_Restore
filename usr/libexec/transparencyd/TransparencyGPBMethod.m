@implementation TransparencyGPBMethod

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_1002A7470;
  if (!qword_1002A7470)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBMethod, CFSTR("Method"), off_1002A1E18, &off_1002A1E30, 7, 40, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_100216DC0);
    qword_1002A7470 = (uint64_t)v2;
  }
  return v2;
}

@end

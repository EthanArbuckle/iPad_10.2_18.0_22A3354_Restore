@implementation TransparencyGPBField

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_10008AB48;
  if (!qword_10008AB48)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBField, CFSTR("Field"), off_100089D28, &off_100089D40, 10, 64, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_10006C0E0);
    qword_10008AB48 = (uint64_t)v2;
  }
  return v2;
}

@end

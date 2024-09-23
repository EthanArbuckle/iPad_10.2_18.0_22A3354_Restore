@implementation Signature

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_1002A75B8;
  if (!qword_1002A75B8)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", Signature, CFSTR("Signature"), &unk_1002A2BE0, &off_1002A2C38, 3, 24, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_1002171ED);
    qword_1002A75B8 = (uint64_t)v2;
  }
  return v2;
}

@end

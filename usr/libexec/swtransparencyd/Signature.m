@implementation Signature

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_10012A640;
  if (!qword_10012A640)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", Signature, CFSTR("Signature"), &unk_1001259B0, &off_100125A08, 3, 24, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_1000DB339);
    qword_10012A640 = (uint64_t)v2;
  }
  return v2;
}

@end

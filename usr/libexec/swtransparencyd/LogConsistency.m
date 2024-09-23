@implementation LogConsistency

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_10012A750;
  if (!qword_10012A750)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", LogConsistency, CFSTR("LogConsistency"), &unk_1001264E0, &off_1001265D8, 5, 48, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_1000DB4FD);
    qword_10012A750 = (uint64_t)v2;
  }
  return v2;
}

@end

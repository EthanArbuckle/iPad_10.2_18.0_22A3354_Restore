@implementation ConsistencyProofResponse

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_10012A6C0;
  if (!qword_10012A6C0)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", ConsistencyProofResponse, CFSTR("ConsistencyProofResponse"), &unk_100126088, &off_1001260E0, 4, 24, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_1000DB400);
    qword_10012A6C0 = (uint64_t)v2;
  }
  return v2;
}

@end

@implementation ConsistencyProofRequest_LogConsistencyRequest

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_10012A6B8;
  if (!qword_10012A6B8)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", ConsistencyProofRequest_LogConsistencyRequest, CFSTR("LogConsistencyRequest"), &unk_100126088, &off_1001260A0, 2, 24, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_1000DB3F8);
    objc_msgSend(v2, "setupContainingMessageClass:", ConsistencyProofRequest);
    qword_10012A6B8 = (uint64_t)v2;
  }
  return v2;
}

@end

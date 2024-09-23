@implementation ConsistencyProofRequest_LogConsistencyRequest

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_1002A7518;
  if (!qword_1002A7518)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", ConsistencyProofRequest_LogConsistencyRequest, CFSTR("LogConsistencyRequest"), &unk_1002A2750, &off_1002A2768, 2, 24, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_100216E80);
    objc_msgSend(v2, "setupContainingMessageClass:", ConsistencyProofRequest);
    qword_1002A7518 = (uint64_t)v2;
  }
  return v2;
}

@end

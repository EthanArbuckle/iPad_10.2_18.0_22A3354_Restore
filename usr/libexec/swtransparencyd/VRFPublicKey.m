@implementation VRFPublicKey

- (BOOL)needsRefresh
{
  id AssociatedObject;
  void *v3;
  unsigned __int8 v4;

  AssociatedObject = objc_getAssociatedObject(self, CFSTR("needsRefresh"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setNeedsRefresh:(BOOL)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  objc_setAssociatedObject(self, CFSTR("needsRefresh"), v4, (void *)1);

}

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_10012A638;
  if (!qword_10012A638)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", VRFPublicKey, CFSTR("VRFPublicKey"), &unk_1001259B0, &off_1001259C8, 2, 16, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_1000DB334);
    qword_10012A638 = (uint64_t)v2;
  }
  return v2;
}

@end

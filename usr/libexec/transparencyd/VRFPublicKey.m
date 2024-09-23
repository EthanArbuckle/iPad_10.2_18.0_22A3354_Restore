@implementation VRFPublicKey

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_1002A75B0;
  if (!qword_1002A75B0)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", VRFPublicKey, CFSTR("VRFPublicKey"), &unk_1002A2BE0, &off_1002A2BF8, 2, 16, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_1002171E8);
    qword_1002A75B0 = (uint64_t)v2;
  }
  return v2;
}

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

@end

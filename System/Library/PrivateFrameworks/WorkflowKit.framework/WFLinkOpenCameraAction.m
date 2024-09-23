@implementation WFLinkOpenCameraAction

- (void)serializeAppIntentDescriptorIfNecessary
{
  void *v3;
  void *v4;

  -[WFAction serializedParameters](self, "serializedParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("AppIntentDescriptor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[WFAction setSupplementalParameterValue:forKey:](self, "setSupplementalParameterValue:forKey:", &unk_1E7B8DCC0, CFSTR("AppIntentDescriptor"));
}

- (id)serializationKeysByParameter
{
  return &unk_1E7B8DCE8;
}

@end

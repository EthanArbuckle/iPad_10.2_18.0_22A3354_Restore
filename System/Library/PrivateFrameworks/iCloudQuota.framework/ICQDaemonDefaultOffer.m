@implementation ICQDaemonDefaultOffer

+ (id)persistenceKey
{
  return CFSTR("_ICQCachedDefaultOfferInternal");
}

- (BOOL)isDefaultOffer
{
  return 1;
}

+ (id)_mutablePlaceholderPersistanceDictionary
{
  void *v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___ICQDaemonDefaultOffer;
  objc_msgSendSuper2(&v4, sel__mutablePlaceholderPersistanceDictionary);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", &unk_1E8B516D8, CFSTR("isDefaultOffer"));
  return v2;
}

@end

@implementation ICQDaemonBuddyOffer

+ (id)_mutablePlaceholderPersistanceDictionary
{
  void *v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___ICQDaemonBuddyOffer;
  objc_msgSendSuper2(&v4, sel__mutablePlaceholderPersistanceDictionary);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", &unk_1E8B51D80, CFSTR("isBuddyOffer"));
  return v2;
}

+ (id)persistenceKey
{
  return CFSTR("_ICQCachedBuddyOfferInternal");
}

@end

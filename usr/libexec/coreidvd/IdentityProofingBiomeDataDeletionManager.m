@implementation IdentityProofingBiomeDataDeletionManager

- (void)pruneUserProofingStream
{
  id v2;

  v2 = objc_msgSend(objc_alloc((Class)BMRestrictedStream), "initWithIdentifier:", CFSTR("UserProofingMetadata"));
  objc_msgSend(v2, "pruneWithPredicateBlock:", &stru_1005FFB30);

}

@end

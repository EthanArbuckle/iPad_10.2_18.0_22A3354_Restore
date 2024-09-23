@implementation STStatusBarOverridesStatusDomainData(ArchiveRecordAccessing)

- (_SBSystemStatusStatusBarOverridesArchiveRecord)_sbSystemStatusStatusBarOverridesArchiveRecord
{
  void *v2;
  void *v3;
  _SBSystemStatusStatusBarOverridesArchiveRecord *v4;

  objc_msgSend(a1, "customOverrides");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "suppressedBackgroundActivityIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_SBSystemStatusStatusBarOverridesArchiveRecord initWithStatusBarData:andSuppressedBackgroundActivityIdentifiers:]([_SBSystemStatusStatusBarOverridesArchiveRecord alloc], "initWithStatusBarData:andSuppressedBackgroundActivityIdentifiers:", v2, v3);

  return v4;
}

@end

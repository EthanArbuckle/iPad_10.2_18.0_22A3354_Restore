@implementation PUIPosterSnapshotBundleCurrentSnapshotBundleEpochAndVersionIdentifier

void __PUIPosterSnapshotBundleCurrentSnapshotBundleEpochAndVersionIdentifier_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d+%d+%d"), 6, 13, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)PUIPosterSnapshotBundleCurrentSnapshotBundleEpochAndVersionIdentifier_currentSnapshotBundleEpochAndVersion;
  PUIPosterSnapshotBundleCurrentSnapshotBundleEpochAndVersionIdentifier_currentSnapshotBundleEpochAndVersion = v0;

}

@end

@implementation ICRunMiniDeviceSnapshotLaunchTask

- (void)runLaunchTask
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[ICNASnapshotReporter sharedReporter](ICNASnapshotReporter, "sharedReporter"));
  objc_msgSend(v2, "submitMiniSnapshot");

}

@end

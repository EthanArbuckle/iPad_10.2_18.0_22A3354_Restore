@implementation _RDPreDataSeparationAttachmentFileManagerDocumentsURLProvider

- (id)documentsURLForAccountIdentifier:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[REMPaths legacy_centralizedDataPath](REMPaths, "legacy_centralizedDataPath", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RDPaths reminderDataContainerURLWithAppDocumentsURL:](RDPaths, "reminderDataContainerURLWithAppDocumentsURL:", v3));

  return v4;
}

@end

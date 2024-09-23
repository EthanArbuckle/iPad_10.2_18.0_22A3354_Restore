@implementation _RDDefaultPostDataSeparationAttachmentFileManagerDocumentsURLProvider

- (id)documentsURLForAccountIdentifier:(id)a3
{
  return +[RDPaths defaultReminderDataContainerURL](RDPaths, "defaultReminderDataContainerURL", a3);
}

@end

@implementation SVXTapToRadarExtraContent

- (NSArray)attachmentURLs
{
  return self->_attachmentURLs;
}

- (void)setAttachmentURLs:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentURLs, a3);
}

- (NSArray)extensionIDs
{
  return self->_extensionIDs;
}

- (void)setExtensionIDs:(id)a3
{
  objc_storeStrong((id *)&self->_extensionIDs, a3);
}

- (NSArray)deviceIDs
{
  return self->_deviceIDs;
}

- (void)setDeviceIDs:(id)a3
{
  objc_storeStrong((id *)&self->_deviceIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIDs, 0);
  objc_storeStrong((id *)&self->_extensionIDs, 0);
  objc_storeStrong((id *)&self->_attachmentURLs, 0);
}

@end

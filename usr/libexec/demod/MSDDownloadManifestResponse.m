@implementation MSDDownloadManifestResponse

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
  objc_storeStrong((id *)&self->_fileName, a3);
}

- (NSString)originServer
{
  return self->_originServer;
}

- (void)setOriginServer:(id)a3
{
  objc_storeStrong((id *)&self->_originServer, a3);
}

- (NSDictionary)manifestInfo
{
  return self->_manifestInfo;
}

- (void)setManifestInfo:(id)a3
{
  objc_storeStrong((id *)&self->_manifestInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifestInfo, 0);
  objc_storeStrong((id *)&self->_originServer, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
}

@end

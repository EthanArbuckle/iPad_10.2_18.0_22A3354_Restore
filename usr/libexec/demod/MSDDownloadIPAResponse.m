@implementation MSDDownloadIPAResponse

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

- (BOOL)isDiffPatch
{
  return self->_isDiffPatch;
}

- (void)setIsDiffPatch:(BOOL)a3
{
  self->_isDiffPatch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originServer, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
}

@end

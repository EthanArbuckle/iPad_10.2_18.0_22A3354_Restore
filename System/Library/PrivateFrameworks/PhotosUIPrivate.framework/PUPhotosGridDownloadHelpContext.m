@implementation PUPhotosGridDownloadHelpContext

- (PHResourceLocalAvailabilityRequest)resourceLocalAvailabilityRequest
{
  return self->_resourceLocalAvailabilityRequest;
}

- (void)setResourceLocalAvailabilityRequest:(id)a3
{
  objc_storeStrong((id *)&self->_resourceLocalAvailabilityRequest, a3);
}

- (NSString)gridProgressIdentifier
{
  return self->_gridProgressIdentifier;
}

- (void)setGridProgressIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_gridProgressIdentifier, a3);
}

- (id)downloadHandler
{
  return self->_downloadHandler;
}

- (void)setDownloadHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_downloadHandler, 0);
  objc_storeStrong((id *)&self->_gridProgressIdentifier, 0);
  objc_storeStrong((id *)&self->_resourceLocalAvailabilityRequest, 0);
}

@end

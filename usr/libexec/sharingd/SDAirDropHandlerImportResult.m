@implementation SDAirDropHandlerImportResult

- (NSArray)importedFiles
{
  return self->_importedFiles;
}

- (void)setImportedFiles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSURL)openAppURL
{
  return self->_openAppURL;
}

- (void)setOpenAppURL:(id)a3
{
  objc_storeStrong((id *)&self->_openAppURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openAppURL, 0);
  objc_storeStrong((id *)&self->_importedFiles, 0);
}

@end

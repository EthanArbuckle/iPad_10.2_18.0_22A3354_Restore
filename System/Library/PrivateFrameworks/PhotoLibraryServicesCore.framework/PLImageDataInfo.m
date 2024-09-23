@implementation PLImageDataInfo

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLImageDataInfo;
  -[PLImageDataInfo description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = CFSTR("YES");
  if (!self->_deliveredPlaceholder)
    v5 = CFSTR("NO");
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" - deliveredFormat: %ld, deliveredPlaceholder: %@, URL: %@, UTI: %@"), self->_deliveredFormat, v5, self->_URL, self->_UTI);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)deliveredFormat
{
  return self->_deliveredFormat;
}

- (void)setDeliveredFormat:(int64_t)a3
{
  self->_deliveredFormat = a3;
}

- (BOOL)deliveredPlaceholder
{
  return self->_deliveredPlaceholder;
}

- (void)setDeliveredPlaceholder:(BOOL)a3
{
  self->_deliveredPlaceholder = a3;
}

- (BOOL)canDownloadFromCloud
{
  return self->_canDownloadFromCloud;
}

- (void)setCanDownloadFromCloud:(BOOL)a3
{
  self->_canDownloadFromCloud = a3;
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)sandboxExtensionToken
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSandboxExtensionToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)UTI
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUTI:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (int64_t)EXIFOrientation
{
  return self->_EXIFOrientation;
}

- (void)setEXIFOrientation:(int64_t)a3
{
  self->_EXIFOrientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UTI, 0);
  objc_storeStrong((id *)&self->_sandboxExtensionToken, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end

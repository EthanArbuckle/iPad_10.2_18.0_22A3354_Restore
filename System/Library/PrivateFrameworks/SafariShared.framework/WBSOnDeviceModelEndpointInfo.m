@implementation WBSOnDeviceModelEndpointInfo

- (WBSOnDeviceModelEndpointInfo)initWithEndpointURL:(id)a3 sizeInBytes:(unint64_t)a4 checksumString:(id)a5
{
  id v8;
  id v9;
  WBSOnDeviceModelEndpointInfo *v10;
  uint64_t v11;
  NSURL *endpointURL;
  uint64_t v13;
  NSString *checksumString;
  WBSOnDeviceModelEndpointInfo *v15;
  objc_super v17;

  v8 = a3;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)WBSOnDeviceModelEndpointInfo;
  v10 = -[WBSOnDeviceModelEndpointInfo init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    endpointURL = v10->_endpointURL;
    v10->_endpointURL = (NSURL *)v11;

    v10->_sizeInBytes = a4;
    v13 = objc_msgSend(v9, "copy");
    checksumString = v10->_checksumString;
    v10->_checksumString = (NSString *)v13;

    v15 = v10;
  }

  return v10;
}

- (NSURL)endpointURL
{
  return self->_endpointURL;
}

- (unint64_t)sizeInBytes
{
  return self->_sizeInBytes;
}

- (NSString)checksumString
{
  return self->_checksumString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checksumString, 0);
  objc_storeStrong((id *)&self->_endpointURL, 0);
}

@end

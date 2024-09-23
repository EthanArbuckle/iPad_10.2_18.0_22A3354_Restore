@implementation OCXReader

- (BOOL)start
{
  return 1;
}

- (BOOL)retainDecryptorWithErrorCode:(int *)a3
{
  NSData *mData;
  NSString *mFileName;
  OCCStreamer *v7;
  uint64_t v8;
  SsrwOORootStorage **v9;
  OCCXmlStreamer *UsingInputFile;
  const void **v11;
  SsrwOORootStorage **v12;
  OCCXmlStreamer *v13;
  id v14;
  OCCDecryptor *v15;
  OCCDecryptor *mDecryptor;

  if (self->super.mDecryptor)
  {
    LOBYTE(mData) = 1;
  }
  else
  {
    mFileName = self->super.super.mFileName;
    if (mFileName)
    {
      v7 = -[NSString UTF8String](mFileName, "UTF8String");
      UsingInputFile = (OCCXmlStreamer *)OCCXmlStreamer::createUsingInputFile(v7, a3, v8, v9);
    }
    else
    {
      mData = self->super.super.mData;
      if (!mData)
        return (char)mData;
      self->mDataBytes = -[NSData bytes](mData, "bytes");
      v11 = -[NSData length](self->super.super.mData, "length");
      UsingInputFile = (OCCXmlStreamer *)OCCXmlStreamer::createUsingInputBuffer((OCCStreamer *)&self->mDataBytes, v11, a3, v12);
    }
    v13 = UsingInputFile;
    if (UsingInputFile)
    {
      -[OCDEncryptedReader defaultPassphrase](self, "defaultPassphrase");
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      OCCXmlStreamer::setDefaultPassphrase(v13, (const char *)objc_msgSend(v14, "UTF8String"));

      v15 = -[OCCDecryptor initWithStreamer:]([OCCDecryptor alloc], "initWithStreamer:", v13);
      mDecryptor = self->super.mDecryptor;
      self->super.mDecryptor = v15;

      LOBYTE(mData) = self->super.mDecryptor != 0;
    }
    else
    {
      LOBYTE(mData) = 0;
    }
  }
  return (char)mData;
}

- (BOOL)isBinaryReader
{
  return 0;
}

- (OCPZipPackage)zipPackage
{
  void *v3;
  OCPZipPackage *v4;
  void *v5;
  OCPZipPackage *v6;
  void *v7;
  OCPZipPackage *v8;
  OCPZipPackage *mZipPackage;

  if (!self->mZipPackage)
  {
    -[OCDReader fileName](self, "fileName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = [OCPZipPackage alloc];
      -[OCDReader fileName](self, "fileName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[OCPZipPackage initWithPath:](v4, "initWithPath:", v5);
LABEL_6:
      mZipPackage = self->mZipPackage;
      self->mZipPackage = v6;

      return self->mZipPackage;
    }
    -[OCDReader data](self, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = [OCPZipPackage alloc];
      -[OCDReader data](self, "data");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[OCPZipPackage initWithData:](v8, "initWithData:", v5);
      goto LABEL_6;
    }
  }
  return self->mZipPackage;
}

- (void)setZipPackage:(id)a3
{
  objc_storeStrong((id *)&self->mZipPackage, a3);
}

- (BOOL)verifyFileFormat
{
  void *v3;

  -[OCDEncryptedReader useUnencryptedDocument](self, "useUnencryptedDocument");
  -[OCXReader zipPackage](self, "zipPackage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  return 1;
}

- (void)restartReaderToUseDecryptedDocument
{
  id v3;

  -[OCCDecryptor outputFilename](self->super.mDecryptor, "outputFilename");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[OCDReader setFileName:](self, "setFileName:");

}

- (id)read
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mZipPackage, 0);
}

@end

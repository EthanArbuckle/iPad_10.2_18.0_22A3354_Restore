@implementation WXReader

- (id)read
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  v3 = (void *)MEMORY[0x22E2DDB58](self, a2);
  -[OCDEncryptedReader useUnencryptedDocument](self, "useUnencryptedDocument");
  -[OCXReader zipPackage](self, "zipPackage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[OCXReader verifyFileFormat](self, "verifyFileFormat");
  -[OCXReader zipPackage](self, "zipPackage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[OCDReader cancelDelegate](self, "cancelDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WXDocument documentFrom:reader:cancel:asThumbnail:](WXDocument, "documentFrom:reader:cancel:asThumbnail:", v5, self, v6, -[OCDReader isThumbnail](self, "isThumbnail"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v8;
}

- (id)defaultPassphrase
{
  return 0;
}

@end

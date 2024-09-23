@implementation PXReader

- (id)read
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v11;

  v3 = (void *)MEMORY[0x22E2DDB58](self, a2);
  -[OCDEncryptedReader useUnencryptedDocument](self, "useUnencryptedDocument");
  -[OCXReader zipPackage](self, "zipPackage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[OCXReader verifyFileFormat](self, "verifyFileFormat");
  -[OCXReader zipPackage](self, "zipPackage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[OCDReader fileName](self, "fileName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[OCDReader cancelDelegate](self, "cancelDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[OCDReader isThumbnail](self, "isThumbnail");
  -[OCDReader delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPresentation readFromPackage:fileName:reader:cancel:isThumbnail:delegate:](PXPresentation, "readFromPackage:fileName:reader:cancel:isThumbnail:delegate:", v5, v6, self, v7, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v11;
}

- (id)defaultPassphrase
{
  return CFSTR("/01Hannes Ruescher/01");
}

@end

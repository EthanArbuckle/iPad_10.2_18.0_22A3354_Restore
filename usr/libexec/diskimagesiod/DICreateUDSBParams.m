@implementation DICreateUDSBParams

- (DICreateUDSBParams)initWithURL:(id)a3 numBlocks:(unint64_t)a4 error:(id *)a5
{
  DICreateUDSBParams *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DICreateUDSBParams;
  result = -[DICreateParams initWithURL:numBlocks:error:](&v6, "initWithURL:numBlocks:error:", a3, a4, a5);
  if (result)
    result->_sparseBundleBandSize = 0x4000000;
  return result;
}

- (void)createDiskImageParamsXPC
{
  SparseBundleBackendXPC *v3;
  void *v4;
  DiskImageParamsSparseBundle_XPC *v5;
  SparseBundleBackendXPC *v6;

  v3 = [SparseBundleBackendXPC alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
  v6 = -[SparseBundleBackendXPC initWithURL:fileOpenFlags:bandSize:](v3, "initWithURL:fileOpenFlags:bandSize:", v4, 514, -[DICreateUDSBParams sparseBundleBandSize](self, "sparseBundleBandSize"));

  v5 = -[DiskImageParamsXPC initWithBackendXPC:]([DiskImageParamsSparseBundle_XPC alloc], "initWithBackendXPC:", v6);
  -[DIBaseParams setDiskImageParamsXPC:](self, "setDiskImageParamsXPC:", v5);

}

+ (BOOL)checkExistingFileWithURL:(id)a3 isDirectory:(BOOL)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;

  v7 = a3;
  if (a4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:relativeToURL:](NSURL, "fileURLWithPath:relativeToURL:", CFSTR("Info.plist"), v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:relativeToURL:](NSURL, "fileURLWithPath:relativeToURL:", CFSTR("token"), v7));
    v10 = objc_retainAutorelease(v8);
    if (access((const char *)objc_msgSend(v10, "fileSystemRepresentation"), 0)
      || access((const char *)objc_msgSend(objc_retainAutorelease(v9), "fileSystemRepresentation"), 0))
    {
      v11 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 17, CFSTR("The requested URL is an existing non-sparsebundle folder"), a5);
    }
    else
    {
      v11 = 1;
    }

  }
  else
  {
    v11 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 20, CFSTR("The requested URL is an existing regular file"), a5);
  }

  return v11;
}

- (unint64_t)sparseBundleBandSize
{
  return self->_sparseBundleBandSize;
}

- (void)setSparseBundleBandSize:(unint64_t)a3
{
  self->_sparseBundleBandSize = a3;
}

@end

@implementation DICreateASIFParams

- (DICreateASIFParams)initWithURL:(id)a3 numBlocks:(unint64_t)a4 error:(id *)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DICreateASIFParams;
  return -[DICreateParams initWithURL:numBlocks:error:](&v6, "initWithURL:numBlocks:error:", a3, a4, a5);
}

- (void)createDiskImageParamsXPC
{
  FileLocalXPC *v3;
  void *v4;
  FileLocalXPC *v5;
  DiskImageParamsASIF_XPC *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = [FileLocalXPC alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
  v5 = -[FileLocalXPC initWithURL:fileOpenFlags:](v3, "initWithURL:fileOpenFlags:", v4, 514);

  v8 = 0;
  v6 = -[DiskImageParamsASIF_XPC initWithBackendXPC:header:]([DiskImageParamsASIF_XPC alloc], "initWithBackendXPC:header:", v5, &v8);
  -[DIBaseParams setDiskImageParamsXPC:](self, "setDiskImageParamsXPC:", v6);

  v7 = v8;
  v8 = 0;
  if (v7)
    operator delete();

}

@end

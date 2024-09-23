@implementation PKFilesystemProvider

- (PKNSBundleProxy)mainBundle
{
  PKNSBundleProxy *v2;
  void *v3;
  PKNSBundleProxy *v4;

  v2 = [PKNSBundleProxy alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKNSBundleProxy initWithNSBundle:](v2, "initWithNSBundle:", v3);

  return v4;
}

- (id)bundleWithURL:(id)a3
{
  id v3;
  PKNSBundleProxy *v4;
  void *v5;
  PKNSBundleProxy *v6;

  v3 = a3;
  v4 = [PKNSBundleProxy alloc];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB34D0]), "initWithURL:", v3);

  v6 = -[PKNSBundleProxy initWithNSBundle:](v4, "initWithNSBundle:", v5);
  return v6;
}

- (id)dataWithContentsOfURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  objc_class *v7;
  id v8;
  void *v9;

  v7 = (objc_class *)MEMORY[0x1E0C99D50];
  v8 = a3;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithContentsOfURL:options:error:", v8, a4, a5);

  return v9;
}

- (BOOL)writeToURL:(id)a3 withData:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  return MEMORY[0x1E0DE7D20](a4, sel_writeToURL_options_error_);
}

- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 attributes:(id)a5 error:(id *)a6
{
  _BOOL8 v7;
  void *v9;
  id v10;
  id v11;
  void *v12;

  v7 = a4;
  v9 = (void *)MEMORY[0x1E0CB3620];
  v10 = a5;
  v11 = a3;
  objc_msgSend(v9, "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v12, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v11, v7, v10, a6);

  return (char)a6;
}

- (id)contentsOfDirectoryAtURL:(id)a3 includingPropertiesForKeys:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v9 = (void *)MEMORY[0x1E0CB3620];
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v11, v10, a5, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end

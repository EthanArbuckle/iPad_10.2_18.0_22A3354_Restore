@implementation PFVideoExport

+ (id)singlePassExportItemForAssetAtFileURL:(id)a3 destinationURL:(id)a4 targetFileSize:(unint64_t)a5 error:(id *)a6
{
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v20;

  v9 = (void *)MEMORY[0x1E0CB3620];
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v12, "attributesOfItemAtPath:error:", v13, &v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v20;

  objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_opt_new();
  objc_msgSend(v17, "setDestinationFileURL:", v10);

  objc_msgSend(v17, "setTargetOutputFileSize:", a5);
  objc_msgSend(v17, "setTargetOutputMediaDataSize:", a5 - 4 * objc_msgSend(v16, "moovAtomSize"));
  objc_msgSend(v17, "setInputAsset:", v16);
  if ((objc_msgSend(v17, "preflight") & 1) != 0)
  {
    v18 = v17;
  }
  else if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PFVideoExportErrorDomain"), 2, 0);
    v18 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

@end

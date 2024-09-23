@implementation VLFilesystemDataProvider

- (VLFilesystemDataProvider)initWithBaseDirectory:(id)a3
{
  id v5;
  VLFilesystemDataProvider *v6;
  VLFilesystemDataProvider *v7;
  VLFilesystemDataProvider *v8;
  id v10;
  objc_super v11;

  v5 = a3;
  if ((objc_msgSend(v5, "isFileURL") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("directoryURL must be a file URL"), 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }
  v11.receiver = self;
  v11.super_class = (Class)VLFilesystemDataProvider;
  v6 = -[VLFilesystemDataProvider init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_baseDirectory, a3);
    v8 = v7;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_baseDirectory, 0);
}

- (id)fileURLForKey:(id *)a3 error:(id *)a4
{
  NSURL *baseDirectory;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;

  baseDirectory = self->_baseDirectory;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%i/%i/%i/tracks_%i.vtrk"), a3->var0, a3->var1, a3->var2, a3->var3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL URLByAppendingPathComponent:](baseDirectory, "URLByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);

  if ((v10 & 1) != 0)
  {
    v11 = v7;
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("VLLocalizationDataProviderErrorDomain"), 2, 0);
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)determineAvailabilityForCoordinate:(id *)a3 horizontalAccuracy:(double)a4 purpose:(int64_t)a5 callbackQueue:(id)a6 callback:(id)a7
{
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  $F24F406B2B787EFB06265DBA3D28CBD5 v14;

  v10 = a7;
  v11 = v10;
  if (v10)
  {
    v14 = *a3;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __113__VLFilesystemDataProvider_determineAvailabilityForCoordinate_horizontalAccuracy_purpose_callbackQueue_callback___block_invoke;
    v12[3] = &unk_24CA9BA00;
    v12[4] = self;
    v13 = v10;
    dispatch_async((dispatch_queue_t)a6, v12);

  }
}

void __113__VLFilesystemDataProvider_determineAvailabilityForCoordinate_horizontalAccuracy_purpose_callbackQueue_callback___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _OWORD v15[4];
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  memset(v15, 0, sizeof(v15));
  if (objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", v15, v16, 16))
  {
    objc_msgSend(**((id **)&v15[0] + 1), "lastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue");
    GEOMapPointForCoordinate();
    v6 = (double)(1 << v5) / *(double *)(MEMORY[0x24BE3CA50] + 16);
    LODWORD(v9) = vcvtmd_u64_f64(v8 * v6);
    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu/%llu/%llu"), v5, __PAIR64__(MEMORY[0x24BE3CA54], vcvtmd_u64_f64(v7 * v6)), v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fileExistsAtPath:", v14);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (VLLocalizationDataProviderDelegate)delegate
{
  return (VLLocalizationDataProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

@end

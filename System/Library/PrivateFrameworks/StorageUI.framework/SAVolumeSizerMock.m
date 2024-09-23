@implementation SAVolumeSizerMock

+ (void)computeSizeOfVolumeAtURL:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  NSLog(CFSTR("SAVolumeSizer - computeSizeOfVolumeAtURL for url: %@"), v5);
  dispatch_get_global_queue(17, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__SAVolumeSizerMock_computeSizeOfVolumeAtURL_completionHandler___block_invoke;
  block[3] = &unk_251924E78;
  v11 = v5;
  v12 = v6;
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, block);

}

void __64__SAVolumeSizerMock_computeSizeOfVolumeAtURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", 844000000000);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", 200000000000);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("SAVolumeSizer - computeSizeOfVolumeAtURL %@ completionHandler capacity: %@ - used: %@"), v2, v4, v3);

}

@end

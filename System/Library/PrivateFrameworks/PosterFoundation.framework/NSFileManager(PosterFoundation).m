@implementation NSFileManager(PosterFoundation)

- (id)pf_createTransientDirectoryAtURL:()PosterFoundation error:
{
  id v6;
  int v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;

  v6 = a3;
  v7 = objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, a4);
  v8 = 0;
  if (v7)
  {
    v9 = objc_alloc(MEMORY[0x24BE0BE98]);
    objc_msgSend(v6, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __74__NSFileManager_PosterFoundation__pf_createTransientDirectoryAtURL_error___block_invoke;
    v12[3] = &unk_251543C60;
    v12[4] = a1;
    v13 = v6;
    v8 = (void *)objc_msgSend(v9, "initWithIdentifier:forReason:invalidationBlock:", v10, CFSTR("TransientDirectory"), v12);

  }
  return v8;
}

@end

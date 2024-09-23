@implementation SearchUIAsyncSectionLoaderCache

- (void)computeObjectForKey:(id)a3 completionHandler:(id)a4
{
  id v5;
  _QWORD *v6;
  void (*v7)(_QWORD *, _QWORD *);
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  objc_msgSend(a3, "computeBlock");
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__SearchUIAsyncSectionLoaderCache_computeObjectForKey_completionHandler___block_invoke;
  v9[3] = &unk_1EA1F5FF0;
  v10 = v5;
  v7 = (void (*)(_QWORD *, _QWORD *))v6[2];
  v8 = v5;
  v7(v6, v9);

}

uint64_t __73__SearchUIAsyncSectionLoaderCache_computeObjectForKey_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end

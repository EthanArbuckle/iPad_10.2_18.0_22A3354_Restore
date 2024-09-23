@implementation PXAppleMusicImageLoader

uint64_t __60___PXAppleMusicImageLoader__handleURLFetchFailureWithError___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))();
}

uint64_t __62___PXAppleMusicImageLoader__handleRequestData_response_error___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = *(_QWORD *)(a1 + 48);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))();
}

void __50___PXAppleMusicImageLoader__beginDownloadFromURL___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_handleRequestData:response:error:", v9, v8, v7);

}

@end

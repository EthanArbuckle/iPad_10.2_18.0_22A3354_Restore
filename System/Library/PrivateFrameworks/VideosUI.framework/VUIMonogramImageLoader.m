@implementation VUIMonogramImageLoader

void __41___VUIMonogramImageLoader_sharedInstance__block_invoke()
{
  _VUIMonogramImageLoader *v0;
  void *v1;

  v0 = objc_alloc_init(_VUIMonogramImageLoader);
  v1 = (void *)sharedInstance_sharedInstance_3;
  sharedInstance_sharedInstance_3 = (uint64_t)v0;

}

void __115___VUIMonogramImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __115___VUIMonogramImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke_2;
  v20[3] = &unk_1E9F9B908;
  v15 = *(id *)(a1 + 32);
  v21 = v11;
  v22 = v12;
  v25 = v15;
  v26 = a5;
  v23 = v13;
  v24 = v14;
  v16 = v14;
  v17 = v13;
  v18 = v12;
  v19 = v11;
  dispatch_async(MEMORY[0x1E0C80D38], v20);

}

uint64_t __115___VUIMonogramImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[8] + 16))(a1[8], a1[4], a1[5], a1[6], a1[9], a1[7]);
}

@end

@implementation StreamShareSourcesForFileURLs

void ___StreamShareSourcesForFileURLs_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v6 = a2;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PLStreamShareSource * _Nullable _StreamShareSourceForURL(NSURL *__strong, NSError *__autoreleasing *)");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("PXPostFilesToSharedAlbumAction.m"), 115, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url"));

  }
  v26 = 0;
  objc_msgSend(MEMORY[0x1E0D752F0], "typeForURL:error:", v6, &v26);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v26;
  v9 = v8;
  if (!v7)
  {
    v12 = objc_retainAutorelease(v8);
LABEL_7:
    v13 = v12;
    v14 = 0;
    goto LABEL_24;
  }
  v10 = v7;
  if ((PFIsLivePhotoBundleType() & 1) != 0)
  {
    v11 = 3;
    goto LABEL_12;
  }
  if ((objc_msgSend(v10, "conformsToType:", *MEMORY[0x1E0CEC568]) & 1) != 0)
  {
    v11 = 1;
    goto LABEL_12;
  }
  if ((objc_msgSend(v10, "conformsToType:", *MEMORY[0x1E0CEC520]) & 1) == 0)
  {

    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Unknown media type for URL: %@"), v6);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v11 = 2;
LABEL_12:

  v15 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PLStreamShareSource * _Nullable _StreamShareSourceWithMediaType(NSURL *__strong, PLStreamShareMediaType, NSError *__autoreleasing *)");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("PXPostFilesToSharedAlbumAction.m"), 79, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileURL"));

  }
  v16 = objc_alloc_init(MEMORY[0x1E0D71B58]);
  objc_msgSend(v16, "setMediaType:", v11);
  if ((unint64_t)(v11 - 1) >= 2)
  {
    if (v11 == 3)
    {
      v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D75318]), "initWithBundleAtURL:", v15);
      if (!v14)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Failed to create PFVideoComplement for URL: %@"), v15);
        v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());

        goto LABEL_20;
      }
      objc_msgSend(v16, "setVideoComplement:", v14);
      objc_msgSend(v16, "setMediaURL:", v15);

    }
  }
  else
  {
    objc_msgSend(v16, "setMediaURL:", v15);
  }
  v14 = v16;
  v17 = 0;
LABEL_20:

  v18 = v17;
  v19 = v18;
  if (v14)
  {
    v20 = v14;
    v13 = 0;
  }
  else
  {
    v13 = objc_retainAutorelease(v18);
  }

LABEL_24:
  v21 = v13;
  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v14);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v13);
    *a4 = 1;
  }

}

@end

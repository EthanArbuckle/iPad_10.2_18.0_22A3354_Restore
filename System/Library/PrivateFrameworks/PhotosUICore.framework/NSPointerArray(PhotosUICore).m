@implementation NSPointerArray(PhotosUICore)

- (void)px_enumeratePointersWithOptions:()PhotosUICore usingBlock:
{
  id v7;
  id v8;
  void (**v9)(_QWORD);
  uint64_t v10;
  unint64_t v11;
  BOOL v12;
  unint64_t v13;
  BOOL v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD aBlock[5];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v7 = a4;
  if (v7)
  {
    if ((a3 & 1) == 0)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSPointerArray+PhotosUICore.m"), 15, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

    if ((a3 & 1) == 0)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSPointerArray+PhotosUICore.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("((options & NSEnumerationConcurrent) == 0)"));

LABEL_3:
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__NSPointerArray_PhotosUICore__px_enumeratePointersWithOptions_usingBlock___block_invoke;
  aBlock[3] = &unk_1E5134318;
  aBlock[4] = a1;
  v8 = v7;
  v20 = v8;
  v21 = &v22;
  v9 = (void (**)(_QWORD))_Block_copy(aBlock);
  v10 = objc_msgSend(a1, "count");
  v11 = v10;
  if ((a3 & 2) != 0)
  {
    for (i = v10 - 1; !*((_BYTE *)v23 + 24) && (i & 0x8000000000000000) == 0; i = v16)
    {
      v16 = i - 1;
      v9[2](v9);
    }
  }
  else
  {
    if (*((_BYTE *)v23 + 24))
      v12 = 1;
    else
      v12 = v10 == 0;
    if (!v12)
    {
      v13 = 1;
      do
      {
        ((void (*)(void (**)(_QWORD), unint64_t))v9[2])(v9, v13 - 1);
        if (*((_BYTE *)v23 + 24))
          v14 = 1;
        else
          v14 = v13 >= v11;
        ++v13;
      }
      while (!v14);
    }
  }

  _Block_object_dispose(&v22, 8);
}

@end

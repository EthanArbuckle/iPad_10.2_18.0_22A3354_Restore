@implementation WBEscher

+ (void)readRootContainer:(id *)a3 type:(int *)a4 reader:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v8 = a5;
  *a4 = 0;
  v12 = v8;
  objc_msgSend(a1, "readRootWithType:reader:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && objc_msgSend(v9, "childCount"))
  {
    objc_msgSend(v10, "childCount");
    objc_msgSend(v10, "childAt:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      *a3 = objc_retainAutorelease(v11);

  }
}

+ (id)readRootWithType:(int *)a3 reader:(id)a4
{
  id v5;
  uint64_t v6;
  int v7;
  ESDRoot *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  int v13;

  v5 = a4;
  v13 = *a3;
  v6 = objc_msgSend(v5, "wrdReader");
  (*(void (**)(uint64_t, int *))(*(_QWORD *)v6 + 440))(v6, &v13);
  v7 = v13;
  *a3 = v13;
  if (v7)
  {
    v8 = [ESDRoot alloc];
    v9 = objc_msgSend(v5, "wrdReader");
    if (v9)
      v10 = v9 + 8;
    else
      v10 = 0;
    v11 = -[ESDRoot initFromReader:](v8, "initFromReader:", v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end

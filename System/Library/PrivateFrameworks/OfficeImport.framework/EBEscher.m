@implementation EBEscher

+ (id)readRootObjectWithType:(int)a3 state:(id)a4
{
  id v6;
  ESDRoot *v7;
  EshObject *v8;
  _DWORD *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;

  v6 = a4;
  v7 = objc_alloc_init(ESDRoot);
  v8 = -[ESDObject eshObject](v7, "eshObject");
  if (v8)
  else
    v9 = 0;
  v9[10] = a3;
  v10 = objc_msgSend(v6, "xlReader");
  (*(void (**)(uint64_t, _DWORD *))(*(_QWORD *)v10 + 136))(v10, v9);
  if (v9[11])
  {
    v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(a1, "readChildrenOfObject:toArray:state:", v9, v11, v6);
    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(v11, "count");
      objc_msgSend(v11, "objectAtIndex:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }
  v13 = v12;

  return v13;
}

+ (void)readChildrenOfObject:(EshObject *)a3 toArray:(id)a4 state:(id)a5
{
  id v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a4;
  v7 = a5;
  v8 = (*((uint64_t (**)(EshObject *))a3->var0 + 5))(a3);
  if (v8)
  {
    v9 = 0;
    do
    {
      if (((*((uint64_t (**)(EshObject *, uint64_t))a3->var0 + 8))(a3, v9) & 0x1000) == 0)
      {
        v10 = (*((uint64_t (**)(EshObject *, uint64_t))a3->var0 + 6))(a3, v9);
        v11 = (*((uint64_t (**)(EshObject *, uint64_t))a3->var0 + 7))(a3, v9);
        v12 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initForExcelBinaryWithType:version:state:", v10, v11, v7);
        if (v12)
          objc_msgSend(v13, "addObject:", v12);

      }
      v9 = (v9 + 1);
    }
    while (v8 != (_DWORD)v9);
  }

}

@end

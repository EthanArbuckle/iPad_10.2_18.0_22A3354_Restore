@implementation SSEntity(VideosUI)

- (id)vui_valuesForProperties:()VideosUI
{
  id v4;
  size_t v5;
  size_t v6;
  id *v7;
  _QWORD *v8;
  id v9;
  uint64_t i;
  id v11;
  BOOL v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if (v5)
  {
    v6 = v5;
    v7 = (id *)malloc_type_calloc(v5, 8uLL, 0x80040B8603338uLL);
    v8 = malloc_type_calloc(v6, 8uLL, 0x80040B8603338uLL);
    objc_msgSend(v4, "getObjects:range:", v7, 0, v6);
    objc_msgSend(a1, "getValues:forProperties:count:", v8, v7, v6);
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    for (i = 0; i != v6; ++i)
    {
      v11 = v7[i];
      if (v11)
        v12 = v8[i] == 0;
      else
        v12 = 1;
      if (!v12)
        objc_msgSend(v9, "setObject:forKey:");

    }
    free(v7);
    free(v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end

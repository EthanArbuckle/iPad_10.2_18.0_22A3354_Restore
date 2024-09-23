@implementation NSArray

+ (id)ps_arrayWithSTLString:(const void *)a3
{
  uint64_t v4;
  uint64_t i;
  _QWORD *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  _QWORD *v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *__p;
  _QWORD *v16;
  unint64_t v17;
  id v18;

  __p = 0;
  v16 = 0;
  v17 = 0;
  sub_1000BDC34((uint64_t)&__p, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3));
  v4 = *(_QWORD *)a3;
  for (i = *((_QWORD *)a3 + 1); v4 != i; v4 += 24)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString ps_stringWithSTL:](NSString, "ps_stringWithSTL:", v4));
    v18 = v7;
    v8 = v16;
    if ((unint64_t)v16 < v17)
    {
      v18 = 0;
      *v16 = v7;
      v6 = v8 + 1;
    }
    else
    {
      v6 = sub_1002EC9A0(&__p, (uint64_t *)&v18);
    }
    v16 = v6;

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:"));
  v10 = __p;
  if (__p)
  {
    v11 = v16;
    v12 = __p;
    if (v16 != __p)
    {
      do
      {
        v13 = (void *)*--v11;

      }
      while (v11 != v10);
      v12 = __p;
    }
    v16 = v10;
    operator delete(v12);
  }
  return v9;
}

@end

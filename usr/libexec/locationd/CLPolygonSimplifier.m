@implementation CLPolygonSimplifier

+ (double)simplifiedLength:(id)a3 threshold:(double)a4 type:(int)a5
{
  uint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v15;
  void *__p;
  void *v17;
  uint64_t v18;
  void *v19;
  _BYTE *v20;
  uint64_t v21;

  v19 = 0;
  v20 = 0;
  v21 = 0;
  sub_10090446C((uint64_t *)&v19, (unint64_t)objc_msgSend(a3, "count"));
  if (v20 != v19)
  {
    v8 = 0;
    v9 = 0;
    do
    {
      objc_msgSend(objc_msgSend(a3, "objectAtIndex:", v9), "coordinate");
      v10 = (char *)v19 + v8;
      *(_QWORD *)v10 = v11;
      *((_QWORD *)v10 + 1) = v12;
      sub_100903250((double *)v10);
      ++v9;
      v8 += 24;
    }
    while (0xAAAAAAAAAAAAAAABLL * ((v20 - (_BYTE *)v19) >> 3) > v9);
  }
  __p = 0;
  v17 = 0;
  v18 = 0;
  v15 = 0.0;
  sub_100903488((uint64_t *)&__p, &v15, (uint64_t *)&v19, a5, a4);
  v13 = v15;
  if (__p)
  {
    v17 = __p;
    operator delete(__p);
  }
  if (v19)
  {
    v20 = v19;
    operator delete(v19);
  }
  return v13;
}

+ (double)simplifiedLength:(id)a3 threshold:(double)a4
{
  double result;

  _objc_msgSend(a1, "simplifiedLength:threshold:type:", a3, 0, a4);
  return result;
}

@end

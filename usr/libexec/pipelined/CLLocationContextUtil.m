@implementation CLLocationContextUtil

+ (BOOL)isRegional:(int64_t)a3
{
  return a3 == 1;
}

+ (BOOL)isIndoor:(int64_t)a3
{
  return a3 == 0;
}

+ (int64_t)convertFromProtoContext:(int)a3
{
  return a3 != 1;
}

+ (int64_t)convertFromLocationContext:(int)a3
{
  return a3 != 0;
}

+ (int64_t)getContextFromVenueBounds:(const void *)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t *v7;
  int v8;
  uint64_t v9;
  size_t v10;
  void **v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  uint64_t v18;
  void *__dst[2];
  unint64_t v21;
  uint64_t v22;
  std::__shared_weak_count *v23;

  if ((*((_BYTE *)a3 + 104) & 8) != 0)
    return (int64_t)objc_msgSend(a1, "convertFromProtoContext:", *((unsigned int *)a3 + 24));
  v4 = *((int *)a3 + 6);
  if (!(_DWORD)v4)
    return 0;
  v5 = (uint64_t *)*((_QWORD *)a3 + 2);
  v6 = 8 * v4;
  while (1)
  {
    v7 = (uint64_t *)*v5;
    v8 = *(char *)(*v5 + 23);
    if (v8 < 0)
      break;
    if (*(_BYTE *)v7 != 71)
    {
      v9 = *(unsigned __int8 *)(*v5 + 23);
      if ((_BYTE)v8)
      {
        v10 = v9 - 1;
        if ((unint64_t)(v9 - 1) < 0x7FFFFFFFFFFFFFF8)
          goto LABEL_10;
LABEL_29:
        sub_1000CDE30();
      }
LABEL_30:
      sub_10018CB84();
    }
LABEL_5:
    ++v5;
    v6 -= 8;
    if (!v6)
      return 0;
  }
  if (*(_BYTE *)*v7 == 71)
    goto LABEL_5;
  v18 = v7[1];
  if (!v18)
    goto LABEL_30;
  v7 = (uint64_t *)*v7;
  v10 = v18 - 1;
  if ((unint64_t)(v18 - 1) >= 0x7FFFFFFFFFFFFFF8)
    goto LABEL_29;
LABEL_10:
  if (v10 >= 0x17)
  {
    v12 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17)
      v12 = v10 | 7;
    v13 = v12 + 1;
    v11 = (void **)operator new(v12 + 1);
    __dst[1] = (void *)v10;
    v21 = v13 | 0x8000000000000000;
    __dst[0] = v11;
  }
  else
  {
    HIBYTE(v21) = v10;
    v11 = __dst;
    if (!v10)
      goto LABEL_19;
  }
  memmove(v11, (char *)v7 + 1, v10);
LABEL_19:
  *((_BYTE *)v11 + v10) = 0;
  sub_10008930C(&v22, (uint64_t)__dst);
  v14 = sub_100258E04((uint64_t)&v22);
  v15 = v23;
  if (v23)
  {
    p_shared_owners = (unint64_t *)&v23->__shared_owners_;
    do
      v17 = __ldaxr(p_shared_owners);
    while (__stlxr(v17 - 1, p_shared_owners));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  if (SHIBYTE(v21) < 0)
    operator delete(__dst[0]);
  return (int64_t)objc_msgSend(a1, "convertFromLocationContext:", v14);
}

@end

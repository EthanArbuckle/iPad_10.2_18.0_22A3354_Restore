@implementation ZN7AriHost21HandleConnectionErrorEv

_QWORD *___ZN7AriHost21HandleConnectionErrorEv_block_invoke(uint64_t a1)
{
  AriHost *v2;
  dispatch_group_t v3;
  std::__shared_weak_count *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  char *v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t *i;
  __int128 v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  _BYTE v23[24];
  _BYTE *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = *(AriHost **)(a1 + 48);
  *((_BYTE *)v2 + 704) = 0;
  AriHost::stallClients_nl(v2);
  v20 = (uint64_t)&v20;
  v21 = &v20;
  v22 = 0;
  v3 = dispatch_group_create();
  v4 = *(std::__shared_weak_count **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  *(_QWORD *)&v19 = v3;
  *((_QWORD *)&v19 + 1) = &v20;
  v24 = 0;
  v9 = (char *)operator new(0x28uLL);
  *(_QWORD *)v9 = &off_24C905FA0;
  *((_QWORD *)v9 + 1) = v6;
  *((_QWORD *)v9 + 2) = v4;
  if (v4)
  {
    v10 = (unint64_t *)&v4->__shared_owners_;
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }
  *(_OWORD *)(v9 + 24) = v19;
  v24 = v9;
  ResMgr<std::shared_ptr<AriHost::ClientData>>::doForEach(v5 + 424, (uint64_t)v23);
  v13 = v24;
  if (v24 == v23)
  {
    v14 = 4;
    v13 = v23;
    goto LABEL_11;
  }
  if (v24)
  {
    v14 = 5;
LABEL_11:
    (*(void (**)(_QWORD *, uint64_t))(*v13 + 8 * v14))(v13, v12);
  }
  if (v4)
  {
    v15 = (unint64_t *)&v4->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  for (i = v21; i != &v20; i = (uint64_t *)i[1])
    AriHost::nackResponseHandlers_nl(*(AriHost **)(a1 + 48), *((_DWORD *)i + 4), 4);
  return std::__list_imp<unsigned int>::clear(&v20);
}

@end

@implementation VKMapView(Munin)

- (uint64_t)muninMarkerAtCoordinate:()Munin completeMarkerHandler:
{

  return a1;
}

- (void)muninMarkerAtCoordinate:()Munin completeMarkerHandler:
{
  uint64_t *v4;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  char v12;
  uint64_t *v13;
  uint64_t **v14;
  uint64_t **v15;
  unint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  unint64_t *v19;
  unint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t **v28;
  BOOL v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v41;
  uint64_t v42;
  VKMuninMarker *v43;
  NSObject *v44;
  NSObject *v45;
  os_signpost_id_t v46;
  _QWORD *v47;
  _BYTE *v48;
  uint64_t v49;
  void *__p;
  void *v51;
  void *v52;
  void *v53;
  char v54;
  int v55;
  uint64_t v56;
  unint64_t v57;
  std::__shared_weak_count *v58;
  uint64_t **v59;
  uint64_t *v60;
  uint64_t v61;

  if (*a2)
    goto LABEL_76;
  v4 = *(uint64_t **)(a3 + 16);
  v60 = 0;
  v61 = 0;
  v59 = &v60;
  if (!v4)
  {
LABEL_75:
    std::__tree<gdc::LayerDataWithWorld>::destroy(v60);
LABEL_76:
    (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
    goto LABEL_77;
  }
  do
  {
    LOBYTE(__p) = *((_BYTE *)v4 + 16);
    gdc::LayerDataKey::LayerDataKey((uint64_t)&v51, (uint64_t)(v4 + 3));
    v54 = 0;
    if (*((_BYTE *)v4 + 112))
    {
      v55 = *((_DWORD *)v4 + 29);
      v54 = 1;
    }
    v5 = v4[16];
    v56 = v4[15];
    v57 = v5;
    v6 = (std::__shared_weak_count *)v4[17];
    v58 = v6;
    if (!v6)
    {
      v9 = 0;
LABEL_15:
      v12 = 1;
      goto LABEL_16;
    }
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
    v5 = v57;
    v9 = v58;
    if (!v58)
      goto LABEL_15;
    v10 = (unint64_t *)&v58->__shared_owners_;
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
    v12 = 0;
LABEL_16:
    v13 = v60;
    v14 = &v60;
    v15 = &v60;
    if (v60)
    {
      while (1)
      {
        while (1)
        {
          v15 = (uint64_t **)v13;
          v16 = v13[4];
          if (v5 >= v16)
            break;
          v13 = *v15;
          v14 = v15;
          if (!*v15)
            goto LABEL_23;
        }
        if (v16 >= v5)
          break;
        v13 = v15[1];
        if (!v13)
        {
          v14 = v15 + 1;
          goto LABEL_23;
        }
      }
    }
    else
    {
LABEL_23:
      v17 = (uint64_t *)operator new(0x30uLL);
      v18 = v17;
      v17[4] = v5;
      v17[5] = (uint64_t)v9;
      if ((v12 & 1) == 0)
      {
        v19 = (unint64_t *)&v9->__shared_owners_;
        do
          v20 = __ldxr(v19);
        while (__stxr(v20 + 1, v19));
      }
      *v17 = 0;
      v17[1] = 0;
      v17[2] = (uint64_t)v15;
      *v14 = v17;
      if (*v59)
      {
        v59 = (uint64_t **)*v59;
        v18 = *v14;
      }
      std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(v60, v18);
      ++v61;
    }
    if (!v9)
      goto LABEL_33;
    v21 = (unint64_t *)&v9->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
      v23 = v58;
      if (!v58)
        goto LABEL_39;
    }
    else
    {
LABEL_33:
      v23 = v58;
      if (!v58)
        goto LABEL_39;
    }
    v24 = (unint64_t *)&v23->__shared_owners_;
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
LABEL_39:
    if (v54)
      v54 = 0;
    if (v52 != v53)
      free(v52);
    v4 = (uint64_t *)*v4;
  }
  while (v4);
  v26 = (uint64_t *)v59;
  __p = 0;
  v51 = 0;
  v52 = 0;
  v47 = 0;
  v48 = 0;
  v49 = 0;
  if (v59 == &v60)
    goto LABEL_75;
  do
  {
    md::mun::MuninMetadata::neighborsWithinRadius(v26[4], (double *)(a1 + 16), (uint64_t)&v47, (uint64_t)&__p, 250.0);
    v27 = (uint64_t *)v26[1];
    if (v27)
    {
      do
      {
        v28 = (uint64_t **)v27;
        v27 = (uint64_t *)*v27;
      }
      while (v27);
    }
    else
    {
      do
      {
        v28 = (uint64_t **)v26[2];
        v29 = *v28 == v26;
        v26 = (uint64_t *)v28;
      }
      while (!v29);
    }
    v26 = (uint64_t *)v28;
  }
  while (v28 != &v60);
  v30 = v47;
  v31 = __p;
  if (v48 == (_BYTE *)v47)
  {
    if (!v47)
      goto LABEL_73;
    goto LABEL_72;
  }
  v32 = 0;
  v33 = 0;
  v34 = (v48 - (_BYTE *)v47) >> 3;
  if (v34 <= 1)
    v34 = 1;
  do
  {
    if (*((double *)__p + v33) < *((double *)__p + v32))
      v32 = v33;
    ++v33;
  }
  while (v34 != v33);
  v35 = 0;
  v36 = fmax(sqrt(*((double *)__p + v32)) * 1.2, 1.0);
  v37 = v36 * v36;
  v38 = v32;
  do
  {
    if (*((double *)__p + v35) <= v37)
    {
      v39 = *(_QWORD *)(v47[v35] + 80);
      if (v39 > *(_QWORD *)(v47[v38] + 80) && (unint64_t)(v39 - *(_QWORD *)(v47[v32] + 80)) > 0x240C8400)
        v38 = v35;
    }
    ++v35;
  }
  while (v34 != v35);
  v41 = v47[v38];
  if (!v41)
  {
LABEL_72:
    operator delete(v47);
    v31 = __p;
LABEL_73:
    if (v31)
    {
      v51 = v31;
      operator delete(v31);
    }
    goto LABEL_75;
  }
  v42 = *(_QWORD *)(a1 + 8);
  v43 = -[VKMuninMarker initWithCollectionPoint:]([VKMuninMarker alloc], "initWithCollectionPoint:", v41);
  (*(void (**)(uint64_t, VKMuninMarker *))(v42 + 16))(v42, v43);

  operator delete(v30);
  if (__p)
  {
    v51 = __p;
    operator delete(__p);
  }
  std::__tree<gdc::LayerDataWithWorld>::destroy(v60);
LABEL_77:
  if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_37931);
  v44 = (id)GEOGetVectorKitVKMapViewMuninLog(void)::log;
  v45 = v44;
  v46 = *(_QWORD *)(a1 + 32);
  if (v46 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
  {
    LOWORD(__p) = 0;
    _os_signpost_emit_with_name_impl(&dword_19F029000, v45, OS_SIGNPOST_INTERVAL_END, v46, "MarkerAtPoint", (const char *)&unk_1A0189141, (uint8_t *)&__p, 2u);
  }

}

- (_QWORD)muninMarkerAtCoordinate:()Munin completeMarkerHandler:
{
  _QWORD *v2;

  v2 = operator new(0x28uLL);
  *v2 = &off_1E42C7E08;
  v2[1] = MEMORY[0x1A1AF5730](*(_QWORD *)(a1 + 8));
  *((_OWORD *)v2 + 1) = *(_OWORD *)(a1 + 16);
  v2[4] = *(_QWORD *)(a1 + 32);
  return v2;
}

- (__n128)muninMarkerAtCoordinate:()Munin completeMarkerHandler:
{
  __n128 result;

  a2->n128_u64[0] = (unint64_t)&off_1E42C7E08;
  a2->n128_u64[1] = MEMORY[0x1A1AF5730](a1->n128_u64[1]);
  result = a1[1];
  a2[1] = result;
  a2[2].n128_u64[0] = a1[2].n128_u64[0];
  return result;
}

@end

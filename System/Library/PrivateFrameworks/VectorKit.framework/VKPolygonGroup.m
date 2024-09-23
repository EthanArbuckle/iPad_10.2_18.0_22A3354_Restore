@implementation VKPolygonGroup

- (void)sourceTexture
{
  return self->_sourceTexture.__ptr_;
}

- (void)targetTexture
{
  return self->_targetTexture.__ptr_;
}

- (void)sourceRoofTexture
{
  return self->_sourceRoofTexture.__ptr_;
}

- (void)targetRoofTexture
{
  return self->_targetRoofTexture.__ptr_;
}

- (VKPolygonGroup)initWithStyleQuery:(void *)a3 tileZoom:(float)a4 fixedAroundCentroid:(const void *)a5 contentScale:(float)a6
{
  VKPolygonGroup *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  uint64_t v11;
  std::__shared_weak_count *v12;

  v11 = 0;
  v12 = 0;
  v6 = -[VKPolygonGroup initWithStyleQuery:tileZoom:fixedAroundCentroid:contentScale:storage:](self, "initWithStyleQuery:tileZoom:fixedAroundCentroid:contentScale:storage:", a3, a5, &v11);
  v7 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

  return v6;
}

- (VKPolygonGroup)initWithStyleQuery:(void *)a3 tileZoom:(float)a4 fixedAroundCentroid:(const void *)a5 contentScale:(float)a6 storage:(shared_ptr<md::MeshSetStorage>)a7
{
  MeshSetStorage *ptr;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  VKPolygonGroup *v11;
  VKPolygonGroup *v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  unint64_t *v19;
  char *v20;
  uint64_t *v21;
  uint64_t **v22;
  uint64_t **v23;
  unint64_t v24;
  uint64_t *v25;
  uint64_t *v26;
  unint64_t v27;
  uint64_t v28;
  __int128 v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  char *v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char *v44;
  char *v45;
  char *v46;
  unint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  __int128 v52;
  uint64_t v53;
  void **p_value;
  void *v55;
  void **v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  std::__shared_weak_count *v60;
  unint64_t *v61;
  unint64_t v62;
  __int128 v63;
  uint64_t v64;
  uint64_t v65;
  __int128 v66;
  std::__shared_weak_count *v67;
  unint64_t *v68;
  unint64_t v69;
  _OWORD v71[3];
  _OWORD v72[2];
  __int16 v73;
  uint64_t v74;
  _OWORD v75[2];
  __int16 v76;
  uint64_t v77;
  _OWORD v78[3];
  objc_super v79;
  uint64_t v80;
  std::__shared_weak_count *v81;
  __int128 v82;

  ptr = a7.__ptr_;
  v8 = (std::__shared_weak_count *)*((_QWORD *)a7.__ptr_ + 1);
  v80 = *(_QWORD *)a7.__ptr_;
  v81 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  v79.receiver = self;
  v79.super_class = (Class)VKPolygonGroup;
  v11 = -[VKPolygonalItemGroup initWithStyleQuery:tileZoom:fixedAroundCentroid:contentScale:storage:](&v79, sel_initWithStyleQuery_tileZoom_fixedAroundCentroid_contentScale_storage_, a3, a5, &v80, a7.__cntrl_);
  v12 = v11;
  v13 = v81;
  if (!v81)
    goto LABEL_8;
  v14 = (unint64_t *)&v81->__shared_owners_;
  do
    v15 = __ldaxr(v14);
  while (__stlxr(v15 - 1, v14));
  if (!v15)
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
    if (!v12)
      return v12;
  }
  else
  {
LABEL_8:
    if (!v11)
      return v12;
  }
  v12->_lastResolvedZoom = -1;
  v16 = *(_QWORD *)ptr;
  LOBYTE(v78[0]) = 0;
  memset((char *)v78 + 2, 0, 38);
  memset(v71, 0, sizeof(v71));
  v72[0] = 0u;
  v77 = 0;
  v75[0] = 0uLL;
  v74 = 0;
  *((_QWORD *)&v78[0] + 1) = v16;
  if (!v16)
  {
    v16 = operator new();
    *(_QWORD *)(v16 + 160) = 0;
    *(_QWORD *)(v16 + 168) = 0;
    *(_OWORD *)(v16 + 128) = 0u;
    *(_OWORD *)(v16 + 144) = 0u;
    *(_OWORD *)(v16 + 96) = 0u;
    *(_OWORD *)(v16 + 112) = 0u;
    *(_OWORD *)(v16 + 64) = 0u;
    *(_OWORD *)(v16 + 80) = 0u;
    *(_OWORD *)(v16 + 32) = 0u;
    *(_OWORD *)(v16 + 48) = 0u;
    *(_OWORD *)v16 = 0u;
    *(_OWORD *)(v16 + 16) = 0u;
    *(_QWORD *)(v16 + 16) = v16 + 24;
    *(_QWORD *)(v16 + 120) = 0;
    *(_QWORD *)(v16 + 128) = 0;
    *(_QWORD *)(v16 + 136) = 0;
    v17 = *(_QWORD *)&v78[1];
    *(_QWORD *)&v78[1] = v16;
    if (v17)
      std::default_delete<md::MeshSetStorage>::operator()[abi:nn180100](v17);
    *((_QWORD *)&v78[0] + 1) = v16;
  }
  v18 = (char *)operator new(0x90uLL);
  *((_QWORD *)v18 + 1) = 0;
  v19 = (unint64_t *)(v18 + 8);
  *((_QWORD *)v18 + 2) = 0;
  *(_QWORD *)v18 = &off_1E42DC3C0;
  *((_QWORD *)v18 + 3) = v16;
  v20 = v18 + 24;
  *((_QWORD *)v18 + 4) = 24;
  *(_OWORD *)(v18 + 40) = 0u;
  *(_OWORD *)(v18 + 56) = 0u;
  *(_OWORD *)(v18 + 72) = 0u;
  *(_OWORD *)(v18 + 88) = 0u;
  v18[104] = 0;
  *((_QWORD *)v18 + 14) = &off_1E42CBFD8;
  *((_QWORD *)v18 + 17) = v18 + 112;
  *(_QWORD *)&v82 = v18 + 24;
  *((_QWORD *)&v82 + 1) = v18;
  v22 = (uint64_t **)(v16 + 24);
  v21 = *(uint64_t **)(v16 + 24);
  if (v21)
  {
    while (1)
    {
      while (1)
      {
        v23 = (uint64_t **)v21;
        v24 = v21[4];
        if ((unint64_t)v20 >= v24)
          break;
        v21 = *v23;
        v22 = v23;
        if (!*v23)
          goto LABEL_20;
      }
      if (v24 >= (unint64_t)v20)
        break;
      v21 = v23[1];
      if (!v21)
      {
        v22 = v23 + 1;
        goto LABEL_20;
      }
    }
  }
  else
  {
    v23 = (uint64_t **)(v16 + 24);
LABEL_20:
    v25 = (uint64_t *)operator new(0x30uLL);
    v26 = v25;
    v25[4] = (uint64_t)v20;
    v25[5] = (uint64_t)v18;
    do
      v27 = __ldxr(v19);
    while (__stxr(v27 + 1, v19));
    *v25 = 0;
    v25[1] = 0;
    v25[2] = (uint64_t)v23;
    *v22 = v25;
    v28 = **(_QWORD **)(v16 + 16);
    if (v28)
    {
      *(_QWORD *)(v16 + 16) = v28;
      v26 = *v22;
    }
    std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(v16 + 24), v26);
    ++*(_QWORD *)(v16 + 32);
  }
  v29 = v82;
  v82 = 0uLL;
  v30 = *(std::__shared_weak_count **)&v78[2];
  *(_OWORD *)((char *)&v78[1] + 8) = v29;
  if (v30)
  {
    v31 = (unint64_t *)&v30->__shared_owners_;
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }
  v33 = (std::__shared_weak_count *)*((_QWORD *)&v82 + 1);
  if (*((_QWORD *)&v82 + 1))
  {
    v34 = (unint64_t *)(*((_QWORD *)&v82 + 1) + 8);
    do
      v35 = __ldaxr(v34);
    while (__stlxr(v35 - 1, v34));
    if (!v35)
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }
  v36 = (char *)*((_QWORD *)&v71[0] + 1);
  if (*((_QWORD *)&v71[0] + 1) >= *(_QWORD *)&v71[1])
  {
    v38 = *(char **)&v71[0];
    v39 = *((_QWORD *)&v71[0] + 1) - *(_QWORD *)&v71[0];
    v40 = (uint64_t)(*((_QWORD *)&v71[0] + 1) - *(_QWORD *)&v71[0]) >> 3;
    v41 = v40 + 1;
    if ((unint64_t)(v40 + 1) >> 61)
      abort();
    v42 = *(_QWORD *)&v71[1] - *(_QWORD *)&v71[0];
    if ((uint64_t)(*(_QWORD *)&v71[1] - *(_QWORD *)&v71[0]) >> 2 > v41)
      v41 = v42 >> 2;
    if ((unint64_t)v42 >= 0x7FFFFFFFFFFFFFF8)
      v43 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v43 = v41;
    if (v43 >> 61)
      std::__throw_bad_array_new_length[abi:nn180100]();
    v44 = (char *)operator new(8 * v43);
    v45 = &v44[8 * v40];
    v46 = &v44[8 * v43];
    *(_WORD *)v45 = 0;
    *((_DWORD *)v45 + 1) = 0;
    v37 = v45 + 8;
    if (v36 != v38)
    {
      v47 = v36 - v38 - 8;
      if (v47 < 0x58)
        goto LABEL_83;
      if ((unint64_t)(&v36[-v39] - v44) < 0x20)
        goto LABEL_83;
      v48 = (v47 >> 3) + 1;
      v49 = &v44[8 * v40 - 16];
      v50 = v36 - 16;
      v51 = v48 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v52 = *(_OWORD *)v50;
        *((_OWORD *)v49 - 1) = *((_OWORD *)v50 - 1);
        *(_OWORD *)v49 = v52;
        v49 -= 32;
        v50 -= 32;
        v51 -= 4;
      }
      while (v51);
      v45 -= 8 * (v48 & 0x3FFFFFFFFFFFFFFCLL);
      v36 -= 8 * (v48 & 0x3FFFFFFFFFFFFFFCLL);
      if (v48 != (v48 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_83:
        do
        {
          v53 = *((_QWORD *)v36 - 1);
          v36 -= 8;
          *((_QWORD *)v45 - 1) = v53;
          v45 -= 8;
        }
        while (v36 != v38);
      }
    }
    *(_QWORD *)&v71[0] = v45;
    *((_QWORD *)&v71[0] + 1) = v37;
    *(_QWORD *)&v71[1] = v46;
    if (v38)
      operator delete(v38);
  }
  else
  {
    **((_WORD **)&v71[0] + 1) = 0;
    *((_DWORD *)v36 + 1) = 0;
    v37 = v36 + 8;
  }
  *((_QWORD *)&v71[0] + 1) = v37;
  p_value = (void **)&v12->_strokeMeshInfo._value;
  if (v12->_strokeMeshInfo._hasValue)
  {
    v55 = *p_value;
    if (*p_value)
    {
      *(_QWORD *)v12->_anon_b28 = v55;
      operator delete(v55);
      *p_value = 0;
      *(_QWORD *)v12->_anon_b28 = 0;
      *(_QWORD *)&v12->_anon_b28[8] = 0;
    }
    *(_OWORD *)v12->_strokeMeshInfo._value.data = v71[0];
    *(_QWORD *)&v12->_anon_b28[8] = *(_QWORD *)&v71[1];
    memset(v71, 0, 24);
    v56 = (void **)&v12->_anon_b28[16];
    v57 = *(_QWORD *)&v12->_anon_b28[16];
    if (v57)
    {
      v58 = *(_QWORD *)&v12->_anon_b28[24];
      v59 = *(void **)&v12->_anon_b28[16];
      if (v58 != v57)
      {
        do
        {
          v60 = *(std::__shared_weak_count **)(v58 - 8);
          if (v60)
          {
            v61 = (unint64_t *)&v60->__shared_owners_;
            do
              v62 = __ldaxr(v61);
            while (__stlxr(v62 - 1, v61));
            if (!v62)
            {
              ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
              std::__shared_weak_count::__release_weak(v60);
            }
          }
          v58 -= 16;
        }
        while (v58 != v57);
        v59 = *v56;
      }
      *(_QWORD *)&v12->_anon_b28[24] = v57;
      operator delete(v59);
      *v56 = 0;
      *(_QWORD *)&v12->_anon_b28[24] = 0;
      *(_QWORD *)&v12->_anon_b28[32] = 0;
    }
    *(_OWORD *)&v12->_anon_b28[16] = *(_OWORD *)((char *)&v71[1] + 8);
    *(_QWORD *)&v12->_anon_b28[32] = *((_QWORD *)&v71[2] + 1);
    memset((char *)&v71[1] + 8, 0, 24);
    ggl::BufferMemory::operator=((uint64_t *)&v12->_anon_b28[40], (uint64_t)v72);
    ggl::BufferMemory::operator=((uint64_t *)&v12->_anon_b28[88], (uint64_t)v75);
    *(_OWORD *)&v12->_anon_b28[136] = v78[0];
    v64 = *(_QWORD *)&v78[1];
    *(_QWORD *)&v78[1] = 0;
    v65 = *(_QWORD *)&v12->_anon_b28[152];
    *(_QWORD *)&v12->_anon_b28[152] = v64;
    if (v65)
      std::default_delete<md::MeshSetStorage>::operator()[abi:nn180100](v65);
    v66 = *(_OWORD *)((char *)&v78[1] + 8);
    *((_QWORD *)&v78[1] + 1) = 0;
    *(_QWORD *)&v78[2] = 0;
    v67 = *(std::__shared_weak_count **)&v12->_anon_b28[168];
    *(_OWORD *)&v12->_anon_b28[160] = v66;
    if (v67)
    {
      v68 = (unint64_t *)&v67->__shared_owners_;
      do
        v69 = __ldaxr(v68);
      while (__stlxr(v69 - 1, v68));
      if (!v69)
      {
        ((void (*)(std::__shared_weak_count *))v67->__on_zero_shared)(v67);
        std::__shared_weak_count::__release_weak(v67);
      }
    }
  }
  else
  {
    *p_value = 0;
    *(_QWORD *)v12->_anon_b28 = 0;
    *(_QWORD *)&v12->_anon_b28[8] = 0;
    *(_OWORD *)v12->_strokeMeshInfo._value.data = v71[0];
    *(_QWORD *)&v12->_anon_b28[8] = *(_QWORD *)&v71[1];
    memset(v71, 0, 24);
    *(_QWORD *)&v12->_anon_b28[16] = 0;
    *(_QWORD *)&v12->_anon_b28[24] = 0;
    *(_QWORD *)&v12->_anon_b28[32] = 0;
    *(_OWORD *)&v12->_anon_b28[16] = *(_OWORD *)((char *)&v71[1] + 8);
    *(_QWORD *)&v12->_anon_b28[32] = *((_QWORD *)&v71[2] + 1);
    memset((char *)&v71[1] + 8, 0, 24);
    *(_OWORD *)&v12->_anon_b28[40] = v72[0];
    *(_OWORD *)&v12->_anon_b28[56] = v72[1];
    *(_WORD *)&v12->_anon_b28[72] = v73;
    *(_QWORD *)&v12->_anon_b28[80] = v74;
    v74 = 0;
    v72[0] = 0uLL;
    *(_OWORD *)&v12->_anon_b28[88] = v75[0];
    *(_OWORD *)&v12->_anon_b28[104] = v75[1];
    *(_WORD *)&v12->_anon_b28[120] = v76;
    *(_QWORD *)&v12->_anon_b28[128] = v77;
    v77 = 0;
    v75[0] = 0uLL;
    *(_OWORD *)&v12->_anon_b28[136] = v78[0];
    v63 = v78[1];
    *(_QWORD *)&v78[1] = 0;
    *(_OWORD *)&v12->_anon_b28[152] = v63;
    *(_QWORD *)&v12->_anon_b28[168] = *(_QWORD *)&v78[2];
    *((_QWORD *)&v78[1] + 1) = 0;
    *(_QWORD *)&v78[2] = 0;
    v12->_strokeMeshInfo._hasValue = 1;
  }
  md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)v71);
  return v12;
}

- (shared_ptr<ggl::Texture2D>)_textureForName:(const void *)a3 textureManager:(void *)a4
{
  _QWORD *v4;
  _QWORD *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  uint64_t *v11;
  float contentScale;
  unint64_t v13;
  Texture2D *v14;
  __shared_weak_count *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  uint64_t v28[2];
  uint64_t v29;
  std::__shared_weak_count *v30;
  std::__shared_weak_count *v31;
  std::__shared_weak_count *v32;
  shared_ptr<ggl::Texture2D> result;

  v8 = v4;
  v9 = (std::__shared_weak_count *)operator new(0x58uLL);
  v9->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v9->__shared_owners_;
  v9->__shared_weak_owners_ = 0;
  v9->__vftable = (std::__shared_weak_count_vtbl *)&off_1E42DED18;
  v9[1].__shared_weak_owners_ = 0;
  v9[2].__vftable = 0;
  v9[1].__shared_owners_ = 0;
  LODWORD(v9[2].__shared_owners_) = 0;
  v9[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1E42B63B0;
  *(_OWORD *)((char *)&v9[2].__shared_owners_ + 4) = xmmword_19FFB2EA0;
  *(std::__shared_weak_count_vtbl **)((char *)&v9[3].__vftable + 4) = (std::__shared_weak_count_vtbl *)0x100000001;
  HIDWORD(v9[3].__shared_owners_) = 0;
  v31 = v9 + 1;
  v32 = v9;
  v11 = *(uint64_t **)a4;
  contentScale = self->super._contentScale;
  v28[0] = (uint64_t)&v9[1];
  v28[1] = (uint64_t)v9;
  do
    v13 = __ldxr(p_shared_owners);
  while (__stxr(v13 + 1, p_shared_owners));
  md::TextureManager::texture(&v29, v11, (uint64_t)a3, v28, 0, contentScale);
  do
    v16 = __ldaxr(p_shared_owners);
  while (__stlxr(v16 - 1, p_shared_owners));
  if (v16)
  {
    v17 = v29;
    if (v29)
      goto LABEL_7;
LABEL_13:
    *v8 = 0;
    v8[1] = 0;
    v22 = v30;
    if (!v30)
      goto LABEL_18;
    goto LABEL_14;
  }
  ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
  std::__shared_weak_count::__release_weak(v9);
  v17 = v29;
  if (!v29)
    goto LABEL_13;
LABEL_7:
  v19 = *(_QWORD *)(v17 + 32);
  v18 = *(_QWORD *)(v17 + 40);
  *v8 = v19;
  v8[1] = v18;
  if (v18)
  {
    v20 = (unint64_t *)(v18 + 8);
    do
      v21 = __ldxr(v20);
    while (__stxr(v21 + 1, v20));
  }
  v22 = v30;
  if (v30)
  {
LABEL_14:
    v23 = (unint64_t *)&v22->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
LABEL_18:
  v25 = v32;
  if (v32)
  {
    v26 = (unint64_t *)&v32->__shared_owners_;
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }
  result.__cntrl_ = v15;
  result.__ptr_ = v14;
  return result;
}

- (FeatureAttributeSet)styleAttributes
{
  return (FeatureAttributeSet *)md::createFeatureAttributeSet((gss::Allocator *)retstr, *(uint64_t **)(-[VKPolygonalItemGroup attributeSets](self, "attributeSets") + 24));
}

- (void)setNeedsTextureUpdate
{
  self->_lastResolvedZoom = -1;
}

- (void)updateTexturesIfNecessary:(float)a3 textureManager:(void *)a4
{
  if (self->_lastResolvedZoom != (int)a3)
    -[VKPolygonGroup updateTextures:textureManager:](self, "updateTextures:textureManager:");
}

- (void)strokeMeshes
{
  return &self->_strokeMeshes;
}

- (unsigned)createStrokePointStyleList:(void *)a3 section:(unint64_t)a4 outPointStyles:(void *)a5 withRounder:(PolygonRound *)a6
{
  unint64_t v10;
  unsigned int *v11;
  unsigned int v12;
  unint64_t v13;
  unint64_t v14;
  unsigned int *v15;
  unsigned int v16;
  int32x4_t v17;
  unint64_t v18;
  unsigned int v19;
  unint64_t v20;
  unint64_t v21;
  char *v22;
  unint64_t v23;
  unint64_t v24;
  char *v25;
  int v26;
  char *v27;
  char *v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  float *v35;
  float *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  char *v42;
  unint64_t v43;
  char *v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  char *v48;
  char *v49;
  char *i;
  uint64_t v51;
  int v52;
  char *v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  char *v59;
  char *v60;
  char *j;
  uint64_t v62;
  int v63;
  char *v64;
  char *v65;
  unint64_t v67;
  _QWORD *v68;
  char *StrokeSpecifications;
  PolygonRound *v70;
  char *CharacteristicPoints;
  unint64_t v72;
  unint64_t v73;
  uint64_t __p;
  float *__pa;
  unint64_t v76;
  uint64_t v77;
  int v78;
  float *v79;
  float *v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  _QWORD v84[5];

  v84[3] = *MEMORY[0x1E0C80C00];
  v83 = 0;
  StrokeSpecifications = geo::codec::polygonFeatureGetStrokeSpecifications(a3, (uint64_t *)&v83);
  v82 = 0;
  CharacteristicPoints = geo::codec::polygonFeatureGetCharacteristicPoints(a3, (uint64_t *)&v82);
  if (v83)
  {
    v10 = 0;
    v11 = (unsigned int *)(StrokeSpecifications + 4);
    while (1)
    {
      v12 = *v11;
      v11 += 4;
      if (v12 >= a4)
        break;
      if (v83 == ++v10)
      {
        v10 = v83;
        break;
      }
    }
    v13 = v82;
    if (v82)
      goto LABEL_7;
  }
  else
  {
    v10 = 0;
    v13 = v82;
    if (v82)
    {
LABEL_7:
      v14 = 0;
      v15 = (unsigned int *)(CharacteristicPoints + 8);
      while (1)
      {
        v16 = *v15;
        v15 += 25;
        if (v16 >= a4)
          goto LABEL_13;
        if (v13 == ++v14)
        {
          v14 = v13;
          goto LABEL_13;
        }
      }
    }
  }
  v14 = 0;
LABEL_13:
  v81 = 0;
  v68 = geo::codec::multiSectionFeaturePoints(a3, a4, &v81);
  v18 = v81;
  if (v81 < 3)
  {
    v19 = 0;
    v64 = *(char **)a5;
    *v64 = 0;
    *(_QWORD *)(v64 + 4) = 56;
    return v19;
  }
  v19 = 0;
  v20 = 0;
  v77 = 0;
  v21 = v14;
  v70 = a6;
  v67 = a4;
  do
  {
    if (v10 < v83)
    {
      v22 = &StrokeSpecifications[16 * v10];
      if (*((_DWORD *)v22 + 1) == a4 && v20 == *((_DWORD *)v22 + 2))
      {
        v77 = *(unsigned int *)&StrokeSpecifications[16 * v10++ + 12];
        LODWORD(v23) = 1;
        v78 = 1;
        if (a6)
          goto LABEL_40;
        goto LABEL_21;
      }
    }
    if (v21 >= v82
      || (v28 = &CharacteristicPoints[100 * v21], *((_DWORD *)v28 + 2) != a4)
      || v20 != *((_DWORD *)v28 + 3))
    {
      if (!v21
        || (v30 = &CharacteristicPoints[100 * v21], *((_DWORD *)v30 - 23) != a4)
        || (v31 = v30 - 100, v20 != *((_DWORD *)v31 + 3) + 1))
      {
        LODWORD(v23) = 0;
        v78 = 0;
        if (a6)
          goto LABEL_40;
        goto LABEL_21;
      }
      LODWORD(v23) = v31[28] & 1;
      if ((v31[28] & 1) != 0)
        v32 = 0;
      else
        v32 = v77;
      v77 = v32;
      v78 = v23;
      if (!a6)
        goto LABEL_21;
LABEL_40:
      v76 = v21;
      v33 = v20 + 1;
      v34 = v68[(v20 + 1) % v18];
      v17.i64[0] = v68[v20];
      v84[0] = v68[(v20 + v18 - 1) % v18];
      v84[1] = v17.i64[0];
      __p = v17.i64[0];
      v84[2] = v34;
      if ((vmaxv_u16((uint16x4_t)vmovn_s32(vceqq_f32((float32x4_t)vzip1q_s32(v17, v17), (float32x4_t)xmmword_19FFB5FF0))) & 1) != 0)
      {
        v35 = (float *)operator new(8uLL);
        *(_QWORD *)v35 = __p;
        v36 = v35 + 2;
        LODWORD(v23) = v78;
      }
      else
      {
        md::PolygonRound::smoothTwoSegments(&v79, &a6->var0, (float *)v84);
        v35 = v79;
        v36 = v80;
        if (v80 == v79)
        {
LABEL_63:
          if (v35)
            operator delete(v35);
          v20 = v33;
          v21 = v76;
          goto LABEL_16;
        }
      }
      v72 = v20 + 1;
      v73 = v10;
      v37 = 0;
      __pa = v35;
      v38 = ((char *)v36 - (char *)v35) >> 3;
      v39 = (v77 << 32) | 0x38;
      v40 = v23 + 1;
      if (v38 <= 1)
        v41 = 1;
      else
        v41 = v38;
      v42 = (char *)*((_QWORD *)a5 + 1);
      do
      {
        v43 = *((_QWORD *)a5 + 2);
        if ((unint64_t)v42 < v43)
        {
          *v42 = v23;
          *(_QWORD *)(v42 + 4) = v39;
          v42 += 12;
        }
        else
        {
          v44 = *(char **)a5;
          v23 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v42[-*(_QWORD *)a5] >> 2);
          v45 = v23 + 1;
          if (v23 + 1 > 0x1555555555555555)
            abort();
          v46 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v43 - (_QWORD)v44) >> 2);
          if (2 * v46 > v45)
            v45 = 2 * v46;
          if (v46 >= 0xAAAAAAAAAAAAAAALL)
            v47 = 0x1555555555555555;
          else
            v47 = v45;
          if (v47 > 0x1555555555555555)
            goto LABEL_83;
          v48 = (char *)operator new(12 * v47);
          v49 = &v48[12 * v23];
          LOBYTE(v23) = v78;
          *v49 = v78;
          *(_QWORD *)(v49 + 4) = v39;
          for (i = v49; v42 != v44; *((_DWORD *)i + 2) = v52)
          {
            v51 = *(_QWORD *)(v42 - 12);
            v42 -= 12;
            v52 = *((_DWORD *)v42 + 2);
            *(_QWORD *)(i - 12) = v51;
            i -= 12;
          }
          v42 = v49 + 12;
          *(_QWORD *)a5 = i;
          *((_QWORD *)a5 + 1) = v49 + 12;
          *((_QWORD *)a5 + 2) = &v48[12 * v47];
          if (v44)
            operator delete(v44);
        }
        *((_QWORD *)a5 + 1) = v42;
        v19 += v40;
        ++v37;
      }
      while (v37 != v41);
      a6 = v70;
      a4 = v67;
      v33 = v72;
      v10 = v73;
      v35 = __pa;
      goto LABEL_63;
    }
    LODWORD(v23) = v28[28] & 1;
    if ((v28[28] & 1) != 0)
      v29 = 1;
    else
      v29 = v77;
    v77 = v29;
    ++v21;
    v78 = v23;
    if (a6)
      goto LABEL_40;
LABEL_21:
    v25 = (char *)*((_QWORD *)a5 + 1);
    v24 = *((_QWORD *)a5 + 2);
    if ((unint64_t)v25 >= v24)
    {
      v53 = *(char **)a5;
      v54 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v25[-*(_QWORD *)a5] >> 2);
      v55 = v54 + 1;
      if (v54 + 1 > 0x1555555555555555)
        abort();
      v56 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v24 - (_QWORD)v53) >> 2);
      if (2 * v56 > v55)
        v55 = 2 * v56;
      if (v56 >= 0xAAAAAAAAAAAAAAALL)
        v57 = 0x1555555555555555;
      else
        v57 = v55;
      if (v57 > 0x1555555555555555)
LABEL_83:
        std::__throw_bad_array_new_length[abi:nn180100]();
      v58 = v21;
      v59 = (char *)operator new(12 * v57);
      v60 = &v59[12 * v54];
      *v60 = v78;
      *(_QWORD *)(v60 + 4) = (v77 << 32) | 0x38;
      for (j = v60; v25 != v53; *((_DWORD *)j + 2) = v63)
      {
        v62 = *(_QWORD *)(v25 - 12);
        v25 -= 12;
        v63 = *((_DWORD *)v25 + 2);
        *(_QWORD *)(j - 12) = v62;
        j -= 12;
      }
      v27 = v60 + 12;
      *(_QWORD *)a5 = j;
      *((_QWORD *)a5 + 1) = v60 + 12;
      *((_QWORD *)a5 + 2) = &v59[12 * v57];
      if (v53)
        operator delete(v53);
      v21 = v58;
      a6 = v70;
      v26 = v78;
    }
    else
    {
      *v25 = v23;
      *(_QWORD *)(v25 + 4) = (v77 << 32) | 0x38;
      v26 = v23;
      v27 = v25 + 12;
    }
    *((_QWORD *)a5 + 1) = v27;
    v19 += v26 + 1;
    ++v20;
LABEL_16:
    v18 = v81;
  }
  while (v20 < v81);
  v65 = *(char **)a5;
  if (*(_DWORD *)(*((_QWORD *)a5 + 1) - 4) != *(_DWORD *)(*(_QWORD *)a5 + 8) && !*v65)
  {
    *v65 = 1;
    ++v19;
  }
  return v19;
}

- (void)prepareForPolygon:(void *)a3 withRounder:(PolygonRound *)a4
{
  uint64_t v7;
  char *StrokeSpecifications;
  unint64_t i;
  uint64_t v10;
  void **v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  int *v15;
  int v16;
  unsigned __int8 v17;
  int *v18;
  int v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  void **v28;
  uint64_t v29;
  _DWORD *v30;
  uint64_t v31;
  int *v32;
  int v33;
  unsigned __int8 v34;
  int *v35;
  int v36;
  unint64_t *v37;
  unint64_t v38;
  std::__shared_weak_count *v39;
  unint64_t *v40;
  unint64_t v41;
  unint64_t j;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  _QWORD v49[2];
  void *__p;
  std::__shared_weak_count *v51;
  uint64_t v52;
  unint64_t v53;
  void **v54;
  std::__shared_weak_count *v55;
  unint64_t v56;

  v7 = *((unsigned int *)a3 + 25);
  v56 = 0;
  StrokeSpecifications = geo::codec::polygonFeatureGetStrokeSpecifications(a3, (uint64_t *)&v56);
  -[VKPolygonalItemGroup indexForGeoFeatureAttributes:](self, "indexForGeoFeatureAttributes:", (char *)a3 + 24);
  if (v56)
  {
    for (i = 0; i < v56; ++i)
    {
      v10 = *(unsigned int *)&StrokeSpecifications[16 * i + 12];
      geo::codec::copyFeatureStyleAttributes((uint64_t *)a3 + 3, &__p);
      v11 = (void **)__p;
      v12 = *((unsigned __int8 *)__p + 33);
      v13 = *(int **)__p;
      if (*((_BYTE *)__p + 33))
      {
        if (v12 >= 0x20)
        {
          v14 = 0;
          v18 = *(int **)__p;
          while (1)
          {
            v19 = *v18;
            v18 += 2;
            if (v19 == 56)
              break;
            if (v12 == ++v14)
              goto LABEL_15;
          }
        }
        else
        {
          v14 = 0;
          v15 = *(int **)__p;
          while (1)
          {
            v16 = *v15;
            v15 += 2;
            if (v16 == 56)
              break;
            if (v12 == ++v14)
              goto LABEL_9;
          }
        }
        v13[2 * v14 + 1] = v10;
      }
      else
      {
LABEL_9:
        *(_QWORD *)&v13[2 * v12] = (v10 << 32) | 0x38;
        v17 = *((_BYTE *)v11 + 33) + 1;
        *((_BYTE *)v11 + 33) = v17;
        qsort(*v11, v17, 8uLL, (int (__cdecl *)(const void *, const void *))FeatureStyleAttributes::compareStylePairs);
        v11 = (void **)__p;
      }
LABEL_15:
      v54 = v11;
      v55 = v51;
      if (v51)
      {
        p_shared_owners = (unint64_t *)&v51->__shared_owners_;
        do
          v21 = __ldxr(p_shared_owners);
        while (__stxr(v21 + 1, p_shared_owners));
      }
      -[VKPolygonalItemGroup indexForGeoFeatureAttributes:](self, "indexForGeoFeatureAttributes:", &v54);
      v22 = v55;
      if (!v55)
        goto LABEL_22;
      v23 = (unint64_t *)&v55->__shared_owners_;
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
        v25 = v51;
        if (v51)
        {
LABEL_23:
          v26 = (unint64_t *)&v25->__shared_owners_;
          do
            v27 = __ldaxr(v26);
          while (__stlxr(v27 - 1, v26));
          if (!v27)
          {
            ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
            std::__shared_weak_count::__release_weak(v25);
          }
        }
      }
      else
      {
LABEL_22:
        v25 = v51;
        if (v51)
          goto LABEL_23;
      }
    }
  }
  geo::codec::copyFeatureStyleAttributes((uint64_t *)a3 + 3, &v54);
  v28 = v54;
  v29 = *((unsigned __int8 *)v54 + 33);
  v30 = *v54;
  if (*((_BYTE *)v54 + 33))
  {
    if (v29 >= 0x20)
    {
      v31 = 0;
      v35 = (int *)*v54;
      while (1)
      {
        v36 = *v35;
        v35 += 2;
        if (v36 == 56)
          break;
        if (v29 == ++v31)
          goto LABEL_40;
      }
    }
    else
    {
      v31 = 0;
      v32 = (int *)*v54;
      while (1)
      {
        v33 = *v32;
        v32 += 2;
        if (v33 == 56)
          break;
        if (v29 == ++v31)
          goto LABEL_34;
      }
    }
    v30[2 * v31 + 1] = 1;
  }
  else
  {
LABEL_34:
    *(_QWORD *)&v30[2 * v29] = 0x100000038;
    v34 = *((_BYTE *)v28 + 33) + 1;
    *((_BYTE *)v28 + 33) = v34;
    qsort(*v28, v34, 8uLL, (int (__cdecl *)(const void *, const void *))FeatureStyleAttributes::compareStylePairs);
    v28 = v54;
  }
LABEL_40:
  __p = v28;
  v51 = v55;
  if (v55)
  {
    v37 = (unint64_t *)&v55->__shared_owners_;
    do
      v38 = __ldxr(v37);
    while (__stxr(v38 + 1, v37));
  }
  -[VKPolygonalItemGroup indexForGeoFeatureAttributes:](self, "indexForGeoFeatureAttributes:", &__p);
  v39 = v51;
  if (!v51)
    goto LABEL_47;
  v40 = (unint64_t *)&v51->__shared_owners_;
  do
    v41 = __ldaxr(v40);
  while (__stlxr(v41 - 1, v40));
  if (!v41)
  {
    ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
    std::__shared_weak_count::__release_weak(v39);
    if (!(_DWORD)v7)
      goto LABEL_58;
  }
  else
  {
LABEL_47:
    if (!(_DWORD)v7)
      goto LABEL_58;
  }
  for (j = 0; j != v7; ++j)
  {
    v53 = 0;
    geo::codec::multiSectionFeaturePoints(a3, j, &v53);
    __p = 0;
    v51 = 0;
    v52 = 0;
    v43 = -[VKPolygonGroup createStrokePointStyleList:section:outPointStyles:withRounder:](self, "createStrokePointStyleList:section:outPointStyles:withRounder:", a3, j, &__p, a4);
    if (v53 >= 3)
    {
      v44 = v43;
      v45 = (_QWORD *)operator new();
      if (a4)
        md::PolygonSectionRound::PolygonSectionRound((uint64_t)v45, a3, j, &a4->var0);
      else
        md::PolygonSection::PolygonSection((uint64_t)v45, a3, j);
      -[VKPolygonGroup enclosePointsInBoundingBox:count:](self, "enclosePointsInBoundingBox:count:", v45[1], v45[11]);
      -[VKPolygonGroup prepareToFillSection:](self, "prepareToFillSection:", v45);
      v49[0] = a3;
      v49[1] = j;
      -[VKPolygonGroup prepareToStrokeSection:key:styles:paddedCount:](self, "prepareToStrokeSection:key:styles:paddedCount:", v45, v49, &__p, v44);
      (*(void (**)(_QWORD *))(*v45 + 8))(v45);
    }
    if (__p)
    {
      v51 = (std::__shared_weak_count *)__p;
      operator delete(__p);
    }
  }
LABEL_58:
  v46 = v55;
  if (v55)
  {
    v47 = (unint64_t *)&v55->__shared_owners_;
    do
      v48 = __ldaxr(v47);
    while (__stlxr(v48 - 1, v47));
    if (!v48)
    {
      ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
      std::__shared_weak_count::__release_weak(v46);
    }
  }
}

- (void)enclosePointsInBoundingBox:(const void *)a3 count:(unint64_t)a4
{
  int8x16_t v4;
  float32x2_t v5;
  char *v6;
  float32x4_t v7;
  float32x4_t v8;
  int8x16_t v9;

  if (a4)
  {
    v4 = *(int8x16_t *)self->super._boundingBox._minimum._e;
    v5 = *(float32x2_t *)&self->super._boundingBox._maximum._e[1];
    v6 = (char *)a3 + 4;
    do
    {
      v7.i32[3] = v4.i32[3];
      v7.i64[0] = *(_QWORD *)(v6 - 4);
      v7.i32[2] = 0;
      v8 = (float32x4_t)v4;
      v8.i32[3] = *((_DWORD *)v6 - 1);
      v9 = (int8x16_t)vcgtq_f32(v8, v7);
      v7.i32[3] = *((_DWORD *)v6 - 1);
      v4 = vbslq_s8(v9, (int8x16_t)v7, v4);
      *(int8x16_t *)self->super._boundingBox._minimum._e = v4;
      v5 = vmaxnm_f32(v5, (float32x2_t)v7.u32[1]);
      *(float32x2_t *)&self->super._boundingBox._maximum._e[1] = v5;
      v6 += 8;
      --a4;
    }
    while (a4);
  }
}

- (void)prepareToFillSection:(const void *)a3
{
  md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::prepareSpaceForPoints((uint64_t)&self->super._fillMeshInfo._value, *((_QWORD *)a3 + 11), 3 * *((_QWORD *)a3 + 11) - 6);
}

- (void)prepareToStrokeSection:(const void *)a3 key:(const void *)a4 styles:(void *)a5 paddedCount:(unsigned int)a6
{
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  unint64_t v12;
  _BYTE *v13;
  _BYTE *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD *v22;
  int v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int *v29;
  int v30;
  int v31;
  int *v32;
  int v33;
  int v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  char *v38;
  char *v39;
  char *v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  char *v44;
  char *v45;
  char *v46;
  char *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  NSObject *v52;
  unint64_t v53;
  unint64_t v54;
  char *v55;
  __int16 v56;
  unint64_t v57;
  char *v58;
  double type;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  BOOL v63;
  unint64_t v64;
  uint64_t v65;
  _BYTE *v66;
  char *v67;
  char *v68;
  unint64_t v69;
  uint64_t v70;
  _OWORD *v71;
  char *v72;
  uint64_t v73;
  __int128 v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD *v77;
  std::__shared_weak_count *v78;
  unint64_t *p_shared_owners;
  unint64_t v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t *v85;
  unint64_t v86;
  VKPolygonGroup *v87;
  unint64_t v88;
  unsigned int v89;
  _QWORD *v90;
  uint64_t v92;
  uint8_t buf[16];

  v9 = std::__hash_table<std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::__unordered_map_hasher<std::pair<void const*,unsigned long>,std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::hash<std::pair<void const*,unsigned long>>,std::equal_to<std::pair<void const*,unsigned long>>,true>,std::__unordered_map_equal<std::pair<void const*,unsigned long>,std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::equal_to<std::pair<void const*,unsigned long>>,std::hash<std::pair<void const*,unsigned long>>,true>,std::allocator<std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>>>::__emplace_unique_key_args<std::pair<void const*,unsigned long>,std::piecewise_construct_t const&,std::tuple<std::pair<void const*,unsigned long> const&>,std::tuple<>>((uint64_t)&self->super._polygonEdges, *(_QWORD *)a4, *((_QWORD *)a4 + 1), a4);
  v10 = a3;
  v11 = v9;
  v12 = *((_QWORD *)a3 + 11);
  v13 = (_BYTE *)v9[4];
  v89 = a6;
  v90 = v10;
  v87 = self;
  if (0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v9[6] - (_QWORD)v13) >> 3) < v12)
  {
    if (v12 > 0x492492492492492)
      goto LABEL_72;
    v14 = (_BYTE *)v9[5];
    v15 = (char *)operator new(56 * v12);
    v16 = &v15[56 * ((v14 - v13) / 56)];
    v17 = v16;
    if (v14 != v13)
    {
      v18 = &v15[56 * ((v14 - v13) / 56)];
      do
      {
        v17 = v18 - 56;
        v19 = *(_OWORD *)(v14 - 56);
        v20 = *(_OWORD *)(v14 - 40);
        v21 = *(_OWORD *)(v14 - 24);
        *((_QWORD *)v18 - 1) = *((_QWORD *)v14 - 1);
        *(_OWORD *)(v18 - 24) = v21;
        *(_OWORD *)(v18 - 40) = v20;
        *(_OWORD *)(v18 - 56) = v19;
        v14 -= 56;
        v18 -= 56;
      }
      while (v14 != v13);
    }
    v11[4] = v17;
    v11[5] = v16;
    v11[6] = &v15[56 * v12];
    v10 = v90;
    if (v13)
    {
      operator delete(v13);
      v10 = v90;
      v12 = v90[11];
    }
  }
  v22 = a5;
  if (v12)
  {
    v23 = 0;
    v24 = 0;
    v25 = a6;
    v88 = a6;
    do
    {
      v27 = *(unsigned __int8 *)(*v22 + 12 * v24) + (uint64_t)v23;
      if (((*(_QWORD *)(v10[8] + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v24) & 1) != 0)
      {
        v26 = v24 + 1;
        v23 = v27 + 1;
      }
      else
      {
        v28 = v10[1];
        v29 = (int *)(v28 + 8 * v24);
        v31 = *v29;
        v30 = v29[1];
        v26 = v24 + 1;
        v32 = (int *)(v28 + 8 * ((v24 + 1) % v12));
        v34 = *v32;
        v33 = v32[1];
        v23 = v27 + 1;
        v35 = ((int)v27 + 1) % a6;
        v36 = (v24 + 1) % v25;
        v38 = (char *)v11[5];
        v37 = v11[6];
        if ((unint64_t)v38 >= v37)
        {
          v40 = (char *)v11[4];
          v41 = 0x6DB6DB6DB6DB6DB7 * ((v38 - v40) >> 3) + 1;
          if (v41 > 0x492492492492492)
            goto LABEL_72;
          v42 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v37 - (_QWORD)v40) >> 3);
          if (2 * v42 > v41)
            v41 = 2 * v42;
          if (v42 >= 0x249249249249249)
            v43 = 0x492492492492492;
          else
            v43 = v41;
          if (v43 > 0x492492492492492)
            goto LABEL_73;
          v92 = 56 * v43;
          v44 = (char *)operator new(56 * v43);
          v45 = &v44[8 * ((v38 - v40) >> 3)];
          *(_DWORD *)v45 = v31;
          *((_DWORD *)v45 + 1) = v30;
          *((_DWORD *)v45 + 2) = 0;
          *((_DWORD *)v45 + 3) = v34;
          *((_DWORD *)v45 + 4) = v33;
          *((_DWORD *)v45 + 5) = 0;
          *((_QWORD *)v45 + 3) = (int)v27;
          *((_QWORD *)v45 + 4) = v35;
          *((_QWORD *)v45 + 5) = v24;
          *((_QWORD *)v45 + 6) = v36;
          if (v38 == v40)
          {
            v47 = &v44[8 * ((v38 - v40) >> 3)];
            a6 = v89;
          }
          else
          {
            v46 = &v44[8 * ((v38 - v40) >> 3)];
            a6 = v89;
            do
            {
              v47 = v46 - 56;
              v48 = *(_OWORD *)(v38 - 56);
              v49 = *(_OWORD *)(v38 - 40);
              v50 = *(_OWORD *)(v38 - 24);
              *((_QWORD *)v46 - 1) = *((_QWORD *)v38 - 1);
              *(_OWORD *)(v46 - 24) = v50;
              *(_OWORD *)(v46 - 40) = v49;
              *(_OWORD *)(v46 - 56) = v48;
              v38 -= 56;
              v46 -= 56;
            }
            while (v38 != v40);
          }
          v39 = v45 + 56;
          v11[4] = v47;
          v11[5] = v45 + 56;
          v11[6] = &v44[v92];
          if (v40)
            operator delete(v40);
          v10 = v90;
          v22 = a5;
          v25 = v88;
        }
        else
        {
          *(_DWORD *)v38 = v31;
          *((_DWORD *)v38 + 1) = v30;
          *((_DWORD *)v38 + 2) = 0;
          *((_DWORD *)v38 + 3) = v34;
          *((_DWORD *)v38 + 4) = v33;
          *((_DWORD *)v38 + 5) = 0;
          *((_QWORD *)v38 + 3) = v27;
          *((_QWORD *)v38 + 4) = v35;
          v39 = v38 + 56;
          *((_QWORD *)v38 + 5) = v24;
          *((_QWORD *)v38 + 6) = v36;
        }
        v11[5] = v39;
        v12 = v10[11];
      }
      v24 = v26;
    }
    while (v26 < v12);
  }
  v51 = v11[5] - v11[4];
  if (v51)
  {
    if (a6 >= 0x8000)
    {
      if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
        dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
      v52 = (id)GEOGetVectorKitVKDefaultLog_log;
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F029000, v52, OS_LOG_TYPE_ERROR, "MeshSet: Cannot prepare space polygons points: polygon is too large", buf, 2u);
      }

      return;
    }
    v53 = 2 * a6;
    v54 = 0x924924924924924ALL * (v51 >> 3);
    v55 = *(char **)v87->_anon_b28;
    v56 = *((_WORD *)v55 - 4);
    if (v53 <= (unsigned __int16)~v56)
    {
      *((_WORD *)v55 - 4) = v56 + 2 * a6;
      *((_DWORD *)v55 - 1) += v54;
LABEL_59:
      v76 = *(_QWORD *)&v87->_anon_b28[144];
      v77 = *(_QWORD **)&v87->_anon_b28[160];
      v78 = *(std::__shared_weak_count **)&v87->_anon_b28[168];
      if (v78)
      {
        p_shared_owners = (unint64_t *)&v78->__shared_owners_;
        do
          v80 = __ldxr(p_shared_owners);
        while (__stxr(v80 + 1, p_shared_owners));
      }
      if (v77 && *v77 == v76 && !*(_BYTE *)(v76 + 40))
      {
        v81 = 48 * a6;
        v82 = *(_QWORD *)(v76 + 8) + v54;
        *(_QWORD *)v76 += v81;
        *(_QWORD *)(v76 + 8) = v82;
        v83 = v77[2] + v81;
        v84 = v77[3] + v54;
        v77[2] = v83;
        v77[3] = v84;
      }
      if (v78)
      {
        v85 = (unint64_t *)&v78->__shared_owners_;
        do
          v86 = __ldaxr(v85);
        while (__stlxr(v86 - 1, v85));
        if (!v86)
        {
          ((void (*)(std::__shared_weak_count *))v78->__on_zero_shared)(v78);
          std::__shared_weak_count::__release_weak(v78);
        }
      }
      return;
    }
    v57 = *(_QWORD *)&v87->_anon_b28[8];
    if ((unint64_t)v55 < v57)
    {
      *(_WORD *)v55 = 2 * a6;
      *((_DWORD *)v55 + 1) = v54;
      v58 = v55 + 8;
LABEL_58:
      *(_QWORD *)v87->_anon_b28 = v58;
      goto LABEL_59;
    }
    type = v87->_strokeMeshInfo._value.type;
    v60 = (uint64_t)&v55[-*(_QWORD *)&type] >> 3;
    v61 = v60 + 1;
    if (!((unint64_t)(v60 + 1) >> 61))
    {
      v62 = v57 - *(_QWORD *)&type;
      if (v62 >> 2 > v61)
        v61 = v62 >> 2;
      v63 = (unint64_t)v62 >= 0x7FFFFFFFFFFFFFF8;
      v64 = 0x1FFFFFFFFFFFFFFFLL;
      if (!v63)
        v64 = v61;
      if (v64 >> 61)
LABEL_73:
        std::__throw_bad_array_new_length[abi:nn180100]();
      v65 = 8 * v64;
      v66 = operator new(8 * v64);
      v67 = &v66[8 * v60];
      v68 = &v66[v65];
      *(_WORD *)v67 = v53;
      *((_DWORD *)v67 + 1) = v54;
      v58 = v67 + 8;
      if (v55 != *(char **)&type)
      {
        v69 = (unint64_t)&v55[-*(_QWORD *)&type - 8];
        if (v69 < 0x58)
          goto LABEL_76;
        if (*(_QWORD *)&type - (_QWORD)v66 < 0x20uLL)
          goto LABEL_76;
        v70 = (v69 >> 3) + 1;
        v71 = &v66[8 * v60 - 16];
        v72 = v55 - 16;
        v73 = v70 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v74 = *(_OWORD *)v72;
          *(v71 - 1) = *((_OWORD *)v72 - 1);
          *v71 = v74;
          v71 -= 2;
          v72 -= 32;
          v73 -= 4;
        }
        while (v73);
        v67 -= 8 * (v70 & 0x3FFFFFFFFFFFFFFCLL);
        v55 -= 8 * (v70 & 0x3FFFFFFFFFFFFFFCLL);
        if (v70 != (v70 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_76:
          do
          {
            v75 = *((_QWORD *)v55 - 1);
            v55 -= 8;
            *((_QWORD *)v67 - 1) = v75;
            v67 -= 8;
          }
          while (v55 != *(char **)&type);
        }
      }
      *(_QWORD *)&v87->_strokeMeshInfo._value.type = v67;
      *(_QWORD *)v87->_anon_b28 = v58;
      *(_QWORD *)&v87->_anon_b28[8] = v68;
      if (type != 0.0)
        operator delete(*(void **)&type);
      a6 = v89;
      goto LABEL_58;
    }
LABEL_72:
    abort();
  }
}

- (void)willAddDataWithAccessor:(ResourceAccessor *)a3
{
  __n128 v5;
  optional<md::MeshSet<ggl::PolygonCommonStroke::MeshMesh, ggl::PolygonCommonStroke::DefaultVbo>> *p_strokeMeshInfo;
  uint64_t *v7;
  uint64_t v8;
  double type;
  _QWORD *i;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  char *v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  uint64_t v25;
  _QWORD *v26;
  unint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  unint64_t *v32;
  unint64_t v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  unint64_t *v37;
  unint64_t v38;
  unint64_t *v39;
  unint64_t v40;
  unint64_t v41;
  double v42;
  __n128 *v43;
  _QWORD *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char *v49;
  __n128 *v50;
  char *v51;
  __n128 v52;
  double v53;
  std::__shared_weak_count *v54;
  unint64_t *v55;
  unint64_t v56;
  std::__shared_weak_count *v57;
  unint64_t *v58;
  unint64_t v59;
  std::__shared_weak_count *v60;
  unint64_t *v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unsigned __int8 v65;
  uint64_t v66;
  geo::read_write_lock *v67;
  const char *v68;
  malloc_zone_t *zone;
  uint64_t v70;
  geo::read_write_lock *v71;
  const char *v72;
  malloc_zone_t *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  __int128 v78;
  uint64_t v79;
  __int128 v80;
  unint64_t v81;
  unint64_t v82;
  __int128 v83;
  int v84;
  int v85;
  unint64_t v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  __int128 v94;
  int v95;
  int v96;
  unint64_t v97;
  unint64_t v98;
  _Unwind_Exception *v99;
  ResourceAccessor *v100;
  const char *v101;
  __int128 v102;
  __int128 v103;
  __n128 v104;
  __int128 v105;
  objc_super v106;
  const char *v107;
  std::__shared_weak_count *v108;
  __int128 v109;
  __int128 v110;
  unint64_t v111;
  unint64_t v112;
  __int16 v113;
  uint64_t v114;
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v106.receiver = self;
  v106.super_class = (Class)VKPolygonGroup;
  -[VKPolygonalItemGroup willAddDataWithAccessor:](&v106, sel_willAddDataWithAccessor_);
  p_strokeMeshInfo = &self->_strokeMeshInfo;
  v7 = *(uint64_t **)&self->_anon_b28[152];
  if (v7)
    md::MeshSetStorage::prepareStorage(v7, a3);
  v100 = a3;
  type = self->_strokeMeshInfo._value.type;
  v8 = *(_QWORD *)self->_anon_b28;
  if (*(_QWORD *)&type != v8)
  {
    v5.n128_u64[1] = 0;
    i = (_QWORD *)&unk_1ECE44000;
    do
    {
      if (!**(_WORD **)&type || !*(_DWORD *)(*(_QWORD *)&type + 4))
        goto LABEL_6;
      v11 = *(_QWORD *)&p_strokeMeshInfo[10]._hasValue;
      if (*(_BYTE *)(v11 + 40)
        && (v12 = *(_QWORD **)&p_strokeMeshInfo[11]._hasValue) != 0
        && *v12 == v11
        && (v13 = v12[1] * (unsigned __int16)**(_WORD **)&type,
            v14 = v12[8],
            v15 = v12[4],
            v14 + v13 <= (unint64_t)(v12[5] - v15)))
      {
        *(_QWORD *)&v110 = v15 + v14;
        *((_QWORD *)&v110 + 1) = v15 + v14 + v13;
        v12[8] = v14 + v13;
        v63 = *(_QWORD *)(v11 + 48);
        v107 = "Polygon Stroke Vertex Data";
        v64 = v12[14];
        if (!v64)
        {
          std::__throw_bad_function_call[abi:nn180100]();
          _Unwind_Resume(v99);
        }
        (*(void (**)(__int128 *__return_ptr, uint64_t, const char **, uint64_t, __int128 *))(*(_QWORD *)v64 + 48))(&v109, v64, &v107, v63, &v110);
        v11 = *(_QWORD *)&p_strokeMeshInfo[10]._hasValue;
      }
      else
      {
        v109 = 0uLL;
      }
      md::MeshSetStorage::buildSubIndexData(&v107, v11, *(_QWORD **)&p_strokeMeshInfo[11]._hasValue, (uint64_t)"Polygon Stroke Index Data", *(unsigned int *)(*(_QWORD *)&type + 4));
      v103 = v109;
      v16 = (std::__shared_weak_count *)*((_QWORD *)&v109 + 1);
      if (*((_QWORD *)&v109 + 1))
      {
        v17 = (unint64_t *)(*((_QWORD *)&v109 + 1) + 8);
        do
          v18 = __ldxr(v17);
        while (__stxr(v18 + 1, v17));
      }
      v19 = (char *)operator new(0xA8uLL);
      *((_QWORD *)v19 + 1) = 0;
      *((_QWORD *)v19 + 2) = 0;
      *(_QWORD *)v19 = &off_1E42E3778;
      v20 = v108;
      v101 = v107;
      if (v108)
      {
        p_shared_owners = (unint64_t *)&v108->__shared_owners_;
        do
          v22 = __ldxr(p_shared_owners);
        while (__stxr(v22 + 1, p_shared_owners));
      }
      if ((v23 & 1) == 0
      {
        if ((v65 & 1) == 0
        {
          ggl::MeshTyped<ggl::PolygonCommonStroke::DefaultVbo>::attributesReflection(void)::r = (uint64_t)&ggl::PolygonCommonStroke::defaultVboReflection;
        }
        ggl::MeshTyped<ggl::PolygonCommonStroke::DefaultVbo>::typedReflection(void)::r = (uint64_t)&ggl::MeshTyped<ggl::PolygonCommonStroke::DefaultVbo>::attributesReflection(void)::r;
        unk_1ECE43D00 = 1;
        i = (_QWORD *)&unk_1ECE44000;
      }
      *((_QWORD *)v19 + 11) = 0;
      *((_QWORD *)v19 + 7) = 0;
      *((_QWORD *)v19 + 8) = 0;
      *((_DWORD *)v19 + 18) = 0;
      *((_QWORD *)v19 + 3) = &off_1E42BBC08;
      *((_QWORD *)v19 + 4) = "Polygon Stroke Mesh";
      *((_QWORD *)v19 + 5) = &unk_1E42BBC28;
      *((_QWORD *)v19 + 6) = 0;
      *((_QWORD *)v19 + 10) = &ggl::MeshTyped<ggl::PolygonCommonStroke::DefaultVbo>::typedReflection(void)::r;
      *((_QWORD *)v19 + 12) = 0;
      *((_QWORD *)v19 + 13) = 0;
      {
        v66 = operator new();
        *(_QWORD *)(v66 + 16) = 0xA3D02C1100000005;
        *(_QWORD *)(v66 + 24) = "GeoGL";
        *(_OWORD *)(v66 + 32) = xmmword_19FFB2DE0;
        *(_QWORD *)v66 = &off_1E42B5668;
        *(_QWORD *)(v66 + 8) = "GeoGL";
        *(_OWORD *)(v66 + 72) = 0u;
        *(_OWORD *)(v66 + 88) = 0u;
        *(_OWORD *)(v66 + 104) = 0u;
        *(_OWORD *)(v66 + 120) = 0u;
        *(_OWORD *)(v66 + 136) = 0u;
        *(_OWORD *)(v66 + 152) = 0u;
        *(_OWORD *)(v66 + 168) = 0u;
        *(_OWORD *)(v66 + 184) = 0u;
        *(_OWORD *)(v66 + 200) = 0u;
        *(_OWORD *)(v66 + 216) = 0u;
        *(_OWORD *)(v66 + 232) = 0u;
        *(_QWORD *)(v66 + 248) = 0;
        *(_OWORD *)(v66 + 56) = 0u;
        v67 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v66 + 56), 0);
        if ((_DWORD)v67)
          geo::read_write_lock::logFailure(v67, (uint64_t)"initialization", v68);
        zone = malloc_create_zone(0, 0);
        *(_QWORD *)(v66 + 48) = zone;
        malloc_set_zone_name(zone, "GeoGL");
        *(_QWORD *)(v66 + 256) = os_log_create("com.apple.VectorKit", "Memory");
        i = &unk_1ECE44000;
        ggl::Allocator::instance(void)::alloc = v66;
      }
      v25 = i[495];
      v26 = i;
      *((_QWORD *)v19 + 18) = 0;
      *((_QWORD *)v19 + 15) = 0;
      *((_QWORD *)v19 + 16) = 0;
      *((_QWORD *)v19 + 14) = v25;
      {
        v70 = operator new();
        *(_QWORD *)(v70 + 16) = 0xA3D02C1100000005;
        *(_QWORD *)(v70 + 24) = "GeoGL";
        *(_OWORD *)(v70 + 32) = xmmword_19FFB2DE0;
        *(_QWORD *)v70 = &off_1E42B5668;
        *(_QWORD *)(v70 + 8) = "GeoGL";
        *(_OWORD *)(v70 + 72) = 0u;
        *(_OWORD *)(v70 + 88) = 0u;
        *(_OWORD *)(v70 + 104) = 0u;
        *(_OWORD *)(v70 + 120) = 0u;
        *(_OWORD *)(v70 + 136) = 0u;
        *(_OWORD *)(v70 + 152) = 0u;
        *(_OWORD *)(v70 + 168) = 0u;
        *(_OWORD *)(v70 + 184) = 0u;
        *(_OWORD *)(v70 + 200) = 0u;
        *(_OWORD *)(v70 + 216) = 0u;
        *(_OWORD *)(v70 + 232) = 0u;
        *(_QWORD *)(v70 + 248) = 0;
        *(_OWORD *)(v70 + 56) = 0u;
        v71 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v70 + 56), 0);
        if ((_DWORD)v71)
          geo::read_write_lock::logFailure(v71, (uint64_t)"initialization", v72);
        v73 = malloc_create_zone(0, 0);
        *(_QWORD *)(v70 + 48) = v73;
        malloc_set_zone_name(v73, "GeoGL");
        *(_QWORD *)(v70 + 256) = os_log_create("com.apple.VectorKit", "Memory");
        v26 = &unk_1ECE44000;
        ggl::Allocator::instance(void)::alloc = v70;
      }
      *((_QWORD *)v19 + 19) = v26[495];
      *((_QWORD *)v19 + 20) = 0;
      *((_QWORD *)v19 + 17) = v19 + 144;
      *((_QWORD *)v19 + 3) = &off_1E42BDA78;
      *((_QWORD *)v19 + 5) = &unk_1E42BDA98;
      v110 = v103;
      if (v16)
      {
        v27 = (unint64_t *)&v16->__shared_owners_;
        do
          v28 = __ldxr(v27);
        while (__stxr(v28 + 1, v27));
      }
      std::vector<std::shared_ptr<ggl::VertexData>,geo::StdAllocator<std::shared_ptr<ggl::VertexData>,ggl::Allocator>>::__assign_with_size[abi:nn180100]<std::shared_ptr<ggl::VertexData> const*,std::shared_ptr<ggl::VertexData> const*>((uint64_t)(v19 + 88), (uint64_t *)&v110, (uint64_t *)&v111, 1uLL);
      v29 = (std::__shared_weak_count *)*((_QWORD *)&v110 + 1);
      i = (_QWORD *)&unk_1ECE44000;
      if (!*((_QWORD *)&v110 + 1))
        goto LABEL_30;
      v30 = (unint64_t *)(*((_QWORD *)&v110 + 1) + 8);
      do
        v31 = __ldaxr(v30);
      while (__stlxr(v31 - 1, v30));
      if (!v31)
      {
        ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
        std::__shared_weak_count::__release_weak(v29);
        if (!v20)
          goto LABEL_33;
      }
      else
      {
LABEL_30:
        if (!v20)
          goto LABEL_33;
      }
      v32 = (unint64_t *)&v20->__shared_owners_;
      do
        v33 = __ldxr(v32);
      while (__stxr(v33 + 1, v32));
LABEL_33:
      v34 = (std::__shared_weak_count *)*((_QWORD *)v19 + 16);
      *((_QWORD *)v19 + 15) = v101;
      *((_QWORD *)v19 + 16) = v20;
      if (v34)
      {
        v35 = (unint64_t *)&v34->__shared_owners_;
        do
          v36 = __ldaxr(v35);
        while (__stlxr(v36 - 1, v35));
        if (!v36)
        {
          ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
          std::__shared_weak_count::__release_weak(v34);
        }
      }
      *((_QWORD *)v19 + 3) = &off_1E42BA958;
      *((_QWORD *)v19 + 5) = &unk_1E42BA978;
      if (!v20)
        goto LABEL_42;
      v37 = (unint64_t *)&v20->__shared_owners_;
      do
        v38 = __ldaxr(v37);
      while (__stlxr(v38 - 1, v37));
      if (!v38)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
        if (!v16)
          goto LABEL_50;
      }
      else
      {
LABEL_42:
        if (!v16)
          goto LABEL_50;
      }
      v39 = (unint64_t *)&v16->__shared_owners_;
      do
        v40 = __ldaxr(v39);
      while (__stlxr(v40 - 1, v39));
      if (!v40)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
LABEL_50:
      v42 = p_strokeMeshInfo[2]._value.type;
      v41 = *(_QWORD *)&p_strokeMeshInfo[3]._hasValue;
      if (*(_QWORD *)&v42 >= v41)
      {
        v44 = *(_QWORD **)&p_strokeMeshInfo[2]._hasValue;
        v45 = (uint64_t)(*(_QWORD *)&v42 - (_QWORD)v44) >> 4;
        v46 = v45 + 1;
        if ((unint64_t)(v45 + 1) >> 60)
          abort();
        v47 = v41 - (_QWORD)v44;
        if (v47 >> 3 > v46)
          v46 = v47 >> 3;
        if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFF0)
          v48 = 0xFFFFFFFFFFFFFFFLL;
        else
          v48 = v46;
        if (v48 >> 60)
          std::__throw_bad_array_new_length[abi:nn180100]();
        v49 = (char *)operator new(16 * v48);
        v5.n128_u64[0] = (unint64_t)(v19 + 24);
        v5.n128_u64[1] = (unint64_t)v19;
        v50 = (__n128 *)&v49[16 * v45];
        v51 = &v49[16 * v48];
        *v50 = v5;
        v43 = v50 + 1;
        if (*(_QWORD **)&v42 == v44)
        {
          *(_QWORD *)&p_strokeMeshInfo[2]._hasValue = v50;
          *(_QWORD *)&p_strokeMeshInfo[2]._value.type = v43;
          *(_QWORD *)&p_strokeMeshInfo[3]._hasValue = v51;
          i = &unk_1ECE44000;
        }
        else
        {
          do
          {
            v52 = *(__n128 *)(*(_QWORD *)&v42 - 16);
            *(_QWORD *)&v42 -= 16;
            v5.n128_u64[1] = v52.n128_u64[1];
            v50[-1] = v52;
            --v50;
            **(_QWORD **)&v42 = 0;
            *(_QWORD *)(*(_QWORD *)&v42 + 8) = 0;
          }
          while (*(_QWORD **)&v42 != v44);
          v42 = *(double *)&p_strokeMeshInfo[2]._hasValue;
          v53 = p_strokeMeshInfo[2]._value.type;
          *(_QWORD *)&p_strokeMeshInfo[2]._hasValue = v50;
          *(_QWORD *)&p_strokeMeshInfo[2]._value.type = v43;
          *(_QWORD *)&p_strokeMeshInfo[3]._hasValue = v51;
          for (i = (_QWORD *)&unk_1ECE44000; *(_QWORD *)&v53 != *(_QWORD *)&v42; *(_QWORD *)&v53 -= 16)
          {
            v54 = *(std::__shared_weak_count **)(*(_QWORD *)&v53 - 8);
            if (v54)
            {
              v55 = (unint64_t *)&v54->__shared_owners_;
              do
                v56 = __ldaxr(v55);
              while (__stlxr(v56 - 1, v55));
              if (!v56)
              {
                ((void (*)(std::__shared_weak_count *))v54->__on_zero_shared)(v54);
                std::__shared_weak_count::__release_weak(v54);
              }
            }
          }
        }
        if (v42 != 0.0)
          operator delete(*(void **)&v42);
      }
      else
      {
        **(_QWORD **)&v42 = v19 + 24;
        *(_QWORD *)(*(_QWORD *)&v42 + 8) = v19;
        v43 = (__n128 *)(*(_QWORD *)&v42 + 16);
      }
      *(_QWORD *)&p_strokeMeshInfo[2]._value.type = v43;
      v57 = v108;
      if (!v108)
        goto LABEL_76;
      v58 = (unint64_t *)&v108->__shared_owners_;
      do
        v59 = __ldaxr(v58);
      while (__stlxr(v59 - 1, v58));
      if (!v59)
      {
        ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
        std::__shared_weak_count::__release_weak(v57);
        v60 = (std::__shared_weak_count *)*((_QWORD *)&v109 + 1);
        if (*((_QWORD *)&v109 + 1))
        {
LABEL_77:
          v61 = (unint64_t *)&v60->__shared_owners_;
          do
            v62 = __ldaxr(v61);
          while (__stlxr(v62 - 1, v61));
          if (!v62)
          {
            ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
            std::__shared_weak_count::__release_weak(v60);
          }
        }
      }
      else
      {
LABEL_76:
        v60 = (std::__shared_weak_count *)*((_QWORD *)&v109 + 1);
        if (*((_QWORD *)&v109 + 1))
          goto LABEL_77;
      }
      v8 = *(_QWORD *)&p_strokeMeshInfo[1]._hasValue;
LABEL_6:
      *(_QWORD *)&type += 8;
    }
    while (*(_QWORD *)&type != v8);
  }
  v74 = *(_QWORD *)&p_strokeMeshInfo[2]._hasValue;
  if (v74 != *(_QWORD *)&p_strokeMeshInfo[2]._value.type)
  {
    v75 = **(_QWORD **)(*(_QWORD *)v74 + 64);
    v76 = **(unsigned __int16 **)&p_strokeMeshInfo->_value.type;
    v110 = 0uLL;
    v77 = *(_QWORD *)(v75 + 8) * v76;
    v5.n128_u64[0] = (unint64_t)v100;
    *(_QWORD *)&v78 = v100;
    *((_QWORD *)&v78 + 1) = v75;
    v104 = v5;
    if (v77)
    {
      if (v100 && *(_BYTE *)(v75 + 17) != 2)
      {
        v102 = v78;
        v79 = (*((uint64_t (**)(ResourceAccessor *))v100->var0 + 7))(v100);
        v78 = v102;
      }
      else
      {
        v79 = *(_QWORD *)(v75 + 72);
      }
    }
    else
    {
      v79 = 0;
    }
    v110 = v78;
    v111 = 0;
    v112 = v77;
    v114 = v79;
    v113 = 257;
    ggl::BufferMemory::operator=((uint64_t *)&p_strokeMeshInfo[3]._value, (uint64_t)&v110);
    *(_QWORD *)&v80 = v104.n128_u64[0];
    if (v114)
    {
      v82 = v111;
      v81 = v112;
      if (v112 != v111)
      {
        v83 = v110;
        v84 = v113;
        v85 = HIBYTE(v113);
        if ((_QWORD)v110 && *(_BYTE *)(*((_QWORD *)&v110 + 1) + 17) != 2)
        {
          (*(void (**)(__n128))(*(_QWORD *)v110 + 64))(v104);
          *(_QWORD *)&v80 = v104.n128_u64[0];
        }
        if (v84 && !v85)
        {
          v87 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 56);
          v86 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 64);
          if (v86 == v87)
            v87 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 80) - *(_QWORD *)(*((_QWORD *)&v83 + 1) + 72);
          if (v82 < v87)
            v87 = v82;
          if (v86 <= v81)
            v86 = v81;
          if (v86 == v87)
            v86 = v87 + *(_QWORD *)(*((_QWORD *)&v83 + 1) + 80) - *(_QWORD *)(*((_QWORD *)&v83 + 1) + 72);
          *(_QWORD *)(*((_QWORD *)&v83 + 1) + 56) = v87;
          *(_QWORD *)(*((_QWORD *)&v83 + 1) + 64) = v86;
        }
      }
    }
    v88 = *(_QWORD *)(**(_QWORD **)&p_strokeMeshInfo[2]._hasValue + 96);
    v89 = *(unsigned int *)(*(_QWORD *)&p_strokeMeshInfo->_value.type + 4);
    v110 = 0uLL;
    v90 = *(_QWORD *)(v88 + 8) * v89;
    *((_QWORD *)&v80 + 1) = v88;
    if (v90)
    {
      if (v100 && *(_BYTE *)(v88 + 17) != 2)
      {
        v105 = v80;
        v91 = (*((uint64_t (**)(ResourceAccessor *))v100->var0 + 7))(v100);
        v80 = v105;
      }
      else
      {
        v91 = *(_QWORD *)(v88 + 72);
      }
    }
    else
    {
      v91 = 0;
    }
    v110 = v80;
    v111 = 0;
    v112 = v90;
    v114 = v91;
    v113 = 257;
    ggl::BufferMemory::operator=((uint64_t *)&p_strokeMeshInfo[6]._value, (uint64_t)&v110);
    if (v114)
    {
      v93 = v111;
      v92 = v112;
      if (v112 != v111)
      {
        v94 = v110;
        v95 = v113;
        v96 = HIBYTE(v113);
        if ((_QWORD)v110 && *(_BYTE *)(*((_QWORD *)&v110 + 1) + 17) != 2)
          (*(void (**)(void))(*(_QWORD *)v110 + 64))();
        if (v95 && !v96)
        {
          v98 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 56);
          v97 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 64);
          if (v97 == v98)
            v98 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 80) - *(_QWORD *)(*((_QWORD *)&v94 + 1) + 72);
          if (v93 < v98)
            v98 = v93;
          if (v97 <= v92)
            v97 = v92;
          if (v97 == v98)
            v97 = v98 + *(_QWORD *)(*((_QWORD *)&v94 + 1) + 80) - *(_QWORD *)(*((_QWORD *)&v94 + 1) + 72);
          *(_QWORD *)(*((_QWORD *)&v94 + 1) + 56) = v98;
          *(_QWORD *)(*((_QWORD *)&v94 + 1) + 64) = v97;
        }
      }
    }
  }
}

- (void)didFinishAddingData
{
  optional<md::MeshSet<ggl::PolygonCommonStroke::MeshMesh, ggl::PolygonCommonStroke::DefaultVbo>> *p_strokeMeshInfo;
  uint64_t v4;
  md::MeshSetStorage *v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  int v9;
  int v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  int v16;
  int v17;
  unint64_t v18;
  unint64_t v19;
  unsigned __int8 *v20;
  vector<std::shared_ptr<ggl::PolygonCommonStroke::MeshMesh>, std::allocator<std::shared_ptr<ggl::PolygonCommonStroke::MeshMesh>>> *p_strokeMeshes;
  char *begin;
  char *end;
  void *v24;
  std::__shared_weak_count *v25;
  unint64_t *p_shared_owners;
  unint64_t v27;
  objc_super v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unsigned __int8 v33;
  unsigned __int8 v34;
  uint64_t v35;

  v28.receiver = self;
  v28.super_class = (Class)VKPolygonGroup;
  -[VKPolygonalItemGroup didFinishAddingData](&v28, sel_didFinishAddingData);
  p_strokeMeshInfo = &self->_strokeMeshInfo;
  v4 = *(_QWORD *)&self->_anon_b28[160];
  if (v4 && *(_QWORD *)v4 == *(_QWORD *)&self->_anon_b28[144])
    *(_BYTE *)(v4 + 80) = 1;
  v5 = *(md::MeshSetStorage **)&self->_anon_b28[152];
  if (v5)
    md::MeshSetStorage::finalize(v5);
  v35 = 0;
  v29 = 0;
  v30 = 0;
  ggl::BufferMemory::operator=((uint64_t *)&self->_anon_b28[40], (uint64_t)&v29);
  if (v35)
  {
    v7 = v31;
    v6 = v32;
    if (v32 != v31)
    {
      v8 = (_QWORD *)v30;
      v9 = v33;
      v10 = v34;
      if (v29 && *(_BYTE *)(v30 + 17) != 2)
        (*(void (**)(void))(*(_QWORD *)v29 + 64))();
      if (v9 && !v10)
      {
        v12 = v8[7];
        v11 = v8[8];
        if (v11 == v12)
          v12 = v8[10] - v8[9];
        if (v7 < v12)
          v12 = v7;
        if (v11 <= v6)
          v11 = v6;
        if (v11 == v12)
          v11 = v12 + v8[10] - v8[9];
        v8[7] = v12;
        v8[8] = v11;
      }
    }
  }
  v35 = 0;
  v29 = 0;
  v30 = 0;
  ggl::BufferMemory::operator=((uint64_t *)&self->_anon_b28[88], (uint64_t)&v29);
  if (v35)
  {
    v14 = v31;
    v13 = v32;
    if (v32 != v31)
    {
      v15 = (_QWORD *)v30;
      v16 = v33;
      v17 = v34;
      if (v29 && *(_BYTE *)(v30 + 17) != 2)
        (*(void (**)(void))(*(_QWORD *)v29 + 64))();
      if (v16 && !v17)
      {
        v19 = v15[7];
        v18 = v15[8];
        if (v18 == v19)
          v19 = v15[10] - v15[9];
        if (v14 < v19)
          v19 = v14;
        if (v18 <= v13)
          v18 = v13;
        if (v18 == v19)
          v18 = v19 + v15[10] - v15[9];
        v15[7] = v19;
        v15[8] = v18;
      }
    }
  }
  v20 = &self->_anon_b28[16];
  p_strokeMeshes = &self->_strokeMeshes;
  begin = (char *)self->_strokeMeshes.__begin_;
  if (begin)
  {
    end = (char *)self->_strokeMeshes.__end_;
    v24 = self->_strokeMeshes.__begin_;
    if (end != begin)
    {
      do
      {
        v25 = (std::__shared_weak_count *)*((_QWORD *)end - 1);
        if (v25)
        {
          p_shared_owners = (unint64_t *)&v25->__shared_owners_;
          do
            v27 = __ldaxr(p_shared_owners);
          while (__stlxr(v27 - 1, p_shared_owners));
          if (!v27)
          {
            ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
            std::__shared_weak_count::__release_weak(v25);
          }
        }
        end -= 16;
      }
      while (end != begin);
      v24 = p_strokeMeshes->__begin_;
    }
    p_strokeMeshes->__end_ = begin;
    operator delete(v24);
    p_strokeMeshes->__begin_ = 0;
    p_strokeMeshes->__end_ = 0;
    p_strokeMeshes->__end_cap_.__value_ = 0;
  }
  *(optional<md::MeshSet<ggl::PolygonCommonStroke::MeshMesh, ggl::PolygonCommonStroke::DefaultVbo>> *)&p_strokeMeshes->__begin_ = p_strokeMeshInfo[2];
  p_strokeMeshes->__end_cap_.__value_ = *(void **)&p_strokeMeshInfo[3]._hasValue;
  *(_QWORD *)v20 = 0;
  p_strokeMeshInfo[2]._value.type = 0.0;
  *(_QWORD *)&p_strokeMeshInfo[3]._hasValue = 0;
  if (p_strokeMeshInfo->_hasValue)
  {
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)&p_strokeMeshInfo->_value);
    p_strokeMeshInfo->_hasValue = 0;
  }
}

- (void)addPolygon:(void *)a3 accessor:(ResourceAccessor *)a4 triangulator:(void *)a5 withRounder:(PolygonRound *)a6
{
  uint64_t v9;
  char *StrokeSpecifications;
  unint64_t v11;
  unint64_t v12;
  unsigned int *v13;
  unsigned int v14;
  float *v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  char *v24;
  void *__p;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;

  v9 = *((unsigned int *)a3 + 25);
  v29 = 0;
  StrokeSpecifications = geo::codec::polygonFeatureGetStrokeSpecifications(a3, (uint64_t *)&v29);
  v21 = -[VKPolygonalItemGroup indexForGeoFeatureAttributes:](self, "indexForGeoFeatureAttributes:");
  if ((_DWORD)v9)
  {
    v11 = 0;
    v12 = 0;
    v24 = StrokeSpecifications + 4;
    do
    {
      if (v11 < v29)
      {
        v13 = (unsigned int *)&v24[16 * v11];
        while (1)
        {
          v14 = *v13;
          v13 += 4;
          if (v14 >= v12)
            break;
          if (v29 == ++v11)
          {
            v11 = v29;
            break;
          }
        }
      }
      v28 = 0;
      v15 = (float *)geo::codec::multiSectionFeaturePoints(a3, v12, &v28);
      __p = 0;
      v26 = 0;
      v27 = 0;
      v16 = -[VKPolygonGroup createStrokePointStyleList:section:outPointStyles:withRounder:](self, "createStrokePointStyleList:section:outPointStyles:withRounder:", a3, v12, &__p, a6);
      v17 = geo::codec::multiSectionFeaturePrecision((uint64_t)a3);
      if (v17 <= 0x10 && v28 >= 3)
      {
        v18 = ggl::CullingGrid::intersectedCellsForRibbon(v28, v15, 1);
        self->super._cullingMask |= v18;
        v19 = operator new();
        if (a6)
          md::PolygonSectionRound::PolygonSectionRound(v19, a3, v12, &a6->var0);
        else
          md::PolygonSection::PolygonSection(v19, a3, v12);
        if (-[VKPolygonGroup addFillForSection:precision:styleIndex:cullingMask:accessor:triangulator:](self, "addFillForSection:precision:styleIndex:cullingMask:accessor:triangulator:", v19, v17, v21, v18, a4, a5))
        {
          LODWORD(v20) = v18;
          -[VKPolygonGroup addStrokeForSection:paddedCount:key:attributes:styles:cullingMask:accessor:](self, "addStrokeForSection:paddedCount:key:attributes:styles:cullingMask:accessor:", v19, v16, a3, v12, (char *)a3 + 24, &__p, v20, a4);
        }
        (*(void (**)(uint64_t))(*(_QWORD *)v19 + 8))(v19);
      }
      if (__p)
      {
        v26 = __p;
        operator delete(__p);
      }
      ++v12;
    }
    while (v12 != v9);
  }
}

- (BOOL)addFillForSection:(const void *)a3 precision:(unsigned __int8)a4 styleIndex:(unsigned int)a5 cullingMask:(unsigned int)a6 accessor:(ResourceAccessor *)a7 triangulator:(void *)a8
{
  float32x4_t v8;
  double v9;
  float32x4_t v10;
  double v11;
  double v12;
  float32x4_t v13;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  __n128 v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v29;
  _DWORD v30[2];
  unsigned int v31;
  unsigned int v32;
  VKPolygonGroup *v33;
  _BYTE v34[24];
  _BYTE *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v33 = self;
  v31 = a6;
  v32 = a5;
  md::Triangulator<float>::triangulate((uint64_t)a8, *((_QWORD *)a3 + 1), *((_QWORD *)a3 + 11), v8, v9, v10, v11, v12, v13);
  v19 = *((_QWORD *)a8 + 11);
  v18 = *((_QWORD *)a8 + 12);
  if (v18 != v19)
  {
    -[VKPolygonalItemGroup size](self, "size");
    v30[0] = v20;
    v30[1] = v21;
    v29 = *(_QWORD *)self->super._boundingBox._minimum._e;
    v22 = *((_QWORD *)a3 + 11);
    v23 = (uint64_t)(*((_QWORD *)a8 + 12) - *((_QWORD *)a8 + 11)) >> 1;
    v24 = operator new(0x40uLL);
    *v24 = &off_1E42C8120;
    v24[1] = a3;
    v24[2] = &v29;
    v24[3] = v30;
    v24[4] = &v32;
    v24[5] = a8;
    v24[6] = &v33;
    v24[7] = &v31;
    v35 = v24;
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::writePoints((uint64_t)&self->super._fillMeshInfo._value, v22, v23, (unint64_t)a7, (uint64_t)v34, v25);
    v26 = v35;
    if (v35 == v34)
    {
      v27 = 4;
      v26 = v34;
      goto LABEL_6;
    }
    if (v35)
    {
      v27 = 5;
LABEL_6:
      (*(void (**)(void))(*v26 + 8 * v27))();
    }
  }
  return v18 != v19;
}

- (unsigned)styleIndexForAttributes:(const void *)a3 edgePair:(const GeoCodecsFeatureStylePair *)a4
{
  uint64_t v6;
  uint64_t v7;
  int *v8;
  unsigned int var0;
  uint64_t v10;
  int *v11;
  int v12;
  unsigned __int8 v13;
  int *v14;
  int v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  unsigned __int8 v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  uint64_t v26;
  std::__shared_weak_count *v27;
  uint64_t v28;
  std::__shared_weak_count *v29;

  geo::codec::copyFeatureStyleAttributes((uint64_t *)a3, &v28);
  v6 = v28;
  v7 = *(unsigned __int8 *)(v28 + 33);
  v8 = *(int **)v28;
  if (*(_BYTE *)(v28 + 33))
  {
    var0 = a4->var0;
    if (v7 >= 0x20)
    {
      v10 = 0;
      v14 = *(int **)v28;
      while (1)
      {
        v15 = *v14;
        v14 += 2;
        if (v15 == var0)
          break;
        if (v7 == ++v10)
          goto LABEL_12;
      }
    }
    else
    {
      v10 = 0;
      v11 = *(int **)v28;
      while (1)
      {
        v12 = *v11;
        v11 += 2;
        if (v12 == var0)
          break;
        if (v7 == ++v10)
          goto LABEL_6;
      }
    }
    v8[2 * v10 + 1] = a4->var1;
  }
  else
  {
LABEL_6:
    *(GeoCodecsFeatureStylePair *)&v8[2 * v7] = *a4;
    v13 = *(_BYTE *)(v6 + 33) + 1;
    *(_BYTE *)(v6 + 33) = v13;
    qsort(*(void **)v6, v13, 8uLL, (int (__cdecl *)(const void *, const void *))FeatureStyleAttributes::compareStylePairs);
    v6 = v28;
  }
LABEL_12:
  v26 = v6;
  v27 = v29;
  if (v29)
  {
    p_shared_owners = (unint64_t *)&v29->__shared_owners_;
    do
      v17 = __ldxr(p_shared_owners);
    while (__stxr(v17 + 1, p_shared_owners));
  }
  v18 = -[VKPolygonalItemGroup indexForGeoFeatureAttributes:](self, "indexForGeoFeatureAttributes:", &v26);
  v19 = v27;
  if (v27)
  {
    v20 = (unint64_t *)&v27->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  v22 = v29;
  if (v29)
  {
    v23 = (unint64_t *)&v29->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  return v18;
}

- (unsigned)initialStyleIndexForSection:(const void *)a3 attributes:(const void *)a4 styles:(const void *)a5
{
  uint64_t v5;
  int v6;
  uint64_t v8;

  v5 = *((_QWORD *)a5 + 1);
  while (v5 != *(_QWORD *)a5)
  {
    v6 = *(unsigned __int8 *)(v5 - 12);
    v5 -= 12;
    if (v6)
    {
      v8 = *(_QWORD *)(v5 + 4);
      return -[VKPolygonGroup styleIndexForAttributes:edgePair:](self, "styleIndexForAttributes:edgePair:", a4, &v8);
    }
  }
  return -[VKPolygonalItemGroup indexForGeoFeatureAttributes:](self, "indexForGeoFeatureAttributes:", a4);
}

- (void)addStrokeForSection:(const void *)a3 paddedCount:(unsigned int)a4 key:(pair<const void *) attributes:(unsigned long>)a5 styles:(const void *)a6 cullingMask:(void *)a7 accessor:(unsigned int)a8
{
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  VKPolygonGroup *v19;
  _QWORD *v20;
  __n128 v21;
  NSObject *v22;
  optional<md::MeshSet<ggl::PolygonCommonStroke::MeshMesh, ggl::PolygonCommonStroke::DefaultVbo>> *p_strokeMeshInfo;
  unint64_t v24;
  unint64_t v25;
  unsigned int v26;
  unsigned __int8 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  unint64_t v34;
  unint64_t v35;
  _QWORD *v36;
  int v37;
  int v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  _QWORD *v48;
  int v49;
  int v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  __int128 v56;
  __n128 v57;
  __int128 v58;
  pair<const void *, unsigned long> v59;
  _QWORD v60[2];
  uint8_t buf[16];
  unint64_t v62;
  unint64_t v63;
  __int16 v64;
  uint64_t v65;
  _BYTE v66[24];
  _BYTE *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v59 = a5;
  v14 = std::__hash_table<std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::__unordered_map_hasher<std::pair<void const*,unsigned long>,std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::hash<std::pair<void const*,unsigned long>>,std::equal_to<std::pair<void const*,unsigned long>>,true>,std::__unordered_map_equal<std::pair<void const*,unsigned long>,std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::equal_to<std::pair<void const*,unsigned long>>,std::hash<std::pair<void const*,unsigned long>>,true>,std::allocator<std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>>>::__emplace_unique_key_args<std::pair<void const*,unsigned long>,std::piecewise_construct_t const&,std::tuple<std::pair<void const*,unsigned long> const&>,std::tuple<>>((uint64_t)&self->super._polygonEdges, (unint64_t)a5.var0, a5.var1, &v59);
  v15 = v14[4];
  v16 = v14[5];
  v17 = v14 + 4;
  v18 = v16 - v15;
  if (v16 != v15)
  {
    v19 = self;
    v20 = operator new(0x38uLL);
    *v20 = &off_1E42C8168;
    v20[1] = a3;
    v20[2] = a6;
    v20[3] = a7;
    v20[4] = v19;
    v20[5] = v17;
    *((_DWORD *)v20 + 12) = a8;
    v67 = v20;
    if (a4 < 0x8000)
    {
      p_strokeMeshInfo = &v19->_strokeMeshInfo;
      v24 = 0x924924924924924ALL * (v18 >> 3);
      v25 = 2 * a4;
      v26 = *(unsigned __int16 *)&v19->_anon_b28[138];
      if (v25 > (unsigned __int16)~(_WORD)v26)
      {
        v27 = v19->_anon_b28[136] + 1;
        v19->_anon_b28[136] = v27;
        *(_WORD *)&v19->_anon_b28[138] = 0;
        *(_DWORD *)&v19->_anon_b28[140] = 0;
        v28 = **(_QWORD **)(*(_QWORD *)(*(_QWORD *)&v19->_anon_b28[16] + 16 * v27) + 64);
        v29 = *(unsigned __int16 *)(*(_QWORD *)&v19->_strokeMeshInfo._value.type + 8 * v27);
        memset(buf, 0, sizeof(buf));
        v30 = *(_QWORD *)(v28 + 8) * v29;
        v21.n128_u64[0] = (unint64_t)a9;
        *(_QWORD *)&v31 = a9;
        *((_QWORD *)&v31 + 1) = v28;
        v57 = v21;
        if (v30)
        {
          if (a9 && *(_BYTE *)(v28 + 17) != 2)
          {
            v56 = v31;
            v32 = (*((uint64_t (**)(ResourceAccessor *))a9->var0 + 7))(a9);
            v31 = v56;
          }
          else
          {
            v32 = *(_QWORD *)(v28 + 72);
          }
        }
        else
        {
          v32 = 0;
        }
        *(_OWORD *)buf = v31;
        v62 = 0;
        v63 = v30;
        v65 = v32;
        v64 = 257;
        ggl::BufferMemory::operator=((uint64_t *)&v19->_anon_b28[40], (uint64_t)buf);
        *(_QWORD *)&v33 = v57.n128_u64[0];
        if (v65)
        {
          v35 = v62;
          v34 = v63;
          if (v63 != v62)
          {
            v36 = *(_QWORD **)&buf[8];
            v37 = v64;
            v38 = HIBYTE(v64);
            if (*(_QWORD *)buf && *(_BYTE *)(*(_QWORD *)&buf[8] + 17) != 2)
            {
              (*(void (**)(__n128))(**(_QWORD **)buf + 64))(v57);
              *(_QWORD *)&v33 = v57.n128_u64[0];
            }
            if (v37 && !v38)
            {
              v40 = v36[7];
              v39 = v36[8];
              if (v39 == v40)
                v40 = v36[10] - v36[9];
              if (v35 < v40)
                v40 = v35;
              if (v39 <= v34)
                v39 = v34;
              if (v39 == v40)
                v39 = v40 + v36[10] - v36[9];
              v36[7] = v40;
              v36[8] = v39;
            }
          }
        }
        v41 = p_strokeMeshInfo[9]._value.data[0];
        v42 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)&p_strokeMeshInfo[2]._hasValue + 16 * v41) + 96);
        v43 = *(unsigned int *)(*(_QWORD *)&p_strokeMeshInfo->_value.type + 8 * v41 + 4);
        memset(buf, 0, sizeof(buf));
        v44 = *(_QWORD *)(v42 + 8) * v43;
        *((_QWORD *)&v33 + 1) = v42;
        if (v44)
        {
          if (a9 && *(_BYTE *)(v42 + 17) != 2)
          {
            v58 = v33;
            v45 = (*((uint64_t (**)(ResourceAccessor *))a9->var0 + 7))(a9);
            v33 = v58;
          }
          else
          {
            v45 = *(_QWORD *)(v42 + 72);
          }
        }
        else
        {
          v45 = 0;
        }
        *(_OWORD *)buf = v33;
        v62 = 0;
        v63 = v44;
        v65 = v45;
        v64 = 257;
        ggl::BufferMemory::operator=((uint64_t *)&p_strokeMeshInfo[6]._value, (uint64_t)buf);
        if (v65)
        {
          v47 = v62;
          v46 = v63;
          if (v63 != v62)
          {
            v48 = *(_QWORD **)&buf[8];
            v49 = v64;
            v50 = HIBYTE(v64);
            if (*(_QWORD *)buf && *(_BYTE *)(*(_QWORD *)&buf[8] + 17) != 2)
              (*(void (**)(void))(**(_QWORD **)buf + 64))();
            if (v49 && !v50)
            {
              v52 = v48[7];
              v51 = v48[8];
              if (v51 == v52)
                v52 = v48[10] - v48[9];
              if (v47 < v52)
                v52 = v47;
              if (v51 <= v46)
                v51 = v46;
              if (v51 == v52)
                v51 = v52 + v48[10] - v48[9];
              v48[7] = v52;
              v48[8] = v51;
            }
          }
        }
        v26 = WORD1(p_strokeMeshInfo[9]._value.type);
        v20 = v67;
      }
      *(_QWORD *)buf = v26;
      *(_QWORD *)&buf[8] = v25 + v26;
      v53 = v24 + HIDWORD(p_strokeMeshInfo[9]._value.type);
      v60[0] = HIDWORD(p_strokeMeshInfo[9]._value.type);
      v60[1] = v53;
      if (!v20)
      {
        std::__throw_bad_function_call[abi:nn180100]();
        __break(1u);
        return;
      }
      (*(void (**)(_QWORD *, uint8_t *, _QWORD *, ValueUnion *, ValueUnion *))(*v20 + 48))(v20, buf, v60, &p_strokeMeshInfo[3]._value, &p_strokeMeshInfo[6]._value);
      WORD1(p_strokeMeshInfo[9]._value.type) += v25;
      HIDWORD(p_strokeMeshInfo[9]._value.type) += v24;
    }
    else
    {
      if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
        dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
      v22 = (id)GEOGetVectorKitVKDefaultLog_log;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F029000, v22, OS_LOG_TYPE_ERROR, "MeshSet: Cannot write points for polygons: polygon is too big", buf, 2u);
      }

    }
    v54 = v67;
    if (v67 == v66)
    {
      v55 = 4;
      v54 = v66;
    }
    else
    {
      if (!v67)
        return;
      v55 = 5;
    }
    (*(void (**)(void))(*v54 + 8 * v55))();
  }
}

- (void)updateTextures:(unsigned __int8)a3 textureManager:(void *)a4
{
  unsigned int v5;
  _QWORD **v7;
  std::string::size_type *v8;
  std::string::size_type v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  unint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  unsigned int v16;
  std::string::size_type size;
  shared_ptr<ggl::Texture2D> v18;
  __shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  __shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  __shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  __shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  __shared_weak_count *cntrl;
  unint64_t *v32;
  unint64_t v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  unint64_t v37;
  unsigned int v38;
  std::string::size_type v39;
  shared_ptr<ggl::Texture2D> v40;
  __shared_weak_count *v41;
  unint64_t *v42;
  unint64_t v43;
  __shared_weak_count *v44;
  unint64_t *v45;
  unint64_t v46;
  unint64_t *v47;
  unint64_t v48;
  std::string::size_type v49;
  shared_ptr<ggl::Texture2D> v50;
  __shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  unint64_t *v54;
  unint64_t v55;
  unint64_t v56;
  unsigned int v57;
  std::string::size_type v58;
  shared_ptr<ggl::Texture2D> v59;
  __shared_weak_count *v60;
  unint64_t *v61;
  unint64_t v62;
  __shared_weak_count *v63;
  unint64_t *v64;
  unint64_t v65;
  shared_ptr<ggl::Texture2D> v66;
  std::string v67;
  std::string __p;
  std::string v69;
  std::string::size_type v70;
  std::__shared_weak_count *v71;
  _QWORD v72[2];
  unsigned __int8 v73;

  v5 = a3;
  -[VKPolygonalItemGroup updateCachedStyles](self, "updateCachedStyles");
  LOWORD(__p.__r_.__value_.__l.__data_) = 0;
  v7 = -[VKPolygonalItemGroup styleQueries:](self, "styleQueries:", &__p);
  v8 = *v7;
  v9 = **v7;
  v10 = (std::__shared_weak_count *)v8[1];
  v69.__r_.__value_.__r.__words[0] = v9;
  v69.__r_.__value_.__l.__size_ = (std::string::size_type)v10;
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v12 = __ldxr(p_shared_owners);
    while (__stxr(v12 + 1, p_shared_owners));
    v71 = v10;
    do
      v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
  }
  else
  {
    v71 = 0;
  }
  v72[0] = 0;
  v72[1] = 0;
  v70 = v9;
  v73 = 0;
  if (v9)
    LODWORD(v9) = (*(uint64_t (**)(std::string::size_type, _QWORD *))(*(_QWORD *)v9 + 48))(v9, v72);
  v73 = v9;
  if (v10)
  {
    v14 = (unint64_t *)&v10->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
    LODWORD(v9) = v73;
  }
  if ((_DWORD)v9)
  {
    if (v5 >= 0x17)
      v16 = 23;
    else
      v16 = v5;
    gss::RenderStyle<gss::PropertyID>::valueForKeyAtZ<std::string>(&v69, *(_QWORD *)(v70 + 24), 0x88u, v16, 2);
    size = HIBYTE(v69.__r_.__value_.__r.__words[2]);
    if ((v69.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      size = v69.__r_.__value_.__l.__size_;
    if (size)
    {
      -[VKPolygonGroup _textureForName:textureManager:](self, "_textureForName:textureManager:", &v69, a4);
      v18 = *(shared_ptr<ggl::Texture2D> *)&__p.__r_.__value_.__l.__data_;
    }
    else
    {
      v18 = (shared_ptr<ggl::Texture2D>)0;
    }
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = 0uLL;
    cntrl = self->_sourceTexture.__cntrl_;
    self->_sourceTexture = v18;
    if (cntrl)
    {
      v32 = (unint64_t *)((char *)cntrl + 8);
      do
        v33 = __ldaxr(v32);
      while (__stlxr(v33 - 1, v32));
      if (!v33)
      {
        (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
      }
    }
    v34 = (std::__shared_weak_count *)__p.__r_.__value_.__l.__size_;
    if (__p.__r_.__value_.__l.__size_)
    {
      v35 = (unint64_t *)(__p.__r_.__value_.__l.__size_ + 8);
      do
        v36 = __ldaxr(v35);
      while (__stlxr(v36 - 1, v35));
      if (!v36)
      {
        ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
        std::__shared_weak_count::__release_weak(v34);
      }
    }
    v37 = *(_QWORD *)(v70 + 24);
    v38 = *(unsigned __int8 *)(v37 + 12);
    if (v38 == 2)
    {
      if ((gss::RenderStyle<gss::PropertyID>::hasValueForKeyAtZAtEnd(*(_QWORD *)(v70 + 24), 0x88u, v16, 0) & 1) != 0)
        goto LABEL_59;
      v38 = 1;
    }
    if (!gss::RenderStyle<gss::PropertyID>::hasValueForKeyAtZAtEnd(v37, 0x88u, v16, v38))
    {
      v41 = self->_targetTexture.__cntrl_;
      self->_targetTexture.__ptr_ = 0;
      self->_targetTexture.__cntrl_ = 0;
      if (v41)
      {
        v42 = (unint64_t *)((char *)v41 + 8);
        do
          v43 = __ldaxr(v42);
        while (__stlxr(v43 - 1, v42));
        if (!v43)
        {
          (*(void (**)(__shared_weak_count *))(*(_QWORD *)v41 + 16))(v41);
          std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v41);
        }
      }
      goto LABEL_80;
    }
LABEL_59:
    gss::RenderStyle<gss::PropertyID>::valueForKeyAtZ<std::string>(&__p, v37, 0x88u, v16, 1);
    v39 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v39 = __p.__r_.__value_.__l.__size_;
    if (v39)
    {
      -[VKPolygonGroup _textureForName:textureManager:](self, "_textureForName:textureManager:", &__p, a4);
      v40 = *(shared_ptr<ggl::Texture2D> *)&v67.__r_.__value_.__l.__data_;
    }
    else
    {
      v40 = (shared_ptr<ggl::Texture2D>)0;
    }
    *(_OWORD *)&v67.__r_.__value_.__l.__data_ = 0uLL;
    v44 = self->_targetTexture.__cntrl_;
    self->_targetTexture = v40;
    if (v44)
    {
      v45 = (unint64_t *)((char *)v44 + 8);
      do
        v46 = __ldaxr(v45);
      while (__stlxr(v46 - 1, v45));
      if (!v46)
      {
        (*(void (**)(__shared_weak_count *))(*(_QWORD *)v44 + 16))(v44);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v44);
      }
    }
    if (!v67.__r_.__value_.__l.__size_)
      goto LABEL_78;
    v47 = (unint64_t *)(v67.__r_.__value_.__l.__size_ + 8);
    do
      v48 = __ldaxr(v47);
    while (__stlxr(v48 - 1, v47));
    if (v48)
    {
LABEL_78:
      if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_80;
      goto LABEL_79;
    }
    (*(void (**)(std::string::size_type))(*(_QWORD *)v67.__r_.__value_.__l.__size_ + 16))(v67.__r_.__value_.__l.__size_);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v67.__r_.__value_.__l.__size_);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
LABEL_79:
      operator delete(__p.__r_.__value_.__l.__data_);
LABEL_80:
    gss::RenderStyle<gss::PropertyID>::valueForKeyAtZ<std::string>(&__p, *(_QWORD *)(v70 + 24), 0x14Du, v16, 2);
    v49 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v49 = __p.__r_.__value_.__l.__size_;
    if (v49)
    {
      -[VKPolygonGroup _textureForName:textureManager:](self, "_textureForName:textureManager:", &__p, a4);
      v50 = *(shared_ptr<ggl::Texture2D> *)&v67.__r_.__value_.__l.__data_;
    }
    else
    {
      v50 = (shared_ptr<ggl::Texture2D>)0;
    }
    *(_OWORD *)&v67.__r_.__value_.__l.__data_ = 0uLL;
    v51 = self->_sourceRoofTexture.__cntrl_;
    self->_sourceRoofTexture = v50;
    if (v51)
    {
      v52 = (unint64_t *)((char *)v51 + 8);
      do
        v53 = __ldaxr(v52);
      while (__stlxr(v53 - 1, v52));
      if (!v53)
      {
        (*(void (**)(__shared_weak_count *))(*(_QWORD *)v51 + 16))(v51);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v51);
      }
    }
    if (v67.__r_.__value_.__l.__size_)
    {
      v54 = (unint64_t *)(v67.__r_.__value_.__l.__size_ + 8);
      do
        v55 = __ldaxr(v54);
      while (__stlxr(v55 - 1, v54));
      if (!v55)
      {
        (*(void (**)(std::string::size_type))(*(_QWORD *)v67.__r_.__value_.__l.__size_ + 16))(v67.__r_.__value_.__l.__size_);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v67.__r_.__value_.__l.__size_);
      }
    }
    v56 = *(_QWORD *)(v70 + 24);
    v57 = *(unsigned __int8 *)(v56 + 12);
    if (v57 == 2)
    {
      if ((gss::RenderStyle<gss::PropertyID>::hasValueForKeyAtZAtEnd(*(_QWORD *)(v70 + 24), 0x14Du, v16, 0) & 1) != 0)
        goto LABEL_99;
      v57 = 1;
    }
    if (!gss::RenderStyle<gss::PropertyID>::hasValueForKeyAtZAtEnd(v56, 0x14Du, v16, v57))
    {
      v60 = self->_targetRoofTexture.__cntrl_;
      self->_targetRoofTexture.__ptr_ = 0;
      self->_targetRoofTexture.__cntrl_ = 0;
      if (v60)
      {
        v61 = (unint64_t *)((char *)v60 + 8);
        do
          v62 = __ldaxr(v61);
        while (__stlxr(v62 - 1, v61));
        if (!v62)
        {
          (*(void (**)(__shared_weak_count *))(*(_QWORD *)v60 + 16))(v60);
          std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v60);
          if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            goto LABEL_117;
          goto LABEL_122;
        }
      }
      goto LABEL_116;
    }
LABEL_99:
    gss::RenderStyle<gss::PropertyID>::valueForKeyAtZ<std::string>(&v67, v56, 0x14Du, v16, 1);
    v58 = HIBYTE(v67.__r_.__value_.__r.__words[2]);
    if ((v67.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v58 = v67.__r_.__value_.__l.__size_;
    if (v58)
    {
      -[VKPolygonGroup _textureForName:textureManager:](self, "_textureForName:textureManager:", &v67, a4);
      v59 = v66;
    }
    else
    {
      v59 = (shared_ptr<ggl::Texture2D>)0;
    }
    v63 = self->_targetRoofTexture.__cntrl_;
    self->_targetRoofTexture = v59;
    if (v63)
    {
      v64 = (unint64_t *)((char *)v63 + 8);
      do
        v65 = __ldaxr(v64);
      while (__stlxr(v65 - 1, v64));
      if (!v65)
      {
        (*(void (**)(__shared_weak_count *))(*(_QWORD *)v63 + 16))(v63);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v63);
      }
    }
    if (SHIBYTE(v67.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v67.__r_.__value_.__l.__data_);
      if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_117:
        if ((SHIBYTE(v69.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_118;
LABEL_123:
        operator delete(v69.__r_.__value_.__l.__data_);
        goto LABEL_118;
      }
LABEL_122:
      operator delete(__p.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v69.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_118;
      goto LABEL_123;
    }
LABEL_116:
    if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_117;
    goto LABEL_122;
  }
  v19 = self->_sourceTexture.__cntrl_;
  self->_sourceTexture.__ptr_ = 0;
  self->_sourceTexture.__cntrl_ = 0;
  if (v19)
  {
    v20 = (unint64_t *)((char *)v19 + 8);
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)v19 + 16))(v19);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v19);
    }
  }
  v22 = self->_targetTexture.__cntrl_;
  self->_targetTexture.__ptr_ = 0;
  self->_targetTexture.__cntrl_ = 0;
  if (v22)
  {
    v23 = (unint64_t *)((char *)v22 + 8);
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)v22 + 16))(v22);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v22);
    }
  }
  v25 = self->_sourceRoofTexture.__cntrl_;
  self->_sourceRoofTexture.__ptr_ = 0;
  self->_sourceRoofTexture.__cntrl_ = 0;
  if (v25)
  {
    v26 = (unint64_t *)((char *)v25 + 8);
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)v25 + 16))(v25);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v25);
    }
  }
  v28 = self->_targetRoofTexture.__cntrl_;
  self->_targetRoofTexture.__ptr_ = 0;
  self->_targetRoofTexture.__cntrl_ = 0;
  if (v28)
  {
    v29 = (unint64_t *)((char *)v28 + 8);
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)v28 + 16))(v28);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v28);
    }
  }
LABEL_118:
  self->_lastResolvedZoom = v5;
  gss::QueryableLocker<gss::PropertyID>::~QueryableLocker((uint64_t)&v70);
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  __shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  __shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  __shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  char *begin;
  char *end;
  void *v17;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  optional<md::MeshSet<ggl::PolygonCommonStroke::MeshMesh, ggl::PolygonCommonStroke::DefaultVbo>> *p_strokeMeshInfo;

  cntrl = self->_targetRoofTexture.__cntrl_;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
  v6 = self->_sourceRoofTexture.__cntrl_;
  if (v6)
  {
    v7 = (unint64_t *)((char *)v6 + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)v6 + 16))(v6, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v6);
    }
  }
  v9 = self->_targetTexture.__cntrl_;
  if (v9)
  {
    v10 = (unint64_t *)((char *)v9 + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)v9 + 16))(v9, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v9);
    }
  }
  v12 = self->_sourceTexture.__cntrl_;
  if (v12)
  {
    v13 = (unint64_t *)((char *)v12 + 8);
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)v12 + 16))(v12, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v12);
    }
  }
  begin = (char *)self->_strokeMeshes.__begin_;
  if (begin)
  {
    end = (char *)self->_strokeMeshes.__end_;
    v17 = self->_strokeMeshes.__begin_;
    if (end != begin)
    {
      do
      {
        v18 = (std::__shared_weak_count *)*((_QWORD *)end - 1);
        if (v18)
        {
          p_shared_owners = (unint64_t *)&v18->__shared_owners_;
          do
            v20 = __ldaxr(p_shared_owners);
          while (__stlxr(v20 - 1, p_shared_owners));
          if (!v20)
          {
            ((void (*)(std::__shared_weak_count *, SEL))v18->__on_zero_shared)(v18, a2);
            std::__shared_weak_count::__release_weak(v18);
          }
        }
        end -= 16;
      }
      while (end != begin);
      v17 = self->_strokeMeshes.__begin_;
    }
    self->_strokeMeshes.__end_ = begin;
    operator delete(v17);
  }
  p_strokeMeshInfo = &self->_strokeMeshInfo;
  if (p_strokeMeshInfo->_hasValue)
  {
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)&p_strokeMeshInfo->_value);
    p_strokeMeshInfo->_hasValue = 0;
  }
}

- (id).cxx_construct
{
  *((_BYTE *)self + 2840) = 0;
  *((_QWORD *)self + 380) = 0;
  *((_QWORD *)self + 381) = 0;
  *((_QWORD *)self + 379) = 0;
  *((_QWORD *)self + 382) = 0;
  *((_QWORD *)self + 383) = 0;
  *((_QWORD *)self + 384) = 0;
  *((_QWORD *)self + 385) = 0;
  *((_QWORD *)self + 386) = 0;
  *((_QWORD *)self + 387) = 0;
  *((_QWORD *)self + 388) = 0;
  *((_QWORD *)self + 389) = 0;
  return self;
}

- (uint64_t)addStrokeForSection:paddedCount:key:attributes:styles:cullingMask:accessor:
{

  return a1;
}

- (void)addStrokeForSection:paddedCount:key:attributes:styles:cullingMask:accessor:
{
  char v8;
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;
  float32x4_t v15;
  uint64_t v16;
  float *v17;
  float v18;
  uint64_t v19;
  int v20;
  __int16 v21;
  uint64_t v22;
  float32x4_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  float *v27;
  float v28;
  int v29;
  uint64_t v30;
  float32x4_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _WORD *v37;
  int v38;
  int v39;
  uint64_t v40;
  int v41;
  unsigned int v42;
  float32x4_t v45;
  uint64_t *v46;
  __int128 v47;
  uint64_t v48;

  v8 = objc_msgSend(*(id *)(a1 + 32), "initialStyleIndexForSection:attributes:styles:", *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
  v9 = *(_QWORD **)(a1 + 8);
  v46 = a2;
  if (v9[11])
  {
    v10 = 0;
    v11 = 0;
    v12 = v8 & 0xF;
    v13 = *a2;
    v14 = *(_QWORD *)(a4 + 40);
    v15 = (float32x4_t)vdupq_n_s32(0x46FFFF00u);
    v45 = v15;
    do
    {
      v16 = v9[2];
      v17 = (float *)(v9[1] + 8 * v10);
      v18 = v17[1];
      LODWORD(v17) = (int)(float)(*v17 * 65535.0);
      v19 = v9[5];
      v20 = (int)(float)(v18 * 65535.0);
      v21 = v12 << 8;
      v22 = v14 + 24 * (2 * v11 + v13);
      *(_WORD *)v22 = (_WORD)v17;
      *(_WORD *)(v22 + 2) = v20;
      *(_WORD *)(v22 + 4) = (v12 << 8) | v12;
      *(_WORD *)(v22 + 6) = 0;
      *(_WORD *)(v22 + 24) = (_WORD)v17;
      *(_WORD *)(v22 + 26) = v20;
      *(_WORD *)(v22 + 28) = (v12 << 8) | v12;
      *(_WORD *)(v22 + 30) = -1;
      v23.i64[0] = *(_QWORD *)(v19 + 8 * v10);
      v23.i64[1] = *(_QWORD *)(v16 + 8 * v10);
      *(int16x4_t *)v23.f32 = vmovn_s32(vcvtq_s32_f32(vmulq_f32(v23, v15)));
      *(_QWORD *)(v22 + 8) = v23.i64[0];
      *(_QWORD *)(v22 + 32) = v23.i64[0];
      *(_DWORD *)(v22 + 16) = 1065353216;
      *(_DWORD *)(v22 + 40) = 0;
      v24 = **(_QWORD **)(a1 + 24);
      if (*(_BYTE *)(v24 + 12 * v10))
      {
        v25 = objc_msgSend(*(id *)(a1 + 32), "styleIndexForAttributes:edgePair:", *(_QWORD *)(a1 + 16), v24 + 12 * v10 + 4);
        v15 = v45;
        v13 = *v46;
        v14 = *(_QWORD *)(a4 + 40);
        v26 = v14 + 24 * (*v46 + 2 * v11);
        *(_WORD *)(v26 + 4) = v21 | v25 & 0xF;
        *(_WORD *)(v26 + 28) = v21 | v25 & 0xF;
        v9 = *(_QWORD **)(a1 + 8);
        v27 = (float *)(v9[1] + 8 * v10);
        v28 = v27[1];
        LODWORD(v27) = (int)(float)(*v27 * 65535.0);
        ++v11;
        v29 = (int)(float)(v28 * 65535.0);
        v30 = v14 + 24 * (v13 + 2 * v11);
        *(_WORD *)v30 = (_WORD)v27;
        *(_WORD *)(v30 + 2) = v29;
        *(_WORD *)(v30 + 4) = v12 | ((v25 & 0xF) << 8);
        *(_WORD *)(v30 + 6) = 0;
        *(_WORD *)(v30 + 24) = (_WORD)v27;
        *(_WORD *)(v30 + 26) = v29;
        *(_WORD *)(v30 + 28) = v12 | ((v25 & 0xF) << 8);
        *(_WORD *)(v30 + 30) = -1;
        v31.i64[0] = *(_QWORD *)(v16 + 8 * v10);
        v31.i64[1] = *(_QWORD *)(v19 + 8 * v10);
        *(int16x4_t *)v31.f32 = vmovn_s32(vcvtq_s32_f32(vmulq_f32(v31, v45)));
        *(_QWORD *)(v30 + 8) = v31.i64[0];
        *(_QWORD *)(v30 + 32) = v31.i64[0];
        *(_DWORD *)(v30 + 16) = 1065353216;
        *(_DWORD *)(v30 + 40) = 0;
        v12 = v25 & 0xF;
      }
      ++v10;
      ++v11;
    }
    while (v10 < v9[11]);
  }
  v32 = *(uint64_t **)(a1 + 40);
  v33 = *v32;
  v34 = v32[1];
  if (v33 != v34)
  {
    v35 = *v46;
    v36 = *v46 + 1;
    v37 = (_WORD *)(*(_QWORD *)(a5 + 40) + 2 * *a3 + 6);
    do
    {
      v38 = 2 * *(_DWORD *)(v33 + 24);
      *(v37 - 3) = v38 + v35;
      v39 = 2 * *(_DWORD *)(v33 + 32);
      *(v37 - 2) = 2 * *(_WORD *)(v33 + 32) + v35;
      LOWORD(v38) = v38 + v36;
      *(v37 - 1) = v38;
      *v37 = v38;
      v37[1] = v39 + v35;
      v37[2] = v39 + v36;
      v33 += 56;
      v37 += 6;
    }
    while (v33 != v34);
  }
  v40 = *(_QWORD *)(a1 + 32);
  v41 = *(_DWORD *)(a1 + 48);
  v42 = *(unsigned __int8 *)(v40 + 2992);
  v47 = *(_OWORD *)a3;
  v48 = v9[13];
  _addRangeToList(v40 + 624, v41, v42, &v47);
}

- (char)addStrokeForSection:paddedCount:key:attributes:styles:cullingMask:accessor:
{
  char *v2;
  void *v3;
  id v4;
  uint64_t v5;

  v2 = (char *)operator new(0x38uLL);
  *(_QWORD *)v2 = &off_1E42C8168;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  v3 = *(void **)(a1 + 32);
  *((_QWORD *)v2 + 3) = *(_QWORD *)(a1 + 24);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 40);
  *((_QWORD *)v2 + 4) = v4;
  *((_QWORD *)v2 + 5) = v5;
  *((_DWORD *)v2 + 12) = *(_DWORD *)(a1 + 48);
  return v2;
}

- (id)addStrokeForSection:paddedCount:key:attributes:styles:cullingMask:accessor:
{
  __int128 v4;
  id result;
  int v6;

  *(_QWORD *)a2 = &off_1E42C8168;
  v4 = *(_OWORD *)(a1 + 8);
  *(_QWORD *)(a2 + 24) = *(_QWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 8) = v4;
  result = *(id *)(a1 + 32);
  *(_QWORD *)(a2 + 32) = result;
  v6 = *(_DWORD *)(a1 + 48);
  *(_QWORD *)(a2 + 40) = *(_QWORD *)(a1 + 40);
  *(_DWORD *)(a2 + 48) = v6;
  return result;
}

- (void)addFillForSection:precision:styleIndex:cullingMask:accessor:triangulator:
{
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _DWORD *v19;
  unsigned __int32 *v20;
  unsigned int v21;
  __int16 *v22;
  uint64_t v23;
  BOOL v24;
  BOOL v25;
  BOOL v26;
  BOOL v27;
  float32x4_t v28;
  unint64_t v29;
  float32x4_t v30;
  int16x8_t v31;
  __int128 v32;
  float v33;
  const float *v34;
  unint64_t v35;
  const float *v36;
  int16x8_t v37;
  int16x8_t v38;
  float v39;
  unint64_t v40;
  float *v41;
  _WORD *v42;
  float v43;
  float v44;
  int16x8_t *v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  int16x8_t *v49;
  unint64_t v50;
  unint64_t v51;
  _WORD *v52;
  __int16 *v53;
  __int16 v54;
  int *v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  int16x8_t v59;
  int16x8_t *v60;
  int16x8_t *v61;
  unint64_t v62;
  int16x8_t v63;
  __int128 v64;
  uint64_t v65;
  float32x4x2_t v66;
  float32x4x2_t v67;

  v13 = *a2;
  v14 = *(_QWORD *)(a5 + 40);
  v15 = *(_QWORD **)(a1 + 8);
  v16 = v15[11];
  if (v16)
  {
    v17 = *(_QWORD *)(a4 + 40);
    v18 = v15[1];
    v19 = *(_DWORD **)(a1 + 16);
    v20 = *(unsigned __int32 **)(a1 + 24);
    LODWORD(a6) = *v19;
    LODWORD(a7) = v19[1];
    a9.i32[0] = *v20;
    a8.i32[0] = v20[1];
    v21 = **(unsigned __int16 **)(a1 + 32) << 8;
    if (v16 <= 0xF
      || ((v22 = (__int16 *)(v17 + 8 * v13), v23 = 4 * (v16 - 1), &v22[v23] >= v22)
        ? (v24 = &v22[v23 + 1] >= v22 + 1)
        : (v24 = 0),
          v24 ? (v25 = &v22[v23 + 2] >= v22 + 2) : (v25 = 0),
          v25 ? (v26 = &v22[v23 + 3] >= v22 + 3) : (v26 = 0),
          v26 ? (v27 = (v16 - 1) >> 61 == 0) : (v27 = 0),
          !v27))
    {
      v29 = 0;
LABEL_22:
      v39 = 1.0 / a9.f32[0];
      v40 = v16 - v29;
      v41 = (float *)(v18 + 8 * v29 + 4);
      v42 = (_WORD *)(v17 + 8 * (v29 + v13) + 4);
      v43 = 1.0 / a8.f32[0];
      do
      {
        v44 = (float)((float)(*v41 - *(float *)&a7) * 65535.0) * v43;
        *(v42 - 2) = (int)(float)((float)((float)(*(v41 - 1) - *(float *)&a6) * 65535.0) * v39);
        *(v42 - 1) = (int)v44;
        *v42 = 0x7FFF;
        v42[1] = v21;
        v41 += 2;
        v42 += 4;
        --v40;
      }
      while (v40);
      goto LABEL_24;
    }
    v28 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a6, 0);
    v29 = v16 & 0xFFFFFFFFFFFFFFF8;
    v30 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a7, 0);
    v31 = vdupq_n_s16(v21);
    *(_QWORD *)&v32 = 0x8000800080008000;
    *((_QWORD *)&v32 + 1) = 0x8000800080008000;
    a13.i32[0] = 1199570688;
    LODWORD(v33) = vdivq_f32(a13, a9).u32[0];
    a13.i32[0] = vdivq_f32(a13, a8).u32[0];
    v34 = (const float *)v15[1];
    v35 = v16 & 0xFFFFFFFFFFFFFFF8;
    do
    {
      v36 = v34;
      v66 = vld2q_f32(v36);
      v36 += 8;
      v67 = vld2q_f32(v36);
      v37 = vuzp1q_s16((int16x8_t)vcvtq_u32_f32(vmulq_n_f32(vsubq_f32(v66.val[0], v28), v33)), (int16x8_t)vcvtq_u32_f32(vmulq_n_f32(vsubq_f32(v67.val[0], v28), v33)));
      v38 = vuzp1q_s16((int16x8_t)vcvtq_u32_f32(vmulq_n_f32(vsubq_f32(v66.val[1], v30), a13.f32[0])), (int16x8_t)vcvtq_u32_f32(vmulq_n_f32(vsubq_f32(v67.val[1], v30), a13.f32[0])));
      vst4q_s16(v22, *(int16x8x4_t *)(&v32 - 2));
      v22 += 32;
      v34 += 16;
      v35 -= 8;
    }
    while (v35);
    if (v16 != v29)
      goto LABEL_22;
  }
LABEL_24:
  v45 = *(int16x8_t **)(*(_QWORD *)(a1 + 40) + 88);
  v46 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96) - (_QWORD)v45;
  if (!v46)
    goto LABEL_32;
  v47 = v46 >> 1;
  v48 = *a3;
  if (v47 <= 1)
    v47 = 1;
  if (v47 <= 0xF || (v49 = (int16x8_t *)(2 * v48 + v14), (unint64_t)((char *)v49 - (char *)v45) < 0x20))
  {
    v50 = 0;
LABEL_30:
    v51 = v47 - v50;
    v52 = (_WORD *)(v14 + 2 * (v50 + v48));
    v53 = &v45->i16[v50];
    do
    {
      v54 = *v53++;
      *v52++ = v54 + v13;
      --v51;
    }
    while (v51);
    goto LABEL_32;
  }
  v50 = v47 & 0xFFFFFFFFFFFFFFF0;
  v59 = vdupq_n_s16(v13);
  v60 = v49 + 1;
  v61 = v45 + 1;
  v62 = v47 & 0xFFFFFFFFFFFFFFF0;
  do
  {
    v63 = vaddq_s16(*v61, v59);
    v60[-1] = vaddq_s16(v61[-1], v59);
    *v60 = v63;
    v60 += 2;
    v61 += 2;
    v62 -= 16;
  }
  while (v62);
  if (v47 != v50)
    goto LABEL_30;
LABEL_32:
  v55 = *(int **)(a1 + 56);
  v56 = **(_QWORD **)(a1 + 48);
  v57 = v56 + 240;
  v58 = *v55;
  LODWORD(v56) = *(unsigned __int8 *)(v56 + 160);
  v64 = *(_OWORD *)a3;
  v65 = v15[13];
  _addRangeToList(v57, v58, v56, &v64);
}

- (__n128)addFillForSection:precision:styleIndex:cullingMask:accessor:triangulator:
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_QWORD *)a2 = &off_1E42C8120;
  result = *(__n128 *)(a1 + 8);
  v3 = *(_OWORD *)(a1 + 24);
  v4 = *(_OWORD *)(a1 + 40);
  *(_QWORD *)(a2 + 56) = *(_QWORD *)(a1 + 56);
  *(_OWORD *)(a2 + 40) = v4;
  *(_OWORD *)(a2 + 24) = v3;
  *(__n128 *)(a2 + 8) = result;
  return result;
}

@end

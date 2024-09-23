@implementation VKBuildingGroup

- (VKBuildingGroup)initWithStyleQuery:(void *)a3 tileZoom:(float)a4 fixedAroundCentroid:(const void *)a5 contentScale:(float)a6
{
  VKBuildingGroup *v6;
  VKBuildingGroup *v7;
  _QWORD *v8;
  unsigned __int8 v9;
  _QWORD *value;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  unsigned __int8 v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  unsigned __int8 v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  unsigned __int8 v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  VKBuildingGroup *v42;
  char *v43;
  unint64_t *v44;
  char *v45;
  uint64_t *v46;
  uint64_t **v47;
  uint64_t **v48;
  unint64_t v49;
  uint64_t *v50;
  uint64_t *v51;
  unint64_t v52;
  uint64_t v53;
  __int128 v54;
  std::__shared_weak_count *v55;
  unint64_t *p_shared_owners;
  unint64_t v57;
  std::__shared_weak_count *v58;
  unint64_t *v59;
  unint64_t v60;
  char *v61;
  char *v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t v68;
  char *v69;
  char *v70;
  unint64_t v71;
  uint64_t v72;
  char *v73;
  char *v74;
  uint64_t v75;
  __int128 v76;
  uint64_t v77;
  VKBuildingGroup *v78;
  optional<md::MeshSet<ggl::BuildingFlatStroke::BuildingFlatStrokeMesh, ggl::BuildingFlatStroke::DefaultVbo>> *p_strokeMeshInfo;
  void **p_value;
  void *v81;
  void **v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  std::__shared_weak_count *v86;
  unint64_t *v87;
  unint64_t v88;
  __int128 v89;
  uint64_t v90;
  uint64_t v91;
  optional<md::MeshSet<ggl::BuildingFlatStroke::BuildingFlatStrokeMesh, ggl::BuildingFlatStroke::DefaultVbo>> v92;
  std::__shared_weak_count *v93;
  unint64_t *v94;
  unint64_t v95;
  __int128 v96;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  _OWORD v102[3];
  __int128 v103;
  __int128 v104;
  __int16 v105;
  uint64_t v106;
  __int128 v107;
  __int128 v108;
  __int16 v109;
  uint64_t v110;
  _OWORD v111[3];
  objc_super v112;
  __int128 v113;

  v112.receiver = self;
  v112.super_class = (Class)VKBuildingGroup;
  v6 = -[VKPolygonalItemGroup initWithStyleQuery:tileZoom:fixedAroundCentroid:contentScale:](&v112, sel_initWithStyleQuery_tileZoom_fixedAroundCentroid_contentScale_, a3, a5);
  v7 = v6;
  if (v6)
  {
    v8 = (_QWORD *)operator new();
    *v8 = 0;
    v8[1] = 0;
    v8[2] = 0;
    {
      v98 = operator new();
      ggl::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v98, "GeoGL", 0xA3D02C1100000005);
    }
    v8[3] = ggl::Allocator::instance(void)::alloc;
    ggl::MeshVendor<ggl::BuildingFacade::BuildingMesh>::_allocateNewMesh((uint64_t)v8);
    value = v6->_extrusionFillMeshVendor.__ptr_.__value_;
    v6->_extrusionFillMeshVendor.__ptr_.__value_ = v8;
    if (value)
    {
      v11 = (_QWORD *)*value;
      if (*value)
      {
        v12 = (_QWORD *)value[1];
        v13 = (_QWORD *)*value;
        if (v12 != v11)
        {
          do
          {
            v15 = *--v12;
            v14 = v15;
            *v12 = 0;
            if (v15)
              (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v14 + 8))(v14, v13);
          }
          while (v12 != v11);
          v13 = (_QWORD *)*value;
        }
        value[1] = v11;
        (*(void (**)(_QWORD, _QWORD *, uint64_t))(*(_QWORD *)value[3] + 40))(value[3], v13, value[2] - (_QWORD)v13);
      }
      MEMORY[0x1A1AF4E00](value, 0x20C40DC1BFBCFLL);
    }
    v16 = (_QWORD *)operator new();
    *v16 = 0;
    v16[1] = 0;
    v16[2] = 0;
    {
      v99 = operator new();
      ggl::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v99, "GeoGL", 0xA3D02C1100000005);
    }
    v16[3] = ggl::Allocator::instance(void)::alloc;
    ggl::MeshVendor<ggl::PrefilteredLine::PrefilteredLineMesh>::_allocateNewMesh((uint64_t)v16);
    v18 = v6->_extrusionStrokeMeshVendor.__ptr_.__value_;
    v6->_extrusionStrokeMeshVendor.__ptr_.__value_ = v16;
    if (v18)
    {
      v19 = (_QWORD *)*v18;
      if (*v18)
      {
        v20 = (_QWORD *)v18[1];
        v21 = (_QWORD *)*v18;
        if (v20 != v19)
        {
          do
          {
            v23 = *--v20;
            v22 = v23;
            *v20 = 0;
            if (v23)
              (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v22 + 8))(v22, v21);
          }
          while (v20 != v19);
          v21 = (_QWORD *)*v18;
        }
        v18[1] = v19;
        (*(void (**)(_QWORD, _QWORD *, uint64_t))(*(_QWORD *)v18[3] + 40))(v18[3], v21, v18[2] - (_QWORD)v21);
      }
      MEMORY[0x1A1AF4E00](v18, 0x20C40DC1BFBCFLL);
    }
    v24 = (_QWORD *)operator new();
    *v24 = 0;
    v24[1] = 0;
    v24[2] = 0;
    {
      v100 = operator new();
      ggl::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v100, "GeoGL", 0xA3D02C1100000005);
    }
    v24[3] = ggl::Allocator::instance(void)::alloc;
    ggl::MeshVendor<ggl::BuildingPointyRoof::BuildingMesh>::_allocateNewMesh((uint64_t)v24);
    v26 = v6->_pointyRoofFillMeshVendor.__ptr_.__value_;
    v6->_pointyRoofFillMeshVendor.__ptr_.__value_ = v24;
    if (v26)
    {
      v27 = (_QWORD *)*v26;
      if (*v26)
      {
        v28 = (_QWORD *)v26[1];
        v29 = (_QWORD *)*v26;
        if (v28 != v27)
        {
          do
          {
            v31 = *--v28;
            v30 = v31;
            *v28 = 0;
            if (v31)
              (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v30 + 8))(v30, v29);
          }
          while (v28 != v27);
          v29 = (_QWORD *)*v26;
        }
        v26[1] = v27;
        (*(void (**)(_QWORD, _QWORD *, uint64_t))(*(_QWORD *)v26[3] + 40))(v26[3], v29, v26[2] - (_QWORD)v29);
      }
      MEMORY[0x1A1AF4E00](v26, 0x20C40DC1BFBCFLL);
    }
    v32 = (_QWORD *)operator new();
    *v32 = 0;
    v32[1] = 0;
    v32[2] = 0;
    {
      v101 = operator new();
      ggl::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v101, "GeoGL", 0xA3D02C1100000005);
    }
    v32[3] = ggl::Allocator::instance(void)::alloc;
    ggl::MeshVendor<ggl::PrefilteredLine::PrefilteredLineMesh>::_allocateNewMesh((uint64_t)v32);
    v34 = v6->_pointyRoofStrokeMeshVendor.__ptr_.__value_;
    v6->_pointyRoofStrokeMeshVendor.__ptr_.__value_ = v32;
    if (v34)
    {
      v35 = (_QWORD *)*v34;
      if (*v34)
      {
        v36 = (_QWORD *)v34[1];
        v37 = (_QWORD *)*v34;
        if (v36 != v35)
        {
          do
          {
            v39 = *--v36;
            v38 = v39;
            *v36 = 0;
            if (v39)
              (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v38 + 8))(v38, v37);
          }
          while (v36 != v35);
          v37 = (_QWORD *)*v34;
        }
        v34[1] = v35;
        (*(void (**)(_QWORD, _QWORD *, uint64_t))(*(_QWORD *)v34[3] + 40))(v34[3], v37, v34[2] - (_QWORD)v37);
      }
      MEMORY[0x1A1AF4E00](v34, 0x20C40DC1BFBCFLL);
    }
    LOBYTE(v111[0]) = 0;
    memset(v102, 0, sizeof(v102));
    v103 = 0u;
    v110 = 0;
    v107 = 0uLL;
    v106 = 0;
    memset((char *)v111 + 2, 0, 38);
    v40 = operator new();
    *(_QWORD *)(v40 + 160) = 0;
    *(_QWORD *)(v40 + 168) = 0;
    *(_OWORD *)(v40 + 128) = 0u;
    *(_OWORD *)(v40 + 144) = 0u;
    *(_OWORD *)(v40 + 96) = 0u;
    *(_OWORD *)(v40 + 112) = 0u;
    *(_OWORD *)(v40 + 64) = 0u;
    *(_OWORD *)(v40 + 80) = 0u;
    *(_OWORD *)(v40 + 32) = 0u;
    *(_OWORD *)(v40 + 48) = 0u;
    *(_OWORD *)v40 = 0u;
    *(_OWORD *)(v40 + 16) = 0u;
    *(_QWORD *)(v40 + 16) = v40 + 24;
    *(_QWORD *)(v40 + 120) = 0;
    *(_QWORD *)(v40 + 128) = 0;
    *(_QWORD *)(v40 + 136) = 0;
    v41 = *(_QWORD *)&v111[1];
    *(_QWORD *)&v111[1] = v40;
    if (v41)
      std::default_delete<md::MeshSetStorage>::operator()[abi:nn180100](v41);
    v42 = v6;
    *((_QWORD *)&v111[0] + 1) = v40;
    v43 = (char *)operator new(0x90uLL);
    *((_QWORD *)v43 + 1) = 0;
    v44 = (unint64_t *)(v43 + 8);
    *((_QWORD *)v43 + 2) = 0;
    *(_QWORD *)v43 = &off_1E42DC3C0;
    *((_QWORD *)v43 + 3) = v40;
    v45 = v43 + 24;
    *((_QWORD *)v43 + 4) = 16;
    *(_OWORD *)(v43 + 40) = 0u;
    *(_OWORD *)(v43 + 56) = 0u;
    *(_OWORD *)(v43 + 72) = 0u;
    *(_OWORD *)(v43 + 88) = 0u;
    v43[104] = 0;
    *((_QWORD *)v43 + 14) = &off_1E42CBF90;
    *((_QWORD *)v43 + 17) = v43 + 112;
    *(_QWORD *)&v113 = v43 + 24;
    *((_QWORD *)&v113 + 1) = v43;
    v47 = (uint64_t **)(v40 + 24);
    v46 = *(uint64_t **)(v40 + 24);
    if (v46)
    {
      while (1)
      {
        while (1)
        {
          v48 = (uint64_t **)v46;
          v49 = v46[4];
          if ((unint64_t)v45 >= v49)
            break;
          v46 = *v48;
          v47 = v48;
          if (!*v48)
            goto LABEL_55;
        }
        if (v49 >= (unint64_t)v45)
          break;
        v46 = v48[1];
        if (!v46)
        {
          v47 = v48 + 1;
          goto LABEL_55;
        }
      }
    }
    else
    {
      v48 = (uint64_t **)(v40 + 24);
LABEL_55:
      v50 = (uint64_t *)operator new(0x30uLL);
      v51 = v50;
      v50[4] = (uint64_t)v45;
      v50[5] = (uint64_t)v43;
      do
        v52 = __ldxr(v44);
      while (__stxr(v52 + 1, v44));
      *v50 = 0;
      v50[1] = 0;
      v50[2] = (uint64_t)v48;
      *v47 = v50;
      v53 = **(_QWORD **)(v40 + 16);
      if (v53)
      {
        *(_QWORD *)(v40 + 16) = v53;
        v51 = *v47;
      }
      std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(v40 + 24), v51);
      ++*(_QWORD *)(v40 + 32);
    }
    v54 = v113;
    v113 = 0uLL;
    v55 = *(std::__shared_weak_count **)&v111[2];
    *(_OWORD *)((char *)&v111[1] + 8) = v54;
    if (v55)
    {
      p_shared_owners = (unint64_t *)&v55->__shared_owners_;
      do
        v57 = __ldaxr(p_shared_owners);
      while (__stlxr(v57 - 1, p_shared_owners));
      if (!v57)
      {
        ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
        std::__shared_weak_count::__release_weak(v55);
      }
    }
    v58 = (std::__shared_weak_count *)*((_QWORD *)&v113 + 1);
    if (*((_QWORD *)&v113 + 1))
    {
      v59 = (unint64_t *)(*((_QWORD *)&v113 + 1) + 8);
      do
        v60 = __ldaxr(v59);
      while (__stlxr(v60 - 1, v59));
      if (!v60)
      {
        ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
        std::__shared_weak_count::__release_weak(v58);
      }
    }
    v61 = (char *)*((_QWORD *)&v102[0] + 1);
    if (*((_QWORD *)&v102[0] + 1) >= *(_QWORD *)&v102[1])
    {
      v63 = *(char **)&v102[0];
      v64 = *((_QWORD *)&v102[0] + 1) - *(_QWORD *)&v102[0];
      v65 = (uint64_t)(*((_QWORD *)&v102[0] + 1) - *(_QWORD *)&v102[0]) >> 3;
      v66 = v65 + 1;
      if ((unint64_t)(v65 + 1) >> 61)
        abort();
      v67 = *(_QWORD *)&v102[1] - *(_QWORD *)&v102[0];
      if ((uint64_t)(*(_QWORD *)&v102[1] - *(_QWORD *)&v102[0]) >> 2 > v66)
        v66 = v67 >> 2;
      if ((unint64_t)v67 >= 0x7FFFFFFFFFFFFFF8)
        v68 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v68 = v66;
      if (v68 >> 61)
        std::__throw_bad_array_new_length[abi:nn180100]();
      v69 = (char *)operator new(8 * v68);
      v70 = &v69[8 * v65];
      *(_WORD *)v70 = 0;
      *((_DWORD *)v70 + 1) = 0;
      v62 = v70 + 8;
      if (v61 != v63)
      {
        v71 = v61 - v63 - 8;
        if (v71 < 0x58)
          goto LABEL_127;
        if ((unint64_t)(&v61[-v64] - v69) < 0x20)
          goto LABEL_127;
        v72 = (v71 >> 3) + 1;
        v73 = &v69[8 * v65 - 16];
        v74 = v61 - 16;
        v75 = v72 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v76 = *(_OWORD *)v74;
          *((_OWORD *)v73 - 1) = *((_OWORD *)v74 - 1);
          *(_OWORD *)v73 = v76;
          v73 -= 32;
          v74 -= 32;
          v75 -= 4;
        }
        while (v75);
        v70 -= 8 * (v72 & 0x3FFFFFFFFFFFFFFCLL);
        v61 -= 8 * (v72 & 0x3FFFFFFFFFFFFFFCLL);
        if (v72 != (v72 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_127:
          do
          {
            v77 = *((_QWORD *)v61 - 1);
            v61 -= 8;
            *((_QWORD *)v70 - 1) = v77;
            v70 -= 8;
          }
          while (v61 != v63);
        }
      }
      *(_QWORD *)&v102[0] = v70;
      *((_QWORD *)&v102[0] + 1) = v62;
      *(_QWORD *)&v102[1] = &v69[8 * v68];
      if (v63)
        operator delete(v63);
    }
    else
    {
      **((_WORD **)&v102[0] + 1) = 0;
      *((_DWORD *)v61 + 1) = 0;
      v62 = v61 + 8;
    }
    v78 = v42;
    *((_QWORD *)&v102[0] + 1) = v62;
    p_strokeMeshInfo = &v42->_strokeMeshInfo;
    p_value = (void **)&v42->_strokeMeshInfo._value;
    if (v42->_strokeMeshInfo._hasValue)
    {
      v81 = *p_value;
      if (*p_value)
      {
        *(_QWORD *)v42->_anon_b28 = v81;
        operator delete(v81);
        *p_value = 0;
        *(_QWORD *)v42->_anon_b28 = 0;
        *(_QWORD *)&v42->_anon_b28[8] = 0;
      }
      *(_OWORD *)v42->_strokeMeshInfo._value.data = v102[0];
      *(_QWORD *)&v42->_anon_b28[8] = *(_QWORD *)&v102[1];
      memset(v102, 0, 24);
      v82 = (void **)&v42->_anon_b28[16];
      v83 = *(_QWORD *)&v42->_anon_b28[16];
      if (v83)
      {
        v84 = *(_QWORD *)&v42->_anon_b28[24];
        v85 = *(void **)&v42->_anon_b28[16];
        if (v84 != v83)
        {
          do
          {
            v86 = *(std::__shared_weak_count **)(v84 - 8);
            if (v86)
            {
              v87 = (unint64_t *)&v86->__shared_owners_;
              do
                v88 = __ldaxr(v87);
              while (__stlxr(v88 - 1, v87));
              if (!v88)
              {
                ((void (*)(std::__shared_weak_count *))v86->__on_zero_shared)(v86);
                std::__shared_weak_count::__release_weak(v86);
              }
            }
            v84 -= 16;
          }
          while (v84 != v83);
          v85 = *v82;
        }
        *(_QWORD *)&v42->_anon_b28[24] = v83;
        operator delete(v85);
        *v82 = 0;
        *(_QWORD *)&v42->_anon_b28[24] = 0;
        *(_QWORD *)&v42->_anon_b28[32] = 0;
      }
      *(_OWORD *)&v42->_anon_b28[16] = *(_OWORD *)((char *)&v102[1] + 8);
      *(_QWORD *)&v42->_anon_b28[32] = *((_QWORD *)&v102[2] + 1);
      memset((char *)&v102[1] + 8, 0, 24);
      ggl::BufferMemory::operator=((uint64_t *)&v42->_anon_b28[40], (uint64_t)&v103);
      ggl::BufferMemory::operator=((uint64_t *)&v42->_anon_b28[88], (uint64_t)&v107);
      *(_OWORD *)&v42->_anon_b28[136] = v111[0];
      v90 = *(_QWORD *)&v111[1];
      *(_QWORD *)&v111[1] = 0;
      v91 = *(_QWORD *)&v42->_anon_b28[152];
      *(_QWORD *)&v42->_anon_b28[152] = v90;
      if (v91)
        std::default_delete<md::MeshSetStorage>::operator()[abi:nn180100](v91);
      v92 = *(optional<md::MeshSet<ggl::BuildingFlatStroke::BuildingFlatStrokeMesh, ggl::BuildingFlatStroke::DefaultVbo>> *)((char *)&v111[1] + 8);
      *((_QWORD *)&v111[1] + 1) = 0;
      *(_QWORD *)&v111[2] = 0;
      v93 = *(std::__shared_weak_count **)&v42->_anon_b28[168];
      p_strokeMeshInfo[11] = v92;
      if (v93)
      {
        v94 = (unint64_t *)&v93->__shared_owners_;
        do
          v95 = __ldaxr(v94);
        while (__stlxr(v95 - 1, v94));
        if (!v95)
        {
          ((void (*)(std::__shared_weak_count *))v93->__on_zero_shared)(v93);
          std::__shared_weak_count::__release_weak(v93);
        }
      }
    }
    else
    {
      *(_OWORD *)v42->_strokeMeshInfo._value.data = v102[0];
      *(_QWORD *)&v42->_anon_b28[8] = *(_QWORD *)&v102[1];
      memset(v102, 0, 24);
      *(_OWORD *)&v42->_anon_b28[16] = *(_OWORD *)((char *)&v102[1] + 8);
      *(_QWORD *)&v42->_anon_b28[32] = *((_QWORD *)&v102[2] + 1);
      memset((char *)&v102[1] + 8, 0, 24);
      *(_OWORD *)&v42->_anon_b28[40] = v103;
      *(_OWORD *)&v42->_anon_b28[56] = v104;
      *(_WORD *)&v42->_anon_b28[72] = v105;
      *(_QWORD *)&v42->_anon_b28[80] = v106;
      v106 = 0;
      v103 = 0uLL;
      *(_OWORD *)&v42->_anon_b28[88] = v107;
      *(_OWORD *)&v42->_anon_b28[104] = v108;
      *(_WORD *)&v42->_anon_b28[120] = v109;
      *(_QWORD *)&v42->_anon_b28[128] = v110;
      v110 = 0;
      v107 = 0uLL;
      *(_OWORD *)&v42->_anon_b28[136] = v111[0];
      v89 = v111[1];
      *(_QWORD *)&v111[1] = 0;
      *(_OWORD *)&v42->_anon_b28[152] = v89;
      *(_QWORD *)&v42->_anon_b28[168] = *(_QWORD *)&v111[2];
      *((_QWORD *)&v111[1] + 1) = 0;
      *(_QWORD *)&v111[2] = 0;
      p_strokeMeshInfo->_hasValue = 1;
    }
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)v102);
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::MeshSet((uint64_t)v102, 0);
    if (v78->_fillMeshInfoForPointyRoofs._hasValue)
    {
      md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::operator=((uint64_t)&v78->_fillMeshInfoForPointyRoofs._value, (uint64_t)v102);
    }
    else
    {
      *(_OWORD *)v78->_fillMeshInfoForPointyRoofs._value.data = v102[0];
      *(_QWORD *)&v78->_anon_be8[8] = *(_QWORD *)&v102[1];
      memset(v102, 0, 24);
      *(_OWORD *)&v78->_anon_be8[16] = *(_OWORD *)((char *)&v102[1] + 8);
      *(_QWORD *)&v78->_anon_be8[32] = *((_QWORD *)&v102[2] + 1);
      memset((char *)&v102[1] + 8, 0, 24);
      *(_OWORD *)&v78->_anon_be8[40] = v103;
      *(_OWORD *)&v78->_anon_be8[56] = v104;
      *(_WORD *)&v78->_anon_be8[72] = v105;
      *(_QWORD *)&v78->_anon_be8[80] = v106;
      v106 = 0;
      v103 = 0uLL;
      *(_OWORD *)&v78->_anon_be8[88] = v107;
      *(_OWORD *)&v78->_anon_be8[104] = v108;
      *(_WORD *)&v78->_anon_be8[120] = v109;
      *(_QWORD *)&v78->_anon_be8[128] = v110;
      v110 = 0;
      v107 = 0uLL;
      *(_OWORD *)&v78->_anon_be8[136] = v111[0];
      v96 = v111[1];
      *(_QWORD *)&v111[1] = 0;
      *(_OWORD *)&v78->_anon_be8[152] = v96;
      *(_QWORD *)&v78->_anon_be8[168] = *(_QWORD *)&v111[2];
      *((_QWORD *)&v111[1] + 1) = 0;
      *(_QWORD *)&v111[2] = 0;
      v78->_fillMeshInfoForPointyRoofs._hasValue = 1;
    }
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)v102);
  }
  return v7;
}

- (void)strokeMeshes
{
  return &self->_strokeMeshes;
}

- (const)extrusionFillMeshVendor
{
  return self->_extrusionFillMeshVendor.__ptr_.__value_;
}

- (const)extrusionStrokeMeshVendor
{
  return self->_extrusionStrokeMeshVendor.__ptr_.__value_;
}

- (void)fillMeshesForPointyRoofs
{
  return &self->_fillMeshesForPointyRoofs;
}

- (const)pointyRoofFillMeshVendor
{
  return self->_pointyRoofFillMeshVendor.__ptr_.__value_;
}

- (const)pointyRoofStrokeMeshVendor
{
  return self->_pointyRoofStrokeMeshVendor.__ptr_.__value_;
}

- (unsigned)maxAttributeSetsPerGroup
{
  return 8;
}

- (void)styleQueriesForPointyRoofs:(BOOL)a3 selected:(BOOL)a4
{
  int *v4;
  int *v5;

  v4 = &OBJC_IVAR___VKBuildingGroup__selectedFlatRoofStyleQueries;
  if (a3)
    v4 = &OBJC_IVAR___VKBuildingGroup__selectedStyleQueries;
  v5 = &OBJC_IVAR___VKBuildingGroup__flatRoofStyleQueries;
  if (a3)
    v5 = &OBJC_IVAR___VKBuildingGroup__styleQueries;
  if (!a4)
    v4 = v5;
  return (char *)self + *v4;
}

- (const)commitRangesToExtrusionFillRenderItemBatcher:(void *)a3 forMeshAtIndex:(unint64_t)a4 cullingMask:(unsigned int)a5 featureIdPredicate:(function<BOOL (unsigned long)long
{
  __n128 v6;
  function<BOOL (unsigned long long)> *var1;
  uint64_t v12;
  array<std::vector<std::vector<FeatureRange>>, 16UL> *p_extrusionFillCullingGroups;
  char *begin;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v21;
  _BYTE v22[24];
  _BYTE *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  var1 = (function<BOOL (unsigned long long)> *)a6->var0.var1;
  if (var1)
  {
    if (var1 == a6)
    {
      v23 = v22;
      (*(void (**)(function<BOOL (unsigned long long)> *, _BYTE *))(*(_QWORD *)a6->var0.var0.__lx + 24))(a6, v22);
    }
    else
    {
      v23 = (_BYTE *)(*(uint64_t (**)(function<BOOL (unsigned long long)> *, SEL))(*(_QWORD *)var1->var0.var0.__lx
                                                                                           + 16))(var1, a2);
    }
  }
  else
  {
    v23 = 0;
  }
  v12 = 0;
  p_extrusionFillCullingGroups = &self->_extrusionFillCullingGroups;
  *((_QWORD *)a3 + 1) = *(_QWORD *)a3;
  do
  {
    if (((a5 >> v12) & 1) != 0)
    {
      begin = (char *)p_extrusionFillCullingGroups->__elems_[v12].__begin_;
      if (0xAAAAAAAAAAAAAAABLL * (((char *)p_extrusionFillCullingGroups->__elems_[v12].__end_ - (char *)begin) >> 3) > a4)
      {
        v15 = &begin[24 * a4];
        v16 = *(_QWORD *)v15;
        v17 = *((_QWORD *)v15 + 1);
        while (v16 != v17)
        {
          v21 = *(_QWORD *)(v16 + 16);
          if (!v23)
          {
            std::__throw_bad_function_call[abi:nn180100]();
            __break(1u);
          }
          if ((*(unsigned int (**)(_BYTE *, uint64_t *))(*(_QWORD *)v23 + 48))(v23, &v21))
          {
            if (*(_QWORD *)(v16 + 8) != *(_QWORD *)v16)
              gm::MultiRange<unsigned long>::push_back((char **)a3, (_OWORD *)v16);
          }
          v16 += 24;
        }
      }
    }
    ++v12;
  }
  while (v12 != 16);
  v18 = v23;
  if (v23 == v22)
  {
    v19 = 4;
    v18 = v22;
    goto LABEL_21;
  }
  if (v23)
  {
    v19 = 5;
LABEL_21:
    v6.n128_f64[0] = (*(double (**)(_QWORD *))(*v18 + 8 * v19))(v18);
  }
  return ggl::Batcher::commit((__int128 **)a3, 0, v6);
}

- (const)commitRangesToExtrusionStrokeRenderItemBatcher:(void *)a3 forMeshAtIndex:(unint64_t)a4 cullingMask:(unsigned int)a5 featureIdPredicate:(function<BOOL (unsigned long)long
{
  __n128 v6;
  function<BOOL (unsigned long long)> *var1;
  uint64_t v12;
  array<std::vector<std::vector<FeatureRange>>, 16UL> *p_extrusionStrokeCullingGroups;
  char *begin;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v21;
  _BYTE v22[24];
  _BYTE *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  var1 = (function<BOOL (unsigned long long)> *)a6->var0.var1;
  if (var1)
  {
    if (var1 == a6)
    {
      v23 = v22;
      (*(void (**)(function<BOOL (unsigned long long)> *, _BYTE *))(*(_QWORD *)a6->var0.var0.__lx + 24))(a6, v22);
    }
    else
    {
      v23 = (_BYTE *)(*(uint64_t (**)(function<BOOL (unsigned long long)> *, SEL))(*(_QWORD *)var1->var0.var0.__lx
                                                                                           + 16))(var1, a2);
    }
  }
  else
  {
    v23 = 0;
  }
  v12 = 0;
  p_extrusionStrokeCullingGroups = &self->_extrusionStrokeCullingGroups;
  *((_QWORD *)a3 + 1) = *(_QWORD *)a3;
  do
  {
    if (((a5 >> v12) & 1) != 0)
    {
      begin = (char *)p_extrusionStrokeCullingGroups->__elems_[v12].__begin_;
      if (0xAAAAAAAAAAAAAAABLL * (((char *)p_extrusionStrokeCullingGroups->__elems_[v12].__end_ - (char *)begin) >> 3) > a4)
      {
        v15 = &begin[24 * a4];
        v16 = *(_QWORD *)v15;
        v17 = *((_QWORD *)v15 + 1);
        while (v16 != v17)
        {
          v21 = *(_QWORD *)(v16 + 16);
          if (!v23)
          {
            std::__throw_bad_function_call[abi:nn180100]();
            __break(1u);
          }
          if ((*(unsigned int (**)(_BYTE *, uint64_t *))(*(_QWORD *)v23 + 48))(v23, &v21))
          {
            if (*(_QWORD *)(v16 + 8) != *(_QWORD *)v16)
              gm::MultiRange<unsigned long>::push_back((char **)a3, (_OWORD *)v16);
          }
          v16 += 24;
        }
      }
    }
    ++v12;
  }
  while (v12 != 16);
  v18 = v23;
  if (v23 == v22)
  {
    v19 = 4;
    v18 = v22;
    goto LABEL_21;
  }
  if (v23)
  {
    v19 = 5;
LABEL_21:
    v6.n128_f64[0] = (*(double (**)(_QWORD *))(*v18 + 8 * v19))(v18);
  }
  return ggl::Batcher::commit((__int128 **)a3, 0, v6);
}

- (const)commitRangesToPointyRoofTopRenderItemBatcher:(void *)a3 forMeshAtIndex:(unint64_t)a4 cullingMask:(unsigned int)a5 featureIdPredicate:(function<BOOL (unsigned long)long
{
  __n128 v6;
  function<BOOL (unsigned long long)> *var1;
  uint64_t v12;
  array<std::vector<std::vector<FeatureRange>>, 16UL> *p_fillCullingGroupsForPointyRoofs;
  char *begin;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v21;
  _BYTE v22[24];
  _BYTE *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  var1 = (function<BOOL (unsigned long long)> *)a6->var0.var1;
  if (var1)
  {
    if (var1 == a6)
    {
      v23 = v22;
      (*(void (**)(function<BOOL (unsigned long long)> *, _BYTE *))(*(_QWORD *)a6->var0.var0.__lx + 24))(a6, v22);
    }
    else
    {
      v23 = (_BYTE *)(*(uint64_t (**)(function<BOOL (unsigned long long)> *, SEL))(*(_QWORD *)var1->var0.var0.__lx
                                                                                           + 16))(var1, a2);
    }
  }
  else
  {
    v23 = 0;
  }
  v12 = 0;
  p_fillCullingGroupsForPointyRoofs = &self->_fillCullingGroupsForPointyRoofs;
  *((_QWORD *)a3 + 1) = *(_QWORD *)a3;
  do
  {
    if (((a5 >> v12) & 1) != 0)
    {
      begin = (char *)p_fillCullingGroupsForPointyRoofs->__elems_[v12].__begin_;
      if (0xAAAAAAAAAAAAAAABLL
         * (((char *)p_fillCullingGroupsForPointyRoofs->__elems_[v12].__end_ - (char *)begin) >> 3) > a4)
      {
        v15 = &begin[24 * a4];
        v16 = *(_QWORD *)v15;
        v17 = *((_QWORD *)v15 + 1);
        while (v16 != v17)
        {
          v21 = *(_QWORD *)(v16 + 16);
          if (!v23)
          {
            std::__throw_bad_function_call[abi:nn180100]();
            __break(1u);
          }
          if ((*(unsigned int (**)(_BYTE *, uint64_t *))(*(_QWORD *)v23 + 48))(v23, &v21))
          {
            if (*(_QWORD *)(v16 + 8) != *(_QWORD *)v16)
              gm::MultiRange<unsigned long>::push_back((char **)a3, (_OWORD *)v16);
          }
          v16 += 24;
        }
      }
    }
    ++v12;
  }
  while (v12 != 16);
  v18 = v23;
  if (v23 == v22)
  {
    v19 = 4;
    v18 = v22;
    goto LABEL_21;
  }
  if (v23)
  {
    v19 = 5;
LABEL_21:
    v6.n128_f64[0] = (*(double (**)(_QWORD *))(*v18 + 8 * v19))(v18);
  }
  return ggl::Batcher::commit((__int128 **)a3, 0, v6);
}

- (const)commitRangesToPointyRoofFillRenderItemBatcher:(void *)a3 forMeshAtIndex:(unint64_t)a4 cullingMask:(unsigned int)a5 featureIdPredicate:(function<BOOL (unsigned long)long
{
  __n128 v6;
  function<BOOL (unsigned long long)> *var1;
  uint64_t v12;
  array<std::vector<std::vector<FeatureRange>>, 16UL> *p_pointyRoofFillCullingGroups;
  char *begin;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v21;
  _BYTE v22[24];
  _BYTE *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  var1 = (function<BOOL (unsigned long long)> *)a6->var0.var1;
  if (var1)
  {
    if (var1 == a6)
    {
      v23 = v22;
      (*(void (**)(function<BOOL (unsigned long long)> *, _BYTE *))(*(_QWORD *)a6->var0.var0.__lx + 24))(a6, v22);
    }
    else
    {
      v23 = (_BYTE *)(*(uint64_t (**)(function<BOOL (unsigned long long)> *, SEL))(*(_QWORD *)var1->var0.var0.__lx
                                                                                           + 16))(var1, a2);
    }
  }
  else
  {
    v23 = 0;
  }
  v12 = 0;
  p_pointyRoofFillCullingGroups = &self->_pointyRoofFillCullingGroups;
  *((_QWORD *)a3 + 1) = *(_QWORD *)a3;
  do
  {
    if (((a5 >> v12) & 1) != 0)
    {
      begin = (char *)p_pointyRoofFillCullingGroups->__elems_[v12].__begin_;
      if (0xAAAAAAAAAAAAAAABLL * (((char *)p_pointyRoofFillCullingGroups->__elems_[v12].__end_ - (char *)begin) >> 3) > a4)
      {
        v15 = &begin[24 * a4];
        v16 = *(_QWORD *)v15;
        v17 = *((_QWORD *)v15 + 1);
        while (v16 != v17)
        {
          v21 = *(_QWORD *)(v16 + 16);
          if (!v23)
          {
            std::__throw_bad_function_call[abi:nn180100]();
            __break(1u);
          }
          if ((*(unsigned int (**)(_BYTE *, uint64_t *))(*(_QWORD *)v23 + 48))(v23, &v21))
          {
            if (*(_QWORD *)(v16 + 8) != *(_QWORD *)v16)
              gm::MultiRange<unsigned long>::push_back((char **)a3, (_OWORD *)v16);
          }
          v16 += 24;
        }
      }
    }
    ++v12;
  }
  while (v12 != 16);
  v18 = v23;
  if (v23 == v22)
  {
    v19 = 4;
    v18 = v22;
    goto LABEL_21;
  }
  if (v23)
  {
    v19 = 5;
LABEL_21:
    v6.n128_f64[0] = (*(double (**)(_QWORD *))(*v18 + 8 * v19))(v18);
  }
  return ggl::Batcher::commit((__int128 **)a3, 0, v6);
}

- (const)commitRangesToPointyRoofStrokeRenderItemBatcher:(void *)a3 forMeshAtIndex:(unint64_t)a4 cullingMask:(unsigned int)a5 featureIdPredicate:(function<BOOL (unsigned long)long
{
  __n128 v6;
  function<BOOL (unsigned long long)> *var1;
  uint64_t v12;
  array<std::vector<std::vector<FeatureRange>>, 16UL> *p_pointyRoofStrokeCullingGroups;
  char *begin;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v21;
  _BYTE v22[24];
  _BYTE *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  var1 = (function<BOOL (unsigned long long)> *)a6->var0.var1;
  if (var1)
  {
    if (var1 == a6)
    {
      v23 = v22;
      (*(void (**)(function<BOOL (unsigned long long)> *, _BYTE *))(*(_QWORD *)a6->var0.var0.__lx + 24))(a6, v22);
    }
    else
    {
      v23 = (_BYTE *)(*(uint64_t (**)(function<BOOL (unsigned long long)> *, SEL))(*(_QWORD *)var1->var0.var0.__lx
                                                                                           + 16))(var1, a2);
    }
  }
  else
  {
    v23 = 0;
  }
  v12 = 0;
  p_pointyRoofStrokeCullingGroups = &self->_pointyRoofStrokeCullingGroups;
  *((_QWORD *)a3 + 1) = *(_QWORD *)a3;
  do
  {
    if (((a5 >> v12) & 1) != 0)
    {
      begin = (char *)p_pointyRoofStrokeCullingGroups->__elems_[v12].__begin_;
      if (0xAAAAAAAAAAAAAAABLL * (((char *)p_pointyRoofStrokeCullingGroups->__elems_[v12].__end_ - (char *)begin) >> 3) > a4)
      {
        v15 = &begin[24 * a4];
        v16 = *(_QWORD *)v15;
        v17 = *((_QWORD *)v15 + 1);
        while (v16 != v17)
        {
          v21 = *(_QWORD *)(v16 + 16);
          if (!v23)
          {
            std::__throw_bad_function_call[abi:nn180100]();
            __break(1u);
          }
          if ((*(unsigned int (**)(_BYTE *, uint64_t *))(*(_QWORD *)v23 + 48))(v23, &v21))
          {
            if (*(_QWORD *)(v16 + 8) != *(_QWORD *)v16)
              gm::MultiRange<unsigned long>::push_back((char **)a3, (_OWORD *)v16);
          }
          v16 += 24;
        }
      }
    }
    ++v12;
  }
  while (v12 != 16);
  v18 = v23;
  if (v23 == v22)
  {
    v19 = 4;
    v18 = v22;
    goto LABEL_21;
  }
  if (v23)
  {
    v19 = 5;
LABEL_21:
    v6.n128_f64[0] = (*(double (**)(_QWORD *))(*v18 + 8 * v19))(v18);
  }
  return ggl::Batcher::commit((__int128 **)a3, 0, v6);
}

- (void)prepareForBuilding:(void *)a3 forRoofStyle:(unsigned __int8)a4 scaleThreshold:(float)a5
{
  int v6;
  _DWORD *v7;
  double v9;
  unint64_t v10;
  _QWORD *v11;
  float v12;
  uint64_t v13;
  float v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  int *v41;
  _QWORD *v42;
  float32x2_t *v43;
  float32x2_t *v44;
  float v45;
  unint64_t v46;
  float32x2_t v47;
  int8x8_t v48;
  float32x2_t *v49;
  float32x2_t i;
  float32x2_t v51;
  float32x2_t v52;
  __int128 v53;
  int32x2_t v54;
  float32x2_t v55;
  BOOL v56;
  BOOL v57;
  BOOL v58;
  __float2 v59;
  __int128 v60;
  int32x4_t v61;
  int32x4_t v62;
  float32x4_t v63;
  int8x16_t v64;
  float32x4_t v65;
  float32x4_t v66;
  int8x16_t v67;
  float32x4_t v68;
  int8x16_t v69;
  float32x4_t v70;
  float32x4_t v71;
  int8x16_t v72;
  unsigned int v73;
  __n128 v74;
  _QWORD *v75;
  uint64_t v76;
  float32x4_t v77;
  float32x4_t v78;
  _QWORD *v79;
  _QWORD *v80;
  unint64_t v81;
  _BYTE *v82;
  _BYTE *v83;
  char *v84;
  char *v85;
  char *v86;
  char *v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint64_t v91;
  char *v92;
  unint64_t v93;
  uint64_t v94;
  _QWORD *j;
  unint64_t v100;
  char *v101;
  _BYTE *v102;
  unint64_t v103;
  unint64_t v104;
  unint64_t v105;
  char *v106;
  char *v107;
  __int128 v108;
  char *v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  uint64_t v113;
  unint64_t v114;
  NSObject *v115;
  unint64_t v116;
  ValueUnion *p_value;
  char *v118;
  __int16 v119;
  unint64_t v120;
  char *v121;
  double type;
  uint64_t v123;
  uint64_t v124;
  unint64_t v125;
  uint64_t v126;
  char *v127;
  char *v128;
  char *v129;
  char *v130;
  char *v131;
  uint64_t v132;
  char *v133;
  char *v134;
  uint64_t v135;
  __int128 v136;
  uint64_t v137;
  uint64_t v138;
  _QWORD *v139;
  std::__shared_weak_count *v140;
  unint64_t *p_shared_owners;
  unint64_t v142;
  unint64_t v143;
  unint64_t v144;
  unint64_t *v145;
  unint64_t v146;
  _QWORD *v147;
  _QWORD *v148;
  uint64_t v149;
  _QWORD *v150;
  _QWORD *v151;
  _QWORD *v152;
  uint64_t v153;
  _QWORD *v154;
  float v155;
  int *v156;
  _BOOL4 v157;
  float v158;
  unint64_t v159;
  _DWORD *v160;
  uint64_t v161;
  float v162;
  unint64_t v163;
  int8x16_t v164;
  float32x2_t v165;
  _BYTE buf[32];
  float32x4_t v167;
  __int128 v168;
  uint64_t v169;
  float v170;
  uint64_t v171;
  _QWORD v172[2];
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *__p;
  void *v179;
  unint64_t v180;
  _QWORD *v181;
  _QWORD *v182;
  uint64_t v183;
  _QWORD *v184;
  _QWORD *v185;
  uint64_t v186;
  _BYTE v187[32];
  uint64_t v188;

  v6 = a4;
  v7 = a3;
  v188 = *MEMORY[0x1E0C80C00];
  v161 = *((unsigned int *)a3 + 25);
  -[VKPolygonalItemGroup indexForGeoFeatureAttributes:](self, "indexForGeoFeatureAttributes:", (char *)a3 + 24);
  v157 = 0;
  if (v7 && v6 == 1)
  {
    if (_shouldMakePointyRoofForBuilding((uint64_t)v7))
    {
      *(float *)&v9 = a5;
      v157 = -[VKBuildingGroup canConstructPointyRoofForPolygon:building:buildingModel:scaleThreshold:](self, "canConstructPointyRoofForPolygon:building:buildingModel:scaleThreshold:", v7, v7, v7[10] & 1, v9);
    }
    else
    {
      v157 = 0;
    }
  }
  v184 = &v184;
  v185 = &v184;
  v186 = 0;
  v181 = &v181;
  v182 = &v181;
  v183 = 0;
  if ((_DWORD)v161)
  {
    v10 = 0;
    v160 = v7;
    do
    {
      v172[0] = 0;
      v11 = geo::codec::multiSectionFeaturePoints(v7, v10, v172);
      v12 = geo::codec::buildingFootprintExtrusionHeight((uint64_t)v7, v10);
      v13 = v172[0];
      if (v172[0])
      {
        v14 = v12;
        v15 = 0;
        v16 = v181;
        v17 = v172[0] - 1;
        v18 = v183 + 1;
        do
        {
          v19 = v11[v15];
          if (v17 == v15)
            v20 = 0;
          else
            v20 = v15 + 1;
          v21 = v11[v20];
          v22 = operator new(0x48uLL);
          v22[2] = v19;
          v23 = v18 + v15;
          *((float *)v22 + 6) = v14;
          *(_QWORD *)((char *)v22 + 28) = v21;
          *((float *)v22 + 9) = v14;
          v22[5] = v15;
          v22[6] = v20;
          v22[7] = v15;
          v22[8] = v20;
          *v22 = v16;
          v22[1] = &v181;
          v16[1] = v22;
          ++v15;
          v16 = v22;
          v181 = v22;
          v183 = v23;
        }
        while (v13 != v15);
      }
      ++v10;
      v7 = v160;
    }
    while (v10 != v161);
    v24 = v182;
    if (v182 != &v181)
    {
      do
      {
        v25 = (_QWORD *)v24[1];
        if (v25 == &v181)
          break;
        v26 = v24 + 2;
        v27 = v24[1];
        while (*v26 != *(_QWORD *)(v27 + 16)
             || *((_DWORD *)v24 + 6) != (unint64_t)*(unsigned int *)(v27 + 24)
             || *(_QWORD *)((char *)v24 + 28) != *(_QWORD *)(v27 + 28)
             || *((_DWORD *)v24 + 9) != (unint64_t)*(unsigned int *)(v27 + 36))
        {
          if (*v26 == *(_QWORD *)(v27 + 28)
            && *((_DWORD *)v24 + 6) == (unint64_t)*(unsigned int *)(v27 + 36)
            && *(_QWORD *)((char *)v24 + 28) == *(_QWORD *)(v27 + 16)
            && *((_DWORD *)v24 + 9) == (unint64_t)*(unsigned int *)(v27 + 24))
          {
            break;
          }
          v27 = *(_QWORD *)(v27 + 8);
          if ((_QWORD **)v27 == &v181)
            goto LABEL_18;
        }
        v32 = operator new(0x48uLL);
        v33 = *(_OWORD *)v26;
        v34 = *((_OWORD *)v24 + 2);
        v35 = *((_OWORD *)v24 + 3);
        v32[8] = v24[8];
        *((_OWORD *)v32 + 2) = v34;
        *((_OWORD *)v32 + 3) = v35;
        *((_OWORD *)v32 + 1) = v33;
        v36 = v184;
        *v32 = v184;
        v32[1] = &v184;
        v36[1] = v32;
        v184 = v32;
        ++v186;
        v37 = *(_QWORD **)v27;
        v37[1] = *(_QWORD *)(v27 + 8);
        **(_QWORD **)(v27 + 8) = v37;
        --v183;
        operator delete((void *)v27);
        v38 = *v24;
        v39 = v24[1];
        *(_QWORD *)(v38 + 8) = v39;
        *(_QWORD *)v24[1] = v38;
        --v183;
        operator delete(v24);
        v25 = *(_QWORD **)(*(_QWORD *)v39 + 8);
LABEL_18:
        v24 = v25;
      }
      while (v25 != &v181);
    }
    v40 = 0;
    if (v157)
      v41 = &OBJC_IVAR___VKBuildingGroup__fillMeshInfoForPointyRoofs;
    else
      v41 = &OBJC_IVAR___VKPolygonalItemGroup__fillMeshInfo;
    v156 = v41;
    v42 = v160;
    while (1)
    {
      v180 = 0;
      v43 = (float32x2_t *)geo::codec::multiSectionFeaturePoints(v42, v40, &v180);
      if (v180 >= 3)
        break;
LABEL_46:
      if (++v40 == v161)
      {
        if (v183)
        {
          v148 = v181;
          v147 = v182;
          v149 = *v182;
          *(_QWORD *)(v149 + 8) = v181[1];
          *(_QWORD *)v148[1] = v149;
          v183 = 0;
          if (v147 != &v181)
          {
            do
            {
              v150 = (_QWORD *)v147[1];
              operator delete(v147);
              v147 = v150;
            }
            while (v150 != &v181);
          }
        }
        goto LABEL_177;
      }
    }
    v44 = v43;
    v162 = geo::codec::buildingFootprintExtrusionHeight((uint64_t)v42, v40);
    v45 = geo::codec::buildingFootprintBaseHeight((uint64_t)v42, v40);
    v46 = v180;
    v47 = *(float32x2_t *)self->super._boundingBox._minimum._e;
    v48 = *(int8x8_t *)&self->super._boundingBox._minimum._e[2];
    v49 = v44;
    for (i = *(float32x2_t *)&self->super._boundingBox._maximum._e[1]; v46; --v46)
    {
      v51 = *v49++;
      v52 = (float32x2_t)vrev64_s32((int32x2_t)v51);
      v47 = vminnm_f32(v51, v47);
      v48 = vbsl_s8((int8x8_t)vcgt_f32((float32x2_t)__PAIR64__(v52.u32[1], v48.u32[0]), (float32x2_t)__PAIR64__(v48.u32[1], LODWORD(v162))), (int8x8_t)__PAIR64__(v52.u32[1], LODWORD(v162)), v48);
      *(float32x2_t *)&v53 = v47;
      *((int8x8_t *)&v53 + 1) = v48;
      *(_OWORD *)self->super._boundingBox._minimum._e = v53;
      v52.f32[1] = v162;
      i = vmaxnm_f32(i, v52);
      *(float32x2_t *)&self->super._boundingBox._maximum._e[1] = i;
    }
    v54 = (int32x2_t)*v44;
    *(float32x2_t *)self->super._boundingBox._minimum._e = vminnm_f32(*v44, v47);
    v55 = (float32x2_t)vrev64_s32(v54);
    *(int8x8_t *)&self->super._boundingBox._minimum._e[2] = vbsl_s8((int8x8_t)vcgt_f32((float32x2_t)__PAIR64__(v55.u32[1], v48.u32[0]), (float32x2_t)__PAIR64__(v48.u32[1], LODWORD(v45))), (int8x8_t)__PAIR64__(v55.u32[1], LODWORD(v45)), v48);
    v55.f32[1] = v45;
    *(float32x2_t *)&self->super._boundingBox._maximum._e[1] = vmaxnm_f32(i, v55);
    md::PolygonSection::PolygonSection((uint64_t)v172, v42, v40);
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::prepareSpaceForPoints((uint64_t)&self->super._fillMeshInfo + *v156, v180, 3 * v180 - 6);
    if (!v157
      || (v171 = 0,
          v170 = 0.0,
          v169 = 0,
          _computeScaleRotationTranslation((uint64_t)v44, v180, (float *)&v171, &v170, (float *)&v169),
          *((float *)&v171 + 1) == 0.0)
      || *(float *)&v171 == 0.0
      || ((float)(*(float *)&v171 / *((float *)&v171 + 1)) <= 2.0
        ? (v56 = (float)(*(float *)&v171 / *((float *)&v171 + 1)) < 0.5)
        : (v56 = 1),
          !v56 ? (v57 = *(float *)&v171 <= a5) : (v57 = 0),
          v57 ? (v58 = *((float *)&v171 + 1) <= a5) : (v58 = 0),
          !v58))
    {
LABEL_70:
      *(_QWORD *)buf = v42;
      *(_QWORD *)&buf[8] = v40;
      v159 = v40;
      v79 = std::__hash_table<std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::__unordered_map_hasher<std::pair<void const*,unsigned long>,std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::hash<std::pair<void const*,unsigned long>>,std::equal_to<std::pair<void const*,unsigned long>>,true>,std::__unordered_map_equal<std::pair<void const*,unsigned long>,std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::equal_to<std::pair<void const*,unsigned long>>,std::hash<std::pair<void const*,unsigned long>>,true>,std::allocator<std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>>>::__emplace_unique_key_args<std::pair<void const*,unsigned long>,std::piecewise_construct_t const&,std::tuple<std::pair<void const*,unsigned long>&&>,std::tuple<>>((uint64_t)&self->super._polygonEdges, (unint64_t)v42, v40, buf);
      v80 = v79;
      v81 = v180;
      v82 = (_BYTE *)v79[4];
      if (0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v79[6] - (_QWORD)v82) >> 3) < v180)
      {
        if (v180 > 0x492492492492492)
          abort();
        v83 = (_BYTE *)v79[5];
        v84 = (char *)operator new(56 * v180);
        v85 = &v84[56 * ((v83 - v82) / 56)];
        v86 = v85;
        if (v83 != v82)
        {
          v87 = &v84[56 * ((v83 - v82) / 56)];
          do
          {
            v86 = v87 - 56;
            v88 = *(_OWORD *)(v83 - 56);
            v89 = *(_OWORD *)(v83 - 40);
            v90 = *(_OWORD *)(v83 - 24);
            *((_QWORD *)v87 - 1) = *((_QWORD *)v83 - 1);
            *(_OWORD *)(v87 - 24) = v90;
            *(_OWORD *)(v87 - 40) = v89;
            *(_OWORD *)(v87 - 56) = v88;
            v83 -= 56;
            v87 -= 56;
          }
          while (v83 != v82);
        }
        v80[4] = v86;
        v80[5] = v85;
        v80[6] = &v84[56 * v81];
        if (v82)
        {
          operator delete(v82);
          v81 = v180;
        }
      }
      if (v81)
      {
        v91 = 0;
        do
        {
          v93 = v91 + 1;
          if (v91 + 1 == v81)
            v94 = 0;
          else
            v94 = v91 + 1;
          *(float32x2_t *)buf = v44[v91];
          *(float *)&buf[8] = v162;
          *(float32x2_t *)&buf[12] = v44[v94];
          *(float *)&buf[20] = v162;
          *(_QWORD *)&buf[24] = v91;
          v167.i64[0] = v94;
          v167.i64[1] = v91;
          *(_QWORD *)&v168 = v94;
          for (j = v185; ; j = (_QWORD *)j[1])
          {
            if (j == &v184)
              goto LABEL_108;
            if (j[2] == *(_QWORD *)buf
              && *((_DWORD *)j + 6) == (unint64_t)*(unsigned int *)&buf[8]
              && *(_QWORD *)((char *)j + 28) == *(_QWORD *)&buf[12]
              && *((_DWORD *)j + 9) == (unint64_t)*(unsigned int *)&buf[20])
            {
              break;
            }
            if (j[2] == *(_QWORD *)&buf[12]
              && *((_DWORD *)j + 6) == (unint64_t)*(unsigned int *)&buf[20]
              && *(_QWORD *)((char *)j + 28) == *(_QWORD *)buf
              && *((_DWORD *)j + 9) == (unint64_t)*(unsigned int *)&buf[8])
            {
              break;
            }
          }
          if (j == &v184)
          {
LABEL_108:
            v101 = (char *)v80[5];
            v100 = v80[6];
            if ((unint64_t)v101 < v100)
            {
              *(_OWORD *)v101 = *(_OWORD *)buf;
              *((_OWORD *)v101 + 1) = *(_OWORD *)&buf[16];
              *((float32x4_t *)v101 + 2) = v167;
              *((_QWORD *)v101 + 6) = v168;
              v92 = v101 + 56;
            }
            else
            {
              v102 = (_BYTE *)v80[4];
              v103 = 0x6DB6DB6DB6DB6DB7 * ((v101 - v102) >> 3) + 1;
              if (v103 > 0x492492492492492)
                abort();
              v104 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v100 - (_QWORD)v102) >> 3);
              if (2 * v104 > v103)
                v103 = 2 * v104;
              if (v104 >= 0x249249249249249)
                v105 = 0x492492492492492;
              else
                v105 = v103;
              if (v105)
              {
                if (v105 > 0x492492492492492)
                  goto LABEL_182;
                v106 = (char *)operator new(56 * v105);
              }
              else
              {
                v106 = 0;
              }
              v107 = &v106[8 * ((v101 - v102) >> 3)];
              v108 = *(_OWORD *)&buf[16];
              *(_OWORD *)v107 = *(_OWORD *)buf;
              *((_OWORD *)v107 + 1) = v108;
              *((float32x4_t *)v107 + 2) = v167;
              *((_QWORD *)v107 + 6) = v168;
              v109 = v107;
              if (v101 != v102)
              {
                do
                {
                  v110 = *(_OWORD *)(v101 - 56);
                  v111 = *(_OWORD *)(v101 - 40);
                  v112 = *(_OWORD *)(v101 - 24);
                  *((_QWORD *)v109 - 1) = *((_QWORD *)v101 - 1);
                  *(_OWORD *)(v109 - 24) = v112;
                  *(_OWORD *)(v109 - 40) = v111;
                  *(_OWORD *)(v109 - 56) = v110;
                  v109 -= 56;
                  v101 -= 56;
                }
                while (v101 != v102);
                v101 = (char *)v80[4];
              }
              v92 = v107 + 56;
              v80[4] = v109;
              v80[5] = v107 + 56;
              v80[6] = &v106[56 * v105];
              if (v101)
              {
                operator delete(v101);
                v81 = v180;
              }
            }
            v80[5] = v92;
          }
          v91 = v93;
        }
        while (v93 < v81);
      }
      v113 = v80[5] - v80[4];
      if (!v113)
        goto LABEL_166;
      v114 = 2 * v81;
      if (2 * v81 >= 0x10000)
      {
        if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
          dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
        v115 = (id)GEOGetVectorKitVKDefaultLog_log;
        if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19F029000, v115, OS_LOG_TYPE_ERROR, "MeshSet: Cannot prepare space polygons points: polygon is too large", buf, 2u);
        }

LABEL_166:
        v172[0] = &off_1E428FC30;
        if (__p)
        {
          v179 = __p;
          operator delete(__p);
        }
        v42 = v160;
        v40 = v159;
        if (v177)
          operator delete(v177);
        if (v175)
        {
          v176 = v175;
          operator delete(v175);
        }
        if (v173)
        {
          v174 = v173;
          operator delete(v173);
        }
        goto LABEL_46;
      }
      v116 = 0x924924924924924ALL * (v113 >> 3);
      p_value = &self->_strokeMeshInfo._value;
      v118 = *(char **)self->_anon_b28;
      v119 = *((_WORD *)v118 - 4);
      if (v114 <= (unsigned __int16)~v119)
      {
        *((_WORD *)v118 - 4) = v119 + v114;
        *((_DWORD *)v118 - 1) += v116;
LABEL_154:
        v138 = *(_QWORD *)&self->_anon_b28[144];
        v139 = *(_QWORD **)&self->_anon_b28[160];
        v140 = *(std::__shared_weak_count **)&self->_anon_b28[168];
        if (v140)
        {
          p_shared_owners = (unint64_t *)&v140->__shared_owners_;
          do
            v142 = __ldxr(p_shared_owners);
          while (__stxr(v142 + 1, p_shared_owners));
        }
        if (v139 && *v139 == v138 && !*(_BYTE *)(v138 + 40))
        {
          v143 = *(_QWORD *)(v138 + 8) + v116;
          *(_QWORD *)v138 += 32 * v81;
          *(_QWORD *)(v138 + 8) = v143;
          v144 = v139[3] + v116;
          v139[2] += 32 * v81;
          v139[3] = v144;
        }
        if (v140)
        {
          v145 = (unint64_t *)&v140->__shared_owners_;
          do
            v146 = __ldaxr(v145);
          while (__stlxr(v146 - 1, v145));
          if (!v146)
          {
            ((void (*)(std::__shared_weak_count *))v140->__on_zero_shared)(v140);
            std::__shared_weak_count::__release_weak(v140);
          }
        }
        goto LABEL_166;
      }
      v120 = *(_QWORD *)&self->_anon_b28[8];
      if ((unint64_t)v118 < v120)
      {
        *(_WORD *)v118 = v114;
        *((_DWORD *)v118 + 1) = v116;
        v121 = v118 + 8;
LABEL_153:
        *(_QWORD *)self->_anon_b28 = v121;
        goto LABEL_154;
      }
      type = p_value->type;
      v123 = (uint64_t)&v118[-*(_QWORD *)&p_value->type];
      v124 = v123 >> 3;
      v125 = (v123 >> 3) + 1;
      if (v125 >> 61)
        abort();
      v126 = v120 - *(_QWORD *)&type;
      if (v126 >> 2 > v125)
        v125 = v126 >> 2;
      if ((unint64_t)v126 >= 0x7FFFFFFFFFFFFFF8)
        v125 = 0x1FFFFFFFFFFFFFFFLL;
      if (v125 >> 61)
LABEL_182:
        std::__throw_bad_array_new_length[abi:nn180100]();
      v163 = v125;
      v127 = (char *)operator new(8 * v125);
      v128 = &v127[8 * v124];
      *(_WORD *)v128 = v114;
      *((_DWORD *)v128 + 1) = v116;
      v129 = &v118[-*(_QWORD *)&type];
      if (v118 == *(char **)&type)
      {
        v131 = &v127[8 * v124];
        goto LABEL_151;
      }
      v130 = v129 - 8;
      if ((unint64_t)(v129 - 8) >= 0x58)
      {
        v131 = &v127[8 * v124];
        if ((unint64_t)(v118 - &v127[v123]) >= 0x20)
        {
          v132 = ((unint64_t)v130 >> 3) + 1;
          v133 = &v127[v123 - 16];
          v134 = v118 - 16;
          v135 = v132 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            v136 = *(_OWORD *)v134;
            *((_OWORD *)v133 - 1) = *((_OWORD *)v134 - 1);
            *(_OWORD *)v133 = v136;
            v133 -= 32;
            v134 -= 32;
            v135 -= 4;
          }
          while (v135);
          v131 = &v128[-8 * (v132 & 0x3FFFFFFFFFFFFFFCLL)];
          v118 -= 8 * (v132 & 0x3FFFFFFFFFFFFFFCLL);
          if (v132 == (v132 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_151:
            v121 = v128 + 8;
            *(_QWORD *)&p_value->type = v131;
            *(_QWORD *)self->_anon_b28 = v128 + 8;
            *(_QWORD *)&self->_anon_b28[8] = &v127[8 * v163];
            if (type != 0.0)
              operator delete(*(void **)&type);
            goto LABEL_153;
          }
        }
      }
      else
      {
        v131 = &v127[8 * v124];
      }
      do
      {
        v137 = *((_QWORD *)v118 - 1);
        v118 -= 8;
        *((_QWORD *)v131 - 1) = v137;
        v131 -= 8;
      }
      while (v118 != *(char **)&type);
      goto LABEL_151;
    }
    v158 = *((float *)&v171 + 1);
    v155 = *(float *)&v171;
    v59 = __sincosf_stret(v170 * 0.5);
    *(_QWORD *)&v60 = v169;
    *((_QWORD *)&v60 + 1) = 0x3F80000000000000;
    *(float *)v61.i32 = 1.0 - (float)((float)(v59.__sinval + v59.__sinval) * v59.__sinval);
    *(float *)v62.i32 = -(float)((float)(v59.__sinval + v59.__sinval) * v59.__cosval);
    v62.i32[1] = v61.i32[0];
    *(float *)&v61.i32[1] = (float)(v59.__sinval + v59.__sinval) * v59.__cosval;
    v63 = (float32x4_t)vzip1q_s32(v61, v61);
    v64 = (int8x16_t)vmulq_f32(v63, (float32x4_t)xmmword_19FFB34C0);
    v65 = vmlaq_f32((float32x4_t)vextq_s8(v64, v64, 8uLL), (float32x4_t)xmmword_19FFB3590, v63);
    v66 = (float32x4_t)vzip1q_s32(v62, v62);
    v67 = (int8x16_t)vmulq_f32(v66, (float32x4_t)xmmword_19FFB34C0);
    *(float32x4_t *)v187 = v65;
    *(float32x4_t *)&v187[16] = vmlaq_f32((float32x4_t)vextq_s8(v67, v67, 8uLL), (float32x4_t)xmmword_19FFB3590, v66);
    v68 = (float32x4_t)vzip1q_s32((int32x4_t)LODWORD(v155), (int32x4_t)LODWORD(v155));
    v69 = (int8x16_t)vmulq_f32(v68, *(float32x4_t *)&v187[8]);
    v65.i64[1] = *(_QWORD *)&v187[24];
    v70 = vmlaq_f32((float32x4_t)vextq_s8(v69, v69, 8uLL), v65, v68);
    v68.i32[0] = 0;
    v68.f32[1] = v158;
    v71 = (float32x4_t)vzip1q_s32((int32x4_t)v68.u64[0], (int32x4_t)v68.u64[0]);
    v72 = (int8x16_t)vmulq_f32(v71, *(float32x4_t *)&v187[8]);
    *(float32x4_t *)buf = v70;
    *(float32x4_t *)&buf[16] = vmlaq_f32((float32x4_t)vextq_s8(v72, v72, 8uLL), v65, v71);
    v167 = vmulq_n_f32((float32x4_t)xmmword_19FFB3580, fminf(v155, v158));
    v168 = v60;
    v73 = v42[5] & 1;
    v164 = (int8x16_t)xmmword_19FFB3470;
    v165 = (float32x2_t)0x80000000800000;
    *(_QWORD *)v187 = &off_1E42D8AB0;
    *(_QWORD *)&v187[8] = &v164;
    *(_QWORD *)&v187[16] = buf;
    *(_QWORD *)&v187[24] = v187;
    v74.n128_u64[0] = (unint64_t)gm::Box<float,3>::forEachCorner(&g_gglBuildingBoundingBoxes[3 * v73], (uint64_t)v187);
    v75 = *(_QWORD **)&v187[24];
    if (*(_BYTE **)&v187[24] == v187)
    {
      v75 = v187;
      v76 = 4;
    }
    else
    {
      if (!*(_QWORD *)&v187[24])
      {
LABEL_69:
        v77 = (float32x4_t)v164;
        v77.i32[3] = HIDWORD(*(_OWORD *)self->super._boundingBox._minimum._e);
        v78 = *(float32x4_t *)self->super._boundingBox._minimum._e;
        v78.i32[3] = v164.i32[3];
        *(int8x16_t *)self->super._boundingBox._minimum._e = vbslq_s8((int8x16_t)vcgtq_f32(v78, v77), v164, *(int8x16_t *)self->super._boundingBox._minimum._e);
        *(float32x2_t *)&self->super._boundingBox._maximum._e[1] = vmaxnm_f32(*(float32x2_t *)&self->super._boundingBox._maximum._e[1], v165);
        goto LABEL_70;
      }
      v76 = 5;
    }
    (*(void (**)(__n128))(*v75 + 8 * v76))(v74);
    goto LABEL_69;
  }
LABEL_177:
  if (v186)
  {
    v152 = v184;
    v151 = v185;
    v153 = *v185;
    *(_QWORD *)(v153 + 8) = v184[1];
    *(_QWORD *)v152[1] = v153;
    v186 = 0;
    if (v151 != &v184)
    {
      do
      {
        v154 = (_QWORD *)v151[1];
        operator delete(v151);
        v151 = v154;
      }
      while (v154 != &v184);
    }
  }
}

- (void)willAddDataWithAccessor:(ResourceAccessor *)a3
{
  __n128 v5;
  optional<md::MeshSet<ggl::BuildingFlatStroke::BuildingFlatStrokeMesh, ggl::BuildingFlatStroke::DefaultVbo>> *p_strokeMeshInfo;
  uint64_t *v7;
  uint64_t v8;
  double type;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  char *v19;
  const char *v20;
  std::__shared_weak_count *v21;
  unint64_t *p_shared_owners;
  unint64_t v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  uint64_t v26;
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
  __n128 *v42;
  __n128 *v43;
  char *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char *v49;
  __n128 *v50;
  char *v51;
  __n128 v52;
  __n128 *v53;
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
  uint64_t v71;
  geo::read_write_lock *v72;
  const char *v73;
  malloc_zone_t *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  __int128 v79;
  uint64_t v80;
  __int128 v81;
  unint64_t v82;
  unint64_t v83;
  __int128 v84;
  int v85;
  int v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  __int128 v95;
  int v96;
  int v97;
  unint64_t v98;
  unint64_t v99;
  _Unwind_Exception *v100;
  ResourceAccessor *v101;
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
  v106.super_class = (Class)VKBuildingGroup;
  -[VKPolygonalItemGroup willAddDataWithAccessor:](&v106, sel_willAddDataWithAccessor_);
  p_strokeMeshInfo = &self->_strokeMeshInfo;
  v7 = *(uint64_t **)&self->_anon_b28[152];
  if (v7)
    md::MeshSetStorage::prepareStorage(v7, a3);
  v101 = a3;
  type = self->_strokeMeshInfo._value.type;
  v8 = *(_QWORD *)self->_anon_b28;
  if (*(_QWORD *)&type != v8)
  {
    v5 = (__n128)xmmword_19FFB2DE0;
    v10 = (_QWORD *)&unk_1ECE44000;
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
        v107 = "Polygon Stroke Index Data";
        v64 = v12[14];
        if (!v64)
        {
          std::__throw_bad_function_call[abi:nn180100]();
          _Unwind_Resume(v100);
        }
        (*(void (**)(__int128 *__return_ptr, uint64_t, const char **, uint64_t, __int128 *))(*(_QWORD *)v64 + 48))(&v109, v64, &v107, v63, &v110);
        v11 = *(_QWORD *)&p_strokeMeshInfo[10]._hasValue;
      }
      else
      {
        v109 = 0uLL;
      }
      md::MeshSetStorage::buildSubIndexData(&v107, v11, *(_QWORD **)&p_strokeMeshInfo[11]._hasValue, (uint64_t)"Polygon Stroke Vertex Data", *(unsigned int *)(*(_QWORD *)&type + 4));
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
      *(_QWORD *)v19 = &off_1E42E3580;
      v20 = v107;
      v21 = v108;
      if (v108)
      {
        p_shared_owners = (unint64_t *)&v108->__shared_owners_;
        do
          v23 = __ldxr(p_shared_owners);
        while (__stxr(v23 + 1, p_shared_owners));
      }
      if ((v24 & 1) == 0
      {
        if ((v65 & 1) == 0
        {
          ggl::MeshTyped<ggl::BuildingFlatStroke::DefaultVbo>::attributesReflection(void)::r = (uint64_t)&ggl::BuildingFlatStroke::defaultVboReflection;
        }
        ggl::MeshTyped<ggl::BuildingFlatStroke::DefaultVbo>::typedReflection(void)::r = (uint64_t)&ggl::MeshTyped<ggl::BuildingFlatStroke::DefaultVbo>::attributesReflection(void)::r;
        unk_1ECE43CB8 = 1;
      }
      *((_QWORD *)v19 + 11) = 0;
      *((_QWORD *)v19 + 7) = 0;
      *((_QWORD *)v19 + 8) = 0;
      *((_DWORD *)v19 + 18) = 0;
      *((_QWORD *)v19 + 3) = &off_1E42BBC08;
      *((_QWORD *)v19 + 4) = "Polygon Stroke Mesh";
      *((_QWORD *)v19 + 5) = &unk_1E42BBC28;
      *((_QWORD *)v19 + 6) = 0;
      *((_QWORD *)v19 + 10) = &ggl::MeshTyped<ggl::BuildingFlatStroke::DefaultVbo>::typedReflection(void)::r;
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
        v10[495] = v66;
      }
      v26 = v10[495];
      *((_QWORD *)v19 + 18) = 0;
      *((_QWORD *)v19 + 15) = 0;
      *((_QWORD *)v19 + 16) = 0;
      *((_QWORD *)v19 + 14) = v26;
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
        v71 = v70;
        *(_OWORD *)(v70 + 56) = 0u;
        v72 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v70 + 56), 0);
        if ((_DWORD)v72)
          geo::read_write_lock::logFailure(v72, (uint64_t)"initialization", v73);
        v74 = malloc_create_zone(0, 0);
        *(_QWORD *)(v71 + 48) = v74;
        malloc_set_zone_name(v74, "GeoGL");
        *(_QWORD *)(v71 + 256) = os_log_create("com.apple.VectorKit", "Memory");
        v10 = &unk_1ECE44000;
        ggl::Allocator::instance(void)::alloc = v71;
      }
      *((_QWORD *)v19 + 19) = v10[495];
      *((_QWORD *)v19 + 20) = 0;
      *((_QWORD *)v19 + 17) = v19 + 144;
      *((_QWORD *)v19 + 3) = &off_1E42BD9B8;
      *((_QWORD *)v19 + 5) = &unk_1E42BD9D8;
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
        if (!v21)
          goto LABEL_33;
      }
      else
      {
LABEL_30:
        if (!v21)
          goto LABEL_33;
      }
      v32 = (unint64_t *)&v21->__shared_owners_;
      do
        v33 = __ldxr(v32);
      while (__stxr(v33 + 1, v32));
LABEL_33:
      v34 = (std::__shared_weak_count *)*((_QWORD *)v19 + 16);
      *((_QWORD *)v19 + 15) = v20;
      *((_QWORD *)v19 + 16) = v21;
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
      *((_QWORD *)v19 + 3) = &off_1E42BA630;
      *((_QWORD *)v19 + 5) = &unk_1E42BA650;
      if (!v21)
        goto LABEL_42;
      v37 = (unint64_t *)&v21->__shared_owners_;
      do
        v38 = __ldaxr(v37);
      while (__stlxr(v38 - 1, v37));
      if (!v38)
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
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
      p_strokeMeshInfo = &self->_strokeMeshInfo;
      v42 = *(__n128 **)&self->_anon_b28[24];
      v41 = *(_QWORD *)&self->_anon_b28[32];
      if ((unint64_t)v42 >= v41)
      {
        v44 = *(char **)&self->_anon_b28[16];
        v45 = ((char *)v42 - v44) >> 4;
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
        if (v42 == (__n128 *)v44)
        {
          p_strokeMeshInfo = &self->_strokeMeshInfo;
          *(_QWORD *)&self->_anon_b28[16] = v50;
          *(_QWORD *)&self->_anon_b28[24] = v43;
          *(_QWORD *)&self->_anon_b28[32] = v51;
        }
        else
        {
          p_strokeMeshInfo = &self->_strokeMeshInfo;
          do
          {
            v52 = v42[-1];
            --v42;
            v5 = v52;
            v50[-1] = v52;
            --v50;
            v42->n128_u64[0] = 0;
            v42->n128_u64[1] = 0;
          }
          while (v42 != (__n128 *)v44);
          v42 = *(__n128 **)&self->_anon_b28[16];
          v53 = *(__n128 **)&self->_anon_b28[24];
          *(_QWORD *)&self->_anon_b28[16] = v50;
          *(_QWORD *)&self->_anon_b28[24] = v43;
          *(_QWORD *)&self->_anon_b28[32] = v51;
          while (v53 != v42)
          {
            v54 = (std::__shared_weak_count *)v53[-1].n128_u64[1];
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
            --v53;
          }
        }
        if (v42)
          operator delete(v42);
      }
      else
      {
        v42->n128_u64[0] = (unint64_t)(v19 + 24);
        v42->n128_u64[1] = (unint64_t)v19;
        v43 = v42 + 1;
      }
      *(_QWORD *)&p_strokeMeshInfo[2]._value.type = v43;
      v57 = v108;
      if (!v108)
        goto LABEL_77;
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
LABEL_78:
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
LABEL_77:
        v60 = (std::__shared_weak_count *)*((_QWORD *)&v109 + 1);
        if (*((_QWORD *)&v109 + 1))
          goto LABEL_78;
      }
      v8 = *(_QWORD *)&p_strokeMeshInfo[1]._hasValue;
      v10 = &unk_1ECE44000;
LABEL_6:
      *(_QWORD *)&type += 8;
    }
    while (*(_QWORD *)&type != v8);
  }
  v75 = *(_QWORD *)&p_strokeMeshInfo[2]._hasValue;
  if (v75 != *(_QWORD *)&p_strokeMeshInfo[2]._value.type)
  {
    v76 = **(_QWORD **)(*(_QWORD *)v75 + 64);
    v77 = **(unsigned __int16 **)&p_strokeMeshInfo->_value.type;
    v110 = 0uLL;
    v78 = *(_QWORD *)(v76 + 8) * v77;
    v5.n128_u64[0] = (unint64_t)v101;
    *(_QWORD *)&v79 = v101;
    *((_QWORD *)&v79 + 1) = v76;
    v104 = v5;
    if (v78)
    {
      if (v101 && *(_BYTE *)(v76 + 17) != 2)
      {
        v102 = v79;
        v80 = (*((uint64_t (**)(ResourceAccessor *))v101->var0 + 7))(v101);
        v79 = v102;
      }
      else
      {
        v80 = *(_QWORD *)(v76 + 72);
      }
    }
    else
    {
      v80 = 0;
    }
    v110 = v79;
    v111 = 0;
    v112 = v78;
    v114 = v80;
    v113 = 257;
    ggl::BufferMemory::operator=((uint64_t *)&p_strokeMeshInfo[3]._value, (uint64_t)&v110);
    *(_QWORD *)&v81 = v104.n128_u64[0];
    if (v114)
    {
      v83 = v111;
      v82 = v112;
      if (v112 != v111)
      {
        v84 = v110;
        v85 = v113;
        v86 = HIBYTE(v113);
        if ((_QWORD)v110 && *(_BYTE *)(*((_QWORD *)&v110 + 1) + 17) != 2)
        {
          (*(void (**)(__n128))(*(_QWORD *)v110 + 64))(v104);
          *(_QWORD *)&v81 = v104.n128_u64[0];
        }
        if (v85 && !v86)
        {
          v88 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 56);
          v87 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 64);
          if (v87 == v88)
            v88 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 80) - *(_QWORD *)(*((_QWORD *)&v84 + 1) + 72);
          if (v83 < v88)
            v88 = v83;
          if (v87 <= v82)
            v87 = v82;
          if (v87 == v88)
            v87 = v88 + *(_QWORD *)(*((_QWORD *)&v84 + 1) + 80) - *(_QWORD *)(*((_QWORD *)&v84 + 1) + 72);
          *(_QWORD *)(*((_QWORD *)&v84 + 1) + 56) = v88;
          *(_QWORD *)(*((_QWORD *)&v84 + 1) + 64) = v87;
        }
      }
    }
    v89 = *(_QWORD *)(**(_QWORD **)&p_strokeMeshInfo[2]._hasValue + 96);
    v90 = *(unsigned int *)(*(_QWORD *)&p_strokeMeshInfo->_value.type + 4);
    v110 = 0uLL;
    v91 = *(_QWORD *)(v89 + 8) * v90;
    *((_QWORD *)&v81 + 1) = v89;
    if (v91)
    {
      if (v101 && *(_BYTE *)(v89 + 17) != 2)
      {
        v105 = v81;
        v92 = (*((uint64_t (**)(ResourceAccessor *))v101->var0 + 7))(v101);
        v81 = v105;
      }
      else
      {
        v92 = *(_QWORD *)(v89 + 72);
      }
    }
    else
    {
      v92 = 0;
    }
    v110 = v81;
    v111 = 0;
    v112 = v91;
    v114 = v92;
    v113 = 257;
    ggl::BufferMemory::operator=((uint64_t *)&p_strokeMeshInfo[6]._value, (uint64_t)&v110);
    if (v114)
    {
      v94 = v111;
      v93 = v112;
      if (v112 != v111)
      {
        v95 = v110;
        v96 = v113;
        v97 = HIBYTE(v113);
        if ((_QWORD)v110 && *(_BYTE *)(*((_QWORD *)&v110 + 1) + 17) != 2)
          (*(void (**)(void))(*(_QWORD *)v110 + 64))();
        if (v96 && !v97)
        {
          v99 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 56);
          v98 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 64);
          if (v98 == v99)
            v99 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 80) - *(_QWORD *)(*((_QWORD *)&v95 + 1) + 72);
          if (v94 < v99)
            v99 = v94;
          if (v98 <= v93)
            v98 = v93;
          if (v98 == v99)
            v98 = v99 + *(_QWORD *)(*((_QWORD *)&v95 + 1) + 80) - *(_QWORD *)(*((_QWORD *)&v95 + 1) + 72);
          *(_QWORD *)(*((_QWORD *)&v95 + 1) + 56) = v99;
          *(_QWORD *)(*((_QWORD *)&v95 + 1) + 64) = v98;
        }
      }
    }
  }
  md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::createMeshes((uint64_t *)&self->_fillMeshInfoForPointyRoofs._value, (uint64_t)"Flat Building Roof Mesh", (uint64_t)"Flat Building Roof Vertex Data", (uint64_t)"Flat Building Roof Index Data", v101, v5);
}

- (void)didFinishAddingData
{
  optional<md::MeshSet<ggl::BuildingFlatStroke::BuildingFlatStrokeMesh, ggl::BuildingFlatStroke::DefaultVbo>> *p_strokeMeshInfo;
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
  vector<std::shared_ptr<ggl::BuildingFlatStroke::BuildingFlatStrokeMesh>, std::allocator<std::shared_ptr<ggl::BuildingFlatStroke::BuildingFlatStrokeMesh>>> *p_strokeMeshes;
  char *begin;
  char *end;
  void *v23;
  std::__shared_weak_count *v24;
  unint64_t *p_shared_owners;
  unint64_t v26;
  optional<md::MeshSet<ggl::PolygonBase::CompressedMeshMesh, ggl::PolygonBase::CompressedVbo>> *p_fillMeshInfoForPointyRoofs;
  ValueUnion *p_value;
  uint64_t *v29;
  vector<std::shared_ptr<ggl::PolygonBase::CompressedMeshMesh>, std::allocator<std::shared_ptr<ggl::PolygonBase::CompressedMeshMesh>>> *p_fillMeshesForPointyRoofs;
  char *v31;
  char *v32;
  void *v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  objc_super v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unsigned __int8 v42;
  unsigned __int8 v43;
  uint64_t v44;

  v37.receiver = self;
  v37.super_class = (Class)VKBuildingGroup;
  -[VKPolygonalItemGroup didFinishAddingData](&v37, sel_didFinishAddingData);
  p_strokeMeshInfo = &self->_strokeMeshInfo;
  v4 = *(_QWORD *)&self->_anon_b28[160];
  if (v4 && *(_QWORD *)v4 == *(_QWORD *)&self->_anon_b28[144])
    *(_BYTE *)(v4 + 80) = 1;
  v5 = *(md::MeshSetStorage **)&self->_anon_b28[152];
  if (v5)
    md::MeshSetStorage::finalize(v5);
  v44 = 0;
  v38 = 0;
  v39 = 0;
  ggl::BufferMemory::operator=((uint64_t *)&self->_anon_b28[40], (uint64_t)&v38);
  if (v44)
  {
    v7 = v40;
    v6 = v41;
    if (v41 != v40)
    {
      v8 = (_QWORD *)v39;
      v9 = v42;
      v10 = v43;
      if (v38 && *(_BYTE *)(v39 + 17) != 2)
        (*(void (**)(void))(*(_QWORD *)v38 + 64))();
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
  v44 = 0;
  v38 = 0;
  v39 = 0;
  ggl::BufferMemory::operator=((uint64_t *)&self->_anon_b28[88], (uint64_t)&v38);
  if (v44)
  {
    v14 = v40;
    v13 = v41;
    if (v41 != v40)
    {
      v15 = (_QWORD *)v39;
      v16 = v42;
      v17 = v43;
      if (v38 && *(_BYTE *)(v39 + 17) != 2)
        (*(void (**)(void))(*(_QWORD *)v38 + 64))();
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
  p_strokeMeshes = &self->_strokeMeshes;
  begin = (char *)self->_strokeMeshes.__begin_;
  if (begin)
  {
    end = (char *)self->_strokeMeshes.__end_;
    v23 = self->_strokeMeshes.__begin_;
    if (end != begin)
    {
      do
      {
        v24 = (std::__shared_weak_count *)*((_QWORD *)end - 1);
        if (v24)
        {
          p_shared_owners = (unint64_t *)&v24->__shared_owners_;
          do
            v26 = __ldaxr(p_shared_owners);
          while (__stlxr(v26 - 1, p_shared_owners));
          if (!v26)
          {
            ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
            std::__shared_weak_count::__release_weak(v24);
          }
        }
        end -= 16;
      }
      while (end != begin);
      v23 = p_strokeMeshes->__begin_;
    }
    self->_strokeMeshes.__end_ = begin;
    operator delete(v23);
    p_strokeMeshes->__begin_ = 0;
    self->_strokeMeshes.__end_ = 0;
    self->_strokeMeshes.__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&p_strokeMeshes->__begin_ = *(_OWORD *)&self->_anon_b28[16];
  self->_strokeMeshes.__end_cap_.__value_ = *(void **)&self->_anon_b28[32];
  *(_QWORD *)&self->_anon_b28[16] = 0;
  *(_QWORD *)&self->_anon_b28[24] = 0;
  *(_QWORD *)&self->_anon_b28[32] = 0;
  p_fillMeshInfoForPointyRoofs = &self->_fillMeshInfoForPointyRoofs;
  p_value = &self->_fillMeshInfoForPointyRoofs._value;
  v29 = md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::finishedWriting((uint64_t *)&self->_fillMeshInfoForPointyRoofs._value);
  p_fillMeshesForPointyRoofs = &self->_fillMeshesForPointyRoofs;
  v31 = (char *)self->_fillMeshesForPointyRoofs.__begin_;
  if (v31)
  {
    v32 = (char *)self->_fillMeshesForPointyRoofs.__end_;
    v33 = self->_fillMeshesForPointyRoofs.__begin_;
    if (v32 != v31)
    {
      do
      {
        v34 = (std::__shared_weak_count *)*((_QWORD *)v32 - 1);
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
        v32 -= 16;
      }
      while (v32 != v31);
      v33 = p_fillMeshesForPointyRoofs->__begin_;
    }
    p_fillMeshesForPointyRoofs->__end_ = v31;
    operator delete(v33);
    p_fillMeshesForPointyRoofs->__begin_ = 0;
    p_fillMeshesForPointyRoofs->__end_ = 0;
    p_fillMeshesForPointyRoofs->__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&p_fillMeshesForPointyRoofs->__begin_ = *(_OWORD *)v29;
  p_fillMeshesForPointyRoofs->__end_cap_.__value_ = (void *)v29[2];
  *v29 = 0;
  v29[1] = 0;
  v29[2] = 0;
  if (p_strokeMeshInfo->_hasValue)
  {
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)&p_strokeMeshInfo->_value);
    p_strokeMeshInfo->_hasValue = 0;
  }
  if (p_fillMeshInfoForPointyRoofs->_hasValue)
  {
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)p_value);
    p_fillMeshInfoForPointyRoofs->_hasValue = 0;
  }
}

- (void)addBuilding:(void *)a3 index:(unint64_t)a4 ofTotal:(unint64_t)a5 accessor:(ResourceAccessor *)a6 triangulator:(void *)a7 prepareExtrusion:(BOOL)a8 forRoofStyle:(unsigned __int8)a9 scaleThreshold:(float)a10
{
  _BOOL4 v10;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;
  _BOOL4 PointyRoofForBuilding;
  double v21;
  double v22;
  _BOOL4 v23;
  int v24;
  int v25;
  int v26;
  unint64_t v27;
  unint64_t v28;
  float *v29;
  float32x4_t v30;
  double v31;
  float32x4_t v32;
  double v33;
  double v34;
  float32x4_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  VKBuildingGroup *v39;
  int *v40;
  uint64_t v41;
  unint64_t v42;
  _QWORD *v43;
  __n128 v44;
  _QWORD *v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  unint64_t v52;
  VKBuildingGroup *v53;
  _QWORD *v54;
  unint64_t v55;
  NSObject *v56;
  optional<md::MeshSet<ggl::BuildingFlatStroke::BuildingFlatStrokeMesh, ggl::BuildingFlatStroke::DefaultVbo>> *p_strokeMeshInfo;
  uint64_t v58;
  unsigned __int8 v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  unint64_t v65;
  unint64_t v66;
  _QWORD *v67;
  int v68;
  int v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  __int128 v77;
  unint64_t v78;
  unint64_t v79;
  _QWORD *v80;
  int v81;
  int v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  _QWORD *v87;
  uint64_t v88;
  int v89;
  int v90;
  int v91;
  int v92;
  _QWORD *v93;
  _QWORD *v94;
  unint64_t v95;
  _BOOL4 v97;
  Box<float, 3> *p_boundingBox;
  _QWORD v99[2];
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *__p;
  void *v106;
  int v107;
  float v108;
  float *v109;
  unint64_t v110;
  _DWORD v111[3];
  BOOL v112;
  char v113;
  uint64_t v114;
  VKBuildingGroup *v115;
  _QWORD v116[2];
  __int128 buf;
  unint64_t v118;
  unint64_t v119;
  __int16 v120;
  uint64_t v121;
  _BYTE v122[24];
  _BYTE *v123;
  _BYTE v124[24];
  _BYTE *v125;
  uint64_t v126;

  v10 = a8;
  v126 = *MEMORY[0x1E0C80C00];
  v17 = *((unsigned int *)a3 + 25);
  v114 = *((_QWORD *)a3 + 5);
  v115 = self;
  v18 = -[VKPolygonalItemGroup indexForGeoFeatureAttributes:](self, "indexForGeoFeatureAttributes:", (char *)a3 + 24);
  v113 = v18;
  v97 = v10;
  if (a9 == 1)
  {
    v19 = v18;
    PointyRoofForBuilding = _shouldMakePointyRoofForBuilding((uint64_t)a3);
    v112 = PointyRoofForBuilding;
    if (PointyRoofForBuilding)
    {
      *(float *)&v22 = (float)v19;
      *(float *)&v21 = a10;
      v23 = -[VKBuildingGroup addPointyRoofForBuilding:buildingModel:scaleThreshold:styleIndex:](self, "addPointyRoofForBuilding:buildingModel:scaleThreshold:styleIndex:", a3, *((_DWORD *)a3 + 10) & 1, v21, v22);
      v112 = v23;
    }
    else
    {
      v23 = 0;
    }
  }
  else
  {
    v23 = 0;
    v112 = 0;
  }
  -[VKPolygonalItemGroup size](self, "size");
  v111[0] = v24;
  v111[1] = v25;
  v111[2] = v26;
  if ((_DWORD)v17)
  {
    v95 = a4;
    v27 = 0;
    p_boundingBox = &self->super._boundingBox;
    while (1)
    {
      v109 = 0;
      v110 = 0;
      v109 = (float *)geo::codec::multiSectionFeaturePoints(a3, v27, &v110);
      if (geo::codec::multiSectionFeaturePrecision((uint64_t)a3) <= 0x10)
      {
        v108 = 0.0;
        v108 = geo::codec::buildingFootprintExtrusionHeight((uint64_t)a3, v27);
        v28 = v110;
        if (v110 >= 3)
        {
          v107 = 0;
          v29 = v109;
          v107 = ggl::CullingGrid::intersectedCellsForRibbon(v110, v109, 1);
          v115->super._cullingMask |= v107;
          md::Triangulator<float>::triangulate((uint64_t)a7, (uint64_t)v29, v28, v30, v31, v32, v33, v34, v35);
          v37 = *((_QWORD *)a7 + 11);
          v36 = *((_QWORD *)a7 + 12);
          v38 = v36 - v37;
          if (v36 != v37)
            break;
        }
      }
LABEL_8:
      if (v17 == ++v27)
      {
        v23 = v112;
        a4 = v95;
        goto LABEL_88;
      }
    }
    v39 = v115;
    v40 = &OBJC_IVAR___VKBuildingGroup__fillMeshInfoForPointyRoofs;
    if (!v112)
      v40 = &OBJC_IVAR___VKPolygonalItemGroup__fillMeshInfo;
    v41 = *v40;
    v42 = v110;
    v43 = operator new(0x68uLL);
    *v43 = &off_1E42C72C8;
    v43[1] = &v110;
    v43[2] = &v109;
    v43[3] = &v108;
    v43[4] = p_boundingBox;
    v43[5] = v111;
    v43[6] = &v113;
    v43[7] = a7;
    v43[8] = &v112;
    v43[9] = &v115;
    v43[10] = &v107;
    v43[11] = (char *)v39 + v41;
    v43[12] = &v114;
    v125 = v43;
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::writePoints((uint64_t)&v39->super._fillMeshInfo + v41, v42, v38 >> 1, (unint64_t)a6, (uint64_t)v124, v44);
    v45 = v125;
    if (v125 == v124)
    {
      v45 = v124;
      v46 = 4;
    }
    else
    {
      if (!v125)
        goto LABEL_19;
      v46 = 5;
    }
    (*(void (**)(void))(*v45 + 8 * v46))();
LABEL_19:
    md::PolygonSection::PolygonSection((uint64_t)v99, a3, v27);
    *(_QWORD *)&buf = a3;
    *((_QWORD *)&buf + 1) = v27;
    v47 = std::__hash_table<std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::__unordered_map_hasher<std::pair<void const*,unsigned long>,std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::hash<std::pair<void const*,unsigned long>>,std::equal_to<std::pair<void const*,unsigned long>>,true>,std::__unordered_map_equal<std::pair<void const*,unsigned long>,std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::equal_to<std::pair<void const*,unsigned long>>,std::hash<std::pair<void const*,unsigned long>>,true>,std::allocator<std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>>>::__emplace_unique_key_args<std::pair<void const*,unsigned long>,std::piecewise_construct_t const&,std::tuple<std::pair<void const*,unsigned long>&&>,std::tuple<>>((uint64_t)&v115->super._polygonEdges, (unint64_t)a3, v27, &buf);
    v48 = v47[4];
    v49 = v47[5];
    v50 = v47 + 4;
    v51 = v49 - v48;
    if (v49 != v48)
    {
      v52 = v110;
      v53 = v115;
      v123 = 0;
      v54 = operator new(0x60uLL);
      *v54 = &off_1E42C7310;
      v54[1] = &v110;
      v54[2] = &v109;
      v54[3] = &v108;
      v54[4] = p_boundingBox;
      v54[5] = v111;
      v54[6] = v99;
      v54[7] = &v113;
      v54[8] = v50;
      v54[9] = &v115;
      v54[10] = &v107;
      v54[11] = &v114;
      v55 = 2 * v52;
      v123 = v54;
      if (v55 < 0x10000)
      {
        p_strokeMeshInfo = &v53->_strokeMeshInfo;
        v58 = WORD1(p_strokeMeshInfo[9]._value.type);
        if (v55 > (v58 ^ 0xFFFFuLL))
        {
          v59 = p_strokeMeshInfo[9]._value.data[0] + 1;
          p_strokeMeshInfo[9]._value.data[0] = v59;
          WORD1(p_strokeMeshInfo[9]._value.type) = 0;
          HIDWORD(p_strokeMeshInfo[9]._value.type) = 0;
          v60 = **(_QWORD **)(*(_QWORD *)(*(_QWORD *)&p_strokeMeshInfo[2]._hasValue + 16 * v59) + 64);
          v61 = *(unsigned __int16 *)(*(_QWORD *)&p_strokeMeshInfo->_value.type + 8 * v59);
          buf = 0uLL;
          v62 = *(_QWORD *)(v60 + 8) * v61;
          if (v62)
          {
            if (a6 && *(_BYTE *)(v60 + 17) != 2)
              v63 = (*((uint64_t (**)(ResourceAccessor *, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t))a6->var0
                     + 7))(a6, v60, 0, v62, 1, 1);
            else
              v63 = *(_QWORD *)(v60 + 72);
          }
          else
          {
            v63 = 0;
          }
          *(_QWORD *)&v64 = a6;
          *((_QWORD *)&v64 + 1) = v60;
          buf = v64;
          v118 = 0;
          v119 = v62;
          v121 = v63;
          v120 = 257;
          ggl::BufferMemory::operator=((uint64_t *)&p_strokeMeshInfo[3]._value, (uint64_t)&buf);
          if (v121)
          {
            v66 = v118;
            v65 = v119;
            if (v119 != v118)
            {
              v67 = (_QWORD *)*((_QWORD *)&buf + 1);
              v68 = v120;
              v69 = HIBYTE(v120);
              if ((_QWORD)buf && *(_BYTE *)(*((_QWORD *)&buf + 1) + 17) != 2)
              {
                v93 = (_QWORD *)*((_QWORD *)&buf + 1);
                v89 = v120;
                v91 = HIBYTE(v120);
                (*(void (**)(_QWORD))(*(_QWORD *)buf + 64))(buf);
                v68 = v89;
                v69 = v91;
                v67 = v93;
              }
              if (v68 && !v69)
              {
                v70 = v67[7];
                v71 = v67[8];
                if (v71 == v70)
                  v70 = v67[10] - v67[9];
                if (v66 < v70)
                  v70 = v66;
                if (v71 <= v65)
                  v71 = v65;
                if (v71 == v70)
                  v71 = v70 + v67[10] - v67[9];
                v67[7] = v70;
                v67[8] = v71;
              }
            }
          }
          v72 = p_strokeMeshInfo[9]._value.data[0];
          v73 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)&p_strokeMeshInfo[2]._hasValue + 16 * v72) + 96);
          v74 = *(unsigned int *)(*(_QWORD *)&p_strokeMeshInfo->_value.type + 8 * v72 + 4);
          buf = 0uLL;
          v75 = *(_QWORD *)(v73 + 8) * v74;
          if (v75)
          {
            if (a6 && *(_BYTE *)(v73 + 17) != 2)
              v76 = (*((uint64_t (**)(ResourceAccessor *, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t))a6->var0
                     + 7))(a6, v73, 0, v75, 1, 1);
            else
              v76 = *(_QWORD *)(v73 + 72);
          }
          else
          {
            v76 = 0;
          }
          *(_QWORD *)&v77 = a6;
          *((_QWORD *)&v77 + 1) = v73;
          buf = v77;
          v118 = 0;
          v119 = v75;
          v121 = v76;
          v120 = 257;
          ggl::BufferMemory::operator=((uint64_t *)&p_strokeMeshInfo[6]._value, (uint64_t)&buf);
          if (v121)
          {
            v79 = v118;
            v78 = v119;
            if (v119 != v118)
            {
              v80 = (_QWORD *)*((_QWORD *)&buf + 1);
              v81 = v120;
              v82 = HIBYTE(v120);
              if ((_QWORD)buf && *(_BYTE *)(*((_QWORD *)&buf + 1) + 17) != 2)
              {
                v94 = (_QWORD *)*((_QWORD *)&buf + 1);
                v90 = v120;
                v92 = HIBYTE(v120);
                (*(void (**)(_QWORD))(*(_QWORD *)buf + 64))(buf);
                v81 = v90;
                v82 = v92;
                v80 = v94;
              }
              if (v81 && !v82)
              {
                v83 = v80[7];
                v84 = v80[8];
                if (v84 == v83)
                  v83 = v80[10] - v80[9];
                if (v79 < v83)
                  v83 = v79;
                if (v84 <= v78)
                  v84 = v78;
                if (v84 == v83)
                  v84 = v83 + v80[10] - v80[9];
                v80[7] = v83;
                v80[8] = v84;
              }
            }
          }
          v58 = WORD1(p_strokeMeshInfo[9]._value.type);
          v54 = v123;
        }
        v85 = 0x924924924924924ALL * (v51 >> 3);
        *(_QWORD *)&buf = v58;
        *((_QWORD *)&buf + 1) = v55 + v58;
        v86 = v85 + HIDWORD(p_strokeMeshInfo[9]._value.type);
        v116[0] = HIDWORD(p_strokeMeshInfo[9]._value.type);
        v116[1] = v86;
        if (!v54)
        {
          std::__throw_bad_function_call[abi:nn180100]();
          __break(1u);
          return;
        }
        (*(void (**)(_QWORD *, __int128 *, _QWORD *, ValueUnion *, ValueUnion *))(*v54 + 48))(v54, &buf, v116, &p_strokeMeshInfo[3]._value, &p_strokeMeshInfo[6]._value);
        WORD1(p_strokeMeshInfo[9]._value.type) += v55;
        HIDWORD(p_strokeMeshInfo[9]._value.type) += v85;
      }
      else
      {
        if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
          dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
        v56 = (id)GEOGetVectorKitVKDefaultLog_log;
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_19F029000, v56, OS_LOG_TYPE_ERROR, "MeshSet: Cannot write points for polygons: polygon is too big", (uint8_t *)&buf, 2u);
        }

      }
      v87 = v123;
      if (v123 == v122)
      {
        v87 = v122;
        v88 = 4;
        goto LABEL_78;
      }
      if (v123)
      {
        v88 = 5;
LABEL_78:
        (*(void (**)(void))(*v87 + 8 * v88))();
      }
    }
    v99[0] = &off_1E428FC30;
    if (__p)
    {
      v106 = __p;
      operator delete(__p);
    }
    if (v104)
      operator delete(v104);
    if (v102)
    {
      v103 = v102;
      operator delete(v102);
    }
    if (v100)
    {
      v101 = v100;
      operator delete(v100);
    }
    goto LABEL_8;
  }
LABEL_88:
  if (v97 && !v23)
    -[VKBuildingGroup addExtrusionForBuilding:index:ofTotal:](v115, "addExtrusionForBuilding:index:ofTotal:", a3, a4, a5);
}

- (void)addExtrusionForBuilding:(void *)a3 index:(unint64_t)a4 ofTotal:(unint64_t)a5
{
  _QWORD *v5;
  uint64_t v6;
  char *v7;
  __int16 v8;
  int v9;
  unint64_t v10;
  char *v11;
  float *v12;
  int v13;
  char *v14;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  char *v21;
  char *v22;
  unint64_t v23;
  char *v24;
  int v25;
  float v26;
  float v27;
  unint64_t v28;
  float v29;
  uint64_t v30;
  uint64_t v31;
  float *v32;
  float *v33;
  uint64_t v34;
  uint64_t v35;
  float *v36;
  float *v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float *v44;
  uint64_t v45;
  int v46;
  float v47;
  float *v48;
  uint64_t v49;
  char *v50;
  __int128 *v51;
  uint64_t v52;
  __int128 v53;
  float **v54;
  uint64_t v55;
  unint64_t v56;
  float **v57;
  _QWORD *v58;
  float *v59;
  _QWORD *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD *v68;
  float *v69;
  float *v70;
  float *v71;
  _QWORD *value;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  uint64_t v79;
  unint64_t v80;
  char *v81;
  std::__shared_weak_count *v82;
  unint64_t *p_shared_owners;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  __int128 v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  uint64_t v96;
  unint64_t v97;
  std::__shared_weak_count *v98;
  unint64_t *v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t v102;
  __int128 v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  int *v107;
  int v108;
  BOOL v109;
  _QWORD *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  unint64_t v115;
  unint64_t v116;
  uint64_t v117;
  unsigned int v118;
  unint64_t v119;
  uint64_t v120;
  unint64_t v121;
  std::__shared_weak_count *v122;
  unint64_t *v123;
  unint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  unint64_t v130;
  __int128 v131;
  unsigned __int8 v132;
  uint64_t v133;
  unint64_t v134;
  unint64_t v135;
  unint64_t v136;
  unint64_t v137;
  uint64_t v138;
  unint64_t v139;
  std::__shared_weak_count *v140;
  unint64_t *v141;
  unint64_t v142;
  uint64_t v143;
  uint64_t v144;
  __int128 v145;
  uint64_t v146;
  uint64_t v147;
  int16x4_t v148;
  float v149;
  float v150;
  float v151;
  float v152;
  float v153;
  float v154;
  float v155;
  float v156;
  float *v157;
  _WORD *v158;
  int v159;
  int v160;
  int v161;
  int v162;
  int v163;
  int v164;
  int16x4_t v165;
  unint64_t v166;
  unint64_t v167;
  __int128 v168;
  int v169;
  int v170;
  int v171;
  unint64_t v172;
  unint64_t v173;
  unint64_t v174;
  unint64_t v175;
  _QWORD *v176;
  int v177;
  int v178;
  unint64_t v179;
  unint64_t v180;
  _WORD *v181;
  __int16 v182;
  __int16 v183;
  float v184;
  float v185;
  float v186;
  unint64_t v187;
  uint64_t v188;
  uint64_t v189;
  float v190;
  float v191;
  float v192;
  float v193;
  float v194;
  float v195;
  std::__shared_weak_count *v196;
  std::__shared_weak_count *v197;
  uint64_t v198;
  unint64_t *v199;
  unint64_t v200;
  _QWORD *v201;
  int v202;
  uint64_t v203;
  unint64_t v204;
  uint64_t v205;
  float *v206;
  uint64_t v207;
  unint64_t v208;
  unint64_t v209;
  float *v210;
  float v211;
  float v212;
  float v213;
  float v214;
  float v215;
  float v216;
  int v217;
  BOOL v218;
  int v219;
  float v220;
  int v221;
  int v222;
  BOOL v223;
  __int16 v224;
  float v225;
  float v226;
  float v227;
  int v228;
  int v229;
  int v230;
  uint64_t v231;
  int v232;
  int v233;
  int v234;
  _BYTE *v235;
  __int16 v236;
  unint64_t v237;
  unint64_t v238;
  __int128 v239;
  int v240;
  int v241;
  unint64_t v242;
  unint64_t v243;
  unint64_t v244;
  unint64_t v245;
  __int128 v246;
  int v247;
  int v248;
  unint64_t v249;
  unint64_t v250;
  _QWORD *v251;
  _QWORD *v252;
  uint64_t v253;
  _QWORD *v254;
  float **v255;
  float *v256;
  float *v257;
  float **v258;
  int ***v259;
  unint64_t v260;
  VKBuildingGroup *v261;
  unint64_t v262;
  uint64_t v263;
  uint64_t v264;
  char *v265;
  int v266;
  int v267;
  __int16 v268;
  uint64_t v269;
  char *__p;
  int v271;
  uint64_t v272;
  unsigned int v273;
  char *v274;
  char *v275;
  unint64_t v276;
  _QWORD *v277;
  _QWORD v278[3];
  __int128 v279;
  unint64_t v280;
  unint64_t v281;
  __int16 v282;
  uint64_t v283;
  __int128 v284;
  unint64_t v285;
  unint64_t v286;
  __int16 v287;
  uint64_t v288;
  __int128 v289;
  unint64_t v290;
  unint64_t v291;
  __int16 v292;
  uint64_t v293;
  _QWORD *v294;
  _QWORD *v295;
  uint64_t v296;
  float *v297;
  float **v298;
  uint64_t v299;
  __int128 v300;
  unint64_t v301;
  unint64_t v302;
  __int16 v303;
  uint64_t v304;
  uint64_t v305;

  v5 = a3;
  v305 = *MEMORY[0x1E0C80C00];
  v6 = *((unsigned int *)a3 + 25);
  v261 = self;
  if ((_DWORD)v6)
  {
    v7 = (char *)operator new(4 * v6);
    v265 = &v7[4 * v6];
    self = v261;
  }
  else
  {
    v265 = 0;
    v7 = 0;
  }
  v260 = v5[5];
  v8 = -[VKPolygonalItemGroup indexForGeoFeatureAttributes:](self, "indexForGeoFeatureAttributes:", v5 + 3);
  v259 = (int ***)(v5 + 3);
  v297 = (float *)&v297;
  v298 = &v297;
  v299 = 0;
  v277 = v5;
  v269 = v6;
  if (!(_DWORD)v6)
  {
    __p = v7;
    v263 = 0;
    v268 = 0;
    v55 = 0;
    v294 = &v294;
    v295 = &v294;
    v296 = 0;
    goto LABEL_73;
  }
  v9 = 0;
  v10 = 0;
  v11 = v7;
  do
  {
    *(_QWORD *)&v289 = 0;
    v12 = (float *)geo::codec::multiSectionFeaturePoints(v5, v10, &v289);
    v13 = ggl::CullingGrid::intersectedCellsForRibbon(v289, v12, 1);
    v271 = v13;
    if (v11 < v265)
    {
      *(_DWORD *)v11 = v13;
      v14 = v11 + 4;
      goto LABEL_26;
    }
    v274 = v11;
    v15 = v11 - v7;
    v16 = (v11 - v7) >> 2;
    v17 = v16 + 1;
    if ((unint64_t)(v16 + 1) >> 62)
      abort();
    if ((v265 - v7) >> 1 > v17)
      v17 = (v265 - v7) >> 1;
    if ((unint64_t)(v265 - v7) >= 0x7FFFFFFFFFFFFFFCLL)
      v18 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v18 = v17;
    if (v18)
    {
      if (v18 >> 62)
        std::__throw_bad_array_new_length[abi:nn180100]();
      v19 = v5;
      v20 = v18;
      v21 = (char *)operator new(4 * v18);
      v18 = v20;
      v5 = v19;
    }
    else
    {
      v21 = 0;
    }
    v22 = &v21[4 * v16];
    *(_DWORD *)v22 = v271;
    v14 = v22 + 4;
    if (v274 != v7)
    {
      v23 = v274 - 4 - v7;
      if (v23 >= 0xBC)
      {
        if (&v21[v15 - 4 - (v23 & 0xFFFFFFFFFFFFFFFCLL)] > &v21[v15 - 4])
        {
          v24 = v274;
        }
        else if (&v274[-(v23 & 0xFFFFFFFFFFFFFFFCLL) - 4] > v274 - 4)
        {
          v24 = v274;
        }
        else if ((unint64_t)(v274 - &v21[v15]) >= 0x20)
        {
          v49 = (v23 >> 2) + 1;
          v24 = &v274[-4 * (v49 & 0x7FFFFFFFFFFFFFF8)];
          v50 = &v21[v15 - 16];
          v51 = (__int128 *)(v274 - 16);
          v52 = v49 & 0x7FFFFFFFFFFFFFF8;
          do
          {
            v53 = *v51;
            *((_OWORD *)v50 - 1) = *(v51 - 1);
            *(_OWORD *)v50 = v53;
            v50 -= 32;
            v51 -= 2;
            v52 -= 8;
          }
          while (v52);
          v22 -= 4 * (v49 & 0x7FFFFFFFFFFFFFF8);
          if (v49 == (v49 & 0x7FFFFFFFFFFFFFF8))
            goto LABEL_23;
        }
        else
        {
          v24 = v274;
        }
      }
      else
      {
        v24 = v274;
      }
      do
      {
        v25 = *((_DWORD *)v24 - 1);
        v24 -= 4;
        *((_DWORD *)v22 - 1) = v25;
        v22 -= 4;
      }
      while (v24 != v7);
    }
LABEL_23:
    v265 = &v21[4 * v18];
    if (v7)
      operator delete(v7);
    v7 = v22;
LABEL_26:
    v267 = v9;
    __p = v7;
    v26 = geo::codec::buildingFootprintExtrusionHeight((uint64_t)v5, v10);
    v275 = v14;
    v262 = v10;
    v27 = geo::codec::buildingFootprintBaseHeight((uint64_t)v5, v10);
    v28 = v289;
    if ((_QWORD)v289)
    {
      v29 = v27;
      v30 = 0;
      v31 = v299;
      v32 = v297;
      v33 = v12 + 1;
      v34 = v289 - 1;
      do
      {
        if (v34 == v30)
          v35 = 0;
        else
          v35 = v30 + 1;
        v36 = &v12[2 * ((v28 + v30 - 1) % v28)];
        v37 = &v12[2 * v35];
        v38 = *(v33 - 1);
        v39 = *v33;
        v40 = *v36;
        v41 = v36[1];
        v42 = *v37;
        v43 = v37[1];
        v44 = (float *)operator new(0x48uLL);
        v44[4] = v38;
        v44[5] = v39;
        v44[6] = v26;
        v44[7] = v42;
        v44[8] = v43;
        v44[9] = v26;
        *((_QWORD *)v44 + 5) = v30;
        *((_QWORD *)v44 + 6) = v35;
        *((_QWORD *)v44 + 7) = v30;
        *((_QWORD *)v44 + 8) = v35;
        *(_QWORD *)v44 = v32;
        *((_QWORD *)v44 + 1) = &v297;
        *((_QWORD *)v32 + 1) = v44;
        v45 = v31 + 1;
        v297 = v44;
        v299 = v31 + 1;
        if (fabsf((float)((float)((float)(v42 - v38) * (float)(v38 - v40))+ (float)((float)(v43 - v39) * (float)(v39 - v41)))/ sqrtf((float)((float)((float)(v38 - v40) * (float)(v38 - v40))+ (float)((float)(v39 - v41) * (float)(v39 - v41)))* (float)((float)((float)(v42 - v38) * (float)(v42 - v38))+ (float)((float)(v43 - v39) * (float)(v43 - v39))))) <= 0.93969)
        {
          v46 = *((_DWORD *)v33 - 1);
          v47 = *v33;
          v48 = (float *)operator new(0x48uLL);
          *((_DWORD *)v48 + 4) = v46;
          v48[5] = v47;
          v48[6] = v29;
          *((_DWORD *)v48 + 7) = v46;
          v48[8] = v47;
          v48[9] = v26;
          *((_QWORD *)v48 + 5) = v30;
          *((_QWORD *)v48 + 6) = v30;
          *((_QWORD *)v48 + 7) = v30;
          *((_QWORD *)v48 + 8) = v30;
          *(_QWORD *)v48 = v44;
          *((_QWORD *)v48 + 1) = &v297;
          *((_QWORD *)v44 + 1) = v48;
          v45 = v31 + 2;
          v44 = v48;
          v297 = v48;
          v299 = v31 + 2;
        }
        ++v30;
        v33 += 2;
        v32 = v44;
        v31 = v45;
      }
      while (v28 != v30);
    }
    v9 = v271 | v267;
    v10 = v262 + 1;
    LODWORD(v6) = v269;
    v7 = __p;
    v11 = v275;
    v5 = v277;
  }
  while (v262 + 1 != v269);
  v54 = v298;
  v294 = &v294;
  v295 = &v294;
  v296 = 0;
  if (v298 != &v297)
  {
    do
    {
      v57 = (float **)v54[1];
      if (v57 == &v297)
        break;
      v58 = v54 + 2;
      v59 = v54[1];
      while (*v58 != *((_QWORD *)v59 + 2)
           || *((_DWORD *)v54 + 6) != (unint64_t)*((unsigned int *)v59 + 6)
           || *(float **)((char *)v54 + 28) != *(float **)(v59 + 7)
           || *((_DWORD *)v54 + 9) != (unint64_t)*((unsigned int *)v59 + 9))
      {
        if (*v58 == *(_QWORD *)(v59 + 7)
          && *((_DWORD *)v54 + 6) == (unint64_t)*((unsigned int *)v59 + 9)
          && *(float **)((char *)v54 + 28) == *((float **)v59 + 2)
          && *((_DWORD *)v54 + 9) == (unint64_t)*((unsigned int *)v59 + 6))
        {
          break;
        }
        v59 = (float *)*((_QWORD *)v59 + 1);
        if (v59 == (float *)&v297)
          goto LABEL_48;
      }
      v64 = operator new(0x48uLL);
      v65 = *(_OWORD *)v58;
      v66 = *((_OWORD *)v54 + 2);
      v67 = *((_OWORD *)v54 + 3);
      v64[8] = v54[8];
      *((_OWORD *)v64 + 2) = v66;
      *((_OWORD *)v64 + 3) = v67;
      *((_OWORD *)v64 + 1) = v65;
      v68 = v294;
      *v64 = v294;
      v64[1] = &v294;
      v68[1] = v64;
      v294 = v64;
      ++v296;
      v69 = *(float **)v59;
      *((_QWORD *)v69 + 1) = *((_QWORD *)v59 + 1);
      **((_QWORD **)v59 + 1) = v69;
      --v299;
      operator delete(v59);
      v70 = *v54;
      v71 = v54[1];
      *((_QWORD *)v70 + 1) = v71;
      *(_QWORD *)v54[1] = v70;
      --v299;
      operator delete(v54);
      v57 = *(float ***)(*(_QWORD *)v71 + 8);
LABEL_48:
      v54 = v57;
    }
    while (v57 != &v297);
  }
  v55 = 0;
  v56 = 0;
  do
  {
    *(_QWORD *)&v289 = 0;
    geo::codec::multiSectionFeaturePoints(v277, v56, &v289);
    v55 += v289;
    ++v56;
  }
  while (v269 != v56);
  v268 = v271 | v267;
  v263 = v299;
LABEL_73:
  value = v261->_extrusionFillMeshVendor.__ptr_.__value_;
  v73 = *(_QWORD *)(value[1] - 8);
  v74 = **(_QWORD **)(v73 + 64);
  v75 = *(_QWORD *)(v74 + 8);
  v76 = (*(_QWORD *)(v74 + 48) - *(_QWORD *)(v74 + 40)) / v75;
  v77 = v76 + 4 * v55;
  if (v77 < 0x10000)
  {
    v272 = value[1];
  }
  else
  {
    ggl::MeshVendor<ggl::BuildingFacade::BuildingMesh>::_allocateNewMesh((uint64_t)v261->_extrusionFillMeshVendor.__ptr_.__value_);
    v272 = value[1];
    v73 = *(_QWORD *)(v272 - 8);
    v74 = **(_QWORD **)(v73 + 64);
    v75 = *(_QWORD *)(v74 + 8);
    v76 = (*(_QWORD *)(v74 + 48) - *(_QWORD *)(v74 + 40)) / v75;
    v77 = v76 + 4 * v55;
  }
  v266 = *(_DWORD *)value;
  v78 = v75 * v77;
  v79 = *(_QWORD *)(v74 + 72);
  v80 = *(_QWORD *)(v74 + 80) - v79;
  v81 = __p;
  if (v78 != v80)
  {
    if (v78 <= v80)
    {
      if (v78 < v80)
        *(_QWORD *)(v74 + 80) = v79 + v78;
    }
    else
    {
      std::vector<unsigned char,geo::StdAllocator<unsigned char,mdm::Allocator>>::__append(v74 + 72, v78 - v80);
    }
    v82 = *(std::__shared_weak_count **)(v74 + 32);
    *(_QWORD *)(v74 + 24) = 0;
    *(_QWORD *)(v74 + 32) = 0;
    if (v82)
    {
      p_shared_owners = (unint64_t *)&v82->__shared_owners_;
      do
        v84 = __ldaxr(p_shared_owners);
      while (__stlxr(v84 - 1, p_shared_owners));
      if (!v84)
      {
        ((void (*)(std::__shared_weak_count *))v82->__on_zero_shared)(v82);
        std::__shared_weak_count::__release_weak(v82);
      }
    }
    *(_QWORD *)(v74 + 120) = 0;
    *(_DWORD *)(v74 + 112) = 0;
    v85 = *(_QWORD *)(v74 + 80) - *(_QWORD *)(v74 + 72);
    *(_QWORD *)(v74 + 40) = 0;
    *(_QWORD *)(v74 + 48) = v85;
    *(_QWORD *)(v74 + 56) = 0;
    *(_QWORD *)(v74 + 64) = v85;
    v74 = **(_QWORD **)(v73 + 64);
  }
  v86 = 0;
  v87 = 6 * v55;
  v289 = 0uLL;
  v88 = *(_QWORD *)(v74 + 8);
  v89 = v88 * v76;
  v90 = v88 * v77;
  *(_QWORD *)&v91 = 0;
  *((_QWORD *)&v91 + 1) = v74;
  if (v90 != v89)
    v86 = *(_QWORD *)(v74 + 72) + v89;
  v289 = v91;
  v290 = v89;
  v291 = v90;
  v293 = v86;
  v292 = 1;
  v92 = *(_QWORD *)(v73 + 96);
  v93 = *(_QWORD *)(v92 + 8);
  v276 = (*(_QWORD *)(v92 + 48) - *(_QWORD *)(v92 + 40)) / v93;
  v94 = v276 + v87;
  v95 = v93 * (v276 + v87);
  v96 = *(_QWORD *)(v92 + 72);
  v97 = *(_QWORD *)(v92 + 80) - v96;
  if (v95 != v97)
  {
    if (v95 <= v97)
    {
      if (v95 < v97)
        *(_QWORD *)(v92 + 80) = v96 + v95;
    }
    else
    {
      std::vector<unsigned char,geo::StdAllocator<unsigned char,mdm::Allocator>>::__append(v92 + 72, v95 - v97);
    }
    v98 = *(std::__shared_weak_count **)(v92 + 32);
    *(_QWORD *)(v92 + 24) = 0;
    *(_QWORD *)(v92 + 32) = 0;
    if (v98)
    {
      v99 = (unint64_t *)&v98->__shared_owners_;
      do
        v100 = __ldaxr(v99);
      while (__stlxr(v100 - 1, v99));
      if (!v100)
      {
        ((void (*)(std::__shared_weak_count *))v98->__on_zero_shared)(v98);
        std::__shared_weak_count::__release_weak(v98);
      }
    }
    *(_QWORD *)(v92 + 120) = 0;
    *(_DWORD *)(v92 + 112) = 0;
    v96 = *(_QWORD *)(v92 + 72);
    v101 = *(_QWORD *)(v92 + 80) - v96;
    *(_QWORD *)(v92 + 40) = 0;
    *(_QWORD *)(v92 + 48) = v101;
    *(_QWORD *)(v92 + 56) = 0;
    *(_QWORD *)(v92 + 64) = v101;
    v93 = *(_QWORD *)(v92 + 8);
    v95 = v93 * v94;
  }
  v284 = 0uLL;
  v102 = v93 * v276;
  *(_QWORD *)&v103 = 0;
  *((_QWORD *)&v103 + 1) = v92;
  v104 = v96 + v102;
  if (v95 == v102)
    v104 = 0;
  v284 = v103;
  v285 = v102;
  v286 = v95;
  v288 = v104;
  v287 = 1;
  +[VKPlatform sharedPlatform](VKPlatform, "sharedPlatform");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v105, "supports3DBuildingStrokes"))
  {
    if (!*((_BYTE *)*v259 + 33))
    {
LABEL_107:

      goto LABEL_110;
    }
    v106 = 0;
    v107 = **v259;
    while (1)
    {
      v108 = *v107;
      v107 += 2;
      if (v108 == 35)
        break;
      if (*((unsigned __int8 *)*v259 + 33) == ++v106)
        goto LABEL_107;
    }
    v109 = (**v259)[2 * v106 + 1] == 0;

    if (!v109)
    {
LABEL_110:
      v110 = v261->_extrusionStrokeMeshVendor.__ptr_.__value_;
      v111 = v110[1];
      v112 = *(_QWORD *)(v111 - 8);
      v113 = **(_QWORD **)(v112 + 64);
      v114 = *(_QWORD *)(v113 + 8);
      v115 = (*(_QWORD *)(v113 + 48) - *(_QWORD *)(v113 + 40)) / v114;
      v116 = v115 + 4 * v263;
      if (v116 >= 0x10000)
      {
        ggl::MeshVendor<ggl::PrefilteredLine::PrefilteredLineMesh>::_allocateNewMesh((uint64_t)v261->_extrusionStrokeMeshVendor.__ptr_.__value_);
        v111 = v110[1];
        v112 = *(_QWORD *)(v111 - 8);
        v113 = **(_QWORD **)(v112 + 64);
        v114 = *(_QWORD *)(v113 + 8);
        v115 = (*(_QWORD *)(v113 + 48) - *(_QWORD *)(v113 + 40)) / v114;
        v116 = v115 + 4 * v263;
      }
      v117 = 3 * v263;
      v118 = v111 - *(_DWORD *)v110;
      v119 = v114 * v116;
      v120 = *(_QWORD *)(v113 + 72);
      v121 = *(_QWORD *)(v113 + 80) - v120;
      v81 = __p;
      if (v119 != v121)
      {
        if (v119 <= v121)
        {
          if (v119 < v121)
            *(_QWORD *)(v113 + 80) = v120 + v119;
        }
        else
        {
          std::vector<unsigned char,geo::StdAllocator<unsigned char,mdm::Allocator>>::__append(v113 + 72, v119 - v121);
          v117 = 3 * v263;
        }
        v122 = *(std::__shared_weak_count **)(v113 + 32);
        *(_QWORD *)(v113 + 24) = 0;
        *(_QWORD *)(v113 + 32) = 0;
        if (v122)
        {
          v123 = (unint64_t *)&v122->__shared_owners_;
          do
            v124 = __ldaxr(v123);
          while (__stlxr(v124 - 1, v123));
          if (!v124)
          {
            v264 = v117;
            ((void (*)(std::__shared_weak_count *))v122->__on_zero_shared)(v122);
            std::__shared_weak_count::__release_weak(v122);
            v117 = v264;
          }
        }
        *(_QWORD *)(v113 + 120) = 0;
        *(_DWORD *)(v113 + 112) = 0;
        v125 = *(_QWORD *)(v113 + 80) - *(_QWORD *)(v113 + 72);
        *(_QWORD *)(v113 + 40) = 0;
        *(_QWORD *)(v113 + 48) = v125;
        *(_QWORD *)(v113 + 56) = 0;
        *(_QWORD *)(v113 + 64) = v125;
        v113 = **(_QWORD **)(v112 + 64);
      }
      v126 = 0;
      v127 = 2 * v117;
      v300 = 0uLL;
      v128 = *(_QWORD *)(v113 + 8);
      v129 = v128 * v115;
      v130 = v128 * v116;
      *(_QWORD *)&v131 = 0;
      *((_QWORD *)&v131 + 1) = v113;
      if (v130 != v129)
        v126 = *(_QWORD *)(v113 + 72) + v129;
      v132 = (v118 >> 3) - 1;
      v300 = v131;
      v301 = v129;
      v302 = v130;
      v304 = v126;
      v303 = 1;
      v133 = *(_QWORD *)(v112 + 96);
      v134 = *(_QWORD *)(v133 + 8);
      v135 = (*(_QWORD *)(v133 + 48) - *(_QWORD *)(v133 + 40)) / v134;
      v136 = v135 + v127;
      v137 = v134 * (v135 + v127);
      v138 = *(_QWORD *)(v133 + 72);
      v139 = *(_QWORD *)(v133 + 80) - v138;
      if (v137 != v139)
      {
        if (v137 <= v139)
        {
          if (v137 < v139)
            *(_QWORD *)(v133 + 80) = v138 + v137;
        }
        else
        {
          std::vector<unsigned char,geo::StdAllocator<unsigned char,mdm::Allocator>>::__append(v133 + 72, v137 - v139);
        }
        v140 = *(std::__shared_weak_count **)(v133 + 32);
        *(_QWORD *)(v133 + 24) = 0;
        *(_QWORD *)(v133 + 32) = 0;
        if (v140)
        {
          v141 = (unint64_t *)&v140->__shared_owners_;
          do
            v142 = __ldaxr(v141);
          while (__stlxr(v142 - 1, v141));
          if (!v142)
          {
            ((void (*)(std::__shared_weak_count *))v140->__on_zero_shared)(v140);
            std::__shared_weak_count::__release_weak(v140);
          }
        }
        *(_QWORD *)(v133 + 120) = 0;
        *(_DWORD *)(v133 + 112) = 0;
        v138 = *(_QWORD *)(v133 + 72);
        v143 = *(_QWORD *)(v133 + 80) - v138;
        *(_QWORD *)(v133 + 40) = 0;
        *(_QWORD *)(v133 + 48) = v143;
        *(_QWORD *)(v133 + 56) = 0;
        *(_QWORD *)(v133 + 64) = v143;
        v134 = *(_QWORD *)(v133 + 8);
        v137 = v134 * v136;
      }
      v279 = 0uLL;
      v144 = v134 * v135;
      *(_QWORD *)&v145 = 0;
      *((_QWORD *)&v145 + 1) = v133;
      v146 = v138 + v144;
      if (v137 == v144)
        v147 = 0;
      else
        v147 = v146;
      v279 = v145;
      v280 = v144;
      v281 = v137;
      v283 = v147;
      v282 = 1;
      v278[0] = v135;
      v278[1] = v136;
      v278[2] = v260;
      _addRangeToList((uint64_t)&v261->_extrusionStrokeCullingGroups, v268, v132, v278);
      v148.i32[0] = LODWORD(v261->super._boundingBox._minimum._e[0]);
      v149 = v261->super._boundingBox._minimum._e[1];
      v150 = v261->super._boundingBox._minimum._e[2];
      v151 = v261->super._boundingBox._maximum._e[0] - *(float *)v148.i32;
      v152 = v261->super._boundingBox._maximum._e[1] - v149;
      v153 = v261->super._boundingBox._maximum._e[2] - v150;
      if (v151 >= 0.0)
        v154 = 65535.0 / v151;
      else
        v154 = INFINITY;
      if (v152 >= 0.0)
        v155 = 65535.0 / v152;
      else
        v155 = INFINITY;
      if (v153 >= 0.0)
        v156 = 65535.0 / v153;
      else
        v156 = INFINITY;
      v157 = (float *)v298;
      LODWORD(v6) = v269;
      if (v298 != &v297)
      {
        v158 = (_WORD *)(v304 + 32);
        do
        {
          v159 = (int)(float)((float)(v157[4] - *(float *)v148.i32) * v154);
          v160 = (int)(float)((float)(v157[5] - v149) * v155);
          v161 = (int)(float)((float)(v157[6] - v150) * v156);
          v162 = (int)(float)((float)(v157[7] - *(float *)v148.i32) * v154);
          v163 = (int)(float)((float)(v157[8] - v149) * v155);
          v164 = (int)(float)((float)(v157[9] - v150) * v156);
          *(v158 - 16) = v159;
          *(v158 - 15) = v160;
          *((_DWORD *)v158 - 7) = (unsigned __int16)v161;
          *(v158 - 12) = v162;
          *(v158 - 11) = v163;
          *(v158 - 10) = v164;
          *(v158 - 9) = v8;
          *(v158 - 8) = v159;
          *(v158 - 7) = v160;
          *(v158 - 6) = v161;
          *(v158 - 5) = 256;
          *(v158 - 4) = v162;
          *(v158 - 3) = v163;
          *(v158 - 2) = v164;
          *(v158 - 1) = v8;
          *v158 = v159;
          v158[1] = v160;
          v158[2] = v161;
          v158[3] = 1;
          v158[4] = v162;
          v158[5] = v163;
          v158[6] = v164;
          v158[7] = v8;
          v158[8] = v159;
          v158[9] = v160;
          v158[10] = v161;
          v158[11] = 257;
          v158[12] = v162;
          v158[13] = v163;
          v158[14] = v164;
          v158[15] = v8;
          *(_WORD *)v147 = v115;
          v165 = vuzp1_s16((int16x4_t)vadd_s32(vdup_n_s32(v115), (int32x2_t)0x200000001), v148);
          *(int16x4_t *)(v147 + 2) = vzip1_s16(v165, vrev32_s16(v165));
          *(_WORD *)(v147 + 10) = v115 + 3;
          v157 = (float *)*((_QWORD *)v157 + 1);
          v147 += 12;
          v115 += 4;
          v158 += 32;
        }
        while (v157 != (float *)&v297);
        v147 = v283;
      }
      if (v147)
      {
        v166 = v280;
        v167 = v281;
        if (v281 != v280)
        {
          v168 = v279;
          v169 = v282;
          v170 = HIBYTE(v282);
          if ((_QWORD)v279 && *(_BYTE *)(*((_QWORD *)&v279 + 1) + 17) != 2)
          {
            v171 = v282;
            (*(void (**)(void))(*(_QWORD *)v279 + 64))();
            v169 = v171;
          }
          if (v169 && !v170)
          {
            v173 = *(_QWORD *)(*((_QWORD *)&v168 + 1) + 56);
            v172 = *(_QWORD *)(*((_QWORD *)&v168 + 1) + 64);
            if (v172 == v173)
              v173 = *(_QWORD *)(*((_QWORD *)&v168 + 1) + 80) - *(_QWORD *)(*((_QWORD *)&v168 + 1) + 72);
            if (v166 < v173)
              v173 = v166;
            if (v172 <= v167)
              v172 = v167;
            if (v172 == v173)
              v172 = v173 + *(_QWORD *)(*((_QWORD *)&v168 + 1) + 80) - *(_QWORD *)(*((_QWORD *)&v168 + 1) + 72);
            *(_QWORD *)(*((_QWORD *)&v168 + 1) + 56) = v173;
            *(_QWORD *)(*((_QWORD *)&v168 + 1) + 64) = v172;
          }
        }
      }
      if (v304)
      {
        v175 = v301;
        v174 = v302;
        if (v302 != v301)
        {
          v176 = (_QWORD *)*((_QWORD *)&v300 + 1);
          v177 = v303;
          v178 = HIBYTE(v303);
          if ((_QWORD)v300 && *(_BYTE *)(*((_QWORD *)&v300 + 1) + 17) != 2)
            (*(void (**)(void))(*(_QWORD *)v300 + 64))();
          if (v177 && !v178)
          {
            v180 = v176[7];
            v179 = v176[8];
            if (v179 == v180)
              v180 = v176[10] - v176[9];
            if (v175 < v180)
              v180 = v175;
            if (v179 <= v174)
              v179 = v174;
            if (v179 == v180)
              v179 = v180 + v176[10] - v176[9];
            v176[7] = v180;
            v176[8] = v179;
          }
        }
      }
    }
  }
  else
  {

  }
  if (v55)
  {
    v181 = (_WORD *)(v288 + 6);
    do
    {
      v182 = v76 + 1;
      *(v181 - 3) = v76 + 1;
      *(v181 - 2) = v76;
      *(v181 - 1) = v76 + 2;
      *v181 = v76 + 2;
      v183 = v76 + 3;
      v76 += 4;
      v181[1] = v183;
      v181[2] = v182;
      v181 += 6;
      --v55;
    }
    while (v55);
  }
  -[VKPolygonalItemGroup size](v261, "size");
  if ((_DWORD)v6)
  {
    v187 = 0;
    v188 = 0;
    v189 = 0;
    v190 = 1.0 / v184;
    v191 = 1.0 / v185;
    v273 = (((v272 - v266) >> 3) - 1);
    v192 = 1.0 / v186;
    do
    {
      v193 = geo::codec::buildingFootprintExtrusionHeight((uint64_t)v277, v187);
      v194 = geo::codec::buildingFootprintBaseHeight((uint64_t)v277, v187);
      v195 = v193 - v194;
      if ((float)(v193 - v194) < 0.0)
      {
        v279 = 0uLL;
        v196 = (std::__shared_weak_count *)v277[1];
        if (v196)
        {
          v196 = std::__shared_weak_count::lock(v196);
          v197 = v196;
          *((_QWORD *)&v279 + 1) = v196;
          if (v196)
          {
            v196 = (std::__shared_weak_count *)*v277;
            *(_QWORD *)&v279 = *v277;
          }
        }
        else
        {
          v197 = 0;
        }
        geo::codec::VectorTile::key((geo::codec::VectorTile *)v196);
        *(_QWORD *)&v300 = GEOTileKeyMake();
        *((_QWORD *)&v300 + 1) = v198;
        if (v197)
        {
          v199 = (unint64_t *)&v197->__shared_owners_;
          do
            v200 = __ldaxr(v199);
          while (__stlxr(v200 - 1, v199));
          if (!v200)
          {
            ((void (*)(std::__shared_weak_count *))v197->__on_zero_shared)(v197);
            std::__shared_weak_count::__release_weak(v197);
          }
        }
        NSLog((NSString *)CFSTR("baseHeight (%f) > height (%f) for feature in tile %d.%d.%d"), v194, v193, ((*(_QWORD *)((char *)&v300 + 1) >> 46) | (*(_DWORD *)((char *)&v300 + 9) << 18)) & 0x3FFFFFF, ((*(unsigned int *)((char *)&v300 + 9) | ((unint64_t)(*(unsigned __int16 *)((char *)&v300 + 13) | (HIBYTE(v300) << 16)) << 32)) >> 8) & 0x3FFFFFF, (*(_QWORD *)((char *)&v300 + 1) >> 40) & 0x3FLL);
        v195 = 0.0;
        v194 = v193;
      }
      *(_QWORD *)&v279 = 0;
      v201 = geo::codec::multiSectionFeaturePoints(v277, v187, &v279);
      v202 = *(_DWORD *)&v81[4 * v187];
      *(_QWORD *)&v300 = v189 + v276;
      *((_QWORD *)&v300 + 1) = v189 + v276 + 6 * v279;
      v301 = v260;
      _addRangeToList((uint64_t)&v261->_extrusionFillCullingGroups, v202, v273, &v300);
      v203 = v279;
      if ((_QWORD)v279)
      {
        v204 = 0;
        v205 = v293;
        v206 = (float *)v201 + 1;
        v207 = 16 * v188 + 59;
        do
        {
          v208 = v204 + 1;
          if (v204 + 1 == v203)
            v209 = 0;
          else
            v209 = v204 + 1;
          v210 = (float *)&v201[v209];
          v211 = *v210;
          v212 = v210[1];
          v213 = *(v206 - 1);
          v214 = *v210 - v213;
          v215 = v212 - *v206;
          v216 = sqrtf((float)(v214 * v214) + (float)(v215 * v215));
          v217 = (int)((float)(v216 * 133.33) + 0.5);
          if (v217)
            v218 = (int)(float)(v195 * 133.33) == 0;
          else
            v218 = 1;
          v219 = v218;
          v220 = 1.0 / v216;
          v221 = (int)(float)(v220 * (float)(127.0 * v215));
          v222 = (int)(float)((float)(v214 * -127.0) * v220);
          if (v195 < 0.025)
            v219 = 1;
          v223 = v219 == 0;
          if (v219)
            v224 = 0;
          else
            v224 = (int)(float)(v195 * 133.33);
          v225 = v261->super._boundingBox._minimum._e[0];
          v226 = v261->super._boundingBox._minimum._e[1];
          v227 = v261->super._boundingBox._minimum._e[2];
          v228 = (int)(float)((float)((float)(v213 - v225) * 65535.0) * v190);
          v229 = (int)(float)((float)((float)(*v206 - v226) * 65535.0) * v191);
          v230 = (int)(float)((float)((float)(v194 - v227) * 65535.0) * v192);
          v231 = v205 + v207;
          *(_WORD *)(v231 - 59) = v228;
          *(_WORD *)(v231 - 57) = v229;
          *(_DWORD *)(v231 - 55) = (unsigned __int16)v230;
          *(_BYTE *)(v231 - 51) = v221;
          *(_BYTE *)(v231 - 50) = v222;
          *(_BYTE *)(v231 - 49) = 0;
          *(_BYTE *)(v231 - 48) = v8;
          v232 = (int)(float)((float)((float)(v193 - v227) * 65535.0) * v192);
          *(_WORD *)(v231 - 43) = v228;
          *(_WORD *)(v231 - 41) = v229;
          *(_WORD *)(v231 - 39) = v232;
          *(_WORD *)(v231 - 37) = v224;
          *(_BYTE *)(v231 - 35) = v221;
          *(_BYTE *)(v231 - 34) = v222;
          *(_BYTE *)(v231 - 33) = 0;
          *(_BYTE *)(v231 - 32) = v8;
          v233 = (int)(float)((float)((float)(v211 - v225) * 65535.0) * v190);
          v234 = (int)(float)((float)((float)(v212 - v226) * 65535.0) * v191);
          v205 = v293;
          v235 = (_BYTE *)(v293 + v207);
          *(_WORD *)(v293 + v207 - 27) = v233;
          v236 = (_WORD)v217 << 8;
          if (!v223)
            v236 = 0;
          *(_WORD *)(v235 - 25) = v234;
          *(_WORD *)(v235 - 23) = v230;
          *(_WORD *)(v235 - 21) = v236;
          *(v235 - 19) = v221;
          *(v235 - 18) = v222;
          *(v235 - 17) = 0;
          *(v235 - 16) = v8;
          *(_WORD *)(v235 - 11) = v233;
          *(_WORD *)(v235 - 9) = v234;
          *(_WORD *)(v235 - 7) = v232;
          *(_WORD *)(v235 - 5) = v236 + v224;
          *(v235 - 3) = v221;
          *(v235 - 2) = v222;
          *(v235 - 1) = 0;
          *v235 = v8;
          v188 += 4;
          v189 += 6;
          v203 = v279;
          v206 += 2;
          v207 += 64;
          v204 = v208;
        }
        while (v208 < (unint64_t)v279);
      }
      ++v187;
    }
    while (v187 != v269);
  }
  if (v288)
  {
    v238 = v285;
    v237 = v286;
    if (v286 != v285)
    {
      v239 = v284;
      v240 = v287;
      v241 = HIBYTE(v287);
      if ((_QWORD)v284 && *(_BYTE *)(*((_QWORD *)&v284 + 1) + 17) != 2)
        (*(void (**)(void))(*(_QWORD *)v284 + 64))();
      if (v240 && !v241)
      {
        v243 = *(_QWORD *)(*((_QWORD *)&v239 + 1) + 56);
        v242 = *(_QWORD *)(*((_QWORD *)&v239 + 1) + 64);
        if (v242 == v243)
          v243 = *(_QWORD *)(*((_QWORD *)&v239 + 1) + 80) - *(_QWORD *)(*((_QWORD *)&v239 + 1) + 72);
        if (v238 < v243)
          v243 = v238;
        if (v242 <= v237)
          v242 = v237;
        if (v242 == v243)
          v242 = v243 + *(_QWORD *)(*((_QWORD *)&v239 + 1) + 80) - *(_QWORD *)(*((_QWORD *)&v239 + 1) + 72);
        *(_QWORD *)(*((_QWORD *)&v239 + 1) + 56) = v243;
        *(_QWORD *)(*((_QWORD *)&v239 + 1) + 64) = v242;
      }
    }
  }
  if (v293)
  {
    v245 = v290;
    v244 = v291;
    if (v291 != v290)
    {
      v246 = v289;
      v247 = v292;
      v248 = HIBYTE(v292);
      if ((_QWORD)v289 && *(_BYTE *)(*((_QWORD *)&v289 + 1) + 17) != 2)
        (*(void (**)(void))(*(_QWORD *)v289 + 64))();
      if (v247 && !v248)
      {
        v250 = *(_QWORD *)(*((_QWORD *)&v246 + 1) + 56);
        v249 = *(_QWORD *)(*((_QWORD *)&v246 + 1) + 64);
        if (v249 == v250)
          v250 = *(_QWORD *)(*((_QWORD *)&v246 + 1) + 80) - *(_QWORD *)(*((_QWORD *)&v246 + 1) + 72);
        if (v245 < v250)
          v250 = v245;
        if (v249 <= v244)
          v249 = v244;
        if (v249 == v250)
          v249 = v250 + *(_QWORD *)(*((_QWORD *)&v246 + 1) + 80) - *(_QWORD *)(*((_QWORD *)&v246 + 1) + 72);
        *(_QWORD *)(*((_QWORD *)&v246 + 1) + 56) = v250;
        *(_QWORD *)(*((_QWORD *)&v246 + 1) + 64) = v249;
      }
    }
  }
  if (v296)
  {
    v252 = v294;
    v251 = v295;
    v253 = *v295;
    *(_QWORD *)(v253 + 8) = v294[1];
    *(_QWORD *)v252[1] = v253;
    v296 = 0;
    if (v251 != &v294)
    {
      do
      {
        v254 = (_QWORD *)v251[1];
        operator delete(v251);
        v251 = v254;
      }
      while (v254 != &v294);
    }
  }
  if (v299)
  {
    v256 = v297;
    v255 = v298;
    v257 = *v298;
    *((_QWORD *)v257 + 1) = *((_QWORD *)v297 + 1);
    **((_QWORD **)v256 + 1) = v257;
    v299 = 0;
    if (v255 != &v297)
    {
      do
      {
        v258 = (float **)v255[1];
        operator delete(v255);
        v255 = v258;
      }
      while (v258 != &v297);
    }
  }
  if (__p)
    operator delete(__p);
}

- (BOOL)canConstructPointyRoofForPolygon:(void *)a3 building:(void *)a4 buildingModel:(unsigned __int8)a5 scaleThreshold:(float)a6
{
  unint64_t v6;
  unint64_t v9;
  BOOL v10;
  _QWORD *v11;
  float v12;
  BOOL v13;
  BOOL v14;
  float v17[2];
  float v18;
  uint64_t v19;
  unint64_t v20;

  v6 = *((unsigned int *)a3 + 25);
  if ((_DWORD)v6)
  {
    v9 = 0;
    v10 = 1;
    while (1)
    {
      v20 = 0;
      v11 = geo::codec::multiSectionFeaturePoints(a3, v9, &v20);
      if (v11)
      {
        if (v20 > 1)
        {
          v19 = 0;
          _computeScaleRotationTranslation((uint64_t)v11, v20, (float *)&v19, &v18, v17);
          if (*((float *)&v19 + 1) != 0.0 && *(float *)&v19 != 0.0)
          {
            v12 = *(float *)&v19 / *((float *)&v19 + 1);
            v13 = *((float *)&v19 + 1) <= a6 && *(float *)&v19 <= a6;
            v14 = !v13 || v12 < 0.5;
            if (!v14 && v12 <= 2.0)
              break;
          }
        }
      }
      v10 = ++v9 < v6;
      if (v6 == v9)
        return 0;
    }
  }
  else
  {
    return 0;
  }
  return v10;
}

- (BOOL)addPointyRoofForBuilding:(void *)a3 buildingModel:(unsigned __int8)a4 scaleThreshold:(float)a5 styleIndex:(float)a6
{
  unsigned int v8;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int *v17;
  int *v18;
  int v19;
  _BOOL4 v20;
  BOOL v21;
  unint64_t v22;
  uint64_t v23;
  int v24;
  float v25;
  float v26;
  _QWORD *v27;
  float v28;
  float v29;
  BOOL v30;
  BOOL v31;
  float v33;
  uint64_t v34;
  float v35;
  float v36;
  float v37;
  float v38;
  _QWORD *value;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  std::__shared_weak_count *v49;
  unint64_t *p_shared_owners;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  __int128 v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  unint64_t v64;
  float v65;
  std::__shared_weak_count *v66;
  unint64_t *v67;
  unint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  __int128 v72;
  uint64_t v73;
  uint64_t v74;
  float v75;
  float v76;
  float v77;
  float v78;
  float v79;
  float v80;
  float v81;
  float v82;
  float v83;
  int16x4_t v84;
  __float2 v85;
  float v86;
  float *v87;
  _WORD *v88;
  float v89;
  float v90;
  float v91;
  float v92;
  float v93;
  int v94;
  int v95;
  int v96;
  int v97;
  int v98;
  int16x4_t v99;
  float v100;
  float v101;
  float v102;
  float v103;
  float v104;
  float v105;
  __int16 v106;
  unint64_t v107;
  unint64_t v108;
  __int128 v109;
  int v110;
  int v111;
  unint64_t v112;
  unint64_t v113;
  unint64_t v114;
  unint64_t v115;
  __int128 v116;
  int v117;
  int v118;
  unint64_t v119;
  unint64_t v120;
  _BOOL4 v122;
  float v123;
  VKBuildingGroup *v124;
  uint64_t *v125;
  float v126;
  float v127;
  float v128;
  float v129;
  float v130;
  float v131;
  uint64_t v132;
  uint64_t *v133;
  unint64_t v134;
  uint64_t v135;
  _QWORD *v136;
  _QWORD *v137;
  float v138;
  Box<float, 3> *p_boundingBox;
  uint64_t *v140;
  uint64_t v141;
  float v142;
  float v143[2];
  float v144;
  uint64_t v145;
  unint64_t v146;
  _QWORD v147[3];
  __int128 v148;
  unint64_t v149;
  unint64_t v150;
  __int16 v151;
  uint64_t v152;
  __int128 v153;
  unint64_t v154;
  unint64_t v155;
  __int16 v156;
  uint64_t v157;
  float v158[8];
  uint64_t v159;

  v8 = a4;
  v159 = *MEMORY[0x1E0C80C00];
  v11 = *((unsigned int *)a3 + 25);
  v12 = *((_QWORD *)a3 + 5);
  +[VKPlatform sharedPlatform](VKPlatform, "sharedPlatform");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "supports3DBuildingStrokes"))
  {
    v14 = *((_QWORD *)a3 + 3);
    v15 = *(unsigned __int8 *)(v14 + 33);
    if (*(_BYTE *)(v14 + 33))
    {
      v16 = 0;
      v17 = *(int **)v14;
      v18 = v17;
      while (1)
      {
        v19 = *v18;
        v18 += 2;
        if (v19 == 35)
          break;
        if (v15 == ++v16)
          goto LABEL_6;
      }
      v20 = v17[2 * v16 + 1] != 0;
    }
    else
    {
LABEL_6:
      v20 = 1;
    }
  }
  else
  {
    v20 = 0;
  }

  v21 = 0;
  if ((_DWORD)v11)
  {
    v22 = 0;
    v23 = 32 * v8;
    v137 = (_QWORD *)((char *)&g_gglBaseRanges + v23);
    v24 = (int)a6;
    v136 = (_QWORD *)((char *)&g_gglRoofRanges + v23);
    v125 = (uint64_t *)((char *)&g_gglEdgeRanges + 16 * v8);
    v133 = v125 + 1;
    p_boundingBox = &self->super._boundingBox;
    v140 = &g_gglBuildingBoundingBoxes[3 * v8];
    v25 = 2.0;
    v26 = 0.5;
    v123 = a5;
    v124 = self;
    v135 = v12;
    v122 = v20;
    do
    {
      v146 = 0;
      v27 = geo::codec::multiSectionFeaturePoints(a3, v22, &v146);
      if (v27)
      {
        if (v146 >= 2)
        {
          v145 = 0;
          v144 = 0.0;
          _computeScaleRotationTranslation((uint64_t)v27, v146, (float *)&v145, &v144, v143);
          v28 = *((float *)&v145 + 1);
          if (*((float *)&v145 + 1) != 0.0)
          {
            v29 = *(float *)&v145;
            if (*(float *)&v145 != 0.0)
            {
              v30 = (float)(*(float *)&v145 / *((float *)&v145 + 1)) > v25
                 || (float)(*(float *)&v145 / *((float *)&v145 + 1)) < v26;
              v31 = !v30 && *(float *)&v145 <= a5;
              if (v31 && *((float *)&v145 + 1) <= a5)
              {
                v141 = v145;
                v138 = fminf(*(float *)&v145, *((float *)&v145 + 1));
                v142 = v138;
                v33 = v144;
                _transformAndAddMesh((uint64_t)&g_gglBaseVertices + 28 * *v137, 40, (int16x8_t *)((char *)&g_gglBaseIndices + 2 * v137[2]), 0x3CuLL, (float *)v140, (uint64_t)self->_pointyRoofFillMeshVendor.__ptr_.__value_, (uint64_t)&self->_pointyRoofFillCullingGroups, v24, v144, v12, (float *)&v141, v143, p_boundingBox->_minimum._e);
                _transformAndAddMesh((uint64_t)&g_gglRoofVertices + 28 * *v136, v136[1], (int16x8_t *)((char *)&g_gglRoofIndices + 2 * v136[2]), v136[3], (float *)v140, (uint64_t)self->_pointyRoofFillMeshVendor.__ptr_.__value_, (uint64_t)&self->_pointyRoofFillCullingGroups, v24, v33, v12, (float *)&v141, v143, p_boundingBox->_minimum._e);
                if (v20)
                {
                  v34 = *v133;
                  if (*v133)
                  {
                    v35 = *(float *)v140;
                    v36 = *((float *)v140 + 1);
                    v38 = *((float *)v140 + 3);
                    v37 = *((float *)v140 + 4);
                    value = self->_pointyRoofStrokeMeshVendor.__ptr_.__value_;
                    v132 = *v125;
                    v40 = *(_QWORD *)(value[1] - 8);
                    v41 = **(_QWORD **)(v40 + 64);
                    v42 = *(_QWORD *)(v41 + 8);
                    v43 = (*(_QWORD *)(v41 + 48) - *(_QWORD *)(v41 + 40)) / v42;
                    v44 = v43 + 4 * v34;
                    if (v44 >= 0x10000)
                    {
                      ggl::MeshVendor<ggl::PrefilteredLine::PrefilteredLineMesh>::_allocateNewMesh((uint64_t)value);
                      v40 = *(_QWORD *)(value[1] - 8);
                      v41 = **(_QWORD **)(v40 + 64);
                      v42 = *(_QWORD *)(v41 + 8);
                      v43 = (*(_QWORD *)(v41 + 48) - *(_QWORD *)(v41 + 40)) / v42;
                      v44 = v43 + 4 * v34;
                    }
                    v45 = v42 * v44;
                    v46 = *(_QWORD *)(v41 + 72);
                    v47 = *(_QWORD *)(v41 + 80) - v46;
                    if (v45 != v47)
                    {
                      if (v45 <= v47)
                      {
                        if (v45 < v47)
                          *(_QWORD *)(v41 + 80) = v46 + v45;
                      }
                      else
                      {
                        v48 = v40;
                        std::vector<unsigned char,geo::StdAllocator<unsigned char,mdm::Allocator>>::__append(v41 + 72, v45 - v47);
                        v40 = v48;
                      }
                      v49 = *(std::__shared_weak_count **)(v41 + 32);
                      *(_QWORD *)(v41 + 24) = 0;
                      *(_QWORD *)(v41 + 32) = 0;
                      if (v49)
                      {
                        p_shared_owners = (unint64_t *)&v49->__shared_owners_;
                        do
                          v51 = __ldaxr(p_shared_owners);
                        while (__stlxr(v51 - 1, p_shared_owners));
                        if (!v51)
                        {
                          v52 = v40;
                          ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
                          std::__shared_weak_count::__release_weak(v49);
                          v40 = v52;
                        }
                      }
                      *(_QWORD *)(v41 + 120) = 0;
                      *(_DWORD *)(v41 + 112) = 0;
                      v53 = *(_QWORD *)(v41 + 80) - *(_QWORD *)(v41 + 72);
                      *(_QWORD *)(v41 + 40) = 0;
                      *(_QWORD *)(v41 + 48) = v53;
                      *(_QWORD *)(v41 + 56) = 0;
                      *(_QWORD *)(v41 + 64) = v53;
                      v41 = **(_QWORD **)(v40 + 64);
                    }
                    v54 = 0;
                    v153 = 0uLL;
                    v55 = *(_QWORD *)(v41 + 8);
                    v56 = v55 * v43;
                    v57 = v55 * v44;
                    if (v57 != v56)
                      v54 = *(_QWORD *)(v41 + 72) + v56;
                    *(_QWORD *)&v58 = 0;
                    *((_QWORD *)&v58 + 1) = v41;
                    v153 = v58;
                    v154 = v56;
                    v155 = v57;
                    v157 = v54;
                    v156 = 1;
                    v59 = *(_QWORD *)(v40 + 96);
                    v60 = *(_QWORD *)(v59 + 8);
                    v61 = (*(_QWORD *)(v59 + 48) - *(_QWORD *)(v59 + 40)) / v60;
                    v134 = v61 + 6 * v34;
                    v62 = v60 * v134;
                    v63 = *(_QWORD *)(v59 + 72);
                    v64 = *(_QWORD *)(v59 + 80) - v63;
                    self = v124;
                    v130 = v38;
                    v131 = v37;
                    v128 = v36;
                    v129 = v35;
                    if (v60 * v134 == v64)
                    {
                      v65 = v33;
                    }
                    else
                    {
                      if (v60 * v134 <= v64)
                      {
                        if (v62 < v64)
                          *(_QWORD *)(v59 + 80) = v63 + v62;
                      }
                      else
                      {
                        std::vector<unsigned char,geo::StdAllocator<unsigned char,mdm::Allocator>>::__append(v59 + 72, v60 * v134 - v64);
                      }
                      v66 = *(std::__shared_weak_count **)(v59 + 32);
                      *(_QWORD *)(v59 + 24) = 0;
                      *(_QWORD *)(v59 + 32) = 0;
                      if (v66)
                      {
                        v67 = (unint64_t *)&v66->__shared_owners_;
                        do
                          v68 = __ldaxr(v67);
                        while (__stlxr(v68 - 1, v67));
                        if (!v68)
                        {
                          ((void (*)(std::__shared_weak_count *))v66->__on_zero_shared)(v66);
                          std::__shared_weak_count::__release_weak(v66);
                        }
                      }
                      v65 = v33;
                      *(_QWORD *)(v59 + 120) = 0;
                      *(_DWORD *)(v59 + 112) = 0;
                      v63 = *(_QWORD *)(v59 + 72);
                      v69 = *(_QWORD *)(v59 + 80) - v63;
                      *(_QWORD *)(v59 + 40) = 0;
                      *(_QWORD *)(v59 + 48) = v69;
                      *(_QWORD *)(v59 + 56) = 0;
                      *(_QWORD *)(v59 + 64) = v69;
                      v60 = *(_QWORD *)(v59 + 8);
                      v62 = v60 * v134;
                    }
                    v148 = 0uLL;
                    v70 = v61;
                    v71 = v60 * v61;
                    *(_QWORD *)&v72 = 0;
                    *((_QWORD *)&v72 + 1) = v59;
                    v73 = v63 + v71;
                    if (v62 == v71)
                      v74 = 0;
                    else
                      v74 = v73;
                    v148 = v72;
                    v149 = v71;
                    v150 = v62;
                    v152 = v74;
                    v151 = 1;
                    v75 = v143[0];
                    v76 = v124->super._boundingBox._minimum._e[0];
                    v77 = v124->super._boundingBox._minimum._e[2];
                    v78 = v124->super._boundingBox._maximum._e[0] - v76;
                    v126 = v124->super._boundingBox._minimum._e[1];
                    v127 = v143[1];
                    v79 = v124->super._boundingBox._maximum._e[1] - v126;
                    v80 = v124->super._boundingBox._maximum._e[2] - v77;
                    if (v78 >= 0.0)
                      v81 = 65535.0 / v78;
                    else
                      v81 = INFINITY;
                    if (v79 >= 0.0)
                      v82 = 65535.0 / v79;
                    else
                      v82 = INFINITY;
                    if (v80 >= 0.0)
                      v83 = 65535.0 / v80;
                    else
                      v83 = INFINITY;
                    v85 = __sincosf_stret(v65);
                    *(float *)v84.i32 = v85.__sinval;
                    v86 = v127 - v126;
                    v87 = (float *)((char *)&g_gglEdges + 24 * v132 + 12);
                    v88 = (_WORD *)(v157 + 32);
                    do
                    {
                      v89 = *(v87 - 3) * v29;
                      v90 = *(v87 - 2) * v28;
                      v91 = *v87 * v29;
                      v92 = v87[1] * v28;
                      v93 = (float)((float)(v75 + (float)(v89 * v85.__cosval))
                                  - (float)(v76 + (float)(v90 * v85.__sinval)))
                          * v81;
                      v94 = (int)(float)((float)((float)(v86 + (float)(v89 * v85.__sinval)) + (float)(v90 * v85.__cosval))
                                       * v82);
                      v95 = (int)(float)((float)-(float)(v77 - (float)(*(v87 - 1) * v138)) * v83);
                      v96 = (int)(float)((float)((float)(v75 + (float)(v91 * v85.__cosval))
                                               - (float)(v76 + (float)(v92 * v85.__sinval)))
                                       * v81);
                      v97 = (int)(float)((float)((float)(v86 + (float)(v91 * v85.__sinval)) + (float)(v92 * v85.__cosval))
                                       * v82);
                      v98 = (int)(float)((float)-(float)(v77 - (float)(v87[2] * v138)) * v83);
                      *(v88 - 16) = (int)v93;
                      *(v88 - 15) = v94;
                      *((_DWORD *)v88 - 7) = (unsigned __int16)v95;
                      *(v88 - 12) = v96;
                      *(v88 - 11) = v97;
                      *(v88 - 10) = v98;
                      *(v88 - 9) = v24;
                      *(v88 - 8) = (int)v93;
                      *(v88 - 7) = v94;
                      *(v88 - 6) = v95;
                      *(v88 - 5) = 256;
                      *(v88 - 4) = v96;
                      *(v88 - 3) = v97;
                      *(v88 - 2) = v98;
                      *(v88 - 1) = v24;
                      *v88 = (int)v93;
                      v88[1] = v94;
                      v88[2] = v95;
                      v88[3] = 1;
                      v88[4] = v96;
                      v88[5] = v97;
                      v88[6] = v98;
                      v88[7] = v24;
                      v88[8] = (int)v93;
                      v88[9] = v94;
                      v88[10] = v95;
                      v88[11] = 257;
                      v88[12] = v96;
                      v88[13] = v97;
                      v88[14] = v98;
                      v88[15] = v24;
                      *(_WORD *)v74 = v43;
                      v99 = vuzp1_s16((int16x4_t)vadd_s32(vdup_n_s32(v43), (int32x2_t)0x200000001), v84);
                      v87 += 6;
                      *(int16x4_t *)(v74 + 2) = vzip1_s16(v99, vrev32_s16(v99));
                      *(_WORD *)(v74 + 10) = v43 + 3;
                      v74 += 12;
                      v43 += 4;
                      v88 += 32;
                      --v34;
                    }
                    while (v34);
                    v100 = (float)(v128 * v28) * v85.__cosval;
                    v101 = v75 + (float)((float)(v129 * v29) * v85.__cosval);
                    v102 = v127 + (float)((float)(v129 * v29) * v85.__sinval);
                    v103 = v75 + (float)((float)(v130 * v29) * v85.__cosval);
                    v104 = v127 + (float)((float)(v130 * v29) * v85.__sinval);
                    v105 = (float)(v131 * v28) * v85.__cosval;
                    v158[0] = v101 - (float)(v85.__sinval * (float)(v128 * v28));
                    v158[1] = v102 + v100;
                    v158[2] = v103 - (float)(v85.__sinval * (float)(v128 * v28));
                    v158[3] = v104 + v100;
                    v158[4] = v103 - (float)(v85.__sinval * (float)(v131 * v28));
                    v158[5] = v104 + v105;
                    v158[6] = v101 - (float)(v85.__sinval * (float)(v131 * v28));
                    v158[7] = v102 + v105;
                    v106 = ggl::CullingGrid::intersectedCellsForRibbon(4uLL, v158, 1);
                    v147[0] = v70;
                    v147[1] = v134;
                    v147[2] = v135;
                    _addRangeToList((uint64_t)&v124->_pointyRoofStrokeCullingGroups, v106, 0, v147);
                    a5 = v123;
                    v25 = 2.0;
                    v26 = 0.5;
                    if (v152)
                    {
                      v108 = v149;
                      v107 = v150;
                      if (v150 != v149)
                      {
                        v109 = v148;
                        v110 = v151;
                        v111 = HIBYTE(v151);
                        if ((_QWORD)v148 && *(_BYTE *)(*((_QWORD *)&v148 + 1) + 17) != 2)
                          (*(void (**)(void))(*(_QWORD *)v148 + 64))();
                        if (v110 && !v111)
                        {
                          v112 = *(_QWORD *)(*((_QWORD *)&v109 + 1) + 56);
                          v113 = *(_QWORD *)(*((_QWORD *)&v109 + 1) + 64);
                          if (v113 == v112)
                            v112 = *(_QWORD *)(*((_QWORD *)&v109 + 1) + 80)
                                 - *(_QWORD *)(*((_QWORD *)&v109 + 1) + 72);
                          if (v108 < v112)
                            v112 = v108;
                          if (v113 <= v107)
                            v113 = v107;
                          if (v113 == v112)
                            v113 = v112
                                 + *(_QWORD *)(*((_QWORD *)&v109 + 1) + 80)
                                 - *(_QWORD *)(*((_QWORD *)&v109 + 1) + 72);
                          *(_QWORD *)(*((_QWORD *)&v109 + 1) + 56) = v112;
                          *(_QWORD *)(*((_QWORD *)&v109 + 1) + 64) = v113;
                        }
                      }
                    }
                    if (v157)
                    {
                      v115 = v154;
                      v114 = v155;
                      if (v155 != v154)
                      {
                        v116 = v153;
                        v117 = v156;
                        v118 = HIBYTE(v156);
                        if ((_QWORD)v153 && *(_BYTE *)(*((_QWORD *)&v153 + 1) + 17) != 2)
                          (*(void (**)(void))(*(_QWORD *)v153 + 64))();
                        if (v117 && !v118)
                        {
                          v119 = *(_QWORD *)(*((_QWORD *)&v116 + 1) + 56);
                          v120 = *(_QWORD *)(*((_QWORD *)&v116 + 1) + 64);
                          if (v120 == v119)
                            v119 = *(_QWORD *)(*((_QWORD *)&v116 + 1) + 80)
                                 - *(_QWORD *)(*((_QWORD *)&v116 + 1) + 72);
                          if (v115 < v119)
                            v119 = v115;
                          if (v120 <= v114)
                            v120 = v114;
                          if (v120 == v119)
                            v120 = v119
                                 + *(_QWORD *)(*((_QWORD *)&v116 + 1) + 80)
                                 - *(_QWORD *)(*((_QWORD *)&v116 + 1) + 72);
                          *(_QWORD *)(*((_QWORD *)&v116 + 1) + 56) = v119;
                          *(_QWORD *)(*((_QWORD *)&v116 + 1) + 64) = v120;
                        }
                      }
                    }
                    v12 = v135;
                    v20 = v122;
                  }
                }
                v21 = 1;
              }
            }
          }
        }
      }
      ++v22;
    }
    while (v22 != v11);
  }
  return v21;
}

- (void)updateWithStyleManager:(const void *)a3
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  vector<std::shared_ptr<gss::StylesheetQuery<gss::PropertyID>>, std::allocator<std::shared_ptr<gss::StylesheetQuery<gss::PropertyID>>>> *p_styleQueries;
  char *begin;
  char *i;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  uint64_t v14;
  vector<std::shared_ptr<gss::StylesheetQuery<gss::PropertyID>>, std::allocator<std::shared_ptr<gss::StylesheetQuery<gss::PropertyID>>>> *p_flatRoofStyleQueries;
  char *v16;
  char *j;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  unint64_t v21;
  vector<std::shared_ptr<gss::StylesheetQuery<gss::PropertyID>>, std::allocator<std::shared_ptr<gss::StylesheetQuery<gss::PropertyID>>>> *p_selectedStyleQueries;
  char *v23;
  char *k;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  vector<std::shared_ptr<gss::StylesheetQuery<gss::PropertyID>>, std::allocator<std::shared_ptr<gss::StylesheetQuery<gss::PropertyID>>>> *p_selectedFlatRoofStyleQueries;
  char *v29;
  char *m;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  gss::Allocator *v37;
  uint64_t v38;
  _OWORD *end;
  char *v40;
  std::__shared_weak_count *v41;
  unint64_t *v42;
  unint64_t v43;
  char *v44;
  _OWORD *v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  gss::Allocator *v51;
  uint64_t v52;
  _OWORD *v53;
  char *v54;
  std::__shared_weak_count *v55;
  unint64_t *v56;
  unint64_t v57;
  char *v58;
  _OWORD *v59;
  uint64_t v60;
  std::__shared_weak_count *v61;
  unint64_t *v62;
  unint64_t v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  char *v67;
  uint64_t v68;
  __int128 v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD v72[3];
  uint64_t v73;
  _BYTE v74[15];
  char v75;

  v5 = -[VKPolygonalItemGroup attributeSets](self, "attributeSets");
  v7 = v5[3];
  v6 = v5[4];
  p_styleQueries = &self->_styleQueries;
  begin = (char *)self->_styleQueries.__begin_;
  for (i = (char *)self->_styleQueries.__end_; i != begin; i -= 16)
  {
    v11 = (std::__shared_weak_count *)*((_QWORD *)i - 1);
    if (v11)
    {
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      do
        v13 = __ldaxr(p_shared_owners);
      while (__stlxr(v13 - 1, p_shared_owners));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
  }
  v14 = v6 - v7;
  self->_styleQueries.__end_ = begin;
  p_flatRoofStyleQueries = &self->_flatRoofStyleQueries;
  v16 = (char *)self->_flatRoofStyleQueries.__begin_;
  for (j = (char *)self->_flatRoofStyleQueries.__end_; j != v16; j -= 16)
  {
    v18 = (std::__shared_weak_count *)*((_QWORD *)j - 1);
    if (v18)
    {
      v19 = (unint64_t *)&v18->__shared_owners_;
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
  }
  v21 = v14 >> 4;
  self->_flatRoofStyleQueries.__end_ = v16;
  p_selectedStyleQueries = &self->_selectedStyleQueries;
  v23 = (char *)self->_selectedStyleQueries.__begin_;
  for (k = (char *)self->_selectedStyleQueries.__end_; k != v23; k -= 16)
  {
    v25 = (std::__shared_weak_count *)*((_QWORD *)k - 1);
    if (v25)
    {
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
  self->_selectedStyleQueries.__end_ = v23;
  p_selectedFlatRoofStyleQueries = &self->_selectedFlatRoofStyleQueries;
  v29 = (char *)p_selectedFlatRoofStyleQueries->__begin_;
  for (m = (char *)p_selectedFlatRoofStyleQueries->__end_; m != v29; m -= 16)
  {
    v31 = (std::__shared_weak_count *)*((_QWORD *)m - 1);
    if (v31)
    {
      v32 = (unint64_t *)&v31->__shared_owners_;
      do
        v33 = __ldaxr(v32);
      while (__stlxr(v33 - 1, v32));
      if (!v33)
      {
        ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
        std::__shared_weak_count::__release_weak(v31);
      }
    }
  }
  p_selectedFlatRoofStyleQueries->__end_ = v29;
  std::vector<std::shared_ptr<md::GEOVectorTileResource>>::reserve((uint64_t)p_styleQueries, v21);
  std::vector<std::shared_ptr<md::GEOVectorTileResource>>::reserve((uint64_t)p_flatRoofStyleQueries, v21);
  std::vector<std::shared_ptr<md::GEOVectorTileResource>>::reserve((uint64_t)p_selectedStyleQueries, v21);
  std::vector<std::shared_ptr<md::GEOVectorTileResource>>::reserve((uint64_t)p_selectedFlatRoofStyleQueries, v21);
  v34 = v5[3];
  if (v5[4] != v34)
  {
    v35 = 0;
    while (1)
    {
      memset(v74, 0, sizeof(v74));
      v75 = 1;
      *(_WORD *)geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::operator[](v74, 0x10002u) = 1;
      md::createFeatureAttributeSet((gss::Allocator *)v72, (uint64_t *)(v34 + 16 * v35));
      v36 = *(_QWORD *)a3;
      *(_QWORD *)((char *)&v69 + 7) = 0;
      *(_QWORD *)&v69 = 0;
      HIBYTE(v69) = 1;
      gss::StylesheetManager<gss::PropertyID>::styleQueryForFeatureAttributes((unint64_t *)&v66, v36, (gss::FeatureAttributeSet *)v72, (gss::QueryOverrides *)&v69);
      if (!BYTE14(v69) && (_QWORD)v69)
      {
        v38 = gss::Allocator::instance(v37);
        (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v38 + 40))(v38, v69, WORD6(v69));
      }
      end = p_styleQueries->__end_;
      if (end >= p_styleQueries->__end_cap_.__value_)
      {
        v40 = std::vector<std::shared_ptr<gdc::LayerDataRequest>>::__push_back_slow_path<std::shared_ptr<gdc::LayerDataRequest>>((char **)p_styleQueries, (uint64_t)&v66);
        v41 = (std::__shared_weak_count *)*((_QWORD *)&v66 + 1);
        p_styleQueries->__end_ = v40;
        if (v41)
        {
          v42 = (unint64_t *)&v41->__shared_owners_;
          do
            v43 = __ldaxr(v42);
          while (__stlxr(v43 - 1, v42));
          if (!v43)
          {
            ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
            std::__shared_weak_count::__release_weak(v41);
          }
        }
      }
      else
      {
        *end = v66;
        p_styleQueries->__end_ = end + 1;
      }
      gss::StylesheetManager<gss::PropertyID>::styleQueryForFeatureAttributes((unint64_t *)&v69, *(_QWORD *)a3, (gss::FeatureAttributeSet *)v72, (gss::QueryOverrides *)v74);
      v45 = p_selectedStyleQueries->__end_;
      if (v45 >= p_selectedStyleQueries->__end_cap_.__value_)
      {
        v44 = std::vector<std::shared_ptr<gdc::LayerDataRequest>>::__push_back_slow_path<std::shared_ptr<gdc::LayerDataRequest>>((char **)p_selectedStyleQueries, (uint64_t)&v69);
        v46 = (std::__shared_weak_count *)*((_QWORD *)&v69 + 1);
        p_selectedStyleQueries->__end_ = v44;
        if (v46)
        {
          v47 = (unint64_t *)&v46->__shared_owners_;
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
      else
      {
        *v45 = v69;
        p_selectedStyleQueries->__end_ = v45 + 1;
      }
      v66 = 0uLL;
      v67 = 0;
      v68 = gss::Allocator::instance((gss::Allocator *)v44);
      v49 = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v68 + 16))(v68, 8, 4);
      *(_QWORD *)&v66 = v49;
      v67 = (char *)(v49 + 1);
      if (v49)
        *v49 = 0x100000013;
      *((_QWORD *)&v66 + 1) = v49 + 1;
      gss::FeatureAttributeSet::setByReplacingAttributes((gss::Allocator *)v72, (unsigned int **)&v66, (uint64_t *)&v69);
      if ((_QWORD)v66)
      {
        *((_QWORD *)&v66 + 1) = v66;
        (*(void (**)(uint64_t, _QWORD, char *))(*(_QWORD *)v68 + 40))(v68, v66, &v67[-v66]);
      }
      v50 = *(_QWORD *)a3;
      *(_QWORD *)((char *)&v66 + 7) = 0;
      *(_QWORD *)&v66 = 0;
      HIBYTE(v66) = 1;
      gss::StylesheetManager<gss::PropertyID>::styleQueryForFeatureAttributes((unint64_t *)&v65, v50, (gss::FeatureAttributeSet *)&v69, (gss::QueryOverrides *)&v66);
      if (!BYTE14(v66) && (_QWORD)v66)
      {
        v52 = gss::Allocator::instance(v51);
        (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v52 + 40))(v52, v66, WORD6(v66));
      }
      v53 = p_flatRoofStyleQueries->__end_;
      if (v53 >= p_flatRoofStyleQueries->__end_cap_.__value_)
      {
        v54 = std::vector<std::shared_ptr<gdc::LayerDataRequest>>::__push_back_slow_path<std::shared_ptr<gdc::LayerDataRequest>>((char **)p_flatRoofStyleQueries, (uint64_t)&v65);
        v55 = (std::__shared_weak_count *)*((_QWORD *)&v65 + 1);
        p_flatRoofStyleQueries->__end_ = v54;
        if (v55)
        {
          v56 = (unint64_t *)&v55->__shared_owners_;
          do
            v57 = __ldaxr(v56);
          while (__stlxr(v57 - 1, v56));
          if (!v57)
          {
            ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
            std::__shared_weak_count::__release_weak(v55);
          }
        }
      }
      else
      {
        *v53 = v65;
        p_flatRoofStyleQueries->__end_ = v53 + 1;
      }
      gss::StylesheetManager<gss::PropertyID>::styleQueryForFeatureAttributes((unint64_t *)&v66, *(_QWORD *)a3, (gss::FeatureAttributeSet *)&v69, (gss::QueryOverrides *)v74);
      v59 = p_selectedFlatRoofStyleQueries->__end_;
      if (v59 < p_selectedFlatRoofStyleQueries->__end_cap_.__value_)
        break;
      v58 = std::vector<std::shared_ptr<gdc::LayerDataRequest>>::__push_back_slow_path<std::shared_ptr<gdc::LayerDataRequest>>((char **)p_selectedFlatRoofStyleQueries, (uint64_t)&v66);
      v61 = (std::__shared_weak_count *)*((_QWORD *)&v66 + 1);
      p_selectedFlatRoofStyleQueries->__end_ = v58;
      if (v61)
      {
        v62 = (unint64_t *)&v61->__shared_owners_;
        do
          v63 = __ldaxr(v62);
        while (__stlxr(v63 - 1, v62));
        if (!v63)
        {
          ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
          std::__shared_weak_count::__release_weak(v61);
          v60 = v69;
          if (!(_QWORD)v69)
            goto LABEL_76;
LABEL_75:
          *((_QWORD *)&v69 + 1) = v60;
          v58 = (char *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v71 + 40))(v71, v60, v70 - v60);
          goto LABEL_76;
        }
      }
      v60 = v69;
      if ((_QWORD)v69)
        goto LABEL_75;
LABEL_76:
      if (v72[0])
      {
        v72[1] = v72[0];
        v58 = (char *)(*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v73 + 40))(v73, v72[0], v72[2] - v72[0]);
      }
      if (!v74[14] && *(_QWORD *)v74)
      {
        v64 = gss::Allocator::instance((gss::Allocator *)v58);
        (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v64 + 40))(v64, *(_QWORD *)v74, *(unsigned __int16 *)&v74[12]);
      }
      ++v35;
      v34 = v5[3];
      if (v35 >= (v5[4] - v34) >> 4)
        return;
    }
    *v59 = v66;
    p_selectedFlatRoofStyleQueries->__end_ = v59 + 1;
    v60 = v69;
    if (!(_QWORD)v69)
      goto LABEL_76;
    goto LABEL_75;
  }
}

- (void).cxx_destruct
{
  vector<std::shared_ptr<gss::StylesheetQuery<gss::PropertyID>>, std::allocator<std::shared_ptr<gss::StylesheetQuery<gss::PropertyID>>>> *p_selectedFlatRoofStyleQueries;
  char *begin;
  char *end;
  void *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  char *v10;
  char *v11;
  void *v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  char *v16;
  char *v17;
  void *v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  char *v22;
  char *v23;
  void *v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  vector<std::shared_ptr<gss::StylesheetQuery<gss::PropertyID>>, std::allocator<std::shared_ptr<gss::StylesheetQuery<gss::PropertyID>>>> *p_styleQueries;
  VKBuildingGroup *v29;
  Class isa;
  objc_class *v31;
  objc_class *v32;
  objc_class *v33;
  objc_class *v34;
  void *v35;
  void *v36;
  array<std::vector<std::vector<FeatureRange>>, 16UL> *p_pointyRoofStrokeCullingGroups;
  VKBuildingGroup *v38;
  Class v39;
  objc_class *v40;
  objc_class *v41;
  objc_class *v42;
  objc_class *v43;
  void *v44;
  void *v45;
  array<std::vector<std::vector<FeatureRange>>, 16UL> *p_pointyRoofFillCullingGroups;
  VKBuildingGroup *v47;
  Class v48;
  objc_class *v49;
  objc_class *v50;
  objc_class *v51;
  objc_class *v52;
  void *v53;
  void *v54;
  array<std::vector<std::vector<FeatureRange>>, 16UL> *p_fillCullingGroupsForPointyRoofs;
  VKBuildingGroup *v56;
  Class v57;
  objc_class *v58;
  objc_class *v59;
  objc_class *v60;
  objc_class *v61;
  void *v62;
  void *v63;
  array<std::vector<std::vector<FeatureRange>>, 16UL> *p_extrusionStrokeCullingGroups;
  VKBuildingGroup *v65;
  Class v66;
  objc_class *v67;
  objc_class *v68;
  objc_class *v69;
  objc_class *v70;
  void *v71;
  void *v72;
  _QWORD *value;
  _QWORD *v74;
  _QWORD *v75;
  _QWORD *v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD *v79;
  _QWORD *v80;
  _QWORD *v81;
  _QWORD *v82;
  uint64_t v83;
  uint64_t v84;
  _QWORD *v85;
  _QWORD *v86;
  _QWORD *v87;
  _QWORD *v88;
  uint64_t v89;
  uint64_t v90;
  _QWORD *v91;
  _QWORD *v92;
  _QWORD *v93;
  _QWORD *v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  char *v98;
  void *v99;
  std::__shared_weak_count *v100;
  unint64_t *v101;
  unint64_t v102;
  char *v103;
  char *v104;
  void *v105;
  std::__shared_weak_count *v106;
  unint64_t *v107;
  unint64_t v108;
  optional<md::MeshSet<ggl::BuildingFlatStroke::BuildingFlatStrokeMesh, ggl::BuildingFlatStroke::DefaultVbo>> *p_strokeMeshInfo;

  p_selectedFlatRoofStyleQueries = &self->_selectedFlatRoofStyleQueries;
  begin = (char *)self->_selectedFlatRoofStyleQueries.__begin_;
  if (begin)
  {
    end = (char *)self->_selectedFlatRoofStyleQueries.__end_;
    v6 = self->_selectedFlatRoofStyleQueries.__begin_;
    if (end != begin)
    {
      do
      {
        v7 = (std::__shared_weak_count *)*((_QWORD *)end - 1);
        if (v7)
        {
          p_shared_owners = (unint64_t *)&v7->__shared_owners_;
          do
            v9 = __ldaxr(p_shared_owners);
          while (__stlxr(v9 - 1, p_shared_owners));
          if (!v9)
          {
            ((void (*)(std::__shared_weak_count *, SEL))v7->__on_zero_shared)(v7, a2);
            std::__shared_weak_count::__release_weak(v7);
          }
        }
        end -= 16;
      }
      while (end != begin);
      v6 = p_selectedFlatRoofStyleQueries->__begin_;
    }
    p_selectedFlatRoofStyleQueries->__end_ = begin;
    operator delete(v6);
  }
  v10 = (char *)self->_selectedStyleQueries.__begin_;
  if (v10)
  {
    v11 = (char *)self->_selectedStyleQueries.__end_;
    v12 = self->_selectedStyleQueries.__begin_;
    if (v11 != v10)
    {
      do
      {
        v13 = (std::__shared_weak_count *)*((_QWORD *)v11 - 1);
        if (v13)
        {
          v14 = (unint64_t *)&v13->__shared_owners_;
          do
            v15 = __ldaxr(v14);
          while (__stlxr(v15 - 1, v14));
          if (!v15)
          {
            ((void (*)(std::__shared_weak_count *, SEL))v13->__on_zero_shared)(v13, a2);
            std::__shared_weak_count::__release_weak(v13);
          }
        }
        v11 -= 16;
      }
      while (v11 != v10);
      v12 = self->_selectedStyleQueries.__begin_;
    }
    self->_selectedStyleQueries.__end_ = v10;
    operator delete(v12);
  }
  v16 = (char *)self->_flatRoofStyleQueries.__begin_;
  if (v16)
  {
    v17 = (char *)self->_flatRoofStyleQueries.__end_;
    v18 = self->_flatRoofStyleQueries.__begin_;
    if (v17 != v16)
    {
      do
      {
        v19 = (std::__shared_weak_count *)*((_QWORD *)v17 - 1);
        if (v19)
        {
          v20 = (unint64_t *)&v19->__shared_owners_;
          do
            v21 = __ldaxr(v20);
          while (__stlxr(v21 - 1, v20));
          if (!v21)
          {
            ((void (*)(std::__shared_weak_count *, SEL))v19->__on_zero_shared)(v19, a2);
            std::__shared_weak_count::__release_weak(v19);
          }
        }
        v17 -= 16;
      }
      while (v17 != v16);
      v18 = self->_flatRoofStyleQueries.__begin_;
    }
    self->_flatRoofStyleQueries.__end_ = v16;
    operator delete(v18);
  }
  v22 = (char *)self->_styleQueries.__begin_;
  if (v22)
  {
    v23 = (char *)self->_styleQueries.__end_;
    v24 = self->_styleQueries.__begin_;
    if (v23 != v22)
    {
      do
      {
        v25 = (std::__shared_weak_count *)*((_QWORD *)v23 - 1);
        if (v25)
        {
          v26 = (unint64_t *)&v25->__shared_owners_;
          do
            v27 = __ldaxr(v26);
          while (__stlxr(v27 - 1, v26));
          if (!v27)
          {
            ((void (*)(std::__shared_weak_count *, SEL))v25->__on_zero_shared)(v25, a2);
            std::__shared_weak_count::__release_weak(v25);
          }
        }
        v23 -= 16;
      }
      while (v23 != v22);
      v24 = self->_styleQueries.__begin_;
    }
    self->_styleQueries.__end_ = v22;
    operator delete(v24);
  }
  p_styleQueries = &self->_styleQueries;
  v29 = (VKBuildingGroup *)&self->_styleQueries;
  do
  {
    v32 = (objc_class *)v29[-1]._selectedFlatRoofStyleQueries.__begin_;
    v29 = (VKBuildingGroup *)((char *)v29 - 24);
    v31 = v32;
    if (v32)
    {
      v33 = (objc_class *)p_styleQueries[-1].__end_;
      isa = v31;
      if (v33 != v31)
      {
        v34 = (objc_class *)p_styleQueries[-1].__end_;
        do
        {
          v36 = (void *)*((_QWORD *)v34 - 3);
          v34 = (objc_class *)((char *)v34 - 24);
          v35 = v36;
          if (v36)
          {
            *((_QWORD *)v33 - 2) = v35;
            operator delete(v35);
          }
          v33 = v34;
        }
        while (v34 != v31);
        isa = v29->super.super.isa;
      }
      p_styleQueries[-1].__end_ = v31;
      operator delete(isa);
    }
    p_styleQueries = (vector<std::shared_ptr<gss::StylesheetQuery<gss::PropertyID>>, std::allocator<std::shared_ptr<gss::StylesheetQuery<gss::PropertyID>>>> *)v29;
  }
  while (v29 != (VKBuildingGroup *)&self->_pointyRoofStrokeCullingGroups);
  p_pointyRoofStrokeCullingGroups = &self->_pointyRoofStrokeCullingGroups;
  v38 = (VKBuildingGroup *)&self->_pointyRoofStrokeCullingGroups;
  do
  {
    v41 = (objc_class *)v38[-1]._selectedFlatRoofStyleQueries.__begin_;
    v38 = (VKBuildingGroup *)((char *)v38 - 24);
    v40 = v41;
    if (v41)
    {
      v42 = (objc_class *)p_pointyRoofStrokeCullingGroups[-1].__elems_[15].__end_;
      v39 = v40;
      if (v42 != v40)
      {
        v43 = (objc_class *)p_pointyRoofStrokeCullingGroups[-1].__elems_[15].__end_;
        do
        {
          v45 = (void *)*((_QWORD *)v43 - 3);
          v43 = (objc_class *)((char *)v43 - 24);
          v44 = v45;
          if (v45)
          {
            *((_QWORD *)v42 - 2) = v44;
            operator delete(v44);
          }
          v42 = v43;
        }
        while (v43 != v40);
        v39 = v38->super.super.isa;
      }
      p_pointyRoofStrokeCullingGroups[-1].__elems_[15].__end_ = v40;
      operator delete(v39);
    }
    p_pointyRoofStrokeCullingGroups = (array<std::vector<std::vector<FeatureRange>>, 16UL> *)v38;
  }
  while (v38 != (VKBuildingGroup *)&self->_pointyRoofFillCullingGroups);
  p_pointyRoofFillCullingGroups = &self->_pointyRoofFillCullingGroups;
  v47 = (VKBuildingGroup *)&self->_pointyRoofFillCullingGroups;
  do
  {
    v50 = (objc_class *)v47[-1]._selectedFlatRoofStyleQueries.__begin_;
    v47 = (VKBuildingGroup *)((char *)v47 - 24);
    v49 = v50;
    if (v50)
    {
      v51 = (objc_class *)p_pointyRoofFillCullingGroups[-1].__elems_[15].__end_;
      v48 = v49;
      if (v51 != v49)
      {
        v52 = (objc_class *)p_pointyRoofFillCullingGroups[-1].__elems_[15].__end_;
        do
        {
          v54 = (void *)*((_QWORD *)v52 - 3);
          v52 = (objc_class *)((char *)v52 - 24);
          v53 = v54;
          if (v54)
          {
            *((_QWORD *)v51 - 2) = v53;
            operator delete(v53);
          }
          v51 = v52;
        }
        while (v52 != v49);
        v48 = v47->super.super.isa;
      }
      p_pointyRoofFillCullingGroups[-1].__elems_[15].__end_ = v49;
      operator delete(v48);
    }
    p_pointyRoofFillCullingGroups = (array<std::vector<std::vector<FeatureRange>>, 16UL> *)v47;
  }
  while (v47 != (VKBuildingGroup *)&self->_fillCullingGroupsForPointyRoofs);
  p_fillCullingGroupsForPointyRoofs = &self->_fillCullingGroupsForPointyRoofs;
  v56 = (VKBuildingGroup *)&self->_fillCullingGroupsForPointyRoofs;
  do
  {
    v59 = (objc_class *)v56[-1]._selectedFlatRoofStyleQueries.__begin_;
    v56 = (VKBuildingGroup *)((char *)v56 - 24);
    v58 = v59;
    if (v59)
    {
      v60 = (objc_class *)p_fillCullingGroupsForPointyRoofs[-1].__elems_[15].__end_;
      v57 = v58;
      if (v60 != v58)
      {
        v61 = (objc_class *)p_fillCullingGroupsForPointyRoofs[-1].__elems_[15].__end_;
        do
        {
          v63 = (void *)*((_QWORD *)v61 - 3);
          v61 = (objc_class *)((char *)v61 - 24);
          v62 = v63;
          if (v63)
          {
            *((_QWORD *)v60 - 2) = v62;
            operator delete(v62);
          }
          v60 = v61;
        }
        while (v61 != v58);
        v57 = v56->super.super.isa;
      }
      p_fillCullingGroupsForPointyRoofs[-1].__elems_[15].__end_ = v58;
      operator delete(v57);
    }
    p_fillCullingGroupsForPointyRoofs = (array<std::vector<std::vector<FeatureRange>>, 16UL> *)v56;
  }
  while (v56 != (VKBuildingGroup *)&self->_extrusionStrokeCullingGroups);
  p_extrusionStrokeCullingGroups = &self->_extrusionStrokeCullingGroups;
  v65 = (VKBuildingGroup *)&self->_extrusionStrokeCullingGroups;
  do
  {
    v68 = (objc_class *)v65[-1]._selectedFlatRoofStyleQueries.__begin_;
    v65 = (VKBuildingGroup *)((char *)v65 - 24);
    v67 = v68;
    if (v68)
    {
      v69 = (objc_class *)p_extrusionStrokeCullingGroups[-1].__elems_[15].__end_;
      v66 = v67;
      if (v69 != v67)
      {
        v70 = (objc_class *)p_extrusionStrokeCullingGroups[-1].__elems_[15].__end_;
        do
        {
          v72 = (void *)*((_QWORD *)v70 - 3);
          v70 = (objc_class *)((char *)v70 - 24);
          v71 = v72;
          if (v72)
          {
            *((_QWORD *)v69 - 2) = v71;
            operator delete(v71);
          }
          v69 = v70;
        }
        while (v70 != v67);
        v66 = v65->super.super.isa;
      }
      p_extrusionStrokeCullingGroups[-1].__elems_[15].__end_ = v67;
      operator delete(v66);
    }
    p_extrusionStrokeCullingGroups = (array<std::vector<std::vector<FeatureRange>>, 16UL> *)v65;
  }
  while (v65 != (VKBuildingGroup *)&self->_extrusionFillCullingGroups);
  value = self->_pointyRoofStrokeMeshVendor.__ptr_.__value_;
  self->_pointyRoofStrokeMeshVendor.__ptr_.__value_ = 0;
  if (value)
  {
    v74 = (_QWORD *)*value;
    if (*value)
    {
      v75 = (_QWORD *)value[1];
      v76 = (_QWORD *)*value;
      if (v75 != v74)
      {
        do
        {
          v78 = *--v75;
          v77 = v78;
          *v75 = 0;
          if (v78)
            (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v77 + 8))(v77, v76);
        }
        while (v75 != v74);
        v76 = (_QWORD *)*value;
      }
      value[1] = v74;
      (*(void (**)(_QWORD, _QWORD *, _QWORD))(*(_QWORD *)value[3] + 40))(value[3], v76, value[2] - (_QWORD)v76);
    }
    MEMORY[0x1A1AF4E00](value, 0x20C40DC1BFBCFLL);
  }
  v79 = self->_pointyRoofFillMeshVendor.__ptr_.__value_;
  self->_pointyRoofFillMeshVendor.__ptr_.__value_ = 0;
  if (v79)
  {
    v80 = (_QWORD *)*v79;
    if (*v79)
    {
      v81 = (_QWORD *)v79[1];
      v82 = (_QWORD *)*v79;
      if (v81 != v80)
      {
        do
        {
          v84 = *--v81;
          v83 = v84;
          *v81 = 0;
          if (v84)
            (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v83 + 8))(v83, v82);
        }
        while (v81 != v80);
        v82 = (_QWORD *)*v79;
      }
      v79[1] = v80;
      (*(void (**)(_QWORD, _QWORD *, _QWORD))(*(_QWORD *)v79[3] + 40))(v79[3], v82, v79[2] - (_QWORD)v82);
    }
    MEMORY[0x1A1AF4E00](v79, 0x20C40DC1BFBCFLL);
  }
  v85 = self->_extrusionStrokeMeshVendor.__ptr_.__value_;
  self->_extrusionStrokeMeshVendor.__ptr_.__value_ = 0;
  if (v85)
  {
    v86 = (_QWORD *)*v85;
    if (*v85)
    {
      v87 = (_QWORD *)v85[1];
      v88 = (_QWORD *)*v85;
      if (v87 != v86)
      {
        do
        {
          v90 = *--v87;
          v89 = v90;
          *v87 = 0;
          if (v90)
            (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v89 + 8))(v89, v88);
        }
        while (v87 != v86);
        v88 = (_QWORD *)*v85;
      }
      v85[1] = v86;
      (*(void (**)(_QWORD, _QWORD *, _QWORD))(*(_QWORD *)v85[3] + 40))(v85[3], v88, v85[2] - (_QWORD)v88);
    }
    MEMORY[0x1A1AF4E00](v85, 0x20C40DC1BFBCFLL);
  }
  v91 = self->_extrusionFillMeshVendor.__ptr_.__value_;
  self->_extrusionFillMeshVendor.__ptr_.__value_ = 0;
  if (v91)
  {
    v92 = (_QWORD *)*v91;
    if (*v91)
    {
      v93 = (_QWORD *)v91[1];
      v94 = (_QWORD *)*v91;
      if (v93 != v92)
      {
        do
        {
          v96 = *--v93;
          v95 = v96;
          *v93 = 0;
          if (v96)
            (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v95 + 8))(v95, v94);
        }
        while (v93 != v92);
        v94 = (_QWORD *)*v91;
      }
      v91[1] = v92;
      (*(void (**)(_QWORD, _QWORD *, _QWORD))(*(_QWORD *)v91[3] + 40))(v91[3], v94, v91[2] - (_QWORD)v94);
    }
    MEMORY[0x1A1AF4E00](v91, 0x20C40DC1BFBCFLL);
  }
  v97 = (char *)self->_fillMeshesForPointyRoofs.__begin_;
  if (v97)
  {
    v98 = (char *)self->_fillMeshesForPointyRoofs.__end_;
    v99 = self->_fillMeshesForPointyRoofs.__begin_;
    if (v98 != v97)
    {
      do
      {
        v100 = (std::__shared_weak_count *)*((_QWORD *)v98 - 1);
        if (v100)
        {
          v101 = (unint64_t *)&v100->__shared_owners_;
          do
            v102 = __ldaxr(v101);
          while (__stlxr(v102 - 1, v101));
          if (!v102)
          {
            ((void (*)(std::__shared_weak_count *))v100->__on_zero_shared)(v100);
            std::__shared_weak_count::__release_weak(v100);
          }
        }
        v98 -= 16;
      }
      while (v98 != v97);
      v99 = self->_fillMeshesForPointyRoofs.__begin_;
    }
    self->_fillMeshesForPointyRoofs.__end_ = v97;
    operator delete(v99);
  }
  v103 = (char *)self->_strokeMeshes.__begin_;
  if (v103)
  {
    v104 = (char *)self->_strokeMeshes.__end_;
    v105 = self->_strokeMeshes.__begin_;
    if (v104 != v103)
    {
      do
      {
        v106 = (std::__shared_weak_count *)*((_QWORD *)v104 - 1);
        if (v106)
        {
          v107 = (unint64_t *)&v106->__shared_owners_;
          do
            v108 = __ldaxr(v107);
          while (__stlxr(v108 - 1, v107));
          if (!v108)
          {
            ((void (*)(std::__shared_weak_count *))v106->__on_zero_shared)(v106);
            std::__shared_weak_count::__release_weak(v106);
          }
        }
        v104 -= 16;
      }
      while (v104 != v103);
      v105 = self->_strokeMeshes.__begin_;
    }
    self->_strokeMeshes.__end_ = v103;
    operator delete(v105);
  }
  if (self->_fillMeshInfoForPointyRoofs._hasValue)
  {
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)&self->_fillMeshInfoForPointyRoofs._value);
    self->_fillMeshInfoForPointyRoofs._hasValue = 0;
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
  *((_BYTE *)self + 3032) = 0;
  *((_QWORD *)self + 404) = 0;
  *((_QWORD *)self + 405) = 0;
  *((_QWORD *)self + 403) = 0;
  *((_QWORD *)self + 407) = 0;
  *((_QWORD *)self + 408) = 0;
  *((_QWORD *)self + 406) = 0;
  *((_QWORD *)self + 409) = 0;
  *((_QWORD *)self + 410) = 0;
  *((_QWORD *)self + 411) = 0;
  *((_QWORD *)self + 412) = 0;
  *(_OWORD *)((char *)self + 3304) = 0u;
  *(_OWORD *)((char *)self + 3320) = 0u;
  *(_OWORD *)((char *)self + 3336) = 0u;
  *(_OWORD *)((char *)self + 3352) = 0u;
  *(_OWORD *)((char *)self + 3368) = 0u;
  *(_OWORD *)((char *)self + 3384) = 0u;
  *(_OWORD *)((char *)self + 3400) = 0u;
  *(_OWORD *)((char *)self + 3416) = 0u;
  *(_OWORD *)((char *)self + 3432) = 0u;
  *(_OWORD *)((char *)self + 3448) = 0u;
  *(_OWORD *)((char *)self + 3464) = 0u;
  *(_OWORD *)((char *)self + 3480) = 0u;
  *(_OWORD *)((char *)self + 3496) = 0u;
  *(_OWORD *)((char *)self + 3512) = 0u;
  *(_OWORD *)((char *)self + 3528) = 0u;
  *(_OWORD *)((char *)self + 3544) = 0u;
  *(_OWORD *)((char *)self + 3560) = 0u;
  *(_OWORD *)((char *)self + 3576) = 0u;
  *(_OWORD *)((char *)self + 3592) = 0u;
  *(_OWORD *)((char *)self + 3608) = 0u;
  *(_OWORD *)((char *)self + 3624) = 0u;
  *(_OWORD *)((char *)self + 3640) = 0u;
  *(_OWORD *)((char *)self + 3656) = 0u;
  *(_OWORD *)((char *)self + 3672) = 0u;
  *(_OWORD *)((char *)self + 3688) = 0u;
  *(_OWORD *)((char *)self + 3704) = 0u;
  *(_OWORD *)((char *)self + 3720) = 0u;
  *(_OWORD *)((char *)self + 3736) = 0u;
  *(_OWORD *)((char *)self + 3752) = 0u;
  *(_OWORD *)((char *)self + 3768) = 0u;
  *(_OWORD *)((char *)self + 3784) = 0u;
  *(_OWORD *)((char *)self + 3800) = 0u;
  *(_OWORD *)((char *)self + 3816) = 0u;
  *(_OWORD *)((char *)self + 3832) = 0u;
  *(_OWORD *)((char *)self + 3848) = 0u;
  *(_OWORD *)((char *)self + 3864) = 0u;
  *(_OWORD *)((char *)self + 3880) = 0u;
  *(_OWORD *)((char *)self + 3896) = 0u;
  *(_OWORD *)((char *)self + 3912) = 0u;
  *(_OWORD *)((char *)self + 3928) = 0u;
  *(_OWORD *)((char *)self + 3944) = 0u;
  *(_OWORD *)((char *)self + 3960) = 0u;
  *(_OWORD *)((char *)self + 3976) = 0u;
  *(_OWORD *)((char *)self + 3992) = 0u;
  *(_OWORD *)((char *)self + 4008) = 0u;
  *(_OWORD *)((char *)self + 4024) = 0u;
  *(_OWORD *)((char *)self + 4040) = 0u;
  *(_OWORD *)((char *)self + 4056) = 0u;
  *(_OWORD *)((char *)self + 4072) = 0u;
  *(_OWORD *)((char *)self + 4088) = 0u;
  *(_OWORD *)((char *)self + 4104) = 0u;
  *(_OWORD *)((char *)self + 4120) = 0u;
  *(_OWORD *)((char *)self + 4136) = 0u;
  *(_OWORD *)((char *)self + 4152) = 0u;
  *(_OWORD *)((char *)self + 4168) = 0u;
  *(_OWORD *)((char *)self + 4184) = 0u;
  *(_OWORD *)((char *)self + 4200) = 0u;
  *(_OWORD *)((char *)self + 4216) = 0u;
  *(_OWORD *)((char *)self + 4232) = 0u;
  *(_OWORD *)((char *)self + 4248) = 0u;
  *(_OWORD *)((char *)self + 4264) = 0u;
  *(_OWORD *)((char *)self + 4280) = 0u;
  *(_OWORD *)((char *)self + 4296) = 0u;
  *(_OWORD *)((char *)self + 4312) = 0u;
  *(_OWORD *)((char *)self + 4328) = 0u;
  *(_OWORD *)((char *)self + 4344) = 0u;
  *(_OWORD *)((char *)self + 4360) = 0u;
  *(_OWORD *)((char *)self + 4376) = 0u;
  *(_OWORD *)((char *)self + 4392) = 0u;
  *(_OWORD *)((char *)self + 4408) = 0u;
  *(_OWORD *)((char *)self + 4424) = 0u;
  *(_OWORD *)((char *)self + 4440) = 0u;
  *(_OWORD *)((char *)self + 4456) = 0u;
  *(_OWORD *)((char *)self + 4472) = 0u;
  *(_OWORD *)((char *)self + 4488) = 0u;
  *(_OWORD *)((char *)self + 4504) = 0u;
  *(_OWORD *)((char *)self + 4520) = 0u;
  *(_OWORD *)((char *)self + 4536) = 0u;
  *(_OWORD *)((char *)self + 4552) = 0u;
  *(_OWORD *)((char *)self + 4568) = 0u;
  *(_OWORD *)((char *)self + 4584) = 0u;
  *(_OWORD *)((char *)self + 4600) = 0u;
  *(_OWORD *)((char *)self + 4616) = 0u;
  *(_OWORD *)((char *)self + 4632) = 0u;
  *(_OWORD *)((char *)self + 4648) = 0u;
  *(_OWORD *)((char *)self + 4664) = 0u;
  *(_OWORD *)((char *)self + 4680) = 0u;
  *(_OWORD *)((char *)self + 4696) = 0u;
  *(_OWORD *)((char *)self + 4712) = 0u;
  *(_OWORD *)((char *)self + 4728) = 0u;
  *(_OWORD *)((char *)self + 4744) = 0u;
  *(_OWORD *)((char *)self + 4760) = 0u;
  *(_OWORD *)((char *)self + 4776) = 0u;
  *(_OWORD *)((char *)self + 4792) = 0u;
  *(_OWORD *)((char *)self + 4808) = 0u;
  *(_OWORD *)((char *)self + 4824) = 0u;
  *(_OWORD *)((char *)self + 4840) = 0u;
  *(_OWORD *)((char *)self + 4856) = 0u;
  *(_OWORD *)((char *)self + 4872) = 0u;
  *(_OWORD *)((char *)self + 4888) = 0u;
  *(_OWORD *)((char *)self + 4904) = 0u;
  *(_OWORD *)((char *)self + 4920) = 0u;
  *(_OWORD *)((char *)self + 4936) = 0u;
  *(_OWORD *)((char *)self + 4952) = 0u;
  *(_OWORD *)((char *)self + 4968) = 0u;
  *(_OWORD *)((char *)self + 4984) = 0u;
  *(_OWORD *)((char *)self + 5000) = 0u;
  *(_OWORD *)((char *)self + 5016) = 0u;
  *(_OWORD *)((char *)self + 5032) = 0u;
  *(_OWORD *)((char *)self + 5048) = 0u;
  *(_OWORD *)((char *)self + 5064) = 0u;
  *(_OWORD *)((char *)self + 5080) = 0u;
  *(_OWORD *)((char *)self + 5096) = 0u;
  *(_OWORD *)((char *)self + 5112) = 0u;
  *(_OWORD *)((char *)self + 5128) = 0u;
  *(_OWORD *)((char *)self + 5144) = 0u;
  *(_OWORD *)((char *)self + 5160) = 0u;
  *(_OWORD *)((char *)self + 5176) = 0u;
  *(_OWORD *)((char *)self + 5192) = 0u;
  *(_OWORD *)((char *)self + 5208) = 0u;
  *((_QWORD *)self + 654) = 0;
  *((_QWORD *)self + 655) = 0;
  *((_QWORD *)self + 653) = 0;
  *((_QWORD *)self + 657) = 0;
  *((_QWORD *)self + 658) = 0;
  *((_QWORD *)self + 656) = 0;
  *((_QWORD *)self + 660) = 0;
  *((_QWORD *)self + 661) = 0;
  *((_QWORD *)self + 659) = 0;
  *((_QWORD *)self + 663) = 0;
  *((_QWORD *)self + 664) = 0;
  *((_QWORD *)self + 662) = 0;
  return self;
}

- (void)addBuilding:index:ofTotal:accessor:triangulator:prepareExtrusion:forRoofStyle:scaleThreshold:
{
  float32x4_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  const char *v18;
  __int16 *v19;
  uint64_t v20;
  BOOL v21;
  BOOL v22;
  BOOL v23;
  BOOL v24;
  unint64_t v25;
  __int16 *v26;
  BOOL v28;
  BOOL v29;
  int16x8_t v30;
  float v31;
  unint64_t v32;
  float *v33;
  _WORD *v34;
  float v35;
  float v36;
  __int16 v37;
  int16x8_t *v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  int16x8_t *v42;
  unint64_t v43;
  unint64_t v44;
  _WORD *v45;
  __int16 *v46;
  __int16 v47;
  int *v48;
  uint64_t v49;
  int v50;
  unsigned int v51;
  int16x8_t v52;
  int16x8_t *v53;
  int16x8_t *v54;
  unint64_t v55;
  int16x8_t v56;
  float32x4_t v57;
  float32x4_t v58;
  float v59;
  const float *v60;
  unint64_t v61;
  const float *v62;
  const float *v63;
  const float *v64;
  float32x4_t v65;
  int16x8_t v66;
  int16x8_t v67;
  int16x8_t v68;
  __int16 *v69;
  __int16 *v70;
  unint64_t v71;
  float32x4_t v72;
  float32x4_t v73;
  float v74;
  unint64_t v75;
  __int16 *v76;
  const float *v77;
  const float *v78;
  __int128 v79;
  uint64_t v80;
  float32x4x2_t v81;
  float32x4x2_t v82;
  float32x4x2_t v83;
  int16x8x4_t v84;
  int16x8x4_t v85;

  v10 = *a2;
  v11 = *(_QWORD *)(a5 + 40);
  v12 = **(_QWORD **)(a1 + 8);
  if (v12)
  {
    v13 = *(_QWORD *)(a4 + 40);
    v14 = **(_QWORD **)(a1 + 16);
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(_QWORD *)(a1 + 40);
    LODWORD(a6) = *(_DWORD *)v15;
    LODWORD(a7) = *(_DWORD *)(v15 + 4);
    a9.i32[0] = *(_DWORD *)v16;
    a8.i32[0] = *(_DWORD *)(v16 + 4);
    v17 = (int)(float)((float)((float)(**(float **)(a1 + 24) - *(float *)(v15 + 8)) * 65535.0) / *(float *)(v16 + 8));
    v18 = *(const char **)(a1 + 48);
    if (v12 <= 7
      || ((v19 = (__int16 *)(v13 + 8 * v10), v20 = 4 * (v12 - 1), &v19[v20] >= v19)
        ? (v21 = &v19[v20 + 1] >= v19 + 1)
        : (v21 = 0),
          v21 ? (v22 = &v19[v20 + 2] >= v19 + 2) : (v22 = 0),
          v22 ? (v23 = &v19[v20 + 3] >= v19 + 3) : (v23 = 0),
          v23 ? (v24 = (v12 - 1) >> 61 == 0) : (v24 = 0),
          !v24))
    {
      v25 = 0;
      goto LABEL_32;
    }
    v25 = 0;
    v26 = &v19[4 * v12];
    v28 = v19 < (__int16 *)(v18 + 1) && v18 < (const char *)v26;
    v29 = v14 >= (unint64_t)v26 || (unint64_t)v19 >= v14 + 8 * v12;
    if (!v29 || v28)
      goto LABEL_32;
    v30 = vdupq_n_s16(v17);
    if (v12 >= 0x10)
    {
      v25 = v12 & 0xFFFFFFFFFFFFFFF0;
      v57 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a6, 0);
      v58 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a7, 0);
      v9.i32[0] = 1199570688;
      LODWORD(v59) = vdivq_f32(v9, a9).u32[0];
      v9 = vdivq_f32(v9, a8);
      v60 = **(const float ***)(a1 + 16);
      v61 = v12 & 0xFFFFFFFFFFFFFFF0;
      do
      {
        v62 = v60;
        v81 = vld2q_f32(v62);
        v62 += 8;
        *(float32x4x2_t *)v84.val[0].i8 = vld2q_f32(v62);
        v63 = v60 + 16;
        *(float32x4x2_t *)v84.val[2].i8 = vld2q_f32(v63);
        v64 = v60 + 24;
        v83 = vld2q_f32(v64);
        v65 = vsubq_f32((float32x4_t)v84.val[0], v57);
        v66 = vuzp1q_s16((int16x8_t)vcvtq_u32_f32(vmulq_n_f32(vsubq_f32((float32x4_t)v84.val[2], v57), v59)), (int16x8_t)vcvtq_u32_f32(vmulq_n_f32(vsubq_f32(v83.val[0], v57), v59)));
        v67 = vuzp1q_s16((int16x8_t)vcvtq_u32_f32(vmulq_n_f32(vsubq_f32((float32x4_t)v84.val[3], v58), v9.f32[0])), (int16x8_t)vcvtq_u32_f32(vmulq_n_f32(vsubq_f32(v83.val[1], v58), v9.f32[0])));
        *(int8x8_t *)v84.val[0].i8 = vld1_dup_s8(v18);
        v68 = vshll_n_s8(*(int8x8_t *)v84.val[0].i8, 8uLL);
        v84.val[0] = vuzp1q_s16((int16x8_t)vcvtq_u32_f32(vmulq_n_f32(vsubq_f32(v81.val[0], v57), v59)), (int16x8_t)vcvtq_u32_f32(vmulq_n_f32(v65, v59)));
        v84.val[1] = vuzp1q_s16((int16x8_t)vcvtq_u32_f32(vmulq_n_f32(vsubq_f32(v81.val[1], v58), v9.f32[0])), (int16x8_t)vcvtq_u32_f32(vmulq_n_f32(vsubq_f32((float32x4_t)v84.val[1], v58), v9.f32[0])));
        v84.val[2] = v30;
        v84.val[3] = v68;
        v69 = v19 + 64;
        vst4q_s16(v19, v84);
        v70 = v19 + 32;
        vst4q_s16(v70, *(int16x8x4_t *)(&v30 - 2));
        v60 += 32;
        v19 = v69;
        v61 -= 16;
      }
      while (v61);
      if (v12 == v25)
        goto LABEL_34;
      if ((v12 & 8) == 0)
      {
LABEL_32:
        v31 = 1.0 / a9.f32[0];
        v32 = v12 - v25;
        v33 = (float *)(v14 + 8 * v25 + 4);
        v34 = (_WORD *)(v13 + 8 * (v25 + v10) + 4);
        v35 = 1.0 / a8.f32[0];
        do
        {
          v36 = (float)((float)(*v33 - *(float *)&a7) * 65535.0) * v35;
          v37 = *(unsigned __int8 *)v18 << 8;
          *(v34 - 2) = (int)(float)((float)((float)(*(v33 - 1) - *(float *)&a6) * 65535.0) * v31);
          *(v34 - 1) = (int)v36;
          *v34 = v17;
          v34[1] = v37;
          v33 += 2;
          v34 += 4;
          --v32;
        }
        while (v32);
        goto LABEL_34;
      }
    }
    else
    {
      v25 = 0;
    }
    v71 = v25;
    v25 = v12 & 0xFFFFFFFFFFFFFFF8;
    v72 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a6, 0);
    v73 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a7, 0);
    v9.i32[0] = 1199570688;
    LODWORD(v74) = vdivq_f32(v9, a9).u32[0];
    v9.i32[0] = vdivq_f32(v9, a8).u32[0];
    v75 = v71 - (v12 & 0xFFFFFFFFFFFFFFF8);
    v76 = (__int16 *)(v13 + 8 * (v71 + v10));
    v77 = (const float *)(v14 + 8 * v71);
    do
    {
      v78 = v77;
      v82 = vld2q_f32(v78);
      v78 += 8;
      *(float32x4x2_t *)v85.val[0].i8 = vld2q_f32(v78);
      v85.val[0] = vuzp1q_s16((int16x8_t)vcvtq_u32_f32(vmulq_n_f32(vsubq_f32(v82.val[0], v72), v74)), (int16x8_t)vcvtq_u32_f32(vmulq_n_f32(vsubq_f32((float32x4_t)v85.val[0], v72), v74)));
      v85.val[1] = vuzp1q_s16((int16x8_t)vcvtq_u32_f32(vmulq_n_f32(vsubq_f32(v82.val[1], v73), v9.f32[0])), (int16x8_t)vcvtq_u32_f32(vmulq_n_f32(vsubq_f32((float32x4_t)v85.val[1], v73), v9.f32[0])));
      *(int8x8_t *)v82.val[0].f32 = vld1_dup_s8(v18);
      v85.val[3] = vshll_n_s8(*(int8x8_t *)v82.val[0].f32, 8uLL);
      v85.val[2] = v30;
      vst4q_s16(v76, v85);
      v76 += 32;
      v77 += 16;
      v75 += 8;
    }
    while (v75);
    if (v12 != v25)
      goto LABEL_32;
  }
LABEL_34:
  v38 = *(int16x8_t **)(*(_QWORD *)(a1 + 56) + 88);
  v39 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 96) - (_QWORD)v38;
  if (v39)
  {
    v40 = v39 >> 1;
    v41 = *a3;
    if (v40 <= 1)
      v40 = 1;
    if (v40 > 0xF && (v42 = (int16x8_t *)(2 * v41 + v11), (unint64_t)((char *)v42 - (char *)v38) >= 0x20))
    {
      v43 = v40 & 0xFFFFFFFFFFFFFFF0;
      v52 = vdupq_n_s16(v10);
      v53 = v42 + 1;
      v54 = v38 + 1;
      v55 = v40 & 0xFFFFFFFFFFFFFFF0;
      do
      {
        v56 = vaddq_s16(*v54, v52);
        v53[-1] = vaddq_s16(v54[-1], v52);
        *v53 = v56;
        v53 += 2;
        v54 += 2;
        v55 -= 16;
      }
      while (v55);
      if (v40 == v43)
        goto LABEL_42;
    }
    else
    {
      v43 = 0;
    }
    v44 = v40 - v43;
    v45 = (_WORD *)(v11 + 2 * (v43 + v41));
    v46 = &v38->i16[v43];
    do
    {
      v47 = *v46++;
      *v45++ = v47 + v10;
      --v44;
    }
    while (v44);
  }
LABEL_42:
  if (**(_BYTE **)(a1 + 64))
    v48 = &OBJC_IVAR___VKBuildingGroup__fillCullingGroupsForPointyRoofs;
  else
    v48 = &OBJC_IVAR___VKPolygonalItemGroup__fillCullingGroups;
  v49 = **(_QWORD **)(a1 + 72) + *v48;
  v50 = **(_DWORD **)(a1 + 80);
  v51 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 88) + 152);
  v79 = *(_OWORD *)a3;
  v80 = **(_QWORD **)(a1 + 96);
  _addRangeToList(v49, v50, v51, &v79);
}

- (__n128)addBuilding:index:ofTotal:accessor:triangulator:prepareExtrusion:forRoofStyle:scaleThreshold:
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  *(_QWORD *)a2 = &off_1E42C72C8;
  v2 = *(_OWORD *)(a1 + 8);
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 8) = v2;
  result = *(__n128 *)(a1 + 40);
  v4 = *(_OWORD *)(a1 + 56);
  v5 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)(a2 + 88) = *(_OWORD *)(a1 + 88);
  *(_OWORD *)(a2 + 72) = v5;
  *(_OWORD *)(a2 + 56) = v4;
  *(__n128 *)(a2 + 40) = result;
  return result;
}

@end

@implementation ZNK2md16RouteLineSection17addTrafficRibbonsERNSt3

float *___ZNK2md16RouteLineSection17addTrafficRibbonsERNSt3__113unordered_mapINS_15TrafficBatchKeyENS1_6vectorINS1_10unique_ptrINS_13TrafficRibbonEN3mdm11TypeDeleterIS6_EEEEN3geo12StdAllocatorISA_NS7_9AllocatorEEEEENS1_4hashIS3_EENS1_8equal_toIS3_EENS1_9allocatorINS1_4pairIKS3_SF_EEEEEERNS2_IS3_NS4_INS5_INS_18SolidTrafficRibbonENS8_ISR_EEEENSC_IST_SD_EEEESH_SJ_NSK_INSL_ISM_SV_EEEEEERKNS1_10shared_ptrIN3gss15StylesheetQueryINS11_10PropertyIDEEEEERKNS_16TrafficMeshStyleE_block_invoke(float *result, unsigned int a2, uint64_t a3, uint64_t a4)
{
  float *v6;
  uint64_t v7;
  int v8;
  unsigned __int8 v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  unsigned __int8 v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  unsigned __int8 v19;
  uint64_t v20;
  md::TrafficBatchKey *v21;
  float *v22;
  _QWORD *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  float *v30;
  float *v31;
  void (***v32)(_QWORD);
  md::TrafficBatchKey *v33;
  unint64_t v34;
  void (***v35)(_QWORD);
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  float *v42;
  float *v43;
  void (***v44)(_QWORD);
  char *v45;
  char *v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  char *v50;
  BOOL v51;
  uint64_t v52;
  char *v53;
  float *v54;
  char *v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  void (***v62)(_QWORD);
  void (***v63)(_QWORD);
  unsigned __int8 v64;
  uint64_t v65;
  char *v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  char *v70;
  BOOL v71;
  uint64_t v72;
  char *v73;
  float *v74;
  char *v75;
  uint64_t v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;
  char *v80;
  void (***v81)(_QWORD);
  void (***v82)(_QWORD);
  unsigned __int8 v83;
  uint64_t v84;
  unsigned __int8 v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void (***v91)(_QWORD);

  if (a2 > 3)
    return result;
  v6 = result;
  v7 = *((_QWORD *)result + 5);
  *(_BYTE *)(*(_QWORD *)(*((_QWORD *)result + 4) + 8) + 68) = a2;
  v8 = *(_DWORD *)(*((_QWORD *)result + 6)
                 + 4 * *(unsigned __int8 *)(*(_QWORD *)(*((_QWORD *)result + 4) + 8) + 68));
  if ((v8 - 1) < 2)
  {
    {
      v86 = operator new();
      mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v86, "VectorKitLabels", 0x5ED09DD50000000FLL);
    }
    v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)mdm::Allocator::instance(void)::alloc + 16))(mdm::Allocator::instance(void)::alloc, 104, 8);
    v11 = v10;
    *(_OWORD *)(v10 + 49) = 0u;
    *(_OWORD *)(v10 + 8) = 0u;
    *(_OWORD *)(v10 + 24) = 0u;
    *(_OWORD *)(v10 + 40) = 0u;
    *(_QWORD *)(v10 + 56) = a4;
    *(_QWORD *)v10 = off_1E42AF568;
    *(_QWORD *)(v10 + 72) = 0;
    v12 = (_QWORD *)(v10 + 72);
    *(_QWORD *)(v10 + 80) = 0;
    *(_QWORD *)(v10 + 88) = 0;
    if (a4)
    {
      *(_QWORD *)(v10 + 88) = a4;
      {
        v88 = operator new();
        mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v88, "VectorKitLabels", 0x5ED09DD50000000FLL);
      }
      v14 = 0;
      *(_QWORD *)(v11 + 72) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)mdm::Allocator::instance(void)::alloc
                                                                                   + 16))(mdm::Allocator::instance(void)::alloc, 8 * a4, 8);
      *(_BYTE *)(v11 + 64) = 1;
      *(_QWORD *)v11 = off_1E42961A8;
      v91 = (void (***)(_QWORD))v11;
      do
      {
        *(_QWORD *)(*v12 + 8 * v14) = *(_QWORD *)(*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(v7 + 96)
                                                                                            + 32))(*(_QWORD *)(v7 + 96), a3 + v14);
        ++v14;
      }
      while (a4 != v14);
    }
    else
    {
      *(_QWORD *)v10 = off_1E42961A8;
      v91 = (void (***)(_QWORD))v10;
    }
    v21 = (md::TrafficBatchKey *)(*(_QWORD *)(*((_QWORD *)v6 + 4) + 8) + 48);
    result = std::__hash_table<std::__hash_value_type<md::TrafficBatchKey,std::vector<std::unique_ptr<md::SolidTrafficRibbon,mdm::TypeDeleter<md::SolidTrafficRibbon>>,geo::StdAllocator<std::unique_ptr<md::SolidTrafficRibbon,mdm::TypeDeleter<md::SolidTrafficRibbon>>,mdm::Allocator>>>,std::__unordered_map_hasher<md::TrafficBatchKey,std::__hash_value_type<md::TrafficBatchKey,std::vector<std::unique_ptr<md::SolidTrafficRibbon,mdm::TypeDeleter<md::SolidTrafficRibbon>>,geo::StdAllocator<std::unique_ptr<md::SolidTrafficRibbon,mdm::TypeDeleter<md::SolidTrafficRibbon>>,mdm::Allocator>>>,std::hash<md::TrafficBatchKey>,std::equal_to<md::TrafficBatchKey>,true>,std::__unordered_map_equal<md::TrafficBatchKey,std::__hash_value_type<md::TrafficBatchKey,std::vector<std::unique_ptr<md::SolidTrafficRibbon,mdm::TypeDeleter<md::SolidTrafficRibbon>>,geo::StdAllocator<std::unique_ptr<md::SolidTrafficRibbon,mdm::TypeDeleter<md::SolidTrafficRibbon>>,mdm::Allocator>>>,std::equal_to<md::TrafficBatchKey>,std::hash<md::TrafficBatchKey>,true>,std::allocator<std::__hash_value_type<md::TrafficBatchKey,std::vector<std::unique_ptr<md::SolidTrafficRibbon,mdm::TypeDeleter<md::SolidTrafficRibbon>>,geo::StdAllocator<std::unique_ptr<md::SolidTrafficRibbon,mdm::TypeDeleter<md::SolidTrafficRibbon>>,mdm::Allocator>>>>>::__emplace_unique_key_args<md::TrafficBatchKey,std::piecewise_construct_t const&,std::tuple<md::TrafficBatchKey const&>,std::tuple<>>(*((uint64_t **)v6 + 8), v21, (uint64_t)v21);
    v22 = result;
    v23 = (_QWORD *)*((_QWORD *)result + 7);
    v24 = *((_QWORD *)result + 8);
    if ((unint64_t)v23 >= v24)
    {
      v25 = *((_QWORD *)result + 6);
      v26 = ((uint64_t)v23 - v25) >> 3;
      v27 = v26 + 1;
      if ((unint64_t)(v26 + 1) >> 61)
        abort();
      v28 = v24 - v25;
      if (v28 >> 2 > v27)
        v27 = v28 >> 2;
      if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF8)
        v29 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v29 = v27;
      if (v29)
      {
        result = (float *)(*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(**((_QWORD **)result + 9) + 16))(*((_QWORD *)result + 9), 8 * v29, 8);
        v30 = &result[2 * v26];
        v31 = &result[2 * v29];
        if (result)
        {
          v32 = v91;
          v91 = 0;
          *(_QWORD *)v30 = v32;
        }
      }
      else
      {
        v31 = 0;
        v30 = (float *)(8 * v26);
      }
      v36 = v30 + 2;
      v45 = (char *)*((_QWORD *)v22 + 6);
      v46 = (char *)*((_QWORD *)v22 + 7);
      if (v46 == v45)
      {
        *((_QWORD *)v22 + 6) = v30;
        *((_QWORD *)v22 + 7) = v36;
        v61 = *((_QWORD *)v22 + 8);
        *((_QWORD *)v22 + 8) = v31;
        goto LABEL_86;
      }
      v47 = v46 - v45 - 8;
      if (v47 > 0x57
        && ((v48 = (v45 - v46 + 7) & 0xFFFFFFFFFFFFFFF8,
             v49 = (unint64_t)&v46[v48],
             v50 = (char *)v30 + v48,
             v49 < (unint64_t)v30)
          ? (v51 = v50 >= v46)
          : (v51 = 1),
            v51))
      {
        v52 = (v47 >> 3) + 1;
        v53 = &v46[-8 * (v52 & 0x3FFFFFFFFFFFFFFCLL)];
        v54 = v30 - 4;
        v55 = v46 - 32;
        v56 = v52 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v58 = *(_OWORD *)v55;
          v57 = *((_OWORD *)v55 + 1);
          *(_OWORD *)v55 = 0uLL;
          *((_OWORD *)v55 + 1) = 0uLL;
          v55 -= 32;
          *((_OWORD *)v54 - 1) = v58;
          *(_OWORD *)v54 = v57;
          v54 -= 8;
          v56 -= 4;
        }
        while (v56);
        v30 -= 2 * (v52 & 0x3FFFFFFFFFFFFFFCLL);
        if (v52 == (v52 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_55:
          v46 = (char *)*((_QWORD *)v22 + 6);
          v60 = (char *)*((_QWORD *)v22 + 7);
          *((_QWORD *)v22 + 6) = v30;
          *((_QWORD *)v22 + 7) = v36;
          v61 = *((_QWORD *)v22 + 8);
          *((_QWORD *)v22 + 8) = v31;
          while (v60 != v46)
          {
            v63 = (void (***)(_QWORD))*((_QWORD *)v60 - 1);
            v60 -= 8;
            v62 = v63;
            *(_QWORD *)v60 = 0;
            if (v63)
            {
              (**v62)(v62);
              {
                v65 = operator new();
                mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v65, "VectorKitLabels", 0x5ED09DD50000000FLL);
              }
              result = (float *)(*(uint64_t (**)(uint64_t, void (***)(_QWORD), uint64_t))(*(_QWORD *)mdm::Allocator::instance(void)::alloc + 40))(mdm::Allocator::instance(void)::alloc, v62, 104);
            }
          }
          goto LABEL_86;
        }
      }
      else
      {
        v53 = (char *)*((_QWORD *)v22 + 7);
      }
      do
      {
        v59 = *((_QWORD *)v53 - 1);
        v53 -= 8;
        *(_QWORD *)v53 = 0;
        *((_QWORD *)v30 - 1) = v59;
        v30 -= 2;
      }
      while (v53 != v45);
      goto LABEL_55;
    }
LABEL_29:
    if (v23)
    {
      v35 = v91;
      v91 = 0;
      *v23 = v35;
    }
    v36 = v23 + 1;
    goto LABEL_88;
  }
  if (v8)
    return result;
  {
    v89 = operator new();
    mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v89, "VectorKitLabels", 0x5ED09DD50000000FLL);
  }
  v16 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)mdm::Allocator::instance(void)::alloc + 16))(mdm::Allocator::instance(void)::alloc, 104, 8);
  v17 = v16;
  *(_OWORD *)(v16 + 49) = 0u;
  *(_OWORD *)(v16 + 8) = 0u;
  *(_OWORD *)(v16 + 24) = 0u;
  *(_OWORD *)(v16 + 40) = 0u;
  *(_QWORD *)(v16 + 56) = a4;
  *(_QWORD *)v16 = off_1E42AF568;
  *(_QWORD *)(v16 + 72) = 0;
  v18 = (_QWORD *)(v16 + 72);
  *(_QWORD *)(v16 + 80) = 0;
  *(_QWORD *)(v16 + 88) = 0;
  if (a4)
  {
    *(_QWORD *)(v16 + 88) = a4;
    {
      v90 = operator new();
      mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v90, "VectorKitLabels", 0x5ED09DD50000000FLL);
    }
    v20 = 0;
    *(_QWORD *)(v17 + 72) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)mdm::Allocator::instance(void)::alloc
                                                                                 + 16))(mdm::Allocator::instance(void)::alloc, 8 * a4, 8);
    *(_BYTE *)(v17 + 64) = 1;
    *(_QWORD *)v17 = off_1E428EC30;
    v91 = (void (***)(_QWORD))v17;
    do
    {
      *(_QWORD *)(*v18 + 8 * v20) = *(_QWORD *)(*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(v7 + 96) + 32))(*(_QWORD *)(v7 + 96), a3 + v20);
      ++v20;
    }
    while (a4 != v20);
  }
  else
  {
    *(_QWORD *)v16 = off_1E428EC30;
    v91 = (void (***)(_QWORD))v16;
  }
  v33 = (md::TrafficBatchKey *)(*(_QWORD *)(*((_QWORD *)v6 + 4) + 8) + 48);
  result = std::__hash_table<std::__hash_value_type<md::TrafficBatchKey,std::vector<std::unique_ptr<md::TrafficRibbon,mdm::TypeDeleter<md::TrafficRibbon>>,geo::StdAllocator<std::unique_ptr<md::TrafficRibbon,mdm::TypeDeleter<md::TrafficRibbon>>,mdm::Allocator>>>,std::__unordered_map_hasher<md::TrafficBatchKey,std::__hash_value_type<md::TrafficBatchKey,std::vector<std::unique_ptr<md::TrafficRibbon,mdm::TypeDeleter<md::TrafficRibbon>>,geo::StdAllocator<std::unique_ptr<md::TrafficRibbon,mdm::TypeDeleter<md::TrafficRibbon>>,mdm::Allocator>>>,std::hash<md::TrafficBatchKey>,std::equal_to<md::TrafficBatchKey>,true>,std::__unordered_map_equal<md::TrafficBatchKey,std::__hash_value_type<md::TrafficBatchKey,std::vector<std::unique_ptr<md::TrafficRibbon,mdm::TypeDeleter<md::TrafficRibbon>>,geo::StdAllocator<std::unique_ptr<md::TrafficRibbon,mdm::TypeDeleter<md::TrafficRibbon>>,mdm::Allocator>>>,std::equal_to<md::TrafficBatchKey>,std::hash<md::TrafficBatchKey>,true>,std::allocator<std::__hash_value_type<md::TrafficBatchKey,std::vector<std::unique_ptr<md::TrafficRibbon,mdm::TypeDeleter<md::TrafficRibbon>>,geo::StdAllocator<std::unique_ptr<md::TrafficRibbon,mdm::TypeDeleter<md::TrafficRibbon>>,mdm::Allocator>>>>>::__emplace_unique_key_args<md::TrafficBatchKey,std::piecewise_construct_t const&,std::tuple<md::TrafficBatchKey const&>,std::tuple<>>(*((uint64_t **)v6 + 7), v33, (uint64_t)v33);
  v22 = result;
  v23 = (_QWORD *)*((_QWORD *)result + 7);
  v34 = *((_QWORD *)result + 8);
  if ((unint64_t)v23 < v34)
    goto LABEL_29;
  v37 = *((_QWORD *)result + 6);
  v38 = ((uint64_t)v23 - v37) >> 3;
  v39 = v38 + 1;
  if ((unint64_t)(v38 + 1) >> 61)
    abort();
  v40 = v34 - v37;
  if (v40 >> 2 > v39)
    v39 = v40 >> 2;
  if ((unint64_t)v40 >= 0x7FFFFFFFFFFFFFF8)
    v41 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v41 = v39;
  if (v41)
  {
    result = (float *)(*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(**((_QWORD **)result + 9) + 16))(*((_QWORD *)result + 9), 8 * v41, 8);
    v42 = &result[2 * v38];
    v43 = &result[2 * v41];
    if (result)
    {
      v44 = v91;
      v91 = 0;
      *(_QWORD *)v42 = v44;
    }
  }
  else
  {
    v43 = 0;
    v42 = (float *)(8 * v38);
  }
  v36 = v42 + 2;
  v66 = (char *)*((_QWORD *)v22 + 6);
  v46 = (char *)*((_QWORD *)v22 + 7);
  if (v46 != v66)
  {
    v67 = v46 - v66 - 8;
    if (v67 > 0x57
      && ((v68 = (v66 - v46 + 7) & 0xFFFFFFFFFFFFFFF8,
           v69 = (unint64_t)&v46[v68],
           v70 = (char *)v42 + v68,
           v69 < (unint64_t)v42)
        ? (v71 = v70 >= v46)
        : (v71 = 1),
          v71))
    {
      v72 = (v67 >> 3) + 1;
      v73 = &v46[-8 * (v72 & 0x3FFFFFFFFFFFFFFCLL)];
      v74 = v42 - 4;
      v75 = v46 - 32;
      v76 = v72 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v78 = *(_OWORD *)v75;
        v77 = *((_OWORD *)v75 + 1);
        *(_OWORD *)v75 = 0uLL;
        *((_OWORD *)v75 + 1) = 0uLL;
        v75 -= 32;
        *((_OWORD *)v74 - 1) = v78;
        *(_OWORD *)v74 = v77;
        v74 -= 8;
        v76 -= 4;
      }
      while (v76);
      v42 -= 2 * (v72 & 0x3FFFFFFFFFFFFFFCLL);
      if (v72 == (v72 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_78:
        v46 = (char *)*((_QWORD *)v22 + 6);
        v80 = (char *)*((_QWORD *)v22 + 7);
        *((_QWORD *)v22 + 6) = v42;
        *((_QWORD *)v22 + 7) = v36;
        v61 = *((_QWORD *)v22 + 8);
        *((_QWORD *)v22 + 8) = v43;
        while (v80 != v46)
        {
          v82 = (void (***)(_QWORD))*((_QWORD *)v80 - 1);
          v80 -= 8;
          v81 = v82;
          *(_QWORD *)v80 = 0;
          if (v82)
          {
            (**v81)(v81);
            {
              v84 = operator new();
              mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v84, "VectorKitLabels", 0x5ED09DD50000000FLL);
            }
            result = (float *)(*(uint64_t (**)(uint64_t, void (***)(_QWORD), uint64_t))(*(_QWORD *)mdm::Allocator::instance(void)::alloc + 40))(mdm::Allocator::instance(void)::alloc, v81, 104);
          }
        }
LABEL_86:
        if (!v46)
          goto LABEL_88;
        goto LABEL_87;
      }
    }
    else
    {
      v73 = (char *)*((_QWORD *)v22 + 7);
    }
    do
    {
      v79 = *((_QWORD *)v73 - 1);
      v73 -= 8;
      *(_QWORD *)v73 = 0;
      *((_QWORD *)v42 - 1) = v79;
      v42 -= 2;
    }
    while (v73 != v66);
    goto LABEL_78;
  }
  *((_QWORD *)v22 + 6) = v42;
  *((_QWORD *)v22 + 7) = v36;
  v61 = *((_QWORD *)v22 + 8);
  *((_QWORD *)v22 + 8) = v43;
  if (v46)
LABEL_87:
    result = (float *)(*(uint64_t (**)(_QWORD, char *, uint64_t))(**((_QWORD **)v22 + 9) + 40))(*((_QWORD *)v22 + 9), v46, v61 - (_QWORD)v46);
LABEL_88:
  *((_QWORD *)v22 + 7) = v36;
  if (v91)
  {
    (**v91)(v91);
    if ((v85 & 1) == 0)
    {
      {
        v87 = operator new();
        mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v87, "VectorKitLabels", 0x5ED09DD50000000FLL);
      }
    }
    return (float *)(*(uint64_t (**)(uint64_t, void (***)(_QWORD), uint64_t))(*(_QWORD *)mdm::Allocator::instance(void)::alloc
                                                                                               + 40))(mdm::Allocator::instance(void)::alloc, v91, 104);
  }
  return result;
}

@end

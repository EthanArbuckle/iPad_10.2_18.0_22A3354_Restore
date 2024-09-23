@implementation RFARSessionObserver

- (RFARSessionObserver)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RFARSessionObserver;
  return -[RFARSessionObserver init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)RFARSessionObserver;
  -[RFARSessionObserver dealloc](&v2, sel_dealloc);
}

- (void)processAddedAnchors:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  RFARSessionObserver *v10;

  v4 = a3;
  v5 = *((_QWORD *)self + 21);
  v6 = *((_QWORD *)self + 22);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __43__RFARSessionObserver_processAddedAnchors___block_invoke;
  v8[3] = &unk_24EFDA058;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_group_async(v5, v6, v8);

}

void __43__RFARSessionObserver_processAddedAnchors___block_invoke(uint64_t a1)
{
  void *v1;
  void **v2;
  uint64_t v3;
  uint64_t v4;
  id **v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  void (**v10)(__int128 *__return_ptr);
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  void (*v17)(_anonymous_namespace_ *@<X0>, uint64_t@<X8>);
  id **v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  ARAnchor *v25;
  rf *v26;
  NSObject *v27;
  void **v28;
  void *p_p;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  __int128 v34;
  uint64_t v35;
  __int128 *v36;
  char v37;
  uint64_t v38;
  id **v39;
  _BYTE *v40;
  void (**v41)(_anonymous_namespace_ *@<X0>, uint64_t@<X8>);
  void *__p;
  char v43;
  char v44;
  void *v45[2];
  uint64_t v46;
  _BYTE v47[16];
  uint64_t v48;
  uint64_t v49;
  void **v50;
  char v51;
  uint64_t (*v52)(_anonymous_namespace_ *, ARAnchor *);
  uint64_t v53;
  id **v54;
  char v55;
  void (*v56)(_anonymous_namespace_ *@<X0>, uint64_t@<X8>);
  char v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  char v66;
  uint64_t v67;
  _QWORD v68[3];
  _QWORD *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _OWORD v74[6];
  uint64_t v75;
  char v76;
  char v77;
  __int16 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  char v107;
  char v108;
  char v109;
  char v110;
  char v111;
  char v112;
  char v113;
  char v114;
  char v115;
  char v116;
  __int16 v117;
  char v118;
  char v119;
  char v120;
  char v121;
  char v122;
  char v123;
  char v124;
  _QWORD v125[3];
  char v126;
  _BYTE buf[12];
  __int16 v128;
  void *v129;
  uint64_t v130;

  v130 = *MEMORY[0x24BDAC8D0];
  v76 = 0;
  v77 = 0;
  v78 = 0;
  v100 = 0;
  v102 = 0;
  v101 = 0;
  v108 = 0;
  v109 = 0;
  v110 = 0;
  v111 = 0;
  v112 = 0;
  v113 = 0;
  v114 = 0;
  v115 = 0;
  v116 = 0;
  v117 = 0;
  v118 = 0;
  v119 = 0;
  v120 = 0;
  v121 = 0;
  v122 = 0;
  v123 = 0;
  v124 = 0;
  v75 = 0;
  memset(v74, 0, sizeof(v74));
  v73 = 0u;
  v72 = 0u;
  v71 = 0u;
  v70 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v2 = (void **)(a1 + 32);
  v1 = *(void **)(a1 + 32);
  v99 = 0u;
  v107 = 0;
  v106 = 0u;
  v105 = 0u;
  v104 = 0u;
  v103 = 0u;
  v3 = objc_msgSend(v1, "count");
  v68[0] = &off_24EFD7680;
  v69 = v68;
  std::function<rf::data_flow::provider::InputData ()(NSArray<ARAnchor *> *)>::operator()((uint64_t)&v58, (uint64_t)v68, *v2);
  std::vector<rf::data_flow::provider::InputMesh>::__vdeallocate((void **)&v70);
  v70 = v58;
  *(_QWORD *)&v71 = v59;
  *(_QWORD *)&v59 = 0;
  v58 = 0uLL;
  rf::data_flow::provider::InputData::~InputData((void **)&v58);
  v48 = 0;
  v49 = v3;
  v50 = v2;
  v51 = 1;
  LOBYTE(v53) = 0;
  v55 = 0;
  _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ43__RFARSessionObserver_processAddedAnchors__EUb_E3__0EENS_14logical_negateIPFbP8ARAnchorEEEE11cache_beginEv((uint64_t)v47);
  v4 = v53;
  v5 = v54;
  _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ43__RFARSessionObserver_processAddedAnchors__EUb_E3__0EENS_14logical_negateIPFbP8ARAnchorEEEE11cache_beginEv((uint64_t)v47);
  v6 = v49;
  v45[1] = 0;
  v46 = 0;
  v45[0] = 0;
  *((_QWORD *)&v58 + 1) = v5;
  *(_QWORD *)&v59 = v47;
  *((_QWORD *)&v59 + 1) = &v56;
  if (v49 != v4)
  {
    v7 = 0;
    v8 = v4;
    do
    {
      *(_QWORD *)&v58 = v8 + 1;
      _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ43__RFARSessionObserver_processAddedAnchors__EUb_E3__0EENS_14logical_negateIPFbP8ARAnchorEEEE15satisfy_forwardERNS_14basic_iteratorINS_14adaptor_cursorINSD_INS3_6cursorEEENS_19iter_transform_viewIS3_NS_10indirectedIS4_EEE7adaptorILb0EEEEEEE(v59, (uint64_t)&v58);
      ++v7;
      v8 = v58;
    }
    while (v6 != (_QWORD)v58);
    __p = v45;
    v43 = 0;
    std::vector<rf::data_flow::EnvironmentProbe>::__vallocate[abi:ne180100](v45, v7);
    v38 = v4;
    v39 = v5;
    v40 = v47;
    v41 = &v56;
    *(void **)&v34 = v45[1];
    *(void **)buf = v45[1];
    v125[0] = &v46;
    v125[1] = buf;
    v125[2] = &v34;
    v9 = v45[1];
    v126 = 0;
    do
    {
      v10 = (void (**)(__int128 *__return_ptr))v41;
      objc_msgSend(**v39, "objectAtIndexedSubscript:", (int)v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*v10)(&v58);

      v12 = v58;
      v13 = v60;
      v9[1] = v59;
      v9[2] = v13;
      *v9 = v12;
      v14 = v61;
      v15 = v62;
      v16 = v64;
      v9[5] = v63;
      v9[6] = v16;
      v9[3] = v14;
      v9[4] = v15;
      *((_BYTE *)v9 + 112) = 0;
      *((_BYTE *)v9 + 120) = 0;
      if (v66)
      {
        *((_QWORD *)v9 + 14) = v65;
        *((_BYTE *)v9 + 120) = 1;
      }
      *((_QWORD *)v9 + 16) = v67;
      v38 = v4 + 1;
      _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ43__RFARSessionObserver_processAddedAnchors__EUb_E3__0EENS_14logical_negateIPFbP8ARAnchorEEEE15satisfy_forwardERNS_14basic_iteratorINS_14adaptor_cursorINSD_INS3_6cursorEEENS_19iter_transform_viewIS3_NS_10indirectedIS4_EEE7adaptorILb0EEEEEEE((uint64_t)v40, (uint64_t)&v38);
      v9 = (_OWORD *)(v34 + 144);
      *(_QWORD *)&v34 = v34 + 144;
      v4 = v38;
    }
    while (v6 != v38);
    v126 = 1;
    std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<rf::data_flow::EnvironmentProbe>,rf::data_flow::EnvironmentProbe*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v125);
    v45[1] = v9;
  }
  std::vector<rf::data_flow::EnvironmentProbe>::__vdeallocate((uint64_t *)&v79);
  v79 = *(_OWORD *)v45;
  *(_QWORD *)&v80 = v46;
  v45[1] = 0;
  v46 = 0;
  v45[0] = 0;
  *(_QWORD *)&v58 = v45;
  std::vector<rf::data_flow::EnvironmentProbe>::__destroy_vector::operator()[abi:ne180100]((void ***)&v58);
  v17 = (void (*)(_anonymous_namespace_ *@<X0>, uint64_t@<X8>))*(id *)(a1 + 40);
  v48 = 0;
  v49 = v3;
  v50 = v2;
  v51 = 1;
  LOBYTE(v53) = 0;
  v55 = 0;
  v56 = v17;
  v57 = 1;
  _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ43__RFARSessionObserver_processAddedAnchors__EUb_E3__0EENS_14logical_negateIPFbP8ARAnchorEEEE11cache_beginEv((uint64_t)v47);
  v19 = v53;
  v18 = v54;
  _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ43__RFARSessionObserver_processAddedAnchors__EUb_E3__0EENS_14logical_negateIPFbP8ARAnchorEEEE11cache_beginEv((uint64_t)v47);
  v20 = v49;
  v35 = 0;
  v34 = 0uLL;
  *((_QWORD *)&v58 + 1) = v18;
  *(_QWORD *)&v59 = v47;
  *((_QWORD *)&v59 + 1) = &v56;
  if (v49 != v19)
  {
    v21 = 0;
    v22 = v19;
    do
    {
      *(_QWORD *)&v58 = v22 + 1;
      _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ43__RFARSessionObserver_processAddedAnchors__EUb_E3__0EENS_14logical_negateIPFbP8ARAnchorEEEE15satisfy_forwardERNS_14basic_iteratorINS_14adaptor_cursorINSD_INS3_6cursorEEENS_19iter_transform_viewIS3_NS_10indirectedIS4_EEE7adaptorILb0EEEEEEE(v59, (uint64_t)&v58);
      ++v21;
      v22 = v58;
    }
    while (v20 != (_QWORD)v58);
    v36 = &v34;
    v37 = 0;
    std::vector<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__vallocate[abi:ne180100](&v34, v21);
    v23 = 0;
    v38 = v19;
    v39 = v18;
    v40 = v47;
    v41 = &v56;
    v24 = *((_QWORD *)&v34 + 1);
    do
    {
      objc_msgSend(**v39, "objectAtIndexedSubscript:", (int)v19);
      v25 = (ARAnchor *)objc_claimAutoreleasedReturnValue();
      v26 = (rf *)rf::data_flow::validateAnchor((uint64_t)&v58);
      rf::realityFusionLogObject(v26);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        rf::helpers::getDebugDescriptionForAnchorType((uint64_t)&v58, v45);
        if (v46 >= 0)
          v28 = v45;
        else
          v28 = (void **)v45[0];
        rf::helpers::getRFUUIDFromAnchor((uint64_t)&v58, (uint64_t)v125);
        rf::data_flow::RFUUID::string((rf::data_flow::RFUUID *)v125, &__p);
        p_p = &__p;
        if (v44 < 0)
          p_p = __p;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v28;
        v128 = 2080;
        v129 = p_p;
        _os_log_impl(&dword_227777000, v27, OS_LOG_TYPE_DEFAULT, "RFARSessionObserver: Adding %s anchor %s", buf, 0x16u);
        if (v44 < 0)
          operator delete(__p);
        if (SHIBYTE(v46) < 0)
          operator delete(v45[0]);
      }

      std::__variant_detail::__move_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__move_constructor(v24 + v23, (uint64_t)&v58);
      std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v58);
      v38 = v19 + 1;
      _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ43__RFARSessionObserver_processAddedAnchors__EUb_E3__0EENS_14logical_negateIPFbP8ARAnchorEEEE15satisfy_forwardERNS_14basic_iteratorINS_14adaptor_cursorINSD_INS3_6cursorEEENS_19iter_transform_viewIS3_NS_10indirectedIS4_EEE7adaptorILb0EEEEEEE((uint64_t)v40, (uint64_t)&v38);
      v19 = v38;
      v23 += 272;
    }
    while (v20 != v38);
    *((_QWORD *)&v34 + 1) = v24 + v23;
  }
  std::vector<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__vdeallocate((void **)v74 + 1);
  *(_OWORD *)((char *)v74 + 8) = v34;
  *((_QWORD *)&v74[1] + 1) = v35;
  v35 = 0;
  v34 = 0uLL;
  *(_QWORD *)&v58 = &v34;
  std::vector<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v58);
  if (v57)

  v30 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32);
  if (!v30)
    std::__throw_bad_function_call[abi:ne180100]();
  (*(void (**)(uint64_t, __int128 *))(*(_QWORD *)v30 + 48))(v30, &v70);
  v31 = v69;
  if (v69 == v68)
  {
    v32 = 4;
    v31 = v68;
    goto LABEL_32;
  }
  if (v69)
  {
    v32 = 5;
LABEL_32:
    (*(void (**)(void))(*v31 + 8 * v32))();
  }
  rf::data_flow::provider::InputData::~InputData((void **)&v70);
}

- (void)processUpdatedAnchors:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  RFARSessionObserver *v10;

  v4 = a3;
  v5 = *((_QWORD *)self + 21);
  v6 = *((_QWORD *)self + 22);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__RFARSessionObserver_processUpdatedAnchors___block_invoke;
  v8[3] = &unk_24EFDA058;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_group_async(v5, v6, v8);

}

void __45__RFARSessionObserver_processUpdatedAnchors___block_invoke(uint64_t a1)
{
  void *v2;
  void **v3;
  uint64_t v4;
  char *v5;
  id **v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  void (**v11)(__int128 *__return_ptr);
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  void (*v18)(_anonymous_namespace_ *@<X0>, uint64_t@<X8>);
  _QWORD *v19;
  id **v20;
  _QWORD *v21;
  unint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  ARAnchor *v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  __int128 v30;
  _QWORD v31[3];
  char v32;
  __int128 v33;
  _BYTE *v34;
  void (**v35)(_anonymous_namespace_ *@<X0>, uint64_t@<X8>);
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  id **v39;
  uint64_t *v40;
  void (**v41)(_anonymous_namespace_ *@<X0>, uint64_t@<X8>);
  _BYTE v42[16];
  uint64_t v43;
  uint64_t v44;
  void **v45;
  char v46;
  uint64_t (*v47)(_anonymous_namespace_ *, ARAnchor *);
  char *v48;
  id **v49;
  char v50;
  void (*v51)(_anonymous_namespace_ *@<X0>, uint64_t@<X8>);
  char v52;
  __int128 v53;
  _OWORD v54[6];
  uint64_t v55;
  char v56;
  uint64_t v57;
  _QWORD v58[3];
  _QWORD *v59;
  _OWORD v60[6];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  char v66;
  char v67;
  __int16 v68;
  __int128 v69;
  uint64_t v70[4];
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  char v96;
  char v97;
  char v98;
  char v99;
  char v100;
  char v101;
  char v102;
  char v103;
  char v104;
  char v105;
  __int16 v106;
  char v107;
  char v108;
  char v109;
  char v110;
  char v111;
  char v112;
  char v113;
  uint64_t v114;

  v114 = *MEMORY[0x24BDAC8D0];
  v66 = 0;
  v67 = 0;
  v68 = 0;
  v89 = 0;
  v91 = 0;
  v90 = 0;
  v97 = 0;
  v98 = 0;
  v99 = 0;
  v100 = 0;
  v101 = 0;
  v102 = 0;
  v103 = 0;
  v104 = 0;
  v105 = 0;
  v106 = 0;
  v107 = 0;
  v108 = 0;
  v109 = 0;
  v110 = 0;
  v111 = 0;
  v112 = 0;
  v113 = 0;
  v65 = 0;
  v64 = 0u;
  v63 = 0u;
  v62 = 0u;
  v61 = 0u;
  v69 = 0u;
  memset(v70, 0, sizeof(v70));
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v3 = (void **)(a1 + 32);
  v2 = *(void **)(a1 + 32);
  memset(v60, 0, sizeof(v60));
  v96 = 0;
  v95 = 0u;
  v94 = 0u;
  v93 = 0u;
  v92 = 0u;
  v4 = objc_msgSend(v2, "count");
  v58[0] = &off_24EFD7710;
  v59 = v58;
  std::function<rf::data_flow::provider::InputData ()(NSArray<ARAnchor *> *)>::operator()((uint64_t)&v53, (uint64_t)v58, *v3);
  std::vector<rf::data_flow::provider::InputMesh>::__vdeallocate((void **)&v60[1] + 1);
  *(_OWORD *)((char *)&v60[1] + 8) = *(_OWORD *)((char *)v54 + 8);
  *((_QWORD *)&v60[2] + 1) = *((_QWORD *)&v54[1] + 1);
  memset((char *)v54 + 8, 0, 24);
  rf::data_flow::provider::InputData::~InputData((void **)&v53);
  v43 = 0;
  v44 = v4;
  v45 = v3;
  v46 = 1;
  LOBYTE(v48) = 0;
  v50 = 0;
  _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ45__RFARSessionObserver_processUpdatedAnchors__EUb0_E3__2EENS_14logical_negateIPFbP8ARAnchorEEEE11cache_beginEv((uint64_t)v42);
  v5 = v48;
  v6 = v49;
  _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ45__RFARSessionObserver_processUpdatedAnchors__EUb0_E3__2EENS_14logical_negateIPFbP8ARAnchorEEEE11cache_beginEv((uint64_t)v42);
  v7 = v44;
  v31[0] = 0;
  v30 = 0uLL;
  *((_QWORD *)&v53 + 1) = v6;
  *(_QWORD *)&v54[0] = v42;
  *((_QWORD *)&v54[0] + 1) = &v51;
  if ((char *)v44 != v5)
  {
    v8 = 0;
    v9 = v5;
    do
    {
      *(_QWORD *)&v53 = v9 + 1;
      _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ45__RFARSessionObserver_processUpdatedAnchors__EUb0_E3__2EENS_14logical_negateIPFbP8ARAnchorEEEE15satisfy_forwardERNS_14basic_iteratorINS_14adaptor_cursorINSD_INS3_6cursorEEENS_19iter_transform_viewIS3_NS_10indirectedIS4_EEE7adaptorILb0EEEEEEE(*(uint64_t *)&v54[0], (uint64_t)&v53);
      ++v8;
      v9 = (char *)v53;
    }
    while (v7 != (_QWORD)v53);
    v31[2] = &v30;
    v32 = 0;
    std::vector<rf::data_flow::EnvironmentProbe>::__vallocate[abi:ne180100](&v30, v8);
    *(_QWORD *)&v33 = v5;
    *((_QWORD *)&v33 + 1) = v6;
    v34 = v42;
    v35 = &v51;
    v36 = *((_QWORD *)&v30 + 1);
    v37 = *((_QWORD *)&v30 + 1);
    v38 = v31;
    v39 = (id **)&v36;
    v40 = &v37;
    v10 = *((_QWORD *)&v30 + 1);
    LOBYTE(v41) = 0;
    do
    {
      v11 = (void (**)(__int128 *__return_ptr))v35;
      objc_msgSend(***((id ***)&v33 + 1), "objectAtIndexedSubscript:", (int)v5, (_QWORD)v30);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*v11)(&v53);

      v13 = v53;
      v14 = v54[1];
      *(_OWORD *)(v10 + 16) = v54[0];
      *(_OWORD *)(v10 + 32) = v14;
      *(_OWORD *)v10 = v13;
      v15 = v54[2];
      v16 = v54[3];
      v17 = v54[5];
      *(_OWORD *)(v10 + 80) = v54[4];
      *(_OWORD *)(v10 + 96) = v17;
      *(_OWORD *)(v10 + 48) = v15;
      *(_OWORD *)(v10 + 64) = v16;
      *(_BYTE *)(v10 + 112) = 0;
      *(_BYTE *)(v10 + 120) = 0;
      if (v56)
      {
        *(_QWORD *)(v10 + 112) = v55;
        *(_BYTE *)(v10 + 120) = 1;
      }
      *(_QWORD *)(v10 + 128) = v57;
      *(_QWORD *)&v33 = v5 + 1;
      _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ45__RFARSessionObserver_processUpdatedAnchors__EUb0_E3__2EENS_14logical_negateIPFbP8ARAnchorEEEE15satisfy_forwardERNS_14basic_iteratorINS_14adaptor_cursorINSD_INS3_6cursorEEENS_19iter_transform_viewIS3_NS_10indirectedIS4_EEE7adaptorILb0EEEEEEE((uint64_t)v34, (uint64_t)&v33);
      v10 = v37 + 144;
      v37 += 144;
      v5 = (char *)v33;
    }
    while (v7 != (_QWORD)v33);
    LOBYTE(v41) = 1;
    std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<rf::data_flow::EnvironmentProbe>,rf::data_flow::EnvironmentProbe*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&v38);
    *((_QWORD *)&v30 + 1) = v10;
  }
  std::vector<rf::data_flow::EnvironmentProbe>::__vdeallocate(&v70[1]);
  *(_OWORD *)&v70[1] = v30;
  v70[3] = v31[0];
  v31[0] = 0;
  v30 = 0uLL;
  *(_QWORD *)&v53 = &v30;
  std::vector<rf::data_flow::EnvironmentProbe>::__destroy_vector::operator()[abi:ne180100]((void ***)&v53);
  v18 = (void (*)(_anonymous_namespace_ *@<X0>, uint64_t@<X8>))*(id *)(a1 + 40);
  v43 = 0;
  v44 = v4;
  v45 = v3;
  v46 = 1;
  LOBYTE(v48) = 0;
  v50 = 0;
  v51 = v18;
  v52 = 1;
  _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ45__RFARSessionObserver_processUpdatedAnchors__EUb0_E3__2EENS_14logical_negateIPFbP8ARAnchorEEEE11cache_beginEv((uint64_t)v42);
  v19 = v48;
  v20 = v49;
  _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ45__RFARSessionObserver_processUpdatedAnchors__EUb0_E3__2EENS_14logical_negateIPFbP8ARAnchorEEEE11cache_beginEv((uint64_t)v42);
  v21 = (_QWORD *)v44;
  v34 = 0;
  v33 = 0uLL;
  *((_QWORD *)&v53 + 1) = v20;
  *(_QWORD *)&v54[0] = v42;
  *((_QWORD *)&v54[0] + 1) = &v51;
  if ((_QWORD *)v44 != v19)
  {
    v22 = 0;
    v23 = v19;
    do
    {
      *(_QWORD *)&v53 = (char *)v23 + 1;
      _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ45__RFARSessionObserver_processUpdatedAnchors__EUb0_E3__2EENS_14logical_negateIPFbP8ARAnchorEEEE15satisfy_forwardERNS_14basic_iteratorINS_14adaptor_cursorINSD_INS3_6cursorEEENS_19iter_transform_viewIS3_NS_10indirectedIS4_EEE7adaptorILb0EEEEEEE(*(uint64_t *)&v54[0], (uint64_t)&v53);
      ++v22;
      v23 = (_QWORD *)v53;
    }
    while (v21 != (_QWORD *)v53);
    *(_QWORD *)&v30 = &v33;
    BYTE8(v30) = 0;
    std::vector<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__vallocate[abi:ne180100](&v33, v22);
    v24 = 0;
    v38 = v19;
    v39 = v20;
    v40 = (uint64_t *)v42;
    v41 = &v51;
    v25 = *((_QWORD *)&v33 + 1);
    do
    {
      objc_msgSend(**v39, "objectAtIndexedSubscript:", (int)v19);
      v26 = (ARAnchor *)objc_claimAutoreleasedReturnValue();
      rf::data_flow::validateAnchor((uint64_t)&v53);

      std::__variant_detail::__move_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__move_constructor(v25 + v24, (uint64_t)&v53);
      std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v53);
      v38 = (_QWORD *)((char *)v19 + 1);
      _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ45__RFARSessionObserver_processUpdatedAnchors__EUb0_E3__2EENS_14logical_negateIPFbP8ARAnchorEEEE15satisfy_forwardERNS_14basic_iteratorINS_14adaptor_cursorINSD_INS3_6cursorEEENS_19iter_transform_viewIS3_NS_10indirectedIS4_EEE7adaptorILb0EEEEEEE((uint64_t)v40, (uint64_t)&v38);
      v19 = v38;
      v24 += 272;
    }
    while (v21 != v38);
    *((_QWORD *)&v33 + 1) = v25 + v24;
  }
  std::vector<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__vdeallocate((void **)&v61);
  v61 = v33;
  *(_QWORD *)&v62 = v34;
  v34 = 0;
  v33 = 0uLL;
  *(_QWORD *)&v53 = &v33;
  std::vector<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v53);
  if (v52)

  v27 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32);
  if (!v27)
    std::__throw_bad_function_call[abi:ne180100]();
  (*(void (**)(uint64_t, _OWORD *))(*(_QWORD *)v27 + 48))(v27, v60);
  v28 = v59;
  if (v59 == v58)
  {
    v29 = 4;
    v28 = v58;
    goto LABEL_22;
  }
  if (v59)
  {
    v29 = 5;
LABEL_22:
    (*(void (**)(void))(*v28 + 8 * v29))();
  }
  rf::data_flow::provider::InputData::~InputData((void **)v60);
}

- (void)processRemovedAnchors:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  RFARSessionObserver *v10;

  v4 = a3;
  v5 = *((_QWORD *)self + 21);
  v6 = *((_QWORD *)self + 22);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__RFARSessionObserver_processRemovedAnchors___block_invoke;
  v8[3] = &unk_24EFDA058;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_group_async(v5, v6, v8);

}

void __45__RFARSessionObserver_processRemovedAnchors___block_invoke(uint64_t a1)
{
  void *v2;
  void **v3;
  uint64_t v4;
  id **v5;
  _OWORD *v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  _OWORD *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  void *v14;
  rf::data_flow::RFUUID *v15;
  rf *v16;
  NSObject *v17;
  _OWORD *v18;
  __int128 v19;
  void **v20;
  id v21;
  id **v22;
  char *v23;
  char *v24;
  unint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  ARAnchor *v30;
  rf *v31;
  NSObject *v32;
  void *v33;
  _BYTE *v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  __int128 *v42;
  char v43;
  char *v44;
  id **v45;
  id ***v46;
  id *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  char *v53;
  void **v54;
  char v55;
  uint64_t (*v56)(_anonymous_namespace_ *, ARAnchor *);
  char *v57;
  id **v58;
  char v59;
  id v60;
  char v61;
  char *v62;
  id **v63;
  uint64_t v64;
  id *v65;
  uint64_t v66;
  void **v67;
  __int128 v68;
  _OWORD *v69;
  id **v70;
  char v71;
  _QWORD v72[3];
  _QWORD *v73;
  _OWORD v74[3];
  void *__p[2];
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _OWORD v79[3];
  uint64_t v80;
  char v81;
  char v82;
  __int16 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  char v112;
  char v113;
  char v114;
  char v115;
  char v116;
  char v117;
  char v118;
  char v119;
  char v120;
  char v121;
  __int16 v122;
  char v123;
  char v124;
  char v125;
  char v126;
  char v127;
  char v128;
  char v129;
  void *v130[2];
  char v131;
  _BYTE buf[12];
  char v133;
  uint8_t v134[4];
  void *v135;
  __int16 v136;
  _BYTE *v137;
  uint64_t v138;

  v138 = *MEMORY[0x24BDAC8D0];
  v81 = 0;
  v82 = 0;
  v83 = 0;
  v105 = 0;
  v107 = 0;
  v106 = 0;
  v113 = 0;
  v114 = 0;
  v115 = 0;
  v116 = 0;
  v117 = 0;
  v118 = 0;
  v119 = 0;
  v120 = 0;
  v121 = 0;
  v122 = 0;
  v123 = 0;
  v124 = 0;
  v125 = 0;
  v126 = 0;
  v127 = 0;
  v128 = 0;
  v129 = 0;
  v80 = 0;
  memset(v79, 0, sizeof(v79));
  v78 = 0u;
  v77 = 0u;
  v76 = 0u;
  *(_OWORD *)__p = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v3 = (void **)(a1 + 32);
  v2 = *(void **)(a1 + 32);
  memset(v74, 0, sizeof(v74));
  v112 = 0;
  v111 = 0u;
  v110 = 0u;
  v109 = 0u;
  v108 = 0u;
  v4 = objc_msgSend(v2, "count");
  v72[0] = &off_24EFD7790;
  v73 = v72;
  std::function<rf::data_flow::provider::InputData ()(NSArray<ARAnchor *> *)>::operator()((uint64_t)&v62, (uint64_t)v72, *v3);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  *(_OWORD *)__p = v68;
  *(_QWORD *)&v76 = v69;
  v69 = 0;
  v68 = 0uLL;
  rf::data_flow::provider::InputData::~InputData((void **)&v62);
  v65 = 0;
  v66 = v4;
  v67 = v3;
  LOBYTE(v68) = 1;
  LOBYTE(v69) = 0;
  v71 = 0;
  _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ45__RFARSessionObserver_processRemovedAnchors__EUb1_E3__4EENS_14logical_negateIPFbP8ARAnchorEEEE11cache_beginEv((uint64_t)&v63);
  v6 = v69;
  v5 = v70;
  _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ45__RFARSessionObserver_processRemovedAnchors__EUb1_E3__4EENS_14logical_negateIPFbP8ARAnchorEEEE11cache_beginEv((uint64_t)&v63);
  v7 = (char *)v66;
  v49 = 0;
  v50 = 0;
  v48 = 0;
  *((_QWORD *)&v51 + 1) = v5;
  *(_QWORD *)&v52 = &v63;
  if ((_OWORD *)v66 == v6)
  {
    v8 = 0;
  }
  else
  {
    v9 = 0;
    v10 = v6;
    do
    {
      *(_QWORD *)&v51 = (char *)v10 + 1;
      _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ45__RFARSessionObserver_processRemovedAnchors__EUb1_E3__4EENS_14logical_negateIPFbP8ARAnchorEEEE15satisfy_forwardERNS_14basic_iteratorINS_14adaptor_cursorINSD_INS3_6cursorEEENS_19iter_transform_viewIS3_NS_10indirectedIS4_EEE7adaptorILb0EEEEEEE(v52, (uint64_t)&v51);
      ++v9;
      v10 = (_OWORD *)v51;
    }
    while (v7 != (char *)v51);
    std::vector<rf::data_flow::RFUUID>::__vallocate[abi:ne180100](&v48, v9);
    v11 = 0;
    v45 = v5;
    v46 = &v63;
    v12 = v49;
    *(_QWORD *)&v13 = 136315138;
    v38 = v13;
    do
    {
      objc_msgSend(**v45, "objectAtIndexedSubscript:", (int)v6, v38);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "identifier");
      v15 = (rf::data_flow::RFUUID *)objc_claimAutoreleasedReturnValue();
      rf::data_flow::RFUUID::copy(v15, (uint64_t)&v51);

      rf::realityFusionLogObject(v16);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        rf::data_flow::RFUUID::string((rf::data_flow::RFUUID *)&v51, v130);
        v20 = v130;
        if (v131 < 0)
          v20 = (void **)v130[0];
        *(_DWORD *)buf = v38;
        *(_QWORD *)&buf[4] = v20;
        _os_log_debug_impl(&dword_227777000, v17, OS_LOG_TYPE_DEBUG, "RFARSessionObserver: Removing probe %s", buf, 0xCu);
        if (v131 < 0)
          operator delete(v130[0]);
      }

      v18 = (_OWORD *)(v12 + v11);
      v19 = v52;
      *v18 = v51;
      v18[1] = v19;
      v44 = (char *)v6 + 1;
      _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ45__RFARSessionObserver_processRemovedAnchors__EUb1_E3__4EENS_14logical_negateIPFbP8ARAnchorEEEE15satisfy_forwardERNS_14basic_iteratorINS_14adaptor_cursorINSD_INS3_6cursorEEENS_19iter_transform_viewIS3_NS_10indirectedIS4_EEE7adaptorILb0EEEEEEE((uint64_t)v46, (uint64_t)&v44);
      v6 = v44;
      v11 += 32;
    }
    while (v7 != v44);
    v8 = v12 + v11;
    v49 = v12 + v11;
  }
  if ((_QWORD)v87)
  {
    *((_QWORD *)&v87 + 1) = v87;
    operator delete((void *)v87);
    v8 = v49;
  }
  *(_QWORD *)&v87 = v48;
  *((_QWORD *)&v87 + 1) = v8;
  *(_QWORD *)&v88 = v50;
  v21 = *(id *)(a1 + 40);
  *((_QWORD *)&v52 + 1) = 0;
  v53 = (char *)v4;
  v54 = v3;
  v55 = 1;
  LOBYTE(v57) = 0;
  v59 = 0;
  v60 = v21;
  v61 = 1;
  _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ45__RFARSessionObserver_processRemovedAnchors__EUb1_E3__4EENS_14logical_negateIPFbP8ARAnchorEEEE11cache_beginEv((uint64_t)&v51 + 8);
  v23 = v57;
  v22 = v58;
  _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ45__RFARSessionObserver_processRemovedAnchors__EUb1_E3__4EENS_14logical_negateIPFbP8ARAnchorEEEE11cache_beginEv((uint64_t)&v51 + 8);
  v24 = v53;
  v41 = 0;
  v40 = 0uLL;
  v63 = v22;
  v64 = (uint64_t)&v51 + 8;
  v65 = &v60;
  if (v53 != v23)
  {
    v25 = 0;
    v26 = v23;
    do
    {
      v62 = v26 + 1;
      _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ45__RFARSessionObserver_processRemovedAnchors__EUb1_E3__4EENS_14logical_negateIPFbP8ARAnchorEEEE15satisfy_forwardERNS_14basic_iteratorINS_14adaptor_cursorINSD_INS3_6cursorEEENS_19iter_transform_viewIS3_NS_10indirectedIS4_EEE7adaptorILb0EEEEEEE(v64, (uint64_t)&v62);
      ++v25;
      v26 = v62;
    }
    while (v24 != v62);
    v42 = &v40;
    v43 = 0;
    std::vector<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__vallocate[abi:ne180100](&v40, v25);
    v27 = 0;
    v44 = v23;
    v45 = v22;
    v46 = (id ***)&v51 + 1;
    v47 = &v60;
    v28 = *((_QWORD *)&v40 + 1);
    *(_QWORD *)&v29 = 136315394;
    v39 = v29;
    do
    {
      objc_msgSend(**v45, "objectAtIndexedSubscript:", (int)v23, v39);
      v30 = (ARAnchor *)objc_claimAutoreleasedReturnValue();
      v31 = (rf *)rf::data_flow::validateAnchor((uint64_t)&v62);
      rf::realityFusionLogObject(v31);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        rf::helpers::getDebugDescriptionForAnchorType((uint64_t)&v62, &v48);
        if (v50 >= 0)
          v33 = &v48;
        else
          v33 = v48;
        rf::helpers::getRFUUIDFromAnchor((uint64_t)&v62, (uint64_t)v130);
        rf::data_flow::RFUUID::string((rf::data_flow::RFUUID *)v130, buf);
        v34 = buf;
        if (v133 < 0)
          v34 = *(_BYTE **)buf;
        *(_DWORD *)v134 = v39;
        v135 = v33;
        v136 = 2080;
        v137 = v34;
        _os_log_debug_impl(&dword_227777000, v32, OS_LOG_TYPE_DEBUG, "RFARSessionObserver: Removing %s anchor %s", v134, 0x16u);
        if (v133 < 0)
          operator delete(*(void **)buf);
        if (SHIBYTE(v50) < 0)
          operator delete(v48);
      }

      std::__variant_detail::__move_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__move_constructor(v28 + v27, (uint64_t)&v62);
      std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v62);
      v44 = v23 + 1;
      _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ45__RFARSessionObserver_processRemovedAnchors__EUb1_E3__4EENS_14logical_negateIPFbP8ARAnchorEEEE15satisfy_forwardERNS_14basic_iteratorINS_14adaptor_cursorINSD_INS3_6cursorEEENS_19iter_transform_viewIS3_NS_10indirectedIS4_EEE7adaptorILb0EEEEEEE((uint64_t)v46, (uint64_t)&v44);
      v23 = v44;
      v27 += 272;
    }
    while (v24 != v44);
    *((_QWORD *)&v40 + 1) = v28 + v27;
  }
  std::vector<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__vdeallocate((void **)v79 + 1);
  *(_OWORD *)((char *)v79 + 8) = v40;
  *((_QWORD *)&v79[1] + 1) = v41;
  v41 = 0;
  v40 = 0uLL;
  v62 = (char *)&v40;
  std::vector<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v62);
  if (v61)

  v35 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32);
  if (!v35)
    std::__throw_bad_function_call[abi:ne180100]();
  (*(void (**)(uint64_t, _OWORD *))(*(_QWORD *)v35 + 48))(v35, v74);
  v36 = v73;
  if (v73 == v72)
  {
    v37 = 4;
    v36 = v72;
    goto LABEL_40;
  }
  if (v73)
  {
    v37 = 5;
LABEL_40:
    (*(void (**)(void))(*v36 + 8 * v37))();
  }
  rf::data_flow::provider::InputData::~InputData((void **)v74);
}

- (void)processUpdatedExternalAnchors:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  RFARSessionObserver *v10;

  v4 = a3;
  v5 = *((_QWORD *)self + 21);
  v6 = *((_QWORD *)self + 22);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__RFARSessionObserver_processUpdatedExternalAnchors___block_invoke;
  v8[3] = &unk_24EFDA058;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_group_async(v5, v6, v8);

}

void __53__RFARSessionObserver_processUpdatedExternalAnchors___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void **v7;
  void **v8;
  void **v9;
  uint64_t v10;
  unint64_t v11;
  void **v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  ARAnchor *v16;
  rf *v17;
  NSObject *v18;
  void **v19;
  void **v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  __int128 *v25;
  char v26;
  void **v27;
  id **v28;
  _QWORD *v29;
  id *v30;
  void *__p[2];
  char v32;
  void *v33[2];
  char v34;
  _QWORD v35[3];
  void **v36;
  uint64_t v37;
  char v38;
  uint64_t (*v39)(_anonymous_namespace_ *, ARAnchor *);
  void **v40;
  void **v41;
  char v42;
  id v43;
  char v44;
  _OWORD v45[9];
  __int128 v46;
  uint64_t v47;
  char v48;
  char v49;
  __int16 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  char v79;
  char v80;
  char v81;
  char v82;
  char v83;
  char v84;
  char v85;
  char v86;
  char v87;
  char v88;
  __int16 v89;
  char v90;
  char v91;
  char v92;
  char v93;
  char v94;
  char v95;
  char v96;
  void **v97[2];
  _QWORD *v98;
  id *v99;
  uint8_t v100[32];
  uint8_t buf[4];
  void **v102;
  __int16 v103;
  void **v104;
  uint64_t v105;

  v105 = *MEMORY[0x24BDAC8D0];
  v48 = 0;
  v49 = 0;
  v50 = 0;
  v72 = 0;
  v74 = 0;
  v73 = 0;
  v80 = 0;
  v81 = 0;
  v82 = 0;
  v83 = 0;
  v84 = 0;
  v85 = 0;
  v86 = 0;
  v87 = 0;
  v88 = 0;
  v89 = 0;
  v90 = 0;
  v91 = 0;
  v92 = 0;
  v93 = 0;
  v94 = 0;
  v95 = 0;
  v96 = 0;
  v47 = 0;
  v46 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v3 = a1 + 32;
  v2 = *(void **)(a1 + 32);
  memset(v45, 0, sizeof(v45));
  v79 = 0;
  v78 = 0u;
  v77 = 0u;
  v76 = 0u;
  v75 = 0u;
  v4 = objc_msgSend(v2, "count");
  v5 = a1;
  v6 = *(id *)(a1 + 40);
  v35[2] = 0;
  v36 = (void **)v4;
  v37 = v3;
  v38 = 1;
  LOBYTE(v40) = 0;
  v42 = 0;
  v43 = v6;
  v44 = 1;
  _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ53__RFARSessionObserver_processUpdatedExternalAnchors__EUb2_E3__7EENS_14logical_negateIPFbP8ARAnchorEEEE11cache_beginEv((uint64_t)v35);
  v8 = v40;
  v7 = v41;
  _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ53__RFARSessionObserver_processUpdatedExternalAnchors__EUb2_E3__7EENS_14logical_negateIPFbP8ARAnchorEEEE11cache_beginEv((uint64_t)v35);
  v9 = v36;
  v24 = 0;
  v23 = 0uLL;
  v97[1] = v7;
  v98 = v35;
  v99 = &v43;
  if (v36 == v8)
  {
    v10 = a1;
  }
  else
  {
    v11 = 0;
    v12 = v8;
    do
    {
      v97[0] = (void **)((char *)v12 + 1);
      _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ53__RFARSessionObserver_processUpdatedExternalAnchors__EUb2_E3__7EENS_14logical_negateIPFbP8ARAnchorEEEE15satisfy_forwardERNS_14basic_iteratorINS_14adaptor_cursorINSD_INS3_6cursorEEENS_19iter_transform_viewIS3_NS_10indirectedIS4_EEE7adaptorILb0EEEEEEE((uint64_t)v98, (uint64_t)v97);
      ++v11;
      v12 = v97[0];
    }
    while (v9 != v97[0]);
    v25 = &v23;
    v26 = 0;
    std::vector<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__vallocate[abi:ne180100](&v23, v11);
    v13 = 0;
    v27 = v8;
    v28 = (id **)v7;
    v29 = v35;
    v30 = &v43;
    v14 = *((_QWORD *)&v23 + 1);
    *(_QWORD *)&v15 = 136315394;
    v22 = v15;
    v10 = a1;
    do
    {
      objc_msgSend(**v28, "objectAtIndexedSubscript:", (int)v8, v22);
      v16 = (ARAnchor *)objc_claimAutoreleasedReturnValue();
      v17 = (rf *)rf::data_flow::validateAnchor((uint64_t)v97);
      rf::realityFusionLogObject(v17);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        rf::helpers::getDebugDescriptionForAnchorType((uint64_t)v97, v33);
        if (v34 >= 0)
          v19 = v33;
        else
          v19 = (void **)v33[0];
        rf::helpers::getRFUUIDFromAnchor((uint64_t)v97, (uint64_t)v100);
        rf::data_flow::RFUUID::string((rf::data_flow::RFUUID *)v100, __p);
        v20 = __p;
        if (v32 < 0)
          v20 = (void **)__p[0];
        *(_DWORD *)buf = v22;
        v102 = v19;
        v103 = 2080;
        v104 = v20;
        _os_log_impl(&dword_227777000, v18, OS_LOG_TYPE_DEFAULT, "RFARSessionObserver: Marking %s anchor %s external", buf, 0x16u);
        if (v32 < 0)
          operator delete(__p[0]);
        v10 = v5;
        if (v34 < 0)
          operator delete(v33[0]);
      }

      std::__variant_detail::__move_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__move_constructor(v14 + v13, (uint64_t)v97);
      std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v97);
      v27 = (void **)((char *)v8 + 1);
      _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ53__RFARSessionObserver_processUpdatedExternalAnchors__EUb2_E3__7EENS_14logical_negateIPFbP8ARAnchorEEEE15satisfy_forwardERNS_14basic_iteratorINS_14adaptor_cursorINSD_INS3_6cursorEEENS_19iter_transform_viewIS3_NS_10indirectedIS4_EEE7adaptorILb0EEEEEEE((uint64_t)v29, (uint64_t)&v27);
      v8 = v27;
      v13 += 272;
    }
    while (v9 != v27);
    *((_QWORD *)&v23 + 1) = v14 + v13;
  }
  std::vector<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__vdeallocate((void **)&v46);
  v46 = v23;
  v47 = v24;
  v24 = 0;
  v23 = 0uLL;
  v97[0] = (void **)&v23;
  std::vector<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__destroy_vector::operator()[abi:ne180100](v97);
  if (v44)

  v21 = *(_QWORD *)(*(_QWORD *)(v10 + 40) + 32);
  if (!v21)
    std::__throw_bad_function_call[abi:ne180100]();
  (*(void (**)(uint64_t, _OWORD *))(*(_QWORD *)v21 + 48))(v21, v45);
  rf::data_flow::provider::InputData::~InputData((void **)v45);
}

- (void)session:(id)a3 didAddAnchors:(id)a4
{
  -[RFARSessionObserver processAddedAnchors:](self, "processAddedAnchors:", a4);
}

- (void)session:(id)a3 didUpdateAnchors:(id)a4
{
  -[RFARSessionObserver processUpdatedAnchors:](self, "processUpdatedAnchors:", a4);
}

- (void)session:(id)a3 didRemoveAnchors:(id)a4
{
  -[RFARSessionObserver processRemovedAnchors:](self, "processRemovedAnchors:", a4);
}

- (void)session:(id)a3 didUpdateExternalAnchors:(id)a4
{
  -[RFARSessionObserver processUpdatedExternalAnchors:](self, "processUpdatedExternalAnchors:", a4);
}

- (void)setCallback:(function<void (rf::data_flow::provider::InputData)&&
{
  function<void (rf::data_flow::provider::InputData &&)> *f;
  char *v5;
  _QWORD *v6;
  char *v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD v10[3];
  _QWORD *v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  f = (function<void (rf::data_flow::provider::InputData &&)> *)a3->__f_.__f_;
  if (f)
  {
    if (f == a3)
    {
      v11 = v10;
      (*(void (**)(function<void (rf::data_flow::provider::InputData &&)> *, _QWORD *))(*(_QWORD *)a3->__f_.__buf_.__lx
                                                                                                 + 24))(a3, v10);
    }
    else
    {
      v11 = (_QWORD *)(*(uint64_t (**)(function<void (rf::data_flow::provider::InputData &&)> *, SEL))(*(_QWORD *)f->__f_.__buf_.__lx + 16))(f, a2);
    }
  }
  else
  {
    v11 = 0;
  }
  v5 = (char *)self + 8;
  if (v10 != (_QWORD *)((char *)self + 8))
  {
    v6 = v11;
    v7 = (char *)*((_QWORD *)self + 4);
    if (v11 == v10)
    {
      if (v7 == v5)
      {
        (*(void (**)(_QWORD *, _QWORD *))(v10[0] + 24))(v10, v12);
        (*(void (**)(_QWORD *))(*v11 + 32))(v11);
        v11 = 0;
        (*(void (**)(_QWORD, _QWORD *))(**((_QWORD **)self + 4) + 24))(*((_QWORD *)self + 4), v10);
        (*(void (**)(_QWORD))(**((_QWORD **)self + 4) + 32))(*((_QWORD *)self + 4));
        *((_QWORD *)self + 4) = 0;
        v11 = v10;
        (*(void (**)(_QWORD *, char *))(v12[0] + 24))(v12, (char *)self + 8);
        (*(void (**)(_QWORD *))(v12[0] + 32))(v12);
      }
      else
      {
        (*(void (**)(_QWORD *, char *))(v10[0] + 24))(v10, (char *)self + 8);
        (*(void (**)(_QWORD *))(*v11 + 32))(v11);
        v11 = (_QWORD *)*((_QWORD *)self + 4);
      }
      *((_QWORD *)self + 4) = v5;
    }
    else if (v7 == v5)
    {
      (*(void (**)(char *, _QWORD *))(*(_QWORD *)v5 + 24))((char *)self + 8, v10);
      (*(void (**)(_QWORD))(**((_QWORD **)self + 4) + 32))(*((_QWORD *)self + 4));
      *((_QWORD *)self + 4) = v11;
      v11 = v10;
    }
    else
    {
      v11 = (_QWORD *)*((_QWORD *)self + 4);
      *((_QWORD *)self + 4) = v6;
    }
  }
  v8 = v11;
  if (v11 == v10)
  {
    v9 = 4;
    v8 = v10;
  }
  else
  {
    if (!v11)
      return;
    v9 = 5;
  }
  (*(void (**)(void))(*v8 + 8 * v9))();
}

- (OS_dispatch_group)dispatchGroup
{
  return (OS_dispatch_group *)*((id *)self + 21);
}

- (void)updateSession:(id)a3 withTime:(double)a4
{
  id v5;
  rf *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  int64x2_t v14;
  BOOL v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  std::mutex::lock((std::mutex *)((char *)self + 96));
  v7 = *((_QWORD *)self + 10);
  if (*((_BYTE *)self + 88))
    v8 = v7 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    v9 = v7 - 1;
    do
    {
      rf::realityFusionLogObject(v6);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)self + 6) + ((*((_QWORD *)self + 9) >> 6) & 0x3FFFFFFFFFFFFF8))+ 8 * (*((_QWORD *)self + 9) & 0x1FFLL)), "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "UUIDString");
        v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v13 = objc_msgSend(v12, "UTF8String");
        *(_DWORD *)buf = 136315138;
        v18 = v13;
        _os_log_impl(&dword_227777000, v10, OS_LOG_TYPE_DEFAULT, "RFARSessionObserver: Attempting to re-add anchor %s in queue to ARKit", buf, 0xCu);

      }
      objc_msgSend(v5, "addAnchor:", *(_QWORD *)(*(_QWORD *)(*((_QWORD *)self + 6) + ((*((_QWORD *)self + 9) >> 6) & 0x3FFFFFFFFFFFFF8))+ 8 * (*((_QWORD *)self + 9) & 0x1FFLL)));
      objc_release(*(id *)(*(_QWORD *)(*((_QWORD *)self + 6) + ((*((_QWORD *)self + 9) >> 6) & 0x3FFFFFFFFFFFFF8))
                         + 8 * (*((_QWORD *)self + 9) & 0x1FFLL)));
      v14 = vaddq_s64(*(int64x2_t *)((char *)self + 72), (int64x2_t)xmmword_2277F1AB0);
      *(int64x2_t *)((char *)self + 72) = v14;
      if (v14.i64[0] >= 0x400uLL)
      {
        operator delete(**((void ***)self + 6));
        *((_QWORD *)self + 6) += 8;
        *((_QWORD *)self + 9) -= 512;
      }
      v16 = v9-- != 0;
    }
    while (*((_BYTE *)self + 88) && v16);
  }
  std::mutex::unlock((std::mutex *)((char *)self + 96));

}

- (void)setDispatchGroup:(id)a3
{
  objc_storeStrong((id *)self + 21, a3);
}

- (OS_dispatch_queue)backgroundComputeQueue
{
  return (OS_dispatch_queue *)*((_QWORD *)self + 22);
}

- (void)setBackgroundComputeQueue:(id)a3
{
  objc_storeStrong((id *)self + 22, a3);
}

- (BOOL)pinchLeft
{
  return *((_BYTE *)self + 161);
}

- (BOOL)pinchRight
{
  return *((_BYTE *)self + 162);
}

- (void).cxx_destruct
{
  void **v3;
  void **v4;
  _QWORD *v5;
  unint64_t v6;
  void **v7;
  void **v8;
  uint64_t v9;
  void *v10;
  void **v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  RFARSessionObserver *v19;
  uint64_t v20;

  objc_storeStrong((id *)self + 22, 0);
  objc_storeStrong((id *)self + 21, 0);
  std::mutex::~mutex((std::mutex *)((char *)self + 96));
  v3 = (void **)*((_QWORD *)self + 6);
  v4 = (void **)*((_QWORD *)self + 7);
  if (v4 == v3)
  {
    v5 = (_QWORD *)((char *)self + 80);
    v4 = (void **)*((_QWORD *)self + 6);
  }
  else
  {
    v5 = (_QWORD *)((char *)self + 80);
    v6 = *((_QWORD *)self + 9);
    v7 = &v3[v6 >> 9];
    v8 = (void **)((char *)*v7 + 8 * (v6 & 0x1FF));
    v9 = *(uint64_t *)((char *)v3 + (((*((_QWORD *)self + 10) + v6) >> 6) & 0x3FFFFFFFFFFFFF8))
       + 8 * ((*((_QWORD *)self + 10) + v6) & 0x1FF);
    if (v8 != (void **)v9)
    {
      do
      {
        v10 = *v8++;

        if ((char *)v8 - (_BYTE *)*v7 == 4096)
        {
          v11 = (void **)v7[1];
          ++v7;
          v8 = v11;
        }
      }
      while (v8 != (void **)v9);
      v3 = (void **)*((_QWORD *)self + 6);
      v4 = (void **)*((_QWORD *)self + 7);
    }
  }
  *v5 = 0;
  v12 = (char *)v4 - (char *)v3;
  if ((unint64_t)((char *)v4 - (char *)v3) >= 0x11)
  {
    do
    {
      operator delete(*v3);
      v4 = (void **)*((_QWORD *)self + 7);
      v3 = (void **)(*((_QWORD *)self + 6) + 8);
      *((_QWORD *)self + 6) = v3;
      v12 = (char *)v4 - (char *)v3;
    }
    while ((unint64_t)((char *)v4 - (char *)v3) > 0x10);
  }
  v13 = v12 >> 3;
  if (v13 == 1)
  {
    v14 = 256;
    goto LABEL_14;
  }
  if (v13 == 2)
  {
    v14 = 512;
LABEL_14:
    *((_QWORD *)self + 9) = v14;
  }
  if (v3 != v4)
  {
    do
    {
      v15 = *v3++;
      operator delete(v15);
    }
    while (v3 != v4);
    v17 = *((_QWORD *)self + 6);
    v16 = *((_QWORD *)self + 7);
    if (v16 != v17)
      *((_QWORD *)self + 7) = v16 + ((v17 - v16 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  v18 = (void *)*((_QWORD *)self + 5);
  if (v18)
    operator delete(v18);
  v19 = (RFARSessionObserver *)*((_QWORD *)self + 4);
  if (v19 == (RFARSessionObserver *)((char *)self + 8))
  {
    v20 = 4;
    v19 = (RFARSessionObserver *)((char *)self + 8);
  }
  else
  {
    if (!v19)
      return;
    v20 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v19 + 8 * v20))();
}

- (id).cxx_construct
{
  *((_QWORD *)self + 10) = 0;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_QWORD *)self + 12) = 850045863;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *((_QWORD *)self + 19) = 0;
  return self;
}

@end

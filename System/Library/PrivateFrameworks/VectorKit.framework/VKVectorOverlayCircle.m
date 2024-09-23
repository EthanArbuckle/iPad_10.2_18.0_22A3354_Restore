@implementation VKVectorOverlayCircle

- (VKVectorOverlayCircle)initWithMapRect:(id)a3 lineWidth:(double)a4 fillColor:(CGColor *)a5 strokeColor:(CGColor *)a6 alpha:(double)a7
{
  double var1;
  double var0;
  double v13;
  double v14;
  VKVectorOverlayCircle *v15;
  VKVectorOverlayCircle *v16;
  VKVectorOverlayCircle *v17;
  char *v18;
  float **p_style;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v22;
  float *v23;
  float lineWidth;
  os_unfair_lock_s *v25;
  float *v26;
  float alpha;
  os_unfair_lock_s *v28;
  double v29;
  double v30;
  char *v31;
  _QWORD *v32;
  Matrix<double, 2, 1> minimum;
  __shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  std::__shared_weak_count_vtbl *v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  std::__shared_weak_count_vtbl *v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  std::__shared_weak_count *v49;
  unint64_t *v50;
  unint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  std::__shared_weak_count *v54;
  unint64_t *v55;
  unint64_t v56;
  ggl::Circle::FillPipelineSetup *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t *v64;
  unint64_t v65;
  std::__shared_weak_count *v66;
  unint64_t *v67;
  unint64_t v68;
  ggl::Circle::FillPipelineSetup *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t *v76;
  unint64_t v77;
  std::__shared_weak_count *v78;
  unint64_t *v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  _QWORD *v85;
  uint64_t v86;
  std::__shared_weak_count *v87;
  unint64_t *v88;
  unint64_t v89;
  ggl::Circle::FillPipelineSetup *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t *v97;
  unint64_t v98;
  std::__shared_weak_count *v99;
  unint64_t *v100;
  unint64_t v101;
  ggl::Circle::FillPipelineSetup *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t *v109;
  unint64_t v110;
  std::__shared_weak_count *v111;
  unint64_t *v112;
  unint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t shared_weak_owners;
  unint64_t v119;
  unint64_t v120;
  unint64_t v121;
  std::__shared_weak_count *v122;
  unint64_t *v123;
  unint64_t v124;
  VKVectorOverlayCircle *v125;
  unint64_t v127;
  objc_super v128;
  uint64_t v129[2];
  std::__shared_weak_count *v130;
  std::__shared_weak_count *v131;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v13 = a3.var0.var1;
  v14 = a3.var0.var0;
  v128.receiver = self;
  v128.super_class = (Class)VKVectorOverlayCircle;
  v15 = -[VKVectorOverlayData init](&v128, sel_init);
  v16 = v15;
  v17 = v15;
  if (v15)
  {
    v15->_lineWidth = a4;
    v15->_fillColor = CGColorRetain(a5);
    v17->_strokeColor = CGColorRetain(a6);
    v17->_alpha = a7;
    v18 = (char *)operator new(0x48uLL);
    *((_QWORD *)v18 + 1) = 0;
    *((_QWORD *)v18 + 2) = 0;
    *(_QWORD *)v18 = &off_1E42DCBD8;
    *(_OWORD *)(v18 + 40) = 0u;
    *(_OWORD *)(v18 + 56) = 0u;
    *(_OWORD *)(v18 + 24) = 0u;
    p_style = (float **)&v16->_style;
    cntrl = (std::__shared_weak_count *)v16->_style.__cntrl_;
    v16->_style.__ptr_ = (Style *)(v18 + 24);
    v16->_style.__cntrl_ = (__shared_weak_count *)v18;
    if (cntrl)
    {
      p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
      do
        v22 = __ldaxr(p_shared_owners);
      while (__stlxr(v22 - 1, p_shared_owners));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
        std::__shared_weak_count::__release_weak(cntrl);
      }
    }
    v23 = *p_style;
    lineWidth = v17->_lineWidth;
    v25 = (os_unfair_lock_s *)(*p_style + 11);
    os_unfair_lock_lock(v25);
    *v23 = lineWidth;
    os_unfair_lock_unlock(v25);
    v26 = *p_style;
    alpha = v17->_alpha;
    v28 = (os_unfair_lock_s *)(*p_style + 11);
    os_unfair_lock_lock(v28);
    v26[9] = alpha;
    os_unfair_lock_unlock(v28);
    v29 = *(double *)(MEMORY[0x1E0D266E8] + 16);
    v30 = *(double *)(MEMORY[0x1E0D266E8] + 24);
    v16->_bounds._minimum._e[0] = v14 / v29;
    v16->_bounds._minimum._e[1] = 1.0 - (var1 + v13) / v30;
    v16->_bounds._maximum._e[0] = (var0 + v14) / v29;
    v16->_bounds._maximum._e[1] = 1.0 - v13 / v30;
    v31 = (char *)operator new(0xC0uLL);
    v32 = v31;
    *((_QWORD *)v31 + 1) = 0;
    *((_QWORD *)v31 + 2) = 0;
    *(_QWORD *)v31 = &off_1E42DCC10;
    minimum = v16->_bounds._minimum;
    *(Matrix<double, 2, 1> *)(v31 + 40) = v16->_bounds._maximum;
    *(Matrix<double, 2, 1> *)(v31 + 24) = minimum;
    *((_QWORD *)v31 + 7) = *p_style;
    v34 = v16->_style.__cntrl_;
    *((_QWORD *)v31 + 8) = v34;
    if (v34)
    {
      v35 = (unint64_t *)((char *)v34 + 8);
      do
        v36 = __ldxr(v35);
      while (__stxr(v36 + 1, v35));
    }
    *((_OWORD *)v31 + 10) = 0u;
    *((_OWORD *)v31 + 11) = 0u;
    *((_OWORD *)v31 + 8) = 0u;
    *((_OWORD *)v31 + 9) = 0u;
    *((_OWORD *)v31 + 6) = 0u;
    *((_OWORD *)v31 + 7) = 0u;
    *((_OWORD *)v31 + 5) = 0u;
    v37 = (std::__shared_weak_count *)operator new(0xF8uLL);
    v37->__shared_owners_ = 0;
    v38 = (unint64_t *)&v37->__shared_owners_;
    v37->__shared_weak_owners_ = 0;
    v37->__vftable = (std::__shared_weak_count_vtbl *)&off_1E42DF1E8;
    ggl::BufferData::BufferData((uint64_t)&v37[1], 2, 1, 0, 6, 6);
    LODWORD(v37[10].__vftable) = 0;
    v37[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1E42B6B88;
    v37[1].__shared_owners_ = 2;
    v37[9].__shared_owners_ = (uint64_t)&unk_1E42B6BA8;
    v37[9].__shared_weak_owners_ = (uint64_t)"circle index data";
    v39 = v37[4].__vftable;
    v39->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))0x200010000;
    LODWORD(v39->~__shared_weak_count_0) = 196610;
    v40 = (std::__shared_weak_count *)operator new(0xF8uLL);
    v40->__shared_owners_ = 0;
    v41 = (unint64_t *)&v40->__shared_owners_;
    v40->__shared_weak_owners_ = 0;
    v40->__vftable = (std::__shared_weak_count_vtbl *)&off_1E42DF840;
    ggl::BufferData::BufferData((uint64_t)&v40[1], 8, 0, 0, 6, 4);
    v40[9].__shared_weak_owners_ = (uint64_t)"circle vertex data";
    v40[10].__vftable = (std::__shared_weak_count_vtbl *)&ggl::CommonMesh::bufferPos2Reflection;
    v40[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1E42B74E0;
    v40[9].__shared_owners_ = (uint64_t)&unk_1E42B7500;
    v127 = 4 * v40[1].__shared_owners_;
    v42 = v40[4].__vftable;
    *(_OWORD *)&v42->~__shared_weak_count = xmmword_19FFB3580;
    *(_OWORD *)&v42->__on_zero_shared = xmmword_19FFB3950;
    v43 = operator new();
    v130 = v40 + 1;
    v131 = v40;
    do
      v44 = __ldxr(v41);
    while (__stxr(v44 + 1, v41));
    v129[0] = (uint64_t)&v37[1];
    v129[1] = (uint64_t)v37;
    do
      v45 = __ldxr(v38);
    while (__stxr(v45 + 1, v38));
    v46 = ggl::CommonMesh::Pos2Mesh::Pos2Mesh(v43, (uint64_t)"CircleUnitQuad", (uint64_t *)&v130, v129);
    v47 = v32[11];
    v32[11] = v46;
    if (v47)
      (*(void (**)(uint64_t))(*(_QWORD *)v47 + 8))(v47);
    do
      v48 = __ldaxr(v38);
    while (__stlxr(v48 - 1, v38));
    if (!v48)
    {
      ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
      std::__shared_weak_count::__release_weak(v37);
    }
    v49 = v131;
    if (v131)
    {
      v50 = (unint64_t *)&v131->__shared_owners_;
      do
        v51 = __ldaxr(v50);
      while (__stlxr(v51 - 1, v50));
      if (!v51)
      {
        ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
        std::__shared_weak_count::__release_weak(v49);
      }
    }
    v52 = operator new(0xE8uLL);
    v52[1] = 0;
    v52[2] = 0;
    *v52 = &off_1E42E26A0;
    v53 = ggl::BufferData::BufferData((uint64_t)(v52 + 3), qword_1EE545B18, 2, 1, 6, 1);
    v52[28] = ggl::Circle::View::reflection(void)::reflection;
    v52[3] = &off_1E42B9A10;
    v54 = (std::__shared_weak_count *)v32[13];
    v32[12] = v53;
    v32[13] = v52;
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
    v57 = (ggl::Circle::FillPipelineSetup *)operator new();
    v58 = ggl::Circle::FillPipelineSetup::FillPipelineSetup(v57);
    v59 = v32[16];
    v32[16] = v58;
    if (v59)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v59 + 8))(v59);
      v58 = v32[16];
    }
    v60 = *(_QWORD *)(v58 + 64);
    *(_QWORD *)(v60 + 24) = 0;
    v61 = v32[12];
    *(_QWORD *)(v60 + 16) = v61;
    v62 = *(_QWORD *)(v58 + 160);
    v63 = v32[13];
    if (v63)
    {
      v64 = (unint64_t *)(v63 + 8);
      do
        v65 = __ldxr(v64);
      while (__stxr(v65 + 1, v64));
    }
    v66 = *(std::__shared_weak_count **)(v62 + 24);
    *(_QWORD *)(v62 + 16) = v61;
    *(_QWORD *)(v62 + 24) = v63;
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
    v69 = (ggl::Circle::FillPipelineSetup *)operator new();
    v70 = ggl::Circle::FillPipelineSetup::FillPipelineSetup(v69);
    v71 = v32[17];
    v32[17] = v70;
    if (v71)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v71 + 8))(v71);
      v70 = v32[17];
    }
    v72 = *(_QWORD *)(v70 + 64);
    *(_QWORD *)(v72 + 24) = 0;
    v73 = v32[12];
    *(_QWORD *)(v72 + 16) = v73;
    v74 = *(_QWORD *)(v70 + 160);
    v75 = v32[13];
    if (v75)
    {
      v76 = (unint64_t *)(v75 + 8);
      do
        v77 = __ldxr(v76);
      while (__stxr(v77 + 1, v76));
    }
    v78 = *(std::__shared_weak_count **)(v74 + 24);
    *(_QWORD *)(v74 + 16) = v73;
    *(_QWORD *)(v74 + 24) = v75;
    if (v78)
    {
      v79 = (unint64_t *)&v78->__shared_owners_;
      do
        v80 = __ldaxr(v79);
      while (__stlxr(v80 - 1, v79));
      if (!v80)
      {
        ((void (*)(std::__shared_weak_count *))v78->__on_zero_shared)(v78);
        std::__shared_weak_count::__release_weak(v78);
      }
    }
    v81 = operator new();
    *(_QWORD *)v81 = &off_1E42B59B0;
    *(_QWORD *)(v81 + 48) = 0;
    *(_QWORD *)(v81 + 24) = 0;
    *(_QWORD *)(v81 + 32) = 0;
    *(_QWORD *)(v81 + 16) = "CircleOverlayFill";
    *(_DWORD *)(v81 + 40) = 0;
    *(_DWORD *)(v81 + 56) = 1065353216;
    *(_OWORD *)(v81 + 64) = 0u;
    *(_OWORD *)(v81 + 80) = 0u;
    *(int64x2_t *)(v81 + 96) = vdupq_n_s64(1uLL);
    *(_QWORD *)(v81 + 112) = 0;
    v82 = v32[20];
    v32[20] = v81;
    if (v82)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v82 + 8))(v82);
      v81 = v32[20];
    }
    *(_QWORD *)(v81 + 32) = v32[16];
    *(_QWORD *)(v32[20] + 64) = v32[11];
    v83 = operator new();
    *(_QWORD *)v83 = &off_1E42B59B0;
    *(_QWORD *)(v83 + 48) = 0;
    *(_QWORD *)(v83 + 24) = 0;
    *(_QWORD *)(v83 + 32) = 0;
    *(_QWORD *)(v83 + 16) = "CircleOverlayFillOcclusion";
    *(_DWORD *)(v83 + 40) = 0;
    *(_DWORD *)(v83 + 56) = 1065353216;
    *(_OWORD *)(v83 + 64) = 0u;
    *(_OWORD *)(v83 + 80) = 0u;
    *(int64x2_t *)(v83 + 96) = vdupq_n_s64(1uLL);
    *(_QWORD *)(v83 + 112) = 0;
    v84 = v32[21];
    v32[21] = v83;
    if (v84)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v84 + 8))(v84);
      v83 = v32[21];
    }
    *(_QWORD *)(v83 + 32) = v32[17];
    *(_QWORD *)(v32[21] + 64) = v32[11];
    v85 = operator new(0xE8uLL);
    v85[1] = 0;
    v85[2] = 0;
    *v85 = &off_1E42E26A0;
    v86 = ggl::BufferData::BufferData((uint64_t)(v85 + 3), qword_1EE545B18, 2, 1, 6, 1);
    v85[28] = ggl::Circle::View::reflection(void)::reflection;
    v85[3] = &off_1E42B9A10;
    v87 = (std::__shared_weak_count *)v32[15];
    v32[14] = v86;
    v32[15] = v85;
    if (v87)
    {
      v88 = (unint64_t *)&v87->__shared_owners_;
      do
        v89 = __ldaxr(v88);
      while (__stlxr(v89 - 1, v88));
      if (!v89)
      {
        ((void (*)(std::__shared_weak_count *))v87->__on_zero_shared)(v87);
        std::__shared_weak_count::__release_weak(v87);
      }
    }
    v90 = (ggl::Circle::FillPipelineSetup *)operator new();
    v91 = ggl::Circle::FillPipelineSetup::FillPipelineSetup(v90);
    v92 = v32[18];
    v32[18] = v91;
    if (v92)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v92 + 8))(v92);
      v91 = v32[18];
    }
    v93 = *(_QWORD *)(v91 + 64);
    *(_QWORD *)(v93 + 24) = 0;
    v94 = v32[14];
    *(_QWORD *)(v93 + 16) = v94;
    v95 = *(_QWORD *)(v91 + 160);
    v96 = v32[15];
    if (v96)
    {
      v97 = (unint64_t *)(v96 + 8);
      do
        v98 = __ldxr(v97);
      while (__stxr(v98 + 1, v97));
    }
    v99 = *(std::__shared_weak_count **)(v95 + 24);
    *(_QWORD *)(v95 + 16) = v94;
    *(_QWORD *)(v95 + 24) = v96;
    if (v99)
    {
      v100 = (unint64_t *)&v99->__shared_owners_;
      do
        v101 = __ldaxr(v100);
      while (__stlxr(v101 - 1, v100));
      if (!v101)
      {
        ((void (*)(std::__shared_weak_count *))v99->__on_zero_shared)(v99);
        std::__shared_weak_count::__release_weak(v99);
      }
    }
    v102 = (ggl::Circle::FillPipelineSetup *)operator new();
    v103 = ggl::Circle::FillPipelineSetup::FillPipelineSetup(v102);
    v104 = v32[19];
    v32[19] = v103;
    if (v104)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v104 + 8))(v104);
      v103 = v32[19];
    }
    v105 = *(_QWORD *)(v103 + 64);
    *(_QWORD *)(v105 + 24) = 0;
    v106 = v32[14];
    *(_QWORD *)(v105 + 16) = v106;
    v107 = *(_QWORD *)(v103 + 160);
    v108 = v32[15];
    if (v108)
    {
      v109 = (unint64_t *)(v108 + 8);
      do
        v110 = __ldxr(v109);
      while (__stxr(v110 + 1, v109));
    }
    v111 = *(std::__shared_weak_count **)(v107 + 24);
    *(_QWORD *)(v107 + 16) = v106;
    *(_QWORD *)(v107 + 24) = v108;
    if (v111)
    {
      v112 = (unint64_t *)&v111->__shared_owners_;
      do
        v113 = __ldaxr(v112);
      while (__stlxr(v113 - 1, v112));
      if (!v113)
      {
        ((void (*)(std::__shared_weak_count *))v111->__on_zero_shared)(v111);
        std::__shared_weak_count::__release_weak(v111);
      }
    }
    v114 = operator new();
    *(_QWORD *)v114 = &off_1E42B59B0;
    *(_QWORD *)(v114 + 48) = 0;
    *(_QWORD *)(v114 + 24) = 0;
    *(_QWORD *)(v114 + 32) = 0;
    *(_QWORD *)(v114 + 16) = "CircleOverlayFill";
    *(_DWORD *)(v114 + 40) = 0;
    *(_DWORD *)(v114 + 56) = 1065353216;
    *(_OWORD *)(v114 + 64) = 0u;
    *(_OWORD *)(v114 + 80) = 0u;
    *(int64x2_t *)(v114 + 96) = vdupq_n_s64(1uLL);
    *(_QWORD *)(v114 + 112) = 0;
    v115 = v32[22];
    v32[22] = v114;
    if (v115)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v115 + 8))(v115);
      v114 = v32[22];
    }
    *(_QWORD *)(v114 + 32) = v32[18];
    *(_QWORD *)(v32[22] + 64) = v32[11];
    v116 = operator new();
    *(_QWORD *)v116 = &off_1E42B59B0;
    *(_QWORD *)(v116 + 48) = 0;
    *(_QWORD *)(v116 + 24) = 0;
    *(_QWORD *)(v116 + 32) = 0;
    *(_QWORD *)(v116 + 16) = "CircleOverlayFillOcclusion";
    *(_DWORD *)(v116 + 40) = 0;
    *(_DWORD *)(v116 + 56) = 1065353216;
    *(_OWORD *)(v116 + 64) = 0u;
    *(_OWORD *)(v116 + 80) = 0u;
    *(int64x2_t *)(v116 + 96) = vdupq_n_s64(1uLL);
    *(_QWORD *)(v116 + 112) = 0;
    v117 = v32[23];
    v32[23] = v116;
    if (v117)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v117 + 8))(v117);
      v116 = v32[23];
    }
    *(_QWORD *)(v116 + 32) = v32[19];
    *(_QWORD *)(v32[23] + 64) = v32[11];
    shared_weak_owners = v40[3].__shared_weak_owners_;
    if (shared_weak_owners <= v127)
      shared_weak_owners = v127;
    v40[3].__shared_owners_ = 0;
    v40[3].__shared_weak_owners_ = shared_weak_owners;
    do
      v119 = __ldaxr(v41);
    while (__stlxr(v119 - 1, v41));
    if (!v119)
    {
      ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
      std::__shared_weak_count::__release_weak(v40);
    }
    v120 = v37[3].__shared_weak_owners_;
    if (v120 <= 0xC)
      v120 = 12;
    v37[3].__shared_owners_ = 0;
    v37[3].__shared_weak_owners_ = v120;
    do
      v121 = __ldaxr(v38);
    while (__stlxr(v121 - 1, v38));
    if (!v121)
    {
      ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
      std::__shared_weak_count::__release_weak(v37);
    }
    v122 = (std::__shared_weak_count *)v16->_renderable.__cntrl_;
    v16->_renderable.__ptr_ = (CircleOverlayRenderable *)(v32 + 3);
    v16->_renderable.__cntrl_ = (__shared_weak_count *)v32;
    if (v122)
    {
      v123 = (unint64_t *)&v122->__shared_owners_;
      do
        v124 = __ldaxr(v123);
      while (__stlxr(v124 - 1, v123));
      if (!v124)
      {
        ((void (*)(std::__shared_weak_count *))v122->__on_zero_shared)(v122);
        std::__shared_weak_count::__release_weak(v122);
      }
    }
    -[VKVectorOverlayCircle _updateStyleColor](v17, "_updateStyleColor");
    v125 = v17;
  }

  return v17;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_fillColor);
  CGColorRelease(self->_strokeColor);
  v3.receiver = self;
  v3.super_class = (Class)VKVectorOverlayCircle;
  -[VKVectorOverlayCircle dealloc](&v3, sel_dealloc);
}

- (void)setBlendMode:(int64_t)a3
{
  os_unfair_lock_s *ptr;
  uint32_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VKVectorOverlayCircle;
  -[VKVectorOverlayData setBlendMode:](&v7, sel_setBlendMode_);
  ptr = (os_unfair_lock_s *)self->_style.__ptr_;
  if ((unint64_t)(a3 - 1) < 0x11)
    v6 = a3;
  else
    v6 = 0;
  os_unfair_lock_lock(ptr + 11);
  ptr[10]._os_unfair_lock_opaque = v6;
  os_unfair_lock_unlock(ptr + 11);
}

- (void)_updateStyleColor
{
  Style *ptr;
  CGColor *fillColor;
  float32x4_t v5;
  CFStringRef *v6;
  CGColorSpace *v7;
  CGColor *CopyByMatchingToColorSpace;
  float64x2_t *Components;
  Style *v10;
  CGColor *strokeColor;
  CGColorSpace *v12;
  CGColor *v13;
  float64x2_t *v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;

  ptr = self->_style.__ptr_;
  fillColor = self->_fillColor;
  v5 = 0uLL;
  v15 = 0u;
  v6 = (CFStringRef *)MEMORY[0x1E0C9DA10];
  if (fillColor)
  {
    v7 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
    CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v7, kCGRenderingIntentDefault, fillColor, 0);
    CFRelease(v7);
    v5 = 0uLL;
    if (CopyByMatchingToColorSpace)
    {
      Components = (float64x2_t *)CGColorGetComponents(CopyByMatchingToColorSpace);
      v16 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*Components), Components[1]);
      CGColorRelease(CopyByMatchingToColorSpace);
      v5 = v16;
    }
  }
  v17 = v5;
  os_unfair_lock_lock((os_unfair_lock_t)ptr + 11);
  *(float32x4_t *)(ptr + 20) = v17;
  os_unfair_lock_unlock((os_unfair_lock_t)ptr + 11);
  v10 = self->_style.__ptr_;
  strokeColor = self->_strokeColor;
  if (strokeColor)
  {
    v12 = CGColorSpaceCreateWithName(*v6);
    v13 = CGColorCreateCopyByMatchingToColorSpace(v12, kCGRenderingIntentDefault, strokeColor, 0);
    CFRelease(v12);
    if (v13)
    {
      v14 = (float64x2_t *)CGColorGetComponents(v13);
      v15 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*v14), v14[1]);
      CGColorRelease(v13);
    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)v10 + 11);
  *(float32x4_t *)(v10 + 4) = v15;
  os_unfair_lock_unlock((os_unfair_lock_t)v10 + 11);
}

- (double)lineWidth
{
  unfair_lock *p_propertiesLock;
  double lineWidth;

  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  lineWidth = self->_lineWidth;
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
  return lineWidth;
}

- (void)setLineWidth:(double)a3
{
  unfair_lock *p_propertiesLock;
  double lineWidth;
  Style *ptr;
  float v8;
  double v9;
  id WeakRetained;

  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  lineWidth = self->_lineWidth;
  self->_lineWidth = a3;
  ptr = self->_style.__ptr_;
  os_unfair_lock_lock((os_unfair_lock_t)ptr + 11);
  v8 = a3;
  *(float *)ptr = v8;
  os_unfair_lock_unlock((os_unfair_lock_t)ptr + 11);
  v9 = vabdd_f64(a3, lineWidth);
  if (v9 > fabs(lineWidth + a3) * 2.22044605e-14 && v9 >= 2.22507386e-308)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
    objc_msgSend(WeakRetained, "vectorOverlayNeedsDisplay:needsFullInvalidate:", self, 0);

  }
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
}

- (CGColor)fillColor
{
  unfair_lock *p_propertiesLock;
  CGColor *fillColor;

  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  fillColor = self->_fillColor;
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
  return fillColor;
}

- (void)setFillColor:(CGColor *)a3
{
  unfair_lock *p_propertiesLock;
  BOOL v6;
  id WeakRetained;

  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  v6 = CGColorEqualToColor(a3, self->_fillColor);
  CGColorRelease(self->_fillColor);
  self->_fillColor = CGColorRetain(a3);
  -[VKVectorOverlayCircle _updateStyleColor](self, "_updateStyleColor");
  if (!v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
    objc_msgSend(WeakRetained, "vectorOverlayNeedsDisplay:needsFullInvalidate:", self, 0);

  }
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
}

- (CGColor)strokeColor
{
  unfair_lock *p_propertiesLock;
  CGColor *strokeColor;

  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  strokeColor = self->_strokeColor;
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
  return strokeColor;
}

- (void)setStrokeColor:(CGColor *)a3
{
  unfair_lock *p_propertiesLock;
  BOOL v6;
  id WeakRetained;

  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  v6 = CGColorEqualToColor(a3, self->_strokeColor);
  CGColorRelease(self->_strokeColor);
  self->_strokeColor = CGColorRetain(a3);
  -[VKVectorOverlayCircle _updateStyleColor](self, "_updateStyleColor");
  if (!v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
    objc_msgSend(WeakRetained, "vectorOverlayNeedsDisplay:needsFullInvalidate:", self, 0);

  }
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
}

- (double)alpha
{
  unfair_lock *p_propertiesLock;
  double alpha;

  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  alpha = self->_alpha;
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
  return alpha;
}

- (void)setAlpha:(double)a3
{
  unfair_lock *p_propertiesLock;
  double alpha;
  Style *ptr;
  float v8;
  double v9;
  id WeakRetained;

  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  alpha = self->_alpha;
  self->_alpha = a3;
  ptr = self->_style.__ptr_;
  os_unfair_lock_lock((os_unfair_lock_t)ptr + 11);
  v8 = a3;
  *((float *)ptr + 9) = v8;
  os_unfair_lock_unlock((os_unfair_lock_t)ptr + 11);
  v9 = vabdd_f64(a3, alpha);
  if (v9 > fabs(alpha + a3) * 2.22044605e-14 && v9 >= 2.22507386e-308)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
    objc_msgSend(WeakRetained, "vectorOverlayNeedsDisplay:needsFullInvalidate:", self, 0);

  }
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
}

- (Box<double,)_bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  Box<double, 2> result;

  v2 = self->_bounds._minimum._e[0];
  v3 = self->_bounds._minimum._e[1];
  v4 = self->_bounds._maximum._e[0];
  v5 = self->_bounds._maximum._e[1];
  result._maximum._e[1] = v5;
  result._maximum._e[0] = v4;
  result._minimum._e[1] = v3;
  result._minimum._e[0] = v2;
  return result;
}

- (shared_ptr<md::CircleOverlayRenderable>)_renderable
{
  CircleOverlayRenderable **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<md::CircleOverlayRenderable> result;

  cntrl = self->_renderable.__cntrl_;
  *v2 = self->_renderable.__ptr_;
  v2[1] = (CircleOverlayRenderable *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (CircleOverlayRenderable *)self;
  return result;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  __shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;

  cntrl = self->_style.__cntrl_;
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
  v6 = self->_renderable.__cntrl_;
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
}

- (id).cxx_construct
{
  *((_DWORD *)self + 30) = 0;
  *((_QWORD *)self + 16) = 0;
  *((_QWORD *)self + 17) = 0;
  *((_QWORD *)self + 18) = 0;
  *((_QWORD *)self + 19) = 0;
  return self;
}

@end

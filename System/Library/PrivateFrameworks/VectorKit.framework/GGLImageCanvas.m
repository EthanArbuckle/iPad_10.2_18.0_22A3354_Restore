@implementation GGLImageCanvas

- (CGSize)size
{
  double v2;
  double v3;
  CGSize result;

  v2 = *((double *)self + 3);
  v3 = *((double *)self + 4);
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)hasRenderTarget
{
  return *((_QWORD *)self + 24) != 0;
}

- (void)finalRenderTarget
{
  return (void *)*((_QWORD *)self + 24);
}

- (const)format
{
  return (const RenderTargetFormat *)((char *)self + 120);
}

- (CGSize)sizeInPixels
{
  double v2;
  double v3;
  double v4;
  CGSize result;

  v2 = *((double *)self + 5);
  v3 = v2 * *((double *)self + 3);
  v4 = *((double *)self + 4) * v2;
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)contentScale
{
  return *((double *)self + 5);
}

- (BOOL)supportsFramebufferFetch
{
  return *((_BYTE *)self + 82);
}

- (void)willDrawView
{
  if (!*((_QWORD *)self + 24)
    || !*(_BYTE *)(*((_QWORD *)self + 1) + 20) && !*((_QWORD *)self + 38)
    || *((_BYTE *)self + 81))
  {
    -[GGLImageCanvas destroyRenderTarget](self, "destroyRenderTarget");
    -[GGLImageCanvas createRenderTarget](self, "createRenderTarget");
    *((_BYTE *)self + 81) = 0;
  }
  *((_BYTE *)self + 80) = 0;
}

- (void)destroyRenderTarget
{
  uint64_t v3;
  int v4;
  _QWORD *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  _QWORD *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t v23;

  if (*((_QWORD *)self + 17) >= 2uLL)
  {
    v3 = 1;
    v4 = 1;
    do
    {
      v5 = (_QWORD *)((char *)self + 16 * v3 + 224);
      v6 = (std::__shared_weak_count *)v5[1];
      *v5 = 0;
      v5[1] = 0;
      if (v6)
      {
        p_shared_owners = (unint64_t *)&v6->__shared_owners_;
        do
          v8 = __ldaxr(p_shared_owners);
        while (__stlxr(v8 - 1, p_shared_owners));
        if (!v8)
        {
          ((void (*)(std::__shared_weak_count *, SEL))v6->__on_zero_shared)(v6, a2);
          std::__shared_weak_count::__release_weak(v6);
        }
      }
      v9 = (_QWORD *)((char *)self + 16 * v3 + 328);
      v10 = (std::__shared_weak_count *)v9[1];
      *v9 = 0;
      v9[1] = 0;
      if (v10)
      {
        v11 = (unint64_t *)&v10->__shared_owners_;
        do
          v12 = __ldaxr(v11);
        while (__stlxr(v12 - 1, v11));
        if (!v12)
        {
          ((void (*)(std::__shared_weak_count *, SEL))v10->__on_zero_shared)(v10, a2);
          std::__shared_weak_count::__release_weak(v10);
        }
      }
      v3 = ++v4;
    }
    while (*((_QWORD *)self + 17) > (unint64_t)v4);
  }
  v13 = *((_QWORD *)self + 13);
  *((_QWORD *)self + 13) = 0;
  if (v13)
    (*(void (**)(uint64_t, SEL))(*(_QWORD *)v13 + 8))(v13, a2);
  v14 = *((_QWORD *)self + 12);
  *((_QWORD *)self + 12) = 0;
  if (v14)
    (*(void (**)(uint64_t, SEL))(*(_QWORD *)v14 + 8))(v14, a2);
  v15 = (std::__shared_weak_count *)*((_QWORD *)self + 26);
  *((_QWORD *)self + 25) = 0;
  *((_QWORD *)self + 26) = 0;
  if (v15)
  {
    v16 = (unint64_t *)&v15->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *, SEL))v15->__on_zero_shared)(v15, a2);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  v18 = *((_QWORD *)self + 24);
  *((_QWORD *)self + 24) = 0;
  if (v18)
    (*(void (**)(uint64_t, SEL))(*(_QWORD *)v18 + 8))(v18, a2);
  v19 = *((_QWORD *)self + 27);
  *((_QWORD *)self + 27) = 0;
  if (v19)
    (*(void (**)(uint64_t, SEL))(*(_QWORD *)v19 + 8))(v19, a2);
  v20 = (std::__shared_weak_count *)*((_QWORD *)self + 40);
  *((_QWORD *)self + 39) = 0;
  *((_QWORD *)self + 40) = 0;
  if (v20)
  {
    v21 = (unint64_t *)&v20->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *, SEL))v20->__on_zero_shared)(v20, a2);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  v23 = *((_QWORD *)self + 38);
  *((_QWORD *)self + 38) = 0;
  if (v23)
    (*(void (**)(uint64_t, SEL))(*(_QWORD *)v23 + 8))(v23, a2);
  *((_BYTE *)self + 80) = 0;
}

- (void)createRenderTarget
{
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unsigned int v21;
  int v22;
  uint64_t v23;
  _QWORD *v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  _QWORD *v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  std::__shared_weak_count *v41;
  unint64_t *v42;
  unint64_t v43;
  _QWORD *v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  int v64;
  _QWORD *v65;
  uint64_t *v66;
  std::__shared_weak_count *v67;
  unint64_t *v68;
  unint64_t v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t *v77;
  unint64_t v78;
  std::__shared_weak_count *v79;
  unint64_t *v80;
  unint64_t v81;
  _QWORD *v82;
  std::__shared_weak_count *v83;
  unint64_t *v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  char *v93;
  uint64_t v94;
  int v95;
  uint64_t v96;
  uint64_t v97;
  _QWORD *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  __int128 v104;
  uint64_t v105;
  unint64_t *v106;
  unint64_t v107;
  uint64_t v108;
  int v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t *v113;
  unint64_t v114;
  std::__shared_weak_count *v115;
  unint64_t *v116;
  unint64_t v117;
  _QWORD *v118;
  uint64_t *v119;
  std::__shared_weak_count *v120;
  unint64_t *v121;
  unint64_t v122;
  std::__shared_weak_count *v123;
  unint64_t *v124;
  unint64_t v125;
  std::__shared_weak_count *v126;
  unint64_t *v127;
  unint64_t v128;
  unsigned int v129;
  unsigned int v130;
  std::__shared_weak_count *v131;
  _QWORD v132[2];
  std::__shared_weak_count *v133;
  std::__shared_weak_count *v134;

  -[GGLImageCanvas sizeInPixels](self, "sizeInPixels");
  v4 = v3;
  v6 = v5;
  v7 = operator new();
  *(_QWORD *)(v7 + 16) = 0;
  *(_QWORD *)(v7 + 24) = 0;
  *(_DWORD *)(v7 + 32) = 0;
  *(_QWORD *)v7 = &off_1E42B6370;
  *(_QWORD *)(v7 + 8) = 0;
  *(_QWORD *)(v7 + 40) = &unk_1E42B6390;
  *(_QWORD *)(v7 + 48) = "/ImageCanvasTarget";
  *(_QWORD *)(v7 + 336) = 0;
  *(_OWORD *)(v7 + 72) = 0u;
  *(_OWORD *)(v7 + 88) = 0u;
  *(_OWORD *)(v7 + 104) = 0u;
  *(_OWORD *)(v7 + 120) = 0u;
  *(_OWORD *)(v7 + 136) = 0u;
  *(_OWORD *)(v7 + 152) = 0u;
  *(_OWORD *)(v7 + 168) = 0u;
  *(_OWORD *)(v7 + 184) = 0u;
  *(_OWORD *)(v7 + 200) = 0u;
  *(_OWORD *)(v7 + 216) = 0u;
  *(_OWORD *)(v7 + 232) = 0u;
  *(_OWORD *)(v7 + 248) = 0u;
  *(_DWORD *)(v7 + 328) = 0;
  *(_BYTE *)(v7 + 344) = 0;
  v8 = *((_QWORD *)self + 24);
  *((_QWORD *)self + 24) = v7;
  *(_OWORD *)(v7 + 56) = 0u;
  v7 += 56;
  *(_OWORD *)(v7 + 208) = 0u;
  *(_OWORD *)(v7 + 224) = 0u;
  *(_OWORD *)(v7 + 240) = 0u;
  *(_OWORD *)(v7 + 256) = 0u;
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  v9 = *((_DWORD *)self + 30);
  v10 = (std::__shared_weak_count *)operator new(0x58uLL);
  v10->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v10->__shared_owners_;
  v10->__shared_weak_owners_ = 0;
  v10->__vftable = (std::__shared_weak_count_vtbl *)&off_1E42DED18;
  v10[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1E42B63B0;
  v10[1].__shared_weak_owners_ = 0;
  v10[2].__vftable = 0;
  v10[1].__shared_owners_ = 0;
  LODWORD(v10[2].__shared_owners_) = 0;
  *(_OWORD *)((char *)&v10[2].__shared_owners_ + 4) = xmmword_19FFB3C50;
  *(std::__shared_weak_count_vtbl **)((char *)&v10[3].__vftable + 4) = (std::__shared_weak_count_vtbl *)0x100000000;
  HIDWORD(v10[3].__shared_owners_) = 0;
  v133 = v10 + 1;
  v134 = v10;
  v12 = operator new();
  v13 = v12;
  v129 = v6;
  v130 = v4;
  v132[0] = v10 + 1;
  v132[1] = v10;
  do
    v14 = __ldxr(p_shared_owners);
  while (__stxr(v14 + 1, p_shared_owners));
  ggl::IOSurfaceTexture::IOSurfaceTexture(v12, v130, v129, v9, v132, 2);
  v15 = *((_QWORD *)self + 12);
  *((_QWORD *)self + 12) = v13;
  if (v15)
    (*(void (**)(uint64_t))(*(_QWORD *)v15 + 8))(v15);
  do
    v16 = __ldaxr(p_shared_owners);
  while (__stlxr(v16 - 1, p_shared_owners));
  if (!v16)
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v10);
  }
  v17 = operator new();
  *(_DWORD *)(v17 + 32) = 0;
  *(_QWORD *)(v17 + 16) = 0;
  *(_QWORD *)(v17 + 24) = 0;
  *(_QWORD *)v17 = &off_1E42B6370;
  *(_QWORD *)(v17 + 8) = 0;
  *(_QWORD *)(v17 + 40) = &unk_1E42B6390;
  *(_QWORD *)(v17 + 48) = "/FlippedImageCanvasTarget";
  *(_QWORD *)(v17 + 336) = 0;
  *(_OWORD *)(v17 + 72) = 0u;
  *(_OWORD *)(v17 + 88) = 0u;
  *(_OWORD *)(v17 + 104) = 0u;
  *(_OWORD *)(v17 + 120) = 0u;
  *(_OWORD *)(v17 + 136) = 0u;
  *(_OWORD *)(v17 + 152) = 0u;
  *(_OWORD *)(v17 + 168) = 0u;
  *(_OWORD *)(v17 + 184) = 0u;
  *(_OWORD *)(v17 + 200) = 0u;
  *(_OWORD *)(v17 + 216) = 0u;
  *(_OWORD *)(v17 + 232) = 0u;
  *(_OWORD *)(v17 + 248) = 0u;
  *(_DWORD *)(v17 + 328) = 0;
  *(_OWORD *)(v17 + 56) = 0u;
  *(_OWORD *)(v17 + 264) = 0u;
  *(_OWORD *)(v17 + 280) = 0u;
  *(_OWORD *)(v17 + 296) = 0u;
  *(_OWORD *)(v17 + 312) = 0u;
  *(_BYTE *)(v17 + 344) = 0;
  v18 = *((_QWORD *)self + 13);
  *((_QWORD *)self + 13) = v17;
  if (v18)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v18 + 8))(v18);
    v17 = *((_QWORD *)self + 13);
  }
  v19 = *((_QWORD *)self + 12);
  *(_QWORD *)(v17 + 96) = 0;
  *(_QWORD *)(v17 + 104) = 0;
  *(_QWORD *)(v17 + 88) = v19;
  *(_DWORD *)(v17 + 80) = *(_DWORD *)(v19 + 72);
  v20 = *(_QWORD *)(v17 + 72);
  if (v20 <= 1)
    v20 = 1;
  *(_QWORD *)(v17 + 72) = v20;
  *(_DWORD *)(v17 + 56) = *(_DWORD *)(v19 + 68);
  v21 = *((_DWORD *)self + 36);
  v22 = *((unsigned __int8 *)self + 82);
  if (v21 < 2)
  {
    v39 = operator new();
    v40 = v39;
    *(_DWORD *)(v39 + 32) = 0;
    *(_QWORD *)(v39 + 16) = 0;
    *(_QWORD *)(v39 + 24) = 0;
    *(_QWORD *)(v39 + 56) = 0x300000001;
    *(_DWORD *)(v39 + 64) = 0;
    *(_DWORD *)(v39 + 68) = v9;
    *(_DWORD *)(v39 + 72) = 1;
    *(_QWORD *)(v39 + 76) = 0;
    *(_QWORD *)(v39 + 92) = 0;
    *(_QWORD *)(v39 + 84) = 0;
    *(_QWORD *)(v39 + 100) = 0x100000000;
    *(_QWORD *)v39 = &off_1E42BE438;
    *(_QWORD *)(v39 + 8) = 0;
    *(_QWORD *)(v39 + 40) = &unk_1E42BE458;
    *(_QWORD *)(v39 + 48) = "";
    *(_QWORD *)(v39 + 112) = 0;
    *(_QWORD *)(v39 + 120) = 0;
    *(_WORD *)(v39 + 128) = 0;
    *(_BYTE *)(v39 + 130) = 1;
    v41 = v134;
    *(_QWORD *)(v39 + 136) = v133;
    *(_QWORD *)(v39 + 144) = v41;
    if (v41)
    {
      v42 = (unint64_t *)&v41->__shared_owners_;
      do
        v43 = __ldxr(v42);
      while (__stxr(v43 + 1, v42));
    }
    *(_DWORD *)(v39 + 80) = v130;
    *(_DWORD *)(v39 + 84) = v129;
    v44 = (_QWORD *)operator new();
    *v44 = &off_1E42E7DE8;
    v44[1] = 0;
    v44[2] = 0;
    v44[3] = v40;
    v45 = (std::__shared_weak_count *)*((_QWORD *)self + 26);
    *((_QWORD *)self + 25) = v40;
    *((_QWORD *)self + 26) = v44;
    if (v45)
    {
      v46 = (unint64_t *)&v45->__shared_owners_;
      do
        v47 = __ldaxr(v46);
      while (__stlxr(v47 - 1, v46));
      if (!v47)
      {
        ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
        std::__shared_weak_count::__release_weak(v45);
      }
    }
  }
  else
  {
    v23 = operator new();
    *(_DWORD *)(v23 + 32) = 0;
    *(_QWORD *)(v23 + 16) = 0;
    *(_QWORD *)(v23 + 24) = 0;
    *(_QWORD *)(v23 + 56) = 0x200000000;
    *(_DWORD *)(v23 + 64) = 2;
    *(_DWORD *)(v23 + 68) = v9;
    *(_DWORD *)(v23 + 72) = v21;
    *(_DWORD *)(v23 + 76) = v22;
    *(_QWORD *)(v23 + 88) = 0;
    *(_QWORD *)(v23 + 96) = 0;
    *(_QWORD *)v23 = &off_1E42B6330;
    *(_QWORD *)(v23 + 8) = 0;
    *(_QWORD *)(v23 + 40) = &unk_1E42B6350;
    *(_QWORD *)(v23 + 48) = "/ImageCanvasMSAARenderBuffer";
    *(_DWORD *)(v23 + 80) = v130;
    *(_DWORD *)(v23 + 84) = v129;
    v24 = (_QWORD *)operator new();
    *v24 = &off_1E42E7758;
    v24[1] = 0;
    v24[2] = 0;
    v24[3] = v23;
    v25 = (std::__shared_weak_count *)*((_QWORD *)self + 26);
    *((_QWORD *)self + 25) = v23;
    *((_QWORD *)self + 26) = v24;
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
    v28 = operator new();
    v29 = v28;
    *(_DWORD *)(v28 + 32) = 0;
    *(_QWORD *)(v28 + 16) = 0;
    *(_QWORD *)(v28 + 24) = 0;
    *(_QWORD *)(v28 + 56) = 0x100000001;
    *(_DWORD *)(v28 + 64) = 0;
    *(_DWORD *)(v28 + 68) = v9;
    *(_DWORD *)(v28 + 72) = 1;
    *(_QWORD *)(v28 + 76) = 0;
    *(_QWORD *)(v28 + 92) = 0;
    *(_QWORD *)(v28 + 84) = 0;
    *(_QWORD *)(v28 + 100) = 0x100000000;
    *(_QWORD *)v28 = &off_1E42BE438;
    *(_QWORD *)(v28 + 8) = 0;
    *(_QWORD *)(v28 + 40) = &unk_1E42BE458;
    *(_QWORD *)(v28 + 48) = "";
    *(_QWORD *)(v28 + 112) = 0;
    *(_QWORD *)(v28 + 120) = 0;
    *(_WORD *)(v28 + 128) = 0;
    *(_BYTE *)(v28 + 130) = 1;
    v30 = v134;
    *(_QWORD *)(v28 + 136) = v133;
    *(_QWORD *)(v28 + 144) = v30;
    if (v30)
    {
      v31 = (unint64_t *)&v30->__shared_owners_;
      do
        v32 = __ldxr(v31);
      while (__stxr(v32 + 1, v31));
    }
    *(_DWORD *)(v28 + 80) = v130;
    *(_DWORD *)(v28 + 84) = v129;
    v33 = (_QWORD *)operator new();
    *v33 = &off_1E42E7E20;
    v33[1] = 0;
    v33[2] = 0;
    v33[3] = v29;
    v34 = (std::__shared_weak_count *)*((_QWORD *)self + 49);
    *((_QWORD *)self + 48) = v29;
    *((_QWORD *)self + 49) = v33;
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
    v37 = (_QWORD *)*((_QWORD *)self + 24);
    v38 = *((_QWORD *)self + 48);
    v37[24] = 0;
    v37[25] = 0;
    v37[23] = v38;
  }
  v48 = operator new();
  v49 = *((_DWORD *)self + 37);
  *(_QWORD *)(v48 + 16) = 0;
  *(_QWORD *)(v48 + 24) = 0;
  *(_DWORD *)(v48 + 32) = 0;
  *(_QWORD *)(v48 + 56) = 0x200000000;
  *(_DWORD *)(v48 + 64) = 2;
  *(_DWORD *)(v48 + 68) = v49;
  *(_DWORD *)(v48 + 72) = v21;
  *(_DWORD *)(v48 + 76) = v22;
  *(_QWORD *)(v48 + 88) = 0;
  *(_QWORD *)(v48 + 96) = 0;
  *(_QWORD *)v48 = &off_1E42B6330;
  *(_QWORD *)(v48 + 8) = 0;
  *(_QWORD *)(v48 + 40) = &unk_1E42B6350;
  *(_QWORD *)(v48 + 48) = "/ImageCanvasDepthBuffer";
  *(_DWORD *)(v48 + 80) = v130;
  *(_DWORD *)(v48 + 84) = v129;
  v50 = *((_QWORD *)self + 27);
  *((_QWORD *)self + 27) = v48;
  if (v50)
    (*(void (**)(uint64_t))(*(_QWORD *)v50 + 8))(v50);
  v51 = *((_QWORD *)self + 24);
  v52 = *((_QWORD *)self + 25);
  *(_QWORD *)(v51 + 96) = 0;
  *(_QWORD *)(v51 + 104) = 0;
  *(_QWORD *)(v51 + 88) = v52;
  *(_DWORD *)(v51 + 80) = *(_DWORD *)(v52 + 72);
  v53 = *(_QWORD *)(v51 + 72);
  if (v53 <= 1)
    v53 = 1;
  *(_QWORD *)(v51 + 72) = v53;
  *(_DWORD *)(v51 + 56) = *(_DWORD *)(v52 + 68);
  v54 = *((_QWORD *)self + 24);
  v55 = *((_QWORD *)self + 27);
  *(_QWORD *)(v54 + 288) = 0;
  *(_QWORD *)(v54 + 296) = 0;
  *(_QWORD *)(v54 + 280) = v55;
  *(_DWORD *)(v54 + 84) = *(_DWORD *)(v55 + 68);
  if (!*(_DWORD *)(v54 + 80))
    *(_DWORD *)(v54 + 80) = *(_DWORD *)(v55 + 72);
  if (*((_QWORD *)self + 17) >= 2uLL)
  {
    v56 = 1;
    v57 = 1;
    do
    {
      v62 = operator new();
      v63 = *((_DWORD *)self + v56 + 30);
      v64 = *((_DWORD *)self + 36);
      *(_QWORD *)(v62 + 16) = 0;
      *(_QWORD *)(v62 + 24) = 0;
      *(_DWORD *)(v62 + 32) = 0;
      *(_QWORD *)(v62 + 56) = 0x200000000;
      *(_DWORD *)(v62 + 64) = 2;
      *(_DWORD *)(v62 + 68) = v63;
      *(_DWORD *)(v62 + 72) = v64;
      *(_DWORD *)(v62 + 76) = 1;
      *(_QWORD *)(v62 + 88) = 0;
      *(_QWORD *)(v62 + 96) = 0;
      *(_QWORD *)v62 = &off_1E42B6330;
      *(_QWORD *)(v62 + 8) = 0;
      *(_QWORD *)(v62 + 40) = &unk_1E42B6350;
      *(_QWORD *)(v62 + 48) = "/ImageCanvasColorBuffer";
      *(_DWORD *)(v62 + 80) = v130;
      *(_DWORD *)(v62 + 84) = v129;
      v65 = (_QWORD *)operator new();
      v66 = (uint64_t *)((char *)self + 16 * v56 + 208);
      *v65 = &off_1E42E7790;
      v65[1] = 0;
      v65[2] = 0;
      v65[3] = v62;
      *v66 = v62;
      v67 = (std::__shared_weak_count *)v66[1];
      v66[1] = (uint64_t)v65;
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
      v58 = *((_QWORD *)self + 24);
      v59 = *v66;
      v60 = (_QWORD *)(v58 + 24 * v56);
      v60[12] = 0;
      v60[13] = 0;
      v60[11] = v59;
      *(_DWORD *)(v58 + 80) = *(_DWORD *)(v59 + 72);
      if (*(_QWORD *)(v58 + 72) <= (unint64_t)(v56 + 1))
        v61 = v56 + 1;
      else
        v61 = *(_QWORD *)(v58 + 72);
      *(_QWORD *)(v58 + 72) = v61;
      *(_DWORD *)(v58 + 4 * v56 + 56) = *(_DWORD *)(v59 + 68);
      v56 = ++v57;
    }
    while (*((_QWORD *)self + 17) > (unint64_t)v57);
  }
  if (!*((_BYTE *)self + 82))
  {
    v70 = *((_DWORD *)self + 68);
    v71 = operator new();
    v72 = v71;
    v73 = (_QWORD *)*((_QWORD *)self + 25);
    v74 = *((_QWORD *)self + 26);
    v75 = *(_QWORD *)((char *)v73 + 60);
    v76 = v73[9];
    *(_QWORD *)(v71 + 16) = 0;
    *(_QWORD *)(v71 + 24) = 0;
    *(_DWORD *)(v71 + 32) = 0;
    *(_DWORD *)(v71 + 56) = 0;
    *(_QWORD *)(v71 + 60) = v75;
    *(_DWORD *)(v71 + 68) = v70;
    *(_QWORD *)(v71 + 72) = v76;
    *(_QWORD *)(v71 + 88) = 0;
    *(_QWORD *)(v71 + 96) = 0;
    *(_QWORD *)v71 = &off_1E42B6330;
    *(_QWORD *)(v71 + 8) = 0;
    *(_QWORD *)(v71 + 40) = &unk_1E42B6350;
    *(_QWORD *)(v71 + 48) = "/ImageCanvasLinearMSAARenderBuffer";
    *(_QWORD *)(v71 + 80) = v73[10];
    if (v74)
    {
      v77 = (unint64_t *)(v74 + 8);
      do
        v78 = __ldxr(v77);
      while (__stxr(v78 + 1, v77));
      v79 = *(std::__shared_weak_count **)(v71 + 96);
      *(_QWORD *)(v71 + 88) = v73;
      *(_QWORD *)(v71 + 96) = v74;
      if (v79)
      {
        v80 = (unint64_t *)&v79->__shared_owners_;
        do
          v81 = __ldaxr(v80);
        while (__stlxr(v81 - 1, v80));
        if (!v81)
        {
          ((void (*)(std::__shared_weak_count *))v79->__on_zero_shared)(v79);
          std::__shared_weak_count::__release_weak(v79);
        }
      }
    }
    else
    {
      *(_QWORD *)(v71 + 88) = v73;
      *(_QWORD *)(v71 + 96) = 0;
    }
    v82 = (_QWORD *)operator new();
    *v82 = &off_1E42E7758;
    v82[1] = 0;
    v82[2] = 0;
    v82[3] = v72;
    v83 = (std::__shared_weak_count *)*((_QWORD *)self + 40);
    *((_QWORD *)self + 39) = v72;
    *((_QWORD *)self + 40) = v82;
    if (v83)
    {
      v84 = (unint64_t *)&v83->__shared_owners_;
      do
        v85 = __ldaxr(v84);
      while (__stlxr(v85 - 1, v84));
      if (!v85)
      {
        ((void (*)(std::__shared_weak_count *))v83->__on_zero_shared)(v83);
        std::__shared_weak_count::__release_weak(v83);
      }
    }
    v86 = operator new();
    *(_DWORD *)(v86 + 32) = 0;
    *(_QWORD *)(v86 + 16) = 0;
    *(_QWORD *)(v86 + 24) = 0;
    *(_QWORD *)v86 = &off_1E42B6370;
    *(_QWORD *)(v86 + 8) = 0;
    *(_QWORD *)(v86 + 40) = &unk_1E42B6390;
    *(_QWORD *)(v86 + 48) = "/ImageLinearCanvasTarget";
    *(_QWORD *)(v86 + 336) = 0;
    *(_OWORD *)(v86 + 72) = 0u;
    *(_OWORD *)(v86 + 88) = 0u;
    *(_OWORD *)(v86 + 104) = 0u;
    *(_OWORD *)(v86 + 120) = 0u;
    *(_OWORD *)(v86 + 136) = 0u;
    *(_OWORD *)(v86 + 152) = 0u;
    *(_OWORD *)(v86 + 168) = 0u;
    *(_OWORD *)(v86 + 184) = 0u;
    *(_OWORD *)(v86 + 200) = 0u;
    *(_OWORD *)(v86 + 216) = 0u;
    *(_OWORD *)(v86 + 232) = 0u;
    *(_OWORD *)(v86 + 248) = 0u;
    *(_DWORD *)(v86 + 328) = 0;
    *(_OWORD *)(v86 + 56) = 0u;
    *(_OWORD *)(v86 + 264) = 0u;
    *(_OWORD *)(v86 + 280) = 0u;
    *(_OWORD *)(v86 + 296) = 0u;
    *(_OWORD *)(v86 + 312) = 0u;
    *(_BYTE *)(v86 + 344) = 0;
    v87 = *((_QWORD *)self + 38);
    *((_QWORD *)self + 38) = v86;
    if (v87)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v87 + 8))(v87);
      v86 = *((_QWORD *)self + 38);
    }
    v88 = *((_QWORD *)self + 39);
    *(_QWORD *)(v86 + 96) = 0;
    *(_QWORD *)(v86 + 104) = 0;
    *(_QWORD *)(v86 + 88) = v88;
    *(_DWORD *)(v86 + 80) = *(_DWORD *)(v88 + 72);
    v89 = *(_QWORD *)(v86 + 72);
    if (v89 <= 1)
      v89 = 1;
    *(_QWORD *)(v86 + 72) = v89;
    *(_DWORD *)(v86 + 56) = *(_DWORD *)(v88 + 68);
    v90 = *((_QWORD *)self + 38);
    v91 = *((_QWORD *)self + 27);
    *(_QWORD *)(v90 + 288) = 0;
    *(_QWORD *)(v90 + 296) = 0;
    *(_QWORD *)(v90 + 280) = v91;
    *(_DWORD *)(v90 + 84) = *(_DWORD *)(v91 + 68);
    if (!*(_DWORD *)(v90 + 80))
      *(_DWORD *)(v90 + 80) = *(_DWORD *)(v91 + 72);
    v92 = *((_QWORD *)self + 17);
    if (v92 >= 2)
    {
      v93 = (char *)self + 224;
      v94 = 1;
      v95 = 1;
      while (1)
      {
        v100 = v94 - 1;
        v101 = *(_QWORD *)(*((_QWORD *)self + 38) + 24 * (v94 - 1) + 88);
        if (!v101 || *(_QWORD *)(v101 + 88) != *(_QWORD *)&v93[16 * v100])
          break;
LABEL_81:
        v94 = ++v95;
        if (v92 <= v95)
          goto LABEL_108;
      }
      v102 = operator new();
      v103 = v102;
      v104 = *(_OWORD *)&v93[16 * v100];
      v131 = (std::__shared_weak_count *)*((_QWORD *)&v104 + 1);
      v105 = *(_QWORD *)&v93[16 * v100 + 8];
      if (*((_QWORD *)&v104 + 1))
      {
        v106 = (unint64_t *)(*((_QWORD *)&v104 + 1) + 8);
        do
          v107 = __ldxr(v106);
        while (__stxr(v107 + 1, v106));
        v105 = *((_QWORD *)&v104 + 1);
      }
      v108 = v104;
      v109 = *((_DWORD *)self + v94 + 68);
      v110 = v104;
      v111 = *(_QWORD *)(v104 + 60);
      v112 = *(_QWORD *)(v110 + 72);
      *(_QWORD *)(v102 + 16) = 0;
      *(_QWORD *)(v102 + 24) = 0;
      *(_DWORD *)(v102 + 32) = 0;
      *(_DWORD *)(v102 + 56) = 0;
      *(_QWORD *)(v102 + 60) = v111;
      *(_DWORD *)(v102 + 68) = v109;
      *(_QWORD *)(v102 + 72) = v112;
      *(_QWORD *)(v102 + 88) = 0;
      *(_QWORD *)(v102 + 96) = 0;
      *(_QWORD *)(v102 + 80) = 0;
      *(_QWORD *)v102 = &off_1E42B6330;
      *(_QWORD *)(v102 + 8) = 0;
      *(_QWORD *)(v102 + 40) = &unk_1E42B6350;
      *(_QWORD *)(v102 + 48) = "/ImageCanwasColorBuffer";
      *(_QWORD *)(v102 + 80) = *(_QWORD *)(v108 + 80);
      if (v105)
      {
        v113 = (unint64_t *)(v105 + 8);
        do
          v114 = __ldxr(v113);
        while (__stxr(v114 + 1, v113));
        v115 = *(std::__shared_weak_count **)(v102 + 96);
        *(_QWORD *)(v102 + 88) = v108;
        *(_QWORD *)(v102 + 96) = v105;
        if (v115)
        {
          v116 = (unint64_t *)&v115->__shared_owners_;
          do
            v117 = __ldaxr(v116);
          while (__stlxr(v117 - 1, v116));
          if (!v117)
          {
            ((void (*)(std::__shared_weak_count *))v115->__on_zero_shared)(v115);
            std::__shared_weak_count::__release_weak(v115);
          }
        }
      }
      else
      {
        *(_QWORD *)(v102 + 88) = v108;
        *(_QWORD *)(v102 + 96) = 0;
      }
      v118 = (_QWORD *)operator new();
      v119 = (uint64_t *)((char *)self + 16 * v100 + 328);
      *v118 = &off_1E42E7790;
      v118[1] = 0;
      v118[2] = 0;
      v118[3] = v103;
      *v119 = v103;
      v120 = (std::__shared_weak_count *)v119[1];
      v119[1] = (uint64_t)v118;
      if (!v120)
        goto LABEL_101;
      v121 = (unint64_t *)&v120->__shared_owners_;
      do
        v122 = __ldaxr(v121);
      while (__stlxr(v122 - 1, v121));
      if (!v122)
      {
        ((void (*)(std::__shared_weak_count *))v120->__on_zero_shared)(v120);
        std::__shared_weak_count::__release_weak(v120);
        v123 = v131;
        if (v131)
          goto LABEL_102;
      }
      else
      {
LABEL_101:
        v123 = v131;
        if (v131)
        {
LABEL_102:
          v124 = (unint64_t *)&v123->__shared_owners_;
          do
            v125 = __ldaxr(v124);
          while (__stlxr(v125 - 1, v124));
          if (!v125)
          {
            ((void (*)(std::__shared_weak_count *))v123->__on_zero_shared)(v123);
            std::__shared_weak_count::__release_weak(v123);
          }
        }
      }
      v96 = *((_QWORD *)self + 38);
      v97 = *v119;
      v98 = (_QWORD *)(v96 + 24 * v94);
      v98[12] = 0;
      v98[13] = 0;
      v98[11] = v97;
      *(_DWORD *)(v96 + 80) = *(_DWORD *)(v97 + 72);
      if (*(_QWORD *)(v96 + 72) <= (unint64_t)(v94 + 1))
        v99 = v94 + 1;
      else
        v99 = *(_QWORD *)(v96 + 72);
      *(_QWORD *)(v96 + 72) = v99;
      *(_DWORD *)(v96 + 4 * v94 + 56) = *(_DWORD *)(v97 + 68);
      v92 = *((_QWORD *)self + 17);
      goto LABEL_81;
    }
  }
LABEL_108:
  *((_BYTE *)self + 80) = 0;
  v126 = v134;
  if (v134)
  {
    v127 = (unint64_t *)&v134->__shared_owners_;
    do
      v128 = __ldaxr(v127);
    while (__stlxr(v128 - 1, v127));
    if (!v128)
    {
      ((void (*)(std::__shared_weak_count *))v126->__on_zero_shared)(v126);
      std::__shared_weak_count::__release_weak(v126);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 48) = 0;
  *((_QWORD *)self + 49) = 0;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 11) = 0u;
  *((_OWORD *)self + 12) = 0u;
  *((_OWORD *)self + 13) = 0u;
  *((_OWORD *)self + 14) = 0u;
  *((_OWORD *)self + 15) = 0u;
  *((_OWORD *)self + 16) = 0u;
  *((_OWORD *)self + 17) = 0u;
  *((_OWORD *)self + 18) = 0u;
  *((_OWORD *)self + 19) = 0u;
  *((_OWORD *)self + 20) = 0u;
  *((_OWORD *)self + 21) = 0u;
  *((_OWORD *)self + 22) = 0u;
  *((_QWORD *)self + 46) = 0;
  *((_QWORD *)self + 52) = 850045863;
  *(_OWORD *)((char *)self + 424) = 0u;
  *(_OWORD *)((char *)self + 440) = 0u;
  *(_OWORD *)((char *)self + 456) = 0u;
  *(_OWORD *)((char *)self + 472) = 0u;
  return self;
}

- (void)setRenderSource:(id)a3
{
  objc_storeWeak((id *)self + 11, a3);
}

- (GGLImageCanvas)initWithSize:(CGSize)a3 scale:(double)a4 useMultisampling:(BOOL)a5 extraColorFormats:(const void *)a6 taskContext:(const void *)a7 device:(void *)a8 services:(void *)a9 signpostId:(unint64_t)a10
{
  CGFloat height;
  CGFloat width;
  char *v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *p_shared_owners;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  int v32;
  _BYTE *v33;
  unint64_t v34;
  __int128 v35;
  uint64_t v36;
  int v37;
  int v38;
  char *v39;
  char *v40;
  unint64_t v41;
  __int128 v42;
  __int128 v43;
  unint64_t v44;
  const void *v45;
  uint64_t v46;
  __int128 v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  ggl::RenderQueue *v51;
  ggl::RenderQueue *v52;
  ggl::RenderQueue *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  std::__shared_weak_count_vtbl *v57;
  std::__shared_weak_count *v58;
  unint64_t *v59;
  unint64_t v60;
  std::__shared_weak_count *v61;
  unint64_t *v62;
  unsigned __int8 v63;
  unint64_t *v64;
  unint64_t v65;
  unint64_t v66;
  _QWORD *v67;
  uint64_t v68;
  unint64_t *v69;
  unint64_t v70;
  unint64_t v71;
  _QWORD *v72;
  _QWORD *v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
  std::__shared_weak_count *v77;
  unint64_t *v78;
  std::__shared_weak_count_vtbl *v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  std::__shared_weak_count *v83;
  unint64_t *v84;
  unint64_t v85;
  unint64_t v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  unint64_t v90;
  unint64_t v91;
  std::__shared_weak_count *v92;
  unint64_t *v93;
  unint64_t v94;
  uint64_t v95;
  _OWORD *v96;
  unint64_t shared_weak_owners;
  unint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  ggl::CommandBuffer *v102;
  double v103;
  uint64_t v104;
  unint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  _QWORD *v110;
  unint64_t *v111;
  char *v112;
  unint64_t v113;
  std::__shared_weak_count *v114;
  unint64_t *v115;
  unint64_t v116;
  char *v117;
  char *v118;
  char *v119;
  unint64_t *v120;
  unint64_t v121;
  std::__shared_weak_count *v122;
  unint64_t *v123;
  unint64_t v124;
  std::__shared_weak_count *v125;
  unint64_t *v126;
  unint64_t v127;
  uint64_t v128;
  uint64_t v129;
  char *v130;
  _QWORD *v131;
  unint64_t *v132;
  char *v133;
  unint64_t v134;
  std::__shared_weak_count *v135;
  unint64_t *v136;
  unint64_t v137;
  char *v138;
  char *v139;
  char *v140;
  unint64_t *v141;
  unint64_t v142;
  std::__shared_weak_count *v143;
  unint64_t *v144;
  unint64_t v145;
  std::__shared_weak_count *v146;
  unint64_t *v147;
  unint64_t v148;
  uint64_t v149;
  uint64_t v150;
  char *v151;
  _QWORD *v152;
  unint64_t *v153;
  char *v154;
  unint64_t v155;
  std::__shared_weak_count *v156;
  unint64_t *v157;
  unint64_t v158;
  char *v159;
  char *v160;
  char *v161;
  unint64_t *v162;
  unint64_t v163;
  std::__shared_weak_count *v164;
  unint64_t *v165;
  unint64_t v166;
  std::__shared_weak_count *v167;
  unint64_t *v168;
  unint64_t v169;
  ggl::ImageCopyShader *v171;
  unsigned __int8 v172;
  unsigned __int8 v173;
  unsigned __int8 v174;
  unsigned __int8 v175;
  char *v176;
  char *v177;
  char *v178;
  void *__p;
  _BYTE *v180;
  _BYTE *v181;
  objc_super v182;
  __int16 v183;
  char v184;
  __int128 __dst;
  __int128 v186;
  uint64_t v187;

  height = a3.height;
  width = a3.width;
  v187 = *MEMORY[0x1E0C80C00];
  v182.receiver = self;
  v182.super_class = (Class)GGLImageCanvas;
  v19 = -[GGLImageCanvas init](&v182, sel_init);
  v20 = v19;
  v21 = v19;
  if (!v19)
    return (GGLImageCanvas *)v21;
  *((_QWORD *)v19 + 61) = a9;
  *((CGFloat *)v19 + 3) = width;
  *((CGFloat *)v19 + 4) = height;
  *((double *)v19 + 5) = a4;
  v19[376] = a5;
  *((_QWORD *)v19 + 50) = a10;
  *((_QWORD *)v19 + 51) = a8;
  v23 = *((_QWORD *)a8 + 1);
  v22 = *((_QWORD *)a8 + 2);
  if (v22)
  {
    v24 = (unint64_t *)(v22 + 8);
    do
      v25 = __ldxr(v24);
    while (__stxr(v25 + 1, v24));
  }
  v26 = (std::__shared_weak_count *)*((_QWORD *)v19 + 2);
  *((_QWORD *)v19 + 1) = v23;
  *((_QWORD *)v19 + 2) = v22;
  if (v26)
  {
    p_shared_owners = (unint64_t *)&v26->__shared_owners_;
    do
      v28 = __ldaxr(p_shared_owners);
    while (__stlxr(v28 - 1, p_shared_owners));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  v29 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(**((_QWORD **)a8 + 1) + 16))(*((_QWORD *)a8 + 1), *(_QWORD *)(*(_QWORD *)a7 + 16), *((_QWORD *)a8 + 3), *((_QWORD *)v21 + 50));
  v30 = *((_QWORD *)v21 + 23);
  *((_QWORD *)v21 + 23) = v29;
  if (v30)
    (*(void (**)(uint64_t))(*(_QWORD *)v30 + 8))(v30);
  if (v21[376])
    v31 = 4;
  else
    v31 = 1;
  v32 = *(_DWORD *)(*((_QWORD *)v21 + 1) + 60);
  v33 = operator new(4uLL);
  __p = v33;
  *(_DWORD *)v33 = v32;
  v180 = v33 + 4;
  v181 = v33 + 4;
  std::vector<ggl::PixelFormat>::__insert_with_size[abi:nn180100]<std::__wrap_iter<ggl::PixelFormat const*>,std::__wrap_iter<ggl::PixelFormat const*>>((char **)&__p, v33 + 4, *(char **)a6, *((char **)a6 + 1), (uint64_t)(*((_QWORD *)a6 + 1) - *(_QWORD *)a6) >> 2);
  __dst = 0uLL;
  *((_QWORD *)&v186 + 1) = v31 | 0x1A00000000;
  v34 = v180 - (_BYTE *)__p;
  *(_QWORD *)&v186 = (v180 - (_BYTE *)__p) >> 2;
  if (v180 == __p || (memcpy(&__dst, __p, v34 & 0xFFFFFFFFFFFFFFFCLL), v34 <= 0xF))
    bzero((char *)&__dst + v34, 16 - v34);
  v35 = v186;
  *(_OWORD *)(v21 + 120) = __dst;
  *(_OWORD *)(v21 + 136) = v35;
  v36 = *((_QWORD *)v21 + 1);
  v37 = *(unsigned __int8 *)(v36 + 20);
  v21[82] = v37;
  if (!v37)
  {
    v38 = *(_DWORD *)(v36 + 56);
    v39 = (char *)operator new(4uLL);
    v176 = v39;
    *(_DWORD *)v39 = v38;
    v177 = v39 + 4;
    v178 = v39 + 4;
    std::vector<ggl::PixelFormat>::__insert_with_size[abi:nn180100]<std::__wrap_iter<ggl::PixelFormat const*>,std::__wrap_iter<ggl::PixelFormat const*>>(&v176, v39 + 4, *(char **)a6, *((char **)a6 + 1), (uint64_t)(*((_QWORD *)a6 + 1) - *(_QWORD *)a6) >> 2);
    v40 = v176;
    __dst = 0uLL;
    *((_QWORD *)&v186 + 1) = v31 | 0x1A00000000;
    v41 = v177 - v176;
    *(_QWORD *)&v186 = (v177 - v176) >> 2;
    if (v177 == v176)
    {
      bzero((char *)&__dst + v41, 16 - v41);
      v43 = v186;
      *((_OWORD *)v21 + 17) = __dst;
      *((_OWORD *)v21 + 18) = v43;
      if (!v40)
        goto LABEL_25;
    }
    else
    {
      memcpy(&__dst, v176, v41 & 0xFFFFFFFFFFFFFFFCLL);
      if (v41 <= 0xF)
        bzero((char *)&__dst + v41, 16 - v41);
      v42 = v186;
      *((_OWORD *)v21 + 17) = __dst;
      *((_OWORD *)v21 + 18) = v42;
    }
    operator delete(v40);
  }
LABEL_25:
  v44 = *((_QWORD *)v21 + 17);
  __dst = 0uLL;
  *(_QWORD *)&v186 = v44;
  *((_QWORD *)&v186 + 1) = 1;
  if (v44)
  {
    v45 = v20 + 120;
    v46 = 4 * v44;
    memcpy(&__dst, v45, 4 * v44);
    if (v44 > 3)
      goto LABEL_30;
  }
  else
  {
    v46 = 0;
  }
  bzero((char *)&__dst + v46, 16 - v46);
LABEL_30:
  v47 = v186;
  *(_OWORD *)(v21 + 152) = __dst;
  *(_OWORD *)(v21 + 168) = v47;
  v48 = *(_DWORD *)(*((_QWORD *)v21 + 1) + 60);
  v49 = operator new();
  v50 = *(_QWORD *)(*((_QWORD *)a8 + 3) + 16);
  *(_OWORD *)v49 = 0u;
  *(_OWORD *)(v49 + 16) = 0u;
  *(_OWORD *)(v49 + 32) = 0u;
  v51 = (ggl::RenderQueue *)operator new();
  v52 = ggl::RenderQueue::RenderQueue(v51, 1);
  v53 = *(ggl::RenderQueue **)v49;
  *(_QWORD *)v49 = v52;
  if (v53)
  {
    ggl::RenderQueue::~RenderQueue(v53);
    MEMORY[0x1A1AF4E00]();
  }
  v54 = operator new();
  *(_DWORD *)(v54 + 32) = 0;
  *(_QWORD *)(v54 + 16) = 0;
  *(_QWORD *)(v54 + 24) = 0;
  *(_QWORD *)v54 = &off_1E42B5DE8;
  *(_QWORD *)(v54 + 8) = 0;
  *(_QWORD *)(v54 + 36) = 65537;
  *(_DWORD *)(v54 + 44) = 0;
  *(_QWORD *)(v54 + 48) = 1;
  *(_WORD *)(v54 + 56) = 0;
  *(_BYTE *)(v54 + 58) = 3;
  *(_QWORD *)(v54 + 67) = 0;
  *(_QWORD *)(v54 + 59) = 0;
  *(_BYTE *)(v54 + 75) = 0;
  *(_QWORD *)(v54 + 132) = 0;
  *(_QWORD *)(v54 + 124) = 0;
  *(_WORD *)(v54 + 188) = 257;
  *(_QWORD *)(v54 + 192) = 0;
  *(_QWORD *)(v54 + 200) = 0;
  *(_BYTE *)(v54 + 208) = 0;
  v55 = *(_QWORD *)(v49 + 16);
  *(_QWORD *)(v49 + 16) = v54;
  if (v55)
    (*(void (**)(uint64_t))(*(_QWORD *)v55 + 8))(v55);
  v56 = *(_QWORD *)(v50 + 80);
  v57 = *(std::__shared_weak_count_vtbl **)(v56 + 1280);
  v58 = *(std::__shared_weak_count **)(v56 + 1288);
  if (v58)
  {
    v59 = (unint64_t *)&v58->__shared_owners_;
    do
      v60 = __ldxr(v59);
    while (__stxr(v60 + 1, v59));
  }
  v176 = 0;
  v61 = (std::__shared_weak_count *)operator new(0x198uLL);
  v61->__shared_owners_ = 0;
  v62 = (unint64_t *)&v61->__shared_owners_;
  v61->__shared_weak_owners_ = 0;
  v61->__vftable = (std::__shared_weak_count_vtbl *)&off_1E42E51F0;
  DWORD2(__dst) = 0;
  *(_QWORD *)&__dst = 0;
  if ((v63 & 1) == 0)
  {
    if ((_DWORD)v171)
    {
      if ((v172 & 1) == 0)
      {
        if ((_DWORD)v171)
        {
          if ((v174 & 1) == 0
          {
            if ((v175 & 1) == 0
            {
              ggl::MeshTyped<ggl::CommonMesh::BufferPos2UV>::attributesReflection(void)::r = (uint64_t)&ggl::CommonMesh::bufferPos2UVReflection;
            }
            ggl::MeshTyped<ggl::CommonMesh::BufferPos2UV>::typedReflection(void)::r = (uint64_t)&ggl::MeshTyped<ggl::CommonMesh::BufferPos2UV>::attributesReflection(void)::r;
            unk_1ECE43AC8 = 1;
          }
          ggl::ImageCopy::Pos2DUVPipelineSetup::typedReflection(void)::ref = (uint64_t)&ggl::MeshTyped<ggl::CommonMesh::BufferPos2UV>::typedReflection(void)::r;
          *(_QWORD *)algn_1EE586198 = &ggl::ImageCopy::pipelineDataPos2DUVPipelineDeviceStructs(void)::ref;
          qword_1EE5861A0 = 0;
          unk_1EE5861A8 = &ggl::ImageCopy::pipelineDataPos2DUVPipelineConstantStructs(void)::ref;
          xmmword_1EE5861B0 = xmmword_19FFB2E40;
        }
      }
      ggl::ImageCopy::Pos2DUVPipelineState::typedReflection(void)::ref = (uint64_t)&ggl::ImageCopy::Pos2DUVPipelineSetup::typedReflection(void)::ref;
      ggl::ImageCopyShader::typedReflection(v171);
      qword_1EE5861D0 = (uint64_t)&ggl::ImageCopyShader::typedReflection(void)::ref;
      if ((v173 & 1) == 0
      {
        ggl::ImageCopy::pipelineStatePos2DUVPipelineAttributeStructBinding(void)::attr = 0;
        unk_1EE586220 = 0;
        qword_1EE586228 = (uint64_t)"";
        dword_1EE586230 = 0;
        qword_1EE586238 = (uint64_t)&ggl::ImageCopy::pipelineStatePos2DUVPipelineAttributeBinding_0(void)::attr;
        unk_1EE586240 = 2;
      }
      qword_1EE5861D8 = (uint64_t)&ggl::ImageCopy::pipelineStatePos2DUVPipelineAttributeStructBinding(void)::attr;
      unk_1EE5861E0 = 1;
      qword_1EE5861E8 = 0;
      unk_1EE5861F0 = 1;
      qword_1EE5861F8 = (uint64_t)&ggl::ImageCopy::pipelineStatePos2DUVPipelineDeviceStructBinding(void)::ref;
      unk_1EE586200 = 0;
      qword_1EE586208 = (uint64_t)&ggl::ImageCopy::pipelineStatePos2DUVPipelineConstantStructBinding(void)::ref;
      unk_1EE586210 = 0;
    }
  }
  if (v58)
  {
    v64 = (unint64_t *)&v58->__shared_owners_;
    do
      v65 = __ldxr(v64);
    while (__stxr(v65 + 1, v64));
    LODWORD(v61[2].__shared_owners_) = 0;
    v61[1].__shared_weak_owners_ = 0;
    v61[2].__vftable = 0;
    v61[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1E42B6760;
    v61[1].__shared_owners_ = 0;
    v61[2].__shared_weak_owners_ = (uint64_t)&ggl::ImageCopy::Pos2DUVPipelineState::typedReflection(void)::ref;
    v61[3].__vftable = v57;
    v61[3].__shared_owners_ = (uint64_t)v58;
    do
      v66 = __ldxr(v64);
    while (__stxr(v66 + 1, v64));
  }
  else
  {
    LODWORD(v61[2].__shared_owners_) = 0;
    v61[1].__shared_weak_owners_ = 0;
    v61[2].__vftable = 0;
    v61[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1E42B6760;
    v61[1].__shared_owners_ = 0;
    v61[2].__shared_weak_owners_ = (uint64_t)&ggl::ImageCopy::Pos2DUVPipelineState::typedReflection(void)::ref;
    v61[3].__vftable = v57;
    v61[3].__shared_owners_ = 0;
  }
  v67 = &v61[1].__vftable;
  LOBYTE(v61[5].__shared_weak_owners_) = 0;
  *(_OWORD *)((char *)&v61[5].__shared_weak_owners_ + 4) = xmmword_19FFB3060;
  *(uint64_t *)((char *)&v61[6].__shared_owners_ + 4) = 0;
  *(std::__shared_weak_count_vtbl **)((char *)&v61[7].__vftable + 4) = 0;
  *(uint64_t *)((char *)&v61[6].__shared_weak_owners_ + 4) = 0;
  LOBYTE(v61[7].__shared_weak_owners_) = 0;
  *(_OWORD *)((char *)&v61[7].__shared_weak_owners_ + 4) = xmmword_19FFB3060;
  *(uint64_t *)((char *)&v61[8].__shared_owners_ + 4) = 0;
  *(std::__shared_weak_count_vtbl **)((char *)&v61[9].__vftable + 4) = 0;
  *(uint64_t *)((char *)&v61[8].__shared_weak_owners_ + 4) = 0;
  LOBYTE(v61[9].__shared_weak_owners_) = 0;
  *(_OWORD *)((char *)&v61[9].__shared_weak_owners_ + 4) = xmmword_19FFB3060;
  *(uint64_t *)((char *)&v61[10].__shared_owners_ + 4) = 0;
  *(std::__shared_weak_count_vtbl **)((char *)&v61[11].__vftable + 4) = 0;
  *(uint64_t *)((char *)&v61[10].__shared_weak_owners_ + 4) = 0;
  LODWORD(v61[11].__shared_weak_owners_) = v48;
  v68 = __dst;
  HIDWORD(v61[12].__vftable) = DWORD2(__dst);
  *(uint64_t *)((char *)&v61[11].__shared_weak_owners_ + 4) = v68;
  v61[12].__shared_owners_ = 1;
  v61[12].__shared_weak_owners_ = 1;
  LOBYTE(v61[13].__vftable) = 0;
  v61[16].__vftable = 0;
  *(_OWORD *)&v61[14].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v61[15].__shared_owners_ = 0u;
  *(_OWORD *)&v61[13].__shared_owners_ = 0u;
  v61[14].std::__shared_count = 0u;
  v61[16].__shared_owners_ = 0x100000001;
  LOBYTE(v61[16].__shared_weak_owners_) = 0;
  LOBYTE(v61[3].__shared_weak_owners_) = 0;
  *(_WORD *)((char *)&v61[3].__shared_weak_owners_ + 1) = v183;
  BYTE3(v61[3].__shared_weak_owners_) = v184;
  *(_OWORD *)((char *)&v61[3].__shared_weak_owners_ + 4) = xmmword_19FFB3060;
  *(uint64_t *)((char *)&v61[4].__shared_owners_ + 4) = (uint64_t)v176;
  HIDWORD(v61[4].__shared_weak_owners_) = 0;
  v61[5].__vftable = 0;
  LODWORD(v61[5].__shared_owners_) = 0;
  BYTE4(v61[5].__shared_owners_) = 15;
  if (v58)
  {
    v69 = (unint64_t *)&v58->__shared_owners_;
    do
      v70 = __ldaxr(v69);
    while (__stlxr(v70 - 1, v69));
    if (!v70)
    {
      ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
      std::__shared_weak_count::__release_weak(v58);
    }
    *v67 = &off_1E42BD0D8;
    do
      v71 = __ldaxr(v69);
    while (__stlxr(v71 - 1, v69));
    if (!v71)
    {
      ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
      std::__shared_weak_count::__release_weak(v58);
    }
  }
  else
  {
    *v67 = &off_1E42BD0D8;
  }
  v72 = (_QWORD *)operator new();
  v73 = v72;
  do
    v74 = __ldxr(v62);
  while (__stxr(v74 + 1, v62));
  ggl::PipelineSetup::PipelineSetup(v72, (uint64_t)&v61[1], (uint64_t)v61);
  do
    v75 = __ldaxr(v62);
  while (__stlxr(v75 - 1, v62));
  if (!v75)
  {
    ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
    std::__shared_weak_count::__release_weak(v61);
  }
  *v73 = &off_1E42BD0A8;
  v76 = *(_QWORD *)(v49 + 24);
  *(_QWORD *)(v49 + 24) = v73;
  if (v76)
    (*(void (**)(uint64_t))(*(_QWORD *)v76 + 8))(v76);
  v77 = (std::__shared_weak_count *)operator new(0xF8uLL);
  v77->__shared_owners_ = 0;
  v78 = (unint64_t *)&v77->__shared_owners_;
  v77->__shared_weak_owners_ = 0;
  v77->__vftable = (std::__shared_weak_count_vtbl *)&off_1E42DF1E8;
  ggl::BufferData::BufferData((uint64_t)&v77[1], 2, 1, 0, 6, 6);
  LODWORD(v77[10].__vftable) = 0;
  v77[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1E42B6B88;
  v77[1].__shared_owners_ = 2;
  v77[9].__shared_owners_ = (uint64_t)&unk_1E42B6BA8;
  v77[9].__shared_weak_owners_ = (uint64_t)"index data";
  v79 = v77[4].__vftable;
  v79->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))0x200010000;
  LODWORD(v79->~__shared_weak_count_0) = 196610;
  v80 = operator new();
  ggl::CommonMesh::Pos2UVMesh::Pos2UVMesh((ggl::CommonMesh::Pos2UVMesh *)v80, "YFlipQuad");
  do
    v81 = __ldxr(v78);
  while (__stxr(v81 + 1, v78));
  do
    v82 = __ldxr(v78);
  while (__stxr(v82 + 1, v78));
  v83 = *(std::__shared_weak_count **)(v80 + 104);
  *(_QWORD *)(v80 + 96) = v77 + 1;
  *(_QWORD *)(v80 + 104) = v77;
  if (v83)
  {
    v84 = (unint64_t *)&v83->__shared_owners_;
    do
      v85 = __ldaxr(v84);
    while (__stlxr(v85 - 1, v84));
    if (!v85)
    {
      ((void (*)(std::__shared_weak_count *))v83->__on_zero_shared)(v83);
      std::__shared_weak_count::__release_weak(v83);
    }
  }
  do
    v86 = __ldaxr(v78);
  while (__stlxr(v86 - 1, v78));
  if (!v86)
  {
    ((void (*)(std::__shared_weak_count *))v77->__on_zero_shared)(v77);
    std::__shared_weak_count::__release_weak(v77);
  }
  v87 = **(_QWORD **)(v80 + 64);
  v88 = 4 * *(_QWORD *)(v87 + 8);
  v89 = *(_QWORD *)(v87 + 72);
  v90 = *(_QWORD *)(v87 + 80) - v89;
  v91 = v88 - v90;
  if (v88 != v90)
  {
    if (v88 <= v90)
    {
      if (v88 < v90)
        *(_QWORD *)(v87 + 80) = v89 + v88;
    }
    else
    {
      std::vector<unsigned char,geo::StdAllocator<unsigned char,mdm::Allocator>>::__append(v87 + 72, v91);
    }
    v92 = *(std::__shared_weak_count **)(v87 + 32);
    *(_QWORD *)(v87 + 24) = 0;
    *(_QWORD *)(v87 + 32) = 0;
    if (v92)
    {
      v93 = (unint64_t *)&v92->__shared_owners_;
      do
        v94 = __ldaxr(v93);
      while (__stlxr(v94 - 1, v93));
      if (!v94)
      {
        ((void (*)(std::__shared_weak_count *))v92->__on_zero_shared)(v92);
        std::__shared_weak_count::__release_weak(v92);
      }
    }
    *(_QWORD *)(v87 + 120) = 0;
    *(_DWORD *)(v87 + 112) = 0;
    v95 = *(_QWORD *)(v87 + 80) - *(_QWORD *)(v87 + 72);
    *(_QWORD *)(v87 + 40) = 0;
    *(_QWORD *)(v87 + 48) = v95;
    *(_QWORD *)(v87 + 56) = 0;
    *(_QWORD *)(v87 + 64) = v95;
    v87 = **(_QWORD **)(v80 + 64);
    v88 = 4 * *(_QWORD *)(v87 + 8);
  }
  v96 = *(_OWORD **)(v87 + 72);
  *v96 = xmmword_19FFB34C0;
  v96[1] = xmmword_19FFB4810;
  v96[2] = xmmword_19FFB39B0;
  v96[3] = xmmword_19FFB3980;
  if (*(_QWORD *)(v87 + 64) > v88)
    v88 = *(_QWORD *)(v87 + 64);
  *(_QWORD *)(v87 + 56) = 0;
  *(_QWORD *)(v87 + 64) = v88;
  shared_weak_owners = v77[3].__shared_weak_owners_;
  if (shared_weak_owners <= 0xC)
    shared_weak_owners = 12;
  v77[3].__shared_owners_ = 0;
  v77[3].__shared_weak_owners_ = shared_weak_owners;
  do
    v98 = __ldaxr(v78);
  while (__stlxr(v98 - 1, v78));
  if (!v98)
  {
    ((void (*)(std::__shared_weak_count *, unint64_t))v77->__on_zero_shared)(v77, v91);
    std::__shared_weak_count::__release_weak(v77);
  }
  v99 = *(_QWORD *)(v49 + 40);
  *(_QWORD *)(v49 + 40) = v80;
  if (v99)
    (*(void (**)(uint64_t, unint64_t))(*(_QWORD *)v99 + 8))(v99, v91);
  v100 = operator new();
  *(_QWORD *)v100 = &off_1E42B59B0;
  *(_QWORD *)(v100 + 16) = "";
  *(_OWORD *)(v100 + 24) = *(_OWORD *)(v49 + 16);
  *(_DWORD *)(v100 + 40) = 0;
  *(_QWORD *)(v100 + 48) = 0;
  *(_DWORD *)(v100 + 56) = 1065353216;
  v101 = *(_QWORD *)(v49 + 32);
  *(_QWORD *)(v100 + 64) = *(_QWORD *)(v49 + 40);
  *(_QWORD *)(v100 + 72) = 0;
  *(_QWORD *)(v100 + 80) = 0;
  *(_QWORD *)(v100 + 88) = 0;
  *(int64x2_t *)(v100 + 96) = vdupq_n_s64(1uLL);
  *(_QWORD *)(v100 + 112) = 0;
  *(_QWORD *)(v49 + 32) = v100;
  if (v101)
    (*(void (**)(uint64_t))(*(_QWORD *)v101 + 8))(v101);
  v102 = (ggl::CommandBuffer *)operator new();
  v103 = ggl::CommandBuffer::CommandBuffer(v102, 0, "");
  v104 = *(_QWORD *)(v49 + 8);
  *(_QWORD *)(v49 + 8) = v102;
  if (v104)
  {
    (*(void (**)(uint64_t, double))(*(_QWORD *)v104 + 8))(v104, v103);
    v102 = *(ggl::CommandBuffer **)(v49 + 8);
  }
  ggl::RenderQueue::setBufferForLayer(*(_QWORD *)v49, 0, v102);
  do
    v105 = __ldaxr(v62);
  while (__stlxr(v105 - 1, v62));
  if (!v105)
  {
    ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
    std::__shared_weak_count::__release_weak(v61);
  }
  v106 = *((_QWORD *)v21 + 14);
  *((_QWORD *)v21 + 14) = v49;
  if (v106)
    std::default_delete<md::YFlipPass>::operator()[abi:nn180100](v106);
  v107 = *((_QWORD *)v21 + 61);
  v108 = operator new();
  v109 = v21;
  *(_QWORD *)v108 = &off_1E428B3B8;
  *(_QWORD *)(v108 + 8) = v109;
  v176 = (char *)v108;
  v110 = (_QWORD *)operator new();
  v110[1] = 0;
  v111 = v110 + 1;
  *v110 = &off_1E42E68E8;
  v110[2] = 0;
  v110[3] = v108;
  v177 = (char *)v110;
  *(_QWORD *)&__dst = 0x15CDDE628588B5E5;
  *((_QWORD *)&__dst + 1) = "md::YFlipPassInjector]";
  *(_QWORD *)&v186 = 21;
  v112 = geo::linear_map<gdc::TypeInfo,std::shared_ptr<void>,std::equal_to<gdc::TypeInfo>,std::allocator<std::pair<gdc::TypeInfo,std::shared_ptr<void>>>,std::vector<std::pair<gdc::TypeInfo,std::shared_ptr<void>>>>::operator[](v107, &__dst);
  do
    v113 = __ldxr(v111);
  while (__stxr(v113 + 1, v111));
  v114 = (std::__shared_weak_count *)*((_QWORD *)v112 + 1);
  *(_QWORD *)v112 = v108;
  *((_QWORD *)v112 + 1) = v110;
  if (v114)
  {
    v115 = (unint64_t *)&v114->__shared_owners_;
    do
      v116 = __ldaxr(v115);
    while (__stlxr(v116 - 1, v115));
    if (!v116)
    {
      ((void (*)(std::__shared_weak_count *))v114->__on_zero_shared)(v114);
      std::__shared_weak_count::__release_weak(v114);
    }
  }
  *(_QWORD *)&__dst = 0x117E7C1AC2EF2C5ALL;
  *((_QWORD *)&__dst + 1) = "GGLImageCanvasYFlipInjector]";
  *(_QWORD *)&v186 = 27;
  v117 = geo::linear_map<gdc::TypeInfo,std::shared_ptr<void>,std::equal_to<gdc::TypeInfo>,std::allocator<std::pair<gdc::TypeInfo,std::shared_ptr<void>>>,std::vector<std::pair<gdc::TypeInfo,std::shared_ptr<void>>>>::operator[](v107, &__dst);
  v119 = v176;
  v118 = v177;
  if (v177)
  {
    v120 = (unint64_t *)(v177 + 8);
    do
      v121 = __ldxr(v120);
    while (__stxr(v121 + 1, v120));
  }
  v122 = (std::__shared_weak_count *)*((_QWORD *)v117 + 1);
  *(_QWORD *)v117 = v119;
  *((_QWORD *)v117 + 1) = v118;
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
  v125 = (std::__shared_weak_count *)v177;
  if (v177)
  {
    v126 = (unint64_t *)(v177 + 8);
    do
      v127 = __ldaxr(v126);
    while (__stlxr(v127 - 1, v126));
    if (!v127)
    {
      ((void (*)(std::__shared_weak_count *))v125->__on_zero_shared)(v125);
      std::__shared_weak_count::__release_weak(v125);
    }
  }
  v128 = *((_QWORD *)v21 + 61);
  v129 = operator new();
  v130 = v109;
  *(_QWORD *)v129 = &off_1E428B8A0;
  *(_QWORD *)(v129 + 8) = v130;
  v176 = (char *)v129;
  v131 = (_QWORD *)operator new();
  v131[1] = 0;
  v132 = v131 + 1;
  *v131 = &off_1E42E69C8;
  v131[2] = 0;
  v131[3] = v129;
  v177 = (char *)v131;
  *(_QWORD *)&__dst = 0xB05F868A6300FD6ELL;
  *((_QWORD *)&__dst + 1) = "md::RenderTargetPreparer]";
  *(_QWORD *)&v186 = 24;
  v133 = geo::linear_map<gdc::TypeInfo,std::shared_ptr<void>,std::equal_to<gdc::TypeInfo>,std::allocator<std::pair<gdc::TypeInfo,std::shared_ptr<void>>>,std::vector<std::pair<gdc::TypeInfo,std::shared_ptr<void>>>>::operator[](v128, &__dst);
  do
    v134 = __ldxr(v132);
  while (__stxr(v134 + 1, v132));
  v135 = (std::__shared_weak_count *)*((_QWORD *)v133 + 1);
  *(_QWORD *)v133 = v129;
  *((_QWORD *)v133 + 1) = v131;
  if (v135)
  {
    v136 = (unint64_t *)&v135->__shared_owners_;
    do
      v137 = __ldaxr(v136);
    while (__stlxr(v137 - 1, v136));
    if (!v137)
    {
      ((void (*)(std::__shared_weak_count *))v135->__on_zero_shared)(v135);
      std::__shared_weak_count::__release_weak(v135);
    }
  }
  *(_QWORD *)&__dst = 0x53CD38396F63DB24;
  *((_QWORD *)&__dst + 1) = "GGLImageCanvasRenderTargetPreparer]";
  *(_QWORD *)&v186 = 34;
  v138 = geo::linear_map<gdc::TypeInfo,std::shared_ptr<void>,std::equal_to<gdc::TypeInfo>,std::allocator<std::pair<gdc::TypeInfo,std::shared_ptr<void>>>,std::vector<std::pair<gdc::TypeInfo,std::shared_ptr<void>>>>::operator[](v128, &__dst);
  v140 = v176;
  v139 = v177;
  if (v177)
  {
    v141 = (unint64_t *)(v177 + 8);
    do
      v142 = __ldxr(v141);
    while (__stxr(v142 + 1, v141));
  }
  v143 = (std::__shared_weak_count *)*((_QWORD *)v138 + 1);
  *(_QWORD *)v138 = v140;
  *((_QWORD *)v138 + 1) = v139;
  if (v143)
  {
    v144 = (unint64_t *)&v143->__shared_owners_;
    do
      v145 = __ldaxr(v144);
    while (__stlxr(v145 - 1, v144));
    if (!v145)
    {
      ((void (*)(std::__shared_weak_count *))v143->__on_zero_shared)(v143);
      std::__shared_weak_count::__release_weak(v143);
    }
  }
  v146 = (std::__shared_weak_count *)v177;
  if (v177)
  {
    v147 = (unint64_t *)(v177 + 8);
    do
      v148 = __ldaxr(v147);
    while (__stlxr(v148 - 1, v147));
    if (!v148)
    {
      ((void (*)(std::__shared_weak_count *))v146->__on_zero_shared)(v146);
      std::__shared_weak_count::__release_weak(v146);
    }
  }
  v149 = *((_QWORD *)v21 + 61);
  v150 = operator new();
  v151 = v130;
  *(_QWORD *)v150 = off_1E426EE00;
  *(_QWORD *)(v150 + 8) = v151;
  v176 = (char *)v150;
  v152 = (_QWORD *)operator new();
  v152[1] = 0;
  v153 = v152 + 1;
  *v152 = &off_1E428A3A8;
  v152[2] = 0;
  v152[3] = v150;
  v177 = (char *)v152;
  *(_QWORD *)&__dst = 0x4987A5FEEF8688ACLL;
  *((_QWORD *)&__dst + 1) = "md::GGLRendererProvider]";
  *(_QWORD *)&v186 = 23;
  v154 = geo::linear_map<gdc::TypeInfo,std::shared_ptr<void>,std::equal_to<gdc::TypeInfo>,std::allocator<std::pair<gdc::TypeInfo,std::shared_ptr<void>>>,std::vector<std::pair<gdc::TypeInfo,std::shared_ptr<void>>>>::operator[](v149, &__dst);
  do
    v155 = __ldxr(v153);
  while (__stxr(v155 + 1, v153));
  v156 = (std::__shared_weak_count *)*((_QWORD *)v154 + 1);
  *(_QWORD *)v154 = v150;
  *((_QWORD *)v154 + 1) = v152;
  if (v156)
  {
    v157 = (unint64_t *)&v156->__shared_owners_;
    do
      v158 = __ldaxr(v157);
    while (__stlxr(v158 - 1, v157));
    if (!v158)
    {
      ((void (*)(std::__shared_weak_count *))v156->__on_zero_shared)(v156);
      std::__shared_weak_count::__release_weak(v156);
    }
  }
  *(_QWORD *)&__dst = 0xC7A2DA07C4458874;
  *((_QWORD *)&__dst + 1) = "GGLImageCanvasRendererProvider]";
  *(_QWORD *)&v186 = 30;
  v159 = geo::linear_map<gdc::TypeInfo,std::shared_ptr<void>,std::equal_to<gdc::TypeInfo>,std::allocator<std::pair<gdc::TypeInfo,std::shared_ptr<void>>>,std::vector<std::pair<gdc::TypeInfo,std::shared_ptr<void>>>>::operator[](v149, &__dst);
  v161 = v176;
  v160 = v177;
  if (v177)
  {
    v162 = (unint64_t *)(v177 + 8);
    do
      v163 = __ldxr(v162);
    while (__stxr(v163 + 1, v162));
  }
  v164 = (std::__shared_weak_count *)*((_QWORD *)v159 + 1);
  *(_QWORD *)v159 = v161;
  *((_QWORD *)v159 + 1) = v160;
  if (v164)
  {
    v165 = (unint64_t *)&v164->__shared_owners_;
    do
      v166 = __ldaxr(v165);
    while (__stlxr(v166 - 1, v165));
    if (!v166)
    {
      ((void (*)(std::__shared_weak_count *))v164->__on_zero_shared)(v164);
      std::__shared_weak_count::__release_weak(v164);
    }
  }
  v167 = (std::__shared_weak_count *)v177;
  if (v177)
  {
    v168 = (unint64_t *)(v177 + 8);
    do
      v169 = __ldaxr(v168);
    while (__stlxr(v169 - 1, v168));
    if (!v169)
    {
      ((void (*)(std::__shared_weak_count *))v167->__on_zero_shared)(v167);
      std::__shared_weak_count::__release_weak(v167);
    }
  }
  if (__p)
    operator delete(__p);
  return (GGLImageCanvas *)v21;
}

- (void)renderTarget
{
  return (void *)*((_QWORD *)self + 24);
}

- (void)flipTarget
{
  return (void *)*((_QWORD *)self + 13);
}

- (void)flipPass
{
  return (void *)*((_QWORD *)self + 14);
}

- (void)finalSurface
{
  return (void *)*((_QWORD *)self + 12);
}

- (void)willDealloc
{
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  md::DebugConsoleManager *v9;
  uint64_t v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;

  v3 = (std::__shared_weak_count *)*((_QWORD *)self + 2);
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *, SEL))v3->__on_zero_shared)(v3, a2);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  v6 = *((_QWORD *)self + 12);
  *((_QWORD *)self + 12) = 0;
  if (v6)
    (*(void (**)(uint64_t, SEL))(*(_QWORD *)v6 + 8))(v6, a2);
  v7 = *((_QWORD *)self + 13);
  *((_QWORD *)self + 13) = 0;
  if (v7)
    (*(void (**)(uint64_t, SEL))(*(_QWORD *)v7 + 8))(v7, a2);
  v8 = *((_QWORD *)self + 14);
  *((_QWORD *)self + 14) = 0;
  if (v8)
    std::default_delete<md::YFlipPass>::operator()[abi:nn180100](v8);
  std::mutex::lock((std::mutex *)((char *)self + 416));
  v9 = (md::DebugConsoleManager *)*((_QWORD *)self + 60);
  if (v9)
  {
    *((_QWORD *)self + 60) = 0;
    md::DebugConsoleManager::~DebugConsoleManager(v9);
    MEMORY[0x1A1AF4E00]();
  }
  std::mutex::unlock((std::mutex *)((char *)self + 416));
  v10 = *((_QWORD *)self + 23);
  *((_QWORD *)self + 23) = 0;
  if (v10)
    (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
  v11 = *((_QWORD *)self + 24);
  *((_QWORD *)self + 24) = 0;
  if (v11)
    (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
  v12 = (std::__shared_weak_count *)*((_QWORD *)self + 26);
  *((_QWORD *)self + 25) = 0;
  *((_QWORD *)self + 26) = 0;
  if (v12)
  {
    v13 = (unint64_t *)&v12->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  v15 = *((_QWORD *)self + 27);
  *((_QWORD *)self + 27) = 0;
  if (v15)
    (*(void (**)(uint64_t))(*(_QWORD *)v15 + 8))(v15);
  v16 = (std::__shared_weak_count *)*((_QWORD *)self + 29);
  *((_QWORD *)self + 28) = 0;
  *((_QWORD *)self + 29) = 0;
  if (v16)
  {
    v17 = (unint64_t *)&v16->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  v19 = (std::__shared_weak_count *)*((_QWORD *)self + 31);
  *((_QWORD *)self + 30) = 0;
  *((_QWORD *)self + 31) = 0;
  if (v19)
  {
    v20 = (unint64_t *)&v19->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  v22 = (std::__shared_weak_count *)*((_QWORD *)self + 33);
  *((_QWORD *)self + 32) = 0;
  *((_QWORD *)self + 33) = 0;
  if (v22)
  {
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
  v25 = *((_QWORD *)self + 38);
  *((_QWORD *)self + 38) = 0;
  if (v25)
    (*(void (**)(uint64_t))(*(_QWORD *)v25 + 8))(v25);
  v26 = (std::__shared_weak_count *)*((_QWORD *)self + 40);
  *((_QWORD *)self + 39) = 0;
  *((_QWORD *)self + 40) = 0;
  if (v26)
  {
    v27 = (unint64_t *)&v26->__shared_owners_;
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  v29 = (std::__shared_weak_count *)*((_QWORD *)self + 42);
  *((_QWORD *)self + 41) = 0;
  *((_QWORD *)self + 42) = 0;
  if (v29)
  {
    v30 = (unint64_t *)&v29->__shared_owners_;
    do
      v31 = __ldaxr(v30);
    while (__stlxr(v31 - 1, v30));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }
  v32 = (std::__shared_weak_count *)*((_QWORD *)self + 44);
  *((_QWORD *)self + 43) = 0;
  *((_QWORD *)self + 44) = 0;
  if (v32)
  {
    v33 = (unint64_t *)&v32->__shared_owners_;
    do
      v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
  }
  v35 = (std::__shared_weak_count *)*((_QWORD *)self + 46);
  *((_QWORD *)self + 45) = 0;
  *((_QWORD *)self + 46) = 0;
  if (v35)
  {
    v36 = (unint64_t *)&v35->__shared_owners_;
    do
      v37 = __ldaxr(v36);
    while (__stlxr(v37 - 1, v36));
    if (!v37)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }
  v38 = (std::__shared_weak_count *)*((_QWORD *)self + 49);
  *((_QWORD *)self + 48) = 0;
  *((_QWORD *)self + 49) = 0;
  if (v38)
  {
    v39 = (unint64_t *)&v38->__shared_owners_;
    do
      v40 = __ldaxr(v39);
    while (__stlxr(v40 - 1, v39));
    if (!v40)
    {
      ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
      std::__shared_weak_count::__release_weak(v38);
    }
  }
}

- (void)_internalRenderTarget
{
  return (void *)*((_QWORD *)self + 13);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)GGLImageCanvas;
  -[GGLImageCanvas dealloc](&v2, sel_dealloc);
}

- (BOOL)shouldRasterize
{
  return 0;
}

- (void)imageTexture
{
  int v2;
  char *v3;
  uint64_t v4;

  v2 = *((unsigned __int8 *)self + 376);
  v3 = -[GGLImageCanvas renderTarget](self, "renderTarget");
  v4 = 184;
  if (!v2)
    v4 = 88;
  return *(void **)&v3[v4];
}

- (shared_ptr<ggl::BitmapDataBase>)bitmapData
{
  _QWORD *v2;
  _OWORD *v3;
  void *v4;
  unsigned int v5;
  CFStringRef *v6;
  CGColorSpace *v7;
  __IOSurface *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  size_t Width;
  size_t Height;
  size_t v13;
  size_t BytesPerRow;
  CGColorSpaceRef v15;
  __int128 v16;
  unint64_t v17;
  unint64_t *p_shared_weak_owners;
  unint64_t v19;
  unint64_t v20;
  BOOL v21;
  int v22;
  BOOL v23;
  __int128 v24;
  shared_ptr<ggl::BitmapDataBase> result;

  v3 = v2;
  if (*((_BYTE *)self + 80))
  {
    v4 = -[GGLImageCanvas finalSurface](self, "finalSurface");
    v5 = *((_DWORD *)v4 + 17);
    if (v5 - 44 >= 0xE && ((v21 = v5 > 0xF, v22 = (1 << v5) & 0xA800, !v21) ? (v23 = v22 == 0) : (v23 = 1), v23))
      v6 = (CFStringRef *)MEMORY[0x1E0C9DA00];
    else
      v6 = (CFStringRef *)MEMORY[0x1E0C9DA10];
    v7 = CGColorSpaceCreateWithName(*v6);
    v8 = (__IOSurface *)*((_QWORD *)v4 + 20);
    v9 = (std::__shared_weak_count *)operator new(0x80uLL);
    v9->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    v9->__shared_weak_owners_ = 0;
    v9->__vftable = (std::__shared_weak_count_vtbl *)&off_1E42E3740;
    Width = IOSurfaceGetWidth(v8);
    Height = IOSurfaceGetHeight(v8);
    v13 = 8 * IOSurfaceGetBytesPerElement(v8);
    BytesPerRow = IOSurfaceGetBytesPerRow(v8);
    v9[1].__shared_owners_ = 0;
    v9[1].__shared_weak_owners_ = 0;
    v9[2].__vftable = (std::__shared_weak_count_vtbl *)Width;
    v9[2].__shared_owners_ = Height;
    v9[2].__shared_weak_owners_ = 8;
    v9[3].__vftable = (std::__shared_weak_count_vtbl *)v13;
    v9[3].__shared_owners_ = BytesPerRow;
    v15 = CGColorSpaceRetain(v7);
    v9[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1E42BA928;
    v9[3].__shared_weak_owners_ = (uint64_t)v15;
    LODWORD(v9[4].__vftable) = 8198;
    v9[4].__shared_owners_ = (uint64_t)v8;
    v9[4].__shared_weak_owners_ = IOSurfaceGetAllocSize(v8);
    LOBYTE(v9[5].__vftable) = 0;
    if (v8)
      CFRetain(v8);
    *(_QWORD *)&v16 = v9 + 1;
    *((_QWORD *)&v16 + 1) = v9;
    do
      v17 = __ldxr(p_shared_owners);
    while (__stxr(v17 + 1, p_shared_owners));
    p_shared_weak_owners = (unint64_t *)&v9->__shared_weak_owners_;
    do
      v19 = __ldxr(p_shared_weak_owners);
    while (__stxr(v19 + 1, p_shared_weak_owners));
    v9[1].__shared_owners_ = (uint64_t)&v9[1];
    v9[1].__shared_weak_owners_ = (uint64_t)v9;
    do
      v20 = __ldaxr(p_shared_owners);
    while (__stlxr(v20 - 1, p_shared_owners));
    if (!v20)
    {
      v24 = v16;
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
      v16 = v24;
    }
    *v3 = v16;
    CGColorSpaceRelease(v7);
  }
  else
  {
    *v2 = 0;
    v2[1] = 0;
  }
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = (BitmapDataBase *)self;
  return result;
}

- (void)setSize:(CGSize)a3
{
  if (*((double *)self + 3) != a3.width || *((double *)self + 4) != a3.height)
  {
    *((_QWORD *)self + 3) = *(_QWORD *)&a3.width;
    *((_QWORD *)self + 4) = *(_QWORD *)&a3.height;
    *((_WORD *)self + 40) = 256;
  }
}

- (void)setContentScale:(double)a3
{
  if (*((double *)self + 5) != a3)
  {
    *((double *)self + 5) = a3;
    *((_WORD *)self + 40) = 256;
  }
}

- (void)linearRenderTarget
{
  return (void *)*((_QWORD *)self + 38);
}

- (const)linearFormat
{
  return (const RenderTargetFormat *)((char *)self + 272);
}

- (void)renderer
{
  return (void *)*((_QWORD *)self + 23);
}

- (__IOSurface)flipImage
{
  const void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  int v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  _QWORD v23[3];
  std::__shared_weak_count *v24;

  v3 = *(const void **)(*((_QWORD *)self + 12) + 160);
  CFRetain(v3);
  -[GGLImageCanvas sizeInPixels](self, "sizeInPixels");
  v5 = v4;
  v7 = v6;
  v8 = *((_DWORD *)self + 30);
  v9 = (std::__shared_weak_count *)operator new(0x58uLL);
  v9->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v9->__shared_owners_;
  v9->__shared_weak_owners_ = 0;
  v9->__vftable = (std::__shared_weak_count_vtbl *)&off_1E42DED18;
  v9[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1E42B63B0;
  v9[1].__shared_weak_owners_ = 0;
  v9[2].__vftable = 0;
  v9[1].__shared_owners_ = 0;
  LODWORD(v9[2].__shared_owners_) = 0;
  *(_OWORD *)((char *)&v9[2].__shared_owners_ + 4) = xmmword_19FFB3C50;
  *(std::__shared_weak_count_vtbl **)((char *)&v9[3].__vftable + 4) = (std::__shared_weak_count_vtbl *)0x100000000;
  HIDWORD(v9[3].__shared_owners_) = 0;
  v23[2] = v9 + 1;
  v24 = v9;
  v11 = operator new();
  v12 = v11;
  v23[0] = v9 + 1;
  v23[1] = v9;
  do
    v13 = __ldxr(p_shared_owners);
  while (__stxr(v13 + 1, p_shared_owners));
  ggl::IOSurfaceTexture::IOSurfaceTexture(v11, v5, v7, v8, v23, 2);
  v14 = *((_QWORD *)self + 12);
  *((_QWORD *)self + 12) = v12;
  if (v14)
    (*(void (**)(uint64_t))(*(_QWORD *)v14 + 8))(v14);
  do
    v15 = __ldaxr(p_shared_owners);
  while (__stlxr(v15 - 1, p_shared_owners));
  if (!v15)
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
  }
  v17 = *((_QWORD *)self + 12);
  v16 = *((_QWORD *)self + 13);
  *(_QWORD *)(v16 + 96) = 0;
  *(_QWORD *)(v16 + 104) = 0;
  *(_QWORD *)(v16 + 88) = v17;
  *(_DWORD *)(v16 + 80) = *(_DWORD *)(v17 + 72);
  v18 = *(_QWORD *)(v16 + 72);
  if (v18 <= 1)
    v18 = 1;
  *(_QWORD *)(v16 + 72) = v18;
  *(_DWORD *)(v16 + 56) = *(_DWORD *)(v17 + 68);
  v19 = v24;
  if (v24)
  {
    v20 = (unint64_t *)&v24->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  return (__IOSurface *)v3;
}

- (void)prepareRenderTask:(const void *)a3
{
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t (***v14)();
  uint64_t v15;
  id to;
  id location;
  uint64_t (**v18)();
  id v19;
  uint64_t (***v20)();
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = *((_QWORD *)self + 61);
  v6 = *(_QWORD **)v5;
  v7 = *(_QWORD **)(v5 + 8);
  if (v6 != v7)
  {
    while (*v6 != 0x8C3843AC816FCBCLL)
    {
      v6 += 5;
      if (v6 == v7)
        goto LABEL_12;
    }
  }
  if (v6 == v7)
  {
LABEL_12:
    v8 = 0;
  }
  else
  {
    v8 = v6[3];
    v9 = (std::__shared_weak_count *)v6[4];
    if (v9)
    {
      p_shared_owners = (unint64_t *)&v9->__shared_owners_;
      do
        v11 = __ldxr(p_shared_owners);
      while (__stxr(v11 + 1, p_shared_owners));
      do
        v12 = __ldaxr(p_shared_owners);
      while (__stlxr(v12 - 1, p_shared_owners));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *, SEL))v9->__on_zero_shared)(v9, a2);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
  }
  objc_initWeak(&location, self);
  v13 = *(_QWORD *)a3;
  objc_copyWeak(&to, &location);
  v20 = 0;
  v18 = &off_1E42C7820;
  objc_moveWeak(&v19, &to);
  v20 = &v18;
  objc_destroyWeak(&to);
  (*(void (**)(uint64_t, uint64_t, _QWORD, uint64_t (***)()))(*(_QWORD *)v8 + 64))(v8, v13, 0, &v18);
  v14 = v20;
  if (v20 == &v18)
  {
    v15 = 4;
    v14 = &v18;
    goto LABEL_17;
  }
  if (v20)
  {
    v15 = 5;
LABEL_17:
    (*v14)[v15]();
  }
  objc_destroyWeak(&location);
}

- (void)didDrawView
{
  *((_BYTE *)self + 80) = 1;
}

- (void)debugConsoleForId:(int)a3
{
  std::mutex *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  md::DebugConsoleManager *v12;
  void *v13;

  v5 = (std::mutex *)((char *)self + 416);
  std::mutex::lock((std::mutex *)((char *)self + 416));
  v6 = (_QWORD *)*((_QWORD *)self + 60);
  if (!v6)
  {
    v6 = (_QWORD *)operator new();
    v7 = *((_QWORD *)self + 23);
    v8 = *(_QWORD **)(*((_QWORD *)self + 51) + 24);
    *v6 = 0;
    v6[1] = 0;
    v6[2] = 0;
    v6[3] = v7;
    v9 = v8[1];
    v6[4] = *v8;
    v6[5] = v9;
    if (v9)
    {
      v10 = (unint64_t *)(v9 + 8);
      do
        v11 = __ldxr(v10);
      while (__stxr(v11 + 1, v10));
    }
    v12 = (md::DebugConsoleManager *)*((_QWORD *)self + 60);
    *((_QWORD *)self + 60) = v6;
    if (v12)
    {
      md::DebugConsoleManager::~DebugConsoleManager(v12);
      MEMORY[0x1A1AF4E00]();
      v6 = (_QWORD *)*((_QWORD *)self + 60);
    }
  }
  v13 = (void *)md::DebugConsoleManager::console((uint64_t)v6, a3);
  std::mutex::unlock(v5);
  return v13;
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *((double *)self + 6);
  v3 = *((double *)self + 7);
  v4 = *((double *)self + 8);
  v5 = *((double *)self + 9);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  *((_QWORD *)self + 6) = *(_QWORD *)&a3.origin.x;
  *((_QWORD *)self + 7) = *(_QWORD *)&a3.origin.y;
  *((_QWORD *)self + 8) = *(_QWORD *)&a3.size.width;
  *((_QWORD *)self + 9) = *(_QWORD *)&a3.size.height;
}

- (GGLRenderQueueSource)renderSource
{
  return (GGLRenderQueueSource *)objc_loadWeakRetained((id *)self + 11);
}

- (BOOL)multiSample
{
  return *((_BYTE *)self + 376);
}

- (unint64_t)signpost
{
  return *((_QWORD *)self + 62);
}

- (void).cxx_destruct
{
  md::DebugConsoleManager *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  uint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;

  v3 = (md::DebugConsoleManager *)*((_QWORD *)self + 60);
  *((_QWORD *)self + 60) = 0;
  if (v3)
  {
    md::DebugConsoleManager::~DebugConsoleManager(v3);
    MEMORY[0x1A1AF4E00]();
  }
  std::mutex::~mutex((std::mutex *)((char *)self + 416));
  v4 = (std::__shared_weak_count *)*((_QWORD *)self + 49);
  if (!v4)
    goto LABEL_7;
  p_shared_owners = (unint64_t *)&v4->__shared_owners_;
  do
    v6 = __ldaxr(p_shared_owners);
  while (__stlxr(v6 - 1, p_shared_owners));
  if (!v6)
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
    v7 = (std::__shared_weak_count *)*((_QWORD *)self + 46);
    if (!v7)
      goto LABEL_13;
  }
  else
  {
LABEL_7:
    v7 = (std::__shared_weak_count *)*((_QWORD *)self + 46);
    if (!v7)
      goto LABEL_13;
  }
  v8 = (unint64_t *)&v7->__shared_owners_;
  do
    v9 = __ldaxr(v8);
  while (__stlxr(v9 - 1, v8));
  if (!v9)
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
LABEL_13:
  v10 = (std::__shared_weak_count *)*((_QWORD *)self + 44);
  if (!v10)
    goto LABEL_17;
  v11 = (unint64_t *)&v10->__shared_owners_;
  do
    v12 = __ldaxr(v11);
  while (__stlxr(v12 - 1, v11));
  if (!v12)
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v10);
    v13 = (std::__shared_weak_count *)*((_QWORD *)self + 42);
    if (!v13)
      goto LABEL_23;
  }
  else
  {
LABEL_17:
    v13 = (std::__shared_weak_count *)*((_QWORD *)self + 42);
    if (!v13)
      goto LABEL_23;
  }
  v14 = (unint64_t *)&v13->__shared_owners_;
  do
    v15 = __ldaxr(v14);
  while (__stlxr(v15 - 1, v14));
  if (!v15)
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
  }
LABEL_23:
  v16 = (std::__shared_weak_count *)*((_QWORD *)self + 40);
  if (v16)
  {
    v17 = (unint64_t *)&v16->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  v19 = *((_QWORD *)self + 38);
  *((_QWORD *)self + 38) = 0;
  if (v19)
    (*(void (**)(uint64_t))(*(_QWORD *)v19 + 8))(v19);
  v20 = (std::__shared_weak_count *)*((_QWORD *)self + 33);
  if (!v20)
    goto LABEL_34;
  v21 = (unint64_t *)&v20->__shared_owners_;
  do
    v22 = __ldaxr(v21);
  while (__stlxr(v22 - 1, v21));
  if (!v22)
  {
    ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
    std::__shared_weak_count::__release_weak(v20);
    v23 = (std::__shared_weak_count *)*((_QWORD *)self + 31);
    if (!v23)
      goto LABEL_40;
  }
  else
  {
LABEL_34:
    v23 = (std::__shared_weak_count *)*((_QWORD *)self + 31);
    if (!v23)
      goto LABEL_40;
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
LABEL_40:
  v26 = (std::__shared_weak_count *)*((_QWORD *)self + 29);
  if (v26)
  {
    v27 = (unint64_t *)&v26->__shared_owners_;
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  v29 = *((_QWORD *)self + 27);
  *((_QWORD *)self + 27) = 0;
  if (v29)
    (*(void (**)(uint64_t))(*(_QWORD *)v29 + 8))(v29);
  v30 = (std::__shared_weak_count *)*((_QWORD *)self + 26);
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
  v33 = *((_QWORD *)self + 24);
  *((_QWORD *)self + 24) = 0;
  if (v33)
    (*(void (**)(uint64_t))(*(_QWORD *)v33 + 8))(v33);
  v34 = *((_QWORD *)self + 23);
  *((_QWORD *)self + 23) = 0;
  if (v34)
    (*(void (**)(uint64_t))(*(_QWORD *)v34 + 8))(v34);
  v35 = *((_QWORD *)self + 14);
  *((_QWORD *)self + 14) = 0;
  if (v35)
    std::default_delete<md::YFlipPass>::operator()[abi:nn180100](v35);
  v36 = *((_QWORD *)self + 13);
  *((_QWORD *)self + 13) = 0;
  if (v36)
    (*(void (**)(uint64_t))(*(_QWORD *)v36 + 8))(v36);
  v37 = *((_QWORD *)self + 12);
  *((_QWORD *)self + 12) = 0;
  if (v37)
    (*(void (**)(uint64_t))(*(_QWORD *)v37 + 8))(v37);
  objc_destroyWeak((id *)self + 11);
  v38 = (std::__shared_weak_count *)*((_QWORD *)self + 2);
  if (v38)
  {
    v39 = (unint64_t *)&v38->__shared_owners_;
    do
      v40 = __ldaxr(v39);
    while (__stlxr(v40 - 1, v39));
    if (!v40)
    {
      ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
      std::__shared_weak_count::__release_weak(v38);
    }
  }
}

- (uint64_t)prepareRenderTask:
{
  objc_destroyWeak((id *)(a1 + 8));
  return a1;
}

- (void)prepareRenderTask:
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "didDrawView");

}

- (id)prepareRenderTask:
{
  id *v1;
  id *v2;

  v1 = (id *)(a1 + 8);
  v2 = (id *)operator new(0x10uLL);
  *v2 = &off_1E42C7820;
  objc_copyWeak(v2 + 1, v1);
  return v2;
}

@end

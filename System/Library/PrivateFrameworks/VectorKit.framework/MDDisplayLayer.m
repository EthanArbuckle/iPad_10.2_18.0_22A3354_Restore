@implementation MDDisplayLayer

- (void)_notifyObserversSizeChanged:(CGSize)a3
{
  double height;
  double width;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  height = a3.height;
  width = a3.width;
  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = *((id *)self + 73);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if (v9)
          objc_msgSend(v9, "sizeDidChange:", width, height, (_QWORD)v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (BOOL)hasRenderTarget
{
  void *v2;
  BOOL v3;

  -[MDDisplayLayer layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CALayer)layer
{
  uint64_t v2;

  v2 = *((_QWORD *)self + 1);
  if (v2)
    return (CALayer *)*(id *)(v2 + 8);
  else
    return (CALayer *)0;
}

- (CGSize)size
{
  double v2;
  double v3;
  CGSize result;

  v2 = *((double *)self + 66);
  v3 = *((double *)self + 67);
  result.height = v3;
  result.width = v2;
  return result;
}

- (const)format
{
  return (const RenderTargetFormat *)((char *)self + 112);
}

- (double)contentScale
{
  return *((double *)self + 68);
}

- (CGSize)sizeInPixels
{
  double v2;
  double v3;
  double v4;
  CGSize result;

  v2 = *((double *)self + 68);
  v3 = v2 * *((double *)self + 66);
  v4 = *((double *)self + 67) * v2;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)finalRenderTarget
{
  return (void *)*((_QWORD *)self + 29);
}

- (void)prepareTexture:(const void *)a3
{
  -[MDDisplayLayer _prepareTexture:isDrawable:](self, "_prepareTexture:isDrawable:", a3, 1);
}

- (void)prepareTargetsForPlatormsWithFramebufferFetch:(const void *)a3
{
  _DWORD *v4;
  int v5;
  int v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  _QWORD *v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  unint64_t v17;
  char *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  int v29;
  _QWORD *v30;
  char *v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  int v39;
  const char *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (*((_BYTE *)self + 489))
  {
    v4 = *(_DWORD **)a3;
    if (*(_DWORD *)(*(_QWORD *)a3 + 56) > 1u)
    {
      v5 = 0;
      v6 = 0;
    }
    else
    {
      v6 = v4[20];
      v5 = v4[21];
    }
    v7 = *((_BYTE *)self + 488);
    v8 = *((_QWORD *)self + 29);
    if (v7)
    {
      *(_QWORD *)(v8 + 192) = 0;
      *(_QWORD *)(v8 + 200) = 0;
      *(_QWORD *)(v8 + 184) = v4;
      v9 = *((_QWORD *)self + 31);
      if (v9 && *(_DWORD *)(v9 + 80) == v6 && *(_DWORD *)(v9 + 84) == v5)
      {
        v7 = 0;
      }
      else
      {
        v10 = operator new();
        v11 = *((_DWORD *)self + 28);
        v12 = *((_DWORD *)self + 34);
        *(_QWORD *)(v10 + 16) = 0;
        *(_QWORD *)(v10 + 24) = 0;
        *(_DWORD *)(v10 + 32) = 0;
        *(_QWORD *)(v10 + 56) = 0x200000000;
        *(_DWORD *)(v10 + 64) = 2;
        *(_DWORD *)(v10 + 68) = v11;
        *(_DWORD *)(v10 + 72) = v12;
        *(_DWORD *)(v10 + 76) = 1;
        *(_QWORD *)(v10 + 88) = 0;
        *(_QWORD *)(v10 + 96) = 0;
        *(_QWORD *)v10 = &off_1E42B6330;
        *(_QWORD *)(v10 + 8) = 0;
        *(_QWORD *)(v10 + 40) = &unk_1E42B6350;
        *(_QWORD *)(v10 + 48) = "MDDisplayLayer FBF";
        *(_DWORD *)(v10 + 80) = v6;
        *(_DWORD *)(v10 + 84) = v5;
        v13 = (_QWORD *)operator new();
        *v13 = &off_1E42E7790;
        v13[1] = 0;
        v13[2] = 0;
        v13[3] = v10;
        v14 = (std::__shared_weak_count *)*((_QWORD *)self + 32);
        *((_QWORD *)self + 31) = v10;
        *((_QWORD *)self + 32) = v13;
        if (v14)
        {
          p_shared_owners = (unint64_t *)&v14->__shared_owners_;
          do
            v16 = __ldaxr(p_shared_owners);
          while (__stlxr(v16 - 1, p_shared_owners));
          if (!v16)
          {
            ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
            std::__shared_weak_count::__release_weak(v14);
          }
        }
        v7 = 1;
      }
      v8 = *((_QWORD *)self + 29);
      v4 = (_DWORD *)*((_QWORD *)self + 31);
    }
    *(_QWORD *)(v8 + 96) = 0;
    *(_QWORD *)(v8 + 104) = 0;
    *(_QWORD *)(v8 + 88) = v4;
    *(_DWORD *)(v8 + 80) = v4[18];
    v17 = *(_QWORD *)(v8 + 72);
    if (v17 <= 1)
      v17 = 1;
    *(_QWORD *)(v8 + 72) = v17;
    *(_DWORD *)(v8 + 56) = v4[17];
    if (*((_QWORD *)self + 16) >= 2uLL)
    {
      v18 = (char *)self + 280;
      v19 = 1;
      v20 = 1;
      do
      {
        v25 = (uint64_t *)&v18[16 * v20 - 16];
        v26 = *v25;
        if (!*v25 || *(_DWORD *)(v26 + 80) != v6 || *(_DWORD *)(v26 + 84) != v5)
        {
          v27 = operator new();
          v28 = *((_DWORD *)self + v20 + 28);
          v29 = *((_DWORD *)self + 34);
          *(_QWORD *)(v27 + 16) = 0;
          *(_QWORD *)(v27 + 24) = 0;
          *(_DWORD *)(v27 + 32) = 0;
          *(_QWORD *)(v27 + 56) = 0x200000000;
          *(_DWORD *)(v27 + 64) = 2;
          *(_DWORD *)(v27 + 68) = v28;
          *(_DWORD *)(v27 + 72) = v29;
          *(_DWORD *)(v27 + 76) = 1;
          *(_QWORD *)(v27 + 88) = 0;
          *(_QWORD *)(v27 + 96) = 0;
          *(_QWORD *)v27 = &off_1E42B6330;
          *(_QWORD *)(v27 + 8) = 0;
          *(_QWORD *)(v27 + 40) = &unk_1E42B6350;
          *(_QWORD *)(v27 + 48) = "MDDisplayLayer FBF";
          *(_DWORD *)(v27 + 80) = v6;
          *(_DWORD *)(v27 + 84) = v5;
          v30 = (_QWORD *)operator new();
          *v30 = &off_1E42E7790;
          v30[1] = 0;
          v30[2] = 0;
          v30[3] = v27;
          *v25 = v27;
          v31 = &v18[16 * v20 - 16];
          v32 = (std::__shared_weak_count *)*((_QWORD *)v31 + 1);
          *((_QWORD *)v31 + 1) = v30;
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
          v7 = 1;
        }
        v21 = *((_QWORD *)self + 29);
        v22 = *v25;
        v23 = (_QWORD *)(v21 + 24 * v20);
        v23[12] = 0;
        v23[13] = 0;
        v23[11] = v22;
        *(_DWORD *)(v21 + 80) = *(_DWORD *)(v22 + 72);
        if (*(_QWORD *)(v21 + 72) <= (unint64_t)(v20 + 1))
          v24 = v20 + 1;
        else
          v24 = *(_QWORD *)(v21 + 72);
        *(_QWORD *)(v21 + 72) = v24;
        *(_DWORD *)(v21 + 4 * v20 + 56) = *(_DWORD *)(v22 + 68);
        v20 = ++v19;
      }
      while (*((_QWORD *)self + 16) > (unint64_t)v19);
    }
    v35 = *((_QWORD *)self + 30);
    if (!v35 || *(_DWORD *)(v35 + 80) != v6 || *(_DWORD *)(v35 + 84) != v5)
    {
      v35 = operator new();
      *(_QWORD *)(v35 + 16) = 0;
      *(_QWORD *)(v35 + 24) = 0;
      *(_DWORD *)(v35 + 32) = 0;
      *(_QWORD *)(v35 + 56) = 0x200000000;
      *(_DWORD *)(v35 + 64) = 2;
      *(int32x2_t *)(v35 + 68) = vrev64_s32(*(int32x2_t *)((char *)self + 136));
      v7 = 1;
      *(_QWORD *)(v35 + 88) = 0;
      *(_QWORD *)(v35 + 96) = 0;
      *(_QWORD *)v35 = &off_1E42B6330;
      *(_QWORD *)(v35 + 8) = 0;
      *(_QWORD *)(v35 + 40) = &unk_1E42B6350;
      *(_QWORD *)(v35 + 48) = "MDDisplayLayer FBF";
      *(_DWORD *)(v35 + 76) = 1;
      *(_DWORD *)(v35 + 80) = v6;
      *(_DWORD *)(v35 + 84) = v5;
      v36 = *((_QWORD *)self + 30);
      *((_QWORD *)self + 30) = v35;
      if (v36)
      {
        (*(void (**)(uint64_t))(*(_QWORD *)v36 + 8))(v36);
        v35 = *((_QWORD *)self + 30);
        v7 = 1;
      }
    }
    v37 = *((_QWORD *)self + 29);
    *(_QWORD *)(v37 + 288) = 0;
    *(_QWORD *)(v37 + 296) = 0;
    *(_QWORD *)(v37 + 280) = v35;
    *(_DWORD *)(v37 + 84) = *(_DWORD *)(v35 + 68);
    if (!*(_DWORD *)(v37 + 80))
      *(_DWORD *)(v37 + 80) = *(_DWORD *)(v35 + 72);
    if (((*((_QWORD *)self + 10) != 0) & v7) == 1)
    {
      if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
        dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
      v38 = (id)GEOGetVectorKitVKDefaultLog_log;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v39 = 136315650;
        v40 = "!(_activeRenderQueue && didResize)";
        v41 = 2080;
        v42 = "/Library/Caches/com.apple.xbs/Sources/VectorKit/src/MDDisplayLayer.mm";
        v43 = 1024;
        v44 = 489;
        _os_log_impl(&dword_19F029000, v38, OS_LOG_TYPE_ERROR, "Processing a dropped frame while resizing: Assertion with expression - %s : Failed in file - %s line - %i", (uint8_t *)&v39, 0x1Cu);
      }

    }
  }
}

- (void)_prepareTexture:(const void *)a3 isDrawable:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;
  uint64_t v8;

  v4 = a4;
  if (!*((_QWORD *)self + 29))
  {
    v7 = operator new();
    *(_QWORD *)(v7 + 16) = 0;
    *(_QWORD *)(v7 + 24) = 0;
    *(_DWORD *)(v7 + 32) = 0;
    *(_QWORD *)v7 = &off_1E42B6370;
    *(_QWORD *)(v7 + 8) = 0;
    *(_QWORD *)(v7 + 40) = &unk_1E42B6390;
    *(_QWORD *)(v7 + 48) = "MDDisplayLayer";
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
    v8 = *((_QWORD *)self + 29);
    *((_QWORD *)self + 29) = v7;
    *(_OWORD *)(v7 + 56) = 0u;
    v7 += 56;
    *(_OWORD *)(v7 + 208) = 0u;
    *(_OWORD *)(v7 + 224) = 0u;
    *(_OWORD *)(v7 + 240) = 0u;
    *(_OWORD *)(v7 + 256) = 0u;
    if (v8)
      (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  }
  if (*((_BYTE *)self + 489))
    -[MDDisplayLayer prepareTargetsForPlatormsWithFramebufferFetch:](self, "prepareTargetsForPlatormsWithFramebufferFetch:", a3);
  else
    -[MDDisplayLayer prepareTargetsForPlatormsWithoutFramebufferFetch:isDrawable:](self, "prepareTargetsForPlatormsWithoutFramebufferFetch:isDrawable:", a3, v4);
}

- (BOOL)supportsFramebufferFetch
{
  return *((_BYTE *)self + 489);
}

- (void)addSizeObserver:(id)a3
{
  objc_msgSend(*((id *)self + 73), "addObject:", a3);
}

- (BOOL)multiSample
{
  return *((_BYTE *)self + 488);
}

- (MDDisplayLayer)initWithContentScale:(double)a3 useMultisampling:(BOOL)a4 extraColorFormats:(const void *)a5 shouldRasterize:(BOOL)a6 allowBlitToDrawable:(BOOL)a7 taskContext:(const void *)a8 device:(void *)a9 sharedResources:(id)a10 services:(void *)a11 signpostId:(unint64_t)a12
{
  id v20;
  MDDisplayLayer *v21;
  MDDisplayLayer *v22;
  uint64_t v23;
  void *v24;
  unsigned int v25;
  int v26;
  char *v27;
  unint64_t v28;
  __int128 v29;
  int v30;
  char *v31;
  char *v32;
  unint64_t v33;
  __int128 v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t BOOL;
  id v45;
  uint64_t v46;
  void *v47;
  id v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  MDDisplayLayer *v53;
  _QWORD *v54;
  unint64_t *v55;
  char *v56;
  unint64_t v57;
  std::__shared_weak_count *v58;
  unint64_t *p_shared_owners;
  unint64_t v60;
  char *v61;
  char *v62;
  char *v63;
  unint64_t *v64;
  unint64_t v65;
  std::__shared_weak_count *v66;
  unint64_t *v67;
  unint64_t v68;
  std::__shared_weak_count *v69;
  unint64_t *v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  MDDisplayLayer *v74;
  _QWORD *v75;
  unint64_t *v76;
  char *v77;
  unint64_t v78;
  std::__shared_weak_count *v79;
  unint64_t *v80;
  unint64_t v81;
  char *v82;
  char *v83;
  char *v84;
  unint64_t *v85;
  unint64_t v86;
  std::__shared_weak_count *v87;
  unint64_t *v88;
  unint64_t v89;
  std::__shared_weak_count *v90;
  unint64_t *v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  MDDisplayLayer *v95;
  _QWORD *v96;
  unint64_t *v97;
  char *v98;
  unint64_t v99;
  std::__shared_weak_count *v100;
  unint64_t *v101;
  unint64_t v102;
  char *v103;
  char *v104;
  char *v105;
  unint64_t *v106;
  unint64_t v107;
  std::__shared_weak_count *v108;
  unint64_t *v109;
  unint64_t v110;
  std::__shared_weak_count *v111;
  unint64_t *v112;
  unint64_t v113;
  ggl::MetalRenderer *v114;
  int v115;
  int UInteger;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  void *v122;
  id *v124;
  void *v125;
  id v126[5];
  id v127[5];
  id v128;
  id location;
  char *v130;
  char *v131;
  char *v132;
  __int128 __dst;
  __int128 v134;
  char *v135;
  char *v136;
  char *v137;
  objc_super v138;

  v20 = a10;
  v138.receiver = self;
  v138.super_class = (Class)MDDisplayLayer;
  v21 = -[MDDisplayLayer init](&v138, sel_init);
  v22 = v21;
  if (v21)
  {
    *((_QWORD *)v21 + 60) = a11;
    *((_QWORD *)v21 + 69) = a12;
    *((_BYTE *)v21 + 489) = *(_BYTE *)(*((_QWORD *)a9 + 1) + 20);
    *((_BYTE *)v21 + 488) = a4;
    *((_BYTE *)v21 + 505) = a6;
    *((double *)v21 + 68) = a3;
    *((_QWORD *)v21 + 18) = a9;
    v23 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(**((_QWORD **)a9 + 1) + 16))(*((_QWORD *)a9 + 1), *(_QWORD *)(*(_QWORD *)a8 + 16), *((_QWORD *)a9 + 3));
    *((_QWORD *)v22 + 19) = v23;
    +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v23 + 32))(v23, objc_msgSend(v24, "drawPerformanceHUD"));

    *((_BYTE *)v22 + 506) = a7;
    if (*((_BYTE *)v22 + 488))
      v25 = 4;
    else
      v25 = 1;
    v26 = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)v22 + 18) + 8) + 60);
    v27 = (char *)operator new(4uLL);
    v135 = v27;
    *(_DWORD *)v27 = v26;
    v136 = v27 + 4;
    v137 = v27 + 4;
    std::vector<ggl::PixelFormat>::__insert_with_size[abi:nn180100]<std::__wrap_iter<ggl::PixelFormat const*>,std::__wrap_iter<ggl::PixelFormat const*>>(&v135, v27 + 4, *(char **)a5, *((char **)a5 + 1), (uint64_t)(*((_QWORD *)a5 + 1) - *(_QWORD *)a5) >> 2);
    __dst = 0uLL;
    *((_QWORD *)&v134 + 1) = v25 | 0x1A00000000;
    v28 = v136 - v135;
    *(_QWORD *)&v134 = (v136 - v135) >> 2;
    if (v136 == v135 || (memcpy(&__dst, v135, v28 & 0xFFFFFFFFFFFFFFFCLL), v28 <= 0xF))
      bzero((char *)&__dst + v28, 16 - v28);
    v29 = v134;
    *((_OWORD *)v22 + 7) = __dst;
    *((_OWORD *)v22 + 8) = v29;
    if (!*((_BYTE *)v22 + 489))
    {
      v30 = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)v22 + 18) + 8) + 56);
      v31 = (char *)operator new(4uLL);
      v130 = v31;
      *(_DWORD *)v31 = v30;
      v131 = v31 + 4;
      v132 = v31 + 4;
      std::vector<ggl::PixelFormat>::__insert_with_size[abi:nn180100]<std::__wrap_iter<ggl::PixelFormat const*>,std::__wrap_iter<ggl::PixelFormat const*>>(&v130, v31 + 4, *(char **)a5, *((char **)a5 + 1), (uint64_t)(*((_QWORD *)a5 + 1) - *(_QWORD *)a5) >> 2);
      v32 = v130;
      __dst = 0uLL;
      *((_QWORD *)&v134 + 1) = v25 | 0x1A00000000;
      v33 = v131 - v130;
      *(_QWORD *)&v134 = (v131 - v130) >> 2;
      if (v131 == v130 || (memcpy(&__dst, v130, v33 & 0xFFFFFFFFFFFFFFFCLL), v33 <= 0xF))
        bzero((char *)&__dst + v33, 16 - v33);
      v34 = v134;
      *((_OWORD *)v22 + 23) = __dst;
      *((_OWORD *)v22 + 24) = v34;
      if (!*((_BYTE *)v22 + 488))
      {
        *((_DWORD *)v22 + 84) = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)v22 + 18) + 8) + 60);
        *((_DWORD *)v22 + 85) = 0;
        *((_QWORD *)v22 + 43) = 0;
        *((_QWORD *)v22 + 44) = 1;
        *((_DWORD *)v22 + 90) = v25;
        *((_DWORD *)v22 + 91) = 0;
      }
      if (v32)
        operator delete(v32);
    }
    v35 = v20;
    v36 = v35;
    if (v35)
      v37 = v35;
    v38 = (void *)*((_QWORD *)v22 + 12);
    *((_QWORD *)v22 + 12) = v36;

    objc_initWeak(&location, v22);
    v39 = **(id **)a8;
    v40 = (void *)MEMORY[0x1E0C809B0];
    v127[1] = (id)MEMORY[0x1E0C809B0];
    v127[2] = (id)3221225472;
    v127[3] = __165__MDDisplayLayer_initWithContentScale_useMultisampling_extraColorFormats_shouldRasterize_allowBlitToDrawable_taskContext_device_sharedResources_services_signpostId___block_invoke;
    v127[4] = &unk_1E42F57C0;
    objc_copyWeak(&v128, &location);
    _GEOConfigAddBlockListenerForKey();
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = (void *)*((_QWORD *)v22 + 70);
    *((_QWORD *)v22 + 70) = v41;

    v43 = *((_QWORD *)v22 + 19);
    BOOL = GEOConfigGetBOOL();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v43 + 48))(v43, BOOL);
    v45 = **(id **)a8;
    v126[1] = v40;
    v126[2] = (id)3221225472;
    v126[3] = __165__MDDisplayLayer_initWithContentScale_useMultisampling_extraColorFormats_shouldRasterize_allowBlitToDrawable_taskContext_device_sharedResources_services_signpostId___block_invoke_2;
    v126[4] = &unk_1E42F57C0;
    objc_copyWeak(v127, &location);
    _GEOConfigAddBlockListenerForKey();
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = (void *)*((_QWORD *)v22 + 71);
    *((_QWORD *)v22 + 71) = v46;

    v48 = **(id **)a8;
    v125 = v40;
    objc_copyWeak(v126, &location);
    _GEOConfigAddBlockListenerForKey();
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = (void *)*((_QWORD *)v22 + 72);
    *((_QWORD *)v22 + 72) = v49;

    v51 = *((_QWORD *)v22 + 60);
    v52 = operator new();
    v53 = v22;
    *(_QWORD *)v52 = &off_1E428B8D0;
    *(_QWORD *)(v52 + 8) = v53;
    v130 = (char *)v52;
    v54 = (_QWORD *)operator new();
    v54[1] = 0;
    v55 = v54 + 1;
    *v54 = &off_1E42E6A00;
    v54[2] = 0;
    v54[3] = v52;
    v131 = (char *)v54;
    *(_QWORD *)&__dst = 0xB05F868A6300FD6ELL;
    *((_QWORD *)&__dst + 1) = "md::RenderTargetPreparer]";
    *(_QWORD *)&v134 = 24;
    v56 = geo::linear_map<gdc::TypeInfo,std::shared_ptr<void>,std::equal_to<gdc::TypeInfo>,std::allocator<std::pair<gdc::TypeInfo,std::shared_ptr<void>>>,std::vector<std::pair<gdc::TypeInfo,std::shared_ptr<void>>>>::operator[](v51, &__dst);
    do
      v57 = __ldxr(v55);
    while (__stxr(v57 + 1, v55));
    v58 = (std::__shared_weak_count *)*((_QWORD *)v56 + 1);
    *(_QWORD *)v56 = v52;
    *((_QWORD *)v56 + 1) = v54;
    if (v58)
    {
      p_shared_owners = (unint64_t *)&v58->__shared_owners_;
      do
        v60 = __ldaxr(p_shared_owners);
      while (__stlxr(v60 - 1, p_shared_owners));
      if (!v60)
      {
        ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
        std::__shared_weak_count::__release_weak(v58);
      }
    }
    *(_QWORD *)&__dst = 0x4A83BCE3AC24574DLL;
    *((_QWORD *)&__dst + 1) = "MDDisplayLayerRenderTargetPreparer]";
    *(_QWORD *)&v134 = 34;
    v61 = geo::linear_map<gdc::TypeInfo,std::shared_ptr<void>,std::equal_to<gdc::TypeInfo>,std::allocator<std::pair<gdc::TypeInfo,std::shared_ptr<void>>>,std::vector<std::pair<gdc::TypeInfo,std::shared_ptr<void>>>>::operator[](v51, &__dst);
    v63 = v130;
    v62 = v131;
    if (v131)
    {
      v64 = (unint64_t *)(v131 + 8);
      do
        v65 = __ldxr(v64);
      while (__stxr(v65 + 1, v64));
    }
    v66 = (std::__shared_weak_count *)*((_QWORD *)v61 + 1);
    *(_QWORD *)v61 = v63;
    *((_QWORD *)v61 + 1) = v62;
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
    v69 = (std::__shared_weak_count *)v131;
    if (v131)
    {
      v70 = (unint64_t *)(v131 + 8);
      do
        v71 = __ldaxr(v70);
      while (__stlxr(v71 - 1, v70));
      if (!v71)
      {
        ((void (*)(std::__shared_weak_count *))v69->__on_zero_shared)(v69);
        std::__shared_weak_count::__release_weak(v69);
      }
    }
    v72 = *((_QWORD *)v22 + 60);
    v73 = operator new();
    v74 = v53;
    *(_QWORD *)v73 = &off_1E426EE40;
    std::__shared_mutex_base::__shared_mutex_base((std::__shared_mutex_base *)(v73 + 8));
    *(_OWORD *)(v73 + 256) = 0u;
    *(_OWORD *)(v73 + 272) = 0u;
    *(_OWORD *)(v73 + 224) = 0u;
    *(_OWORD *)(v73 + 240) = 0u;
    *(_OWORD *)(v73 + 192) = 0u;
    *(_OWORD *)(v73 + 208) = 0u;
    *(_OWORD *)(v73 + 176) = 0u;
    *(_QWORD *)(v73 + 288) = 0;
    *(_QWORD *)(v73 + 296) = v74;
    v130 = (char *)v73;
    v75 = (_QWORD *)operator new();
    v75[1] = 0;
    v76 = v75 + 1;
    *v75 = &off_1E428A418;
    v75[2] = 0;
    v75[3] = v73;
    v131 = (char *)v75;
    *(_QWORD *)&__dst = 0xC5B557B9C9754C35;
    *((_QWORD *)&__dst + 1) = "md::SwapchainProvider]";
    *(_QWORD *)&v134 = 21;
    v77 = geo::linear_map<gdc::TypeInfo,std::shared_ptr<void>,std::equal_to<gdc::TypeInfo>,std::allocator<std::pair<gdc::TypeInfo,std::shared_ptr<void>>>,std::vector<std::pair<gdc::TypeInfo,std::shared_ptr<void>>>>::operator[](v72, &__dst);
    do
      v78 = __ldxr(v76);
    while (__stxr(v78 + 1, v76));
    v79 = (std::__shared_weak_count *)*((_QWORD *)v77 + 1);
    *(_QWORD *)v77 = v73;
    *((_QWORD *)v77 + 1) = v75;
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
    *(_QWORD *)&__dst = 0xAD0C18F84C4B8F20;
    *((_QWORD *)&__dst + 1) = "MDDisplayLayerSwapchainProvider]";
    *(_QWORD *)&v134 = 31;
    v82 = geo::linear_map<gdc::TypeInfo,std::shared_ptr<void>,std::equal_to<gdc::TypeInfo>,std::allocator<std::pair<gdc::TypeInfo,std::shared_ptr<void>>>,std::vector<std::pair<gdc::TypeInfo,std::shared_ptr<void>>>>::operator[](v72, &__dst);
    v84 = v130;
    v83 = v131;
    if (v131)
    {
      v85 = (unint64_t *)(v131 + 8);
      do
        v86 = __ldxr(v85);
      while (__stxr(v86 + 1, v85));
    }
    v87 = (std::__shared_weak_count *)*((_QWORD *)v82 + 1);
    *(_QWORD *)v82 = v84;
    *((_QWORD *)v82 + 1) = v83;
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
    v90 = (std::__shared_weak_count *)v131;
    if (v131)
    {
      v91 = (unint64_t *)(v131 + 8);
      do
        v92 = __ldaxr(v91);
      while (__stlxr(v92 - 1, v91));
      if (!v92)
      {
        ((void (*)(std::__shared_weak_count *))v90->__on_zero_shared)(v90);
        std::__shared_weak_count::__release_weak(v90);
      }
    }
    v93 = *((_QWORD *)v22 + 60);
    v94 = operator new();
    v95 = v74;
    *(_QWORD *)v94 = off_1E426EE20;
    *(_QWORD *)(v94 + 8) = v95;
    v130 = (char *)v94;
    v96 = (_QWORD *)operator new();
    v96[1] = 0;
    v97 = v96 + 1;
    *v96 = &off_1E428A3E0;
    v96[2] = 0;
    v96[3] = v94;
    v131 = (char *)v96;
    *(_QWORD *)&__dst = 0x4987A5FEEF8688ACLL;
    *((_QWORD *)&__dst + 1) = "md::GGLRendererProvider]";
    *(_QWORD *)&v134 = 23;
    v98 = geo::linear_map<gdc::TypeInfo,std::shared_ptr<void>,std::equal_to<gdc::TypeInfo>,std::allocator<std::pair<gdc::TypeInfo,std::shared_ptr<void>>>,std::vector<std::pair<gdc::TypeInfo,std::shared_ptr<void>>>>::operator[](v93, &__dst);
    do
      v99 = __ldxr(v97);
    while (__stxr(v99 + 1, v97));
    v100 = (std::__shared_weak_count *)*((_QWORD *)v98 + 1);
    *(_QWORD *)v98 = v94;
    *((_QWORD *)v98 + 1) = v96;
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
    *(_QWORD *)&__dst = 0x365D2DC417111A35;
    *((_QWORD *)&__dst + 1) = "MDDisplayLayerRendererProvider]";
    *(_QWORD *)&v134 = 30;
    v103 = geo::linear_map<gdc::TypeInfo,std::shared_ptr<void>,std::equal_to<gdc::TypeInfo>,std::allocator<std::pair<gdc::TypeInfo,std::shared_ptr<void>>>,std::vector<std::pair<gdc::TypeInfo,std::shared_ptr<void>>>>::operator[](v93, &__dst);
    v105 = v130;
    v104 = v131;
    if (v131)
    {
      v106 = (unint64_t *)(v131 + 8);
      do
        v107 = __ldxr(v106);
      while (__stxr(v107 + 1, v106));
    }
    v108 = (std::__shared_weak_count *)*((_QWORD *)v103 + 1);
    *(_QWORD *)v103 = v105;
    *((_QWORD *)v103 + 1) = v104;
    if (v108)
    {
      v109 = (unint64_t *)&v108->__shared_owners_;
      do
        v110 = __ldaxr(v109);
      while (__stlxr(v110 - 1, v109));
      if (!v110)
      {
        ((void (*)(std::__shared_weak_count *))v108->__on_zero_shared)(v108);
        std::__shared_weak_count::__release_weak(v108);
      }
    }
    v111 = (std::__shared_weak_count *)v131;
    if (v131)
    {
      v112 = (unint64_t *)(v131 + 8);
      do
        v113 = __ldaxr(v112);
      while (__stlxr(v113 - 1, v112));
      if (!v113)
      {
        ((void (*)(std::__shared_weak_count *))v111->__on_zero_shared)(v111);
        std::__shared_weak_count::__release_weak(v111);
      }
    }
    v114 = (ggl::MetalRenderer *)*((_QWORD *)v22 + 19);
    if (!*(_DWORD *)(*((_QWORD *)v114 + 1) + 96))
    {
      v115 = GEOConfigGetBOOL();
      ggl::MetalRenderer::enableCommandQueueResetOnError(v114, v115);
      UInteger = GEOConfigGetUInteger();
      ggl::MetalRenderer::setCommandQueueResetAttempts(v114, UInteger);
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", &v128, 0, 0, v125, 3221225472, __165__MDDisplayLayer_initWithContentScale_useMultisampling_extraColorFormats_shouldRasterize_allowBlitToDrawable_taskContext_device_sharedResources_services_signpostId___block_invoke_3, &unk_1E42F57C0);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "addObserver:selector:name:object:", v95, sel_enablePerformanceHUD_, CFSTR("VKEnablePeformanceHUD"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "addObserver:selector:name:object:", v95, sel_disablePerformanceHUD_, CFSTR("VKDisablePeformanceHUD"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "addObserver:selector:name:object:", v95, sel_expandedPerformanceHUD_, CFSTR("VKExtendedPeformanceHUD"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "addObserver:selector:name:object:", v95, sel_expandedPerformanceHUD_, CFSTR("VKDMinimalPeformanceHUD"), 0);

    v121 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 1);
    v122 = (void *)*((_QWORD *)v95 + 73);
    *((_QWORD *)v95 + 73) = v121;

    objc_destroyWeak(v126);
    objc_destroyWeak(v127);
    objc_destroyWeak(v124);
    objc_destroyWeak(&location);
    if (v135)
      operator delete(v135);
  }

  return v22;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double MidX;
  double MidY;
  id v13;
  id v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = *((double *)self + 66);
  v9 = *((double *)self + 67);
  *((double *)self + 64) = x;
  *((double *)self + 65) = y;
  *((_QWORD *)self + 66) = *(_QWORD *)&a3.size.width;
  *((_QWORD *)self + 67) = *(_QWORD *)&a3.size.height;
  if (v8 != a3.size.width || v9 != a3.size.height)
  {
    -[MDDisplayLayer _notifyObserversSizeChanged:](self, "_notifyObserversSizeChanged:", a3.size.width, a3.size.height);
    x = *((double *)self + 64);
    y = *((double *)self + 65);
    width = *((double *)self + 66);
    height = *((double *)self + 67);
  }
  -[MDDisplayLayer layer](self, "layer");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", x, y, width, height);

  MidX = CGRectGetMidX(*((CGRect *)self + 16));
  MidY = CGRectGetMidY(*((CGRect *)self + 16));
  -[MDDisplayLayer layer](self, "layer");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPosition:", MidX, MidY);

}

- (void)setRenderSource:(id)a3
{
  objc_storeWeak((id *)self + 7, a3);
}

- (void)setContentScale:(double)a3
{
  void *v5;
  float v6;

  *((double *)self + 68) = a3;
  -[MDDisplayLayer layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentsScale:", a3);

  v6 = *((double *)self + 68);
  (*(void (**)(_QWORD, float))(**((_QWORD **)self + 19) + 40))(*((_QWORD *)self + 19), v6);
}

- (BOOL)insertDisplayLayer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;

  v4 = a3;
  -[MDDisplayLayer layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "sublayers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MDDisplayLayer layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "containsObject:", v7);

    if ((v8 & 1) == 0)
    {
      -[MDDisplayLayer layer](self, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "insertSublayer:atIndex:", v9, 0);

    }
    v10 = v8 ^ 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)createRenderTarget
{
  void *v3;
  NSObject *v4;
  __int128 v5;
  _QWORD *v6;
  id v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  uint64_t v11;
  __int128 v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  void *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  unint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  std::__shared_weak_count *v44;
  unint64_t *v45;
  unint64_t v46;
  unint64_t *v47;
  unint64_t v48;
  unint64_t *v49;
  unint64_t v50;
  std::__shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  int v54;
  void *v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  int v59;
  std::__shared_weak_count *v60;
  _QWORD v61[5];
  uint8_t buf[8];
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  -[MDDisplayLayer layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
    v4 = (id)GEOGetVectorKitVKDefaultLog_log;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F029000, v4, OS_LOG_TYPE_INFO, "MDDisplayLayer creating new render layer", buf, 2u);
    }

    v5 = 0uLL;
    if (!**((_DWORD **)self + 18))
    {
      v6 = operator new(0x30uLL);
      v6[1] = 0;
      v6[2] = 0;
      *v6 = &off_1E42DECE0;
      v7 = objc_alloc_init(MEMORY[0x1E0CD27E0]);
      v6[4] = v7;
      v6[3] = &off_1E42B62A0;
      v6[5] = v7;
      *(_QWORD *)&v5 = v6 + 3;
      *((_QWORD *)&v5 + 1) = v6;
    }
    v8 = (std::__shared_weak_count *)*((_QWORD *)self + 2);
    *(_OWORD *)((char *)self + 8) = v5;
    if (v8)
    {
      p_shared_owners = (unint64_t *)&v8->__shared_owners_;
      do
        v10 = __ldaxr(p_shared_owners);
      while (__stlxr(v10 - 1, p_shared_owners));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    v11 = *((_QWORD *)self + 18);
    v12 = 0uLL;
    if (!*(_DWORD *)v11)
    {
      v13 = *(std::__shared_weak_count **)(v11 + 16);
      v59 = *(_DWORD *)(*(_QWORD *)(v11 + 8) + 60);
      v58 = *(_QWORD *)(v11 + 8);
      v60 = v13;
      if (v13)
      {
        v14 = (unint64_t *)&v13->__shared_owners_;
        do
          v15 = __ldxr(v14);
        while (__stxr(v15 + 1, v14));
      }
      v16 = (std::__shared_weak_count *)*((_QWORD *)self + 2);
      v56 = *((_QWORD *)self + 1);
      if (v16)
      {
        v17 = (unint64_t *)&v16->__shared_owners_;
        do
          v18 = __ldxr(v17);
        while (__stxr(v18 + 1, v17));
      }
      +[VKPlatform sharedPlatform](VKPlatform, "sharedPlatform", 0.0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v19, "explicitDefaultRefreshRate");

      v20 = operator new(0x88uLL);
      v21 = v20;
      v20[1] = 0;
      v20[2] = 0;
      *v20 = &off_1E42DF290;
      v20[3] = &off_1E42B6C68;
      v20[4] = v58;
      v22 = v20 + 3;
      v20[5] = v13;
      if (v13)
      {
        v23 = (unint64_t *)&v13->__shared_owners_;
        do
          v24 = __ldxr(v23);
        while (__stxr(v24 + 1, v23));
      }
      v25 = v56;
      v20[6] = v56;
      v20[7] = v16;
      if (v16)
      {
        v26 = (unint64_t *)&v16->__shared_owners_;
        do
          v27 = __ldxr(v26);
        while (__stxr(v27 + 1, v26));
        v25 = v20[6];
      }
      v20[8] = 0;
      v20[9] = 0;
      v20[10] = 0;
      *((_DWORD *)v20 + 22) = v59;
      v20[12] = 0;
      v20[13] = 0;
      *((_DWORD *)v20 + 28) = 3;
      v20[15] = 0;
      v20[16] = 0;
      v57 = *(id *)(v25 + 16);
      v61[0] = CFSTR("bounds");
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = v55;
      v61[1] = CFSTR("position");
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v28;
      v61[2] = CFSTR("contentsScale");
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v29;
      v61[3] = CFSTR("hidden");
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = v30;
      v61[4] = CFSTR("contents");
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v31;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v61, 5);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setActions:", v32);

      objc_msgSend(*(id *)(v21[6] + 16), "setOpaque:", 1);
      objc_msgSend(*(id *)(v21[6] + 16), "setHidden:", 0);
      objc_msgSend(*(id *)(v21[6] + 16), "setContentsGravity:", *MEMORY[0x1E0CD2F78]);
      objc_msgSend(*(id *)(v21[6] + 16), "setPresentsWithTransaction:", 1);
      objc_msgSend(*(id *)(v21[6] + 16), "setFramebufferOnly:", 0);
      if ((v59 - 1) > 0x2A)
        v33 = 0;
      else
        v33 = qword_1A0083590[v59 - 1];
      objc_msgSend(*(id *)(v21[6] + 16), "setPixelFormat:", v33);
      objc_msgSend(*(id *)(v21[6] + 16), "setFenceEnabled:", 1);
      v34 = *(void **)(v21[6] + 16);
      v35 = *(id *)(v58 + 104);
      objc_msgSend(v34, "setDevice:", v35);

      objc_msgSend(*(id *)(v21[6] + 16), "setMaximumDrawableCount:", 3);
      if (v54)
        objc_msgSend(*(id *)(v21[6] + 16), "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("disableProMotionCompatibility"));
      objc_msgSend(*(id *)(v56 + 16), "contentsScale");
      v37 = v36;
      objc_msgSend(*(id *)(v56 + 16), "bounds");
      ggl::MetalSwapchain::resize(v22, (v38 * v37), (v39 * v37));
      v21[15] = 6;
      v40 = v21[8];
      v41 = v21[9];
      v42 = v41 - v40;
      if ((unint64_t)(v41 - v40) > 0x5F)
      {
        if (v42 != 96)
        {
          for (i = v40 + 96; v41 != i; v41 -= 16)
          {
            v44 = *(std::__shared_weak_count **)(v41 - 8);
            if (v44)
            {
              v45 = (unint64_t *)&v44->__shared_owners_;
              do
                v46 = __ldaxr(v45);
              while (__stlxr(v46 - 1, v45));
              if (!v46)
              {
                ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
                std::__shared_weak_count::__release_weak(v44);
              }
            }
          }
          v21[9] = i;
        }
      }
      else
      {
        std::vector<std::shared_ptr<ggl::Data>>::__append((uint64_t)(v21 + 8), 6 - (v42 >> 4));
      }
      if (v16)
      {
        v47 = (unint64_t *)&v16->__shared_owners_;
        do
          v48 = __ldaxr(v47);
        while (__stlxr(v48 - 1, v47));
        if (!v48)
        {
          ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
          std::__shared_weak_count::__release_weak(v16);
        }
      }
      *(_QWORD *)&v12 = v22;
      if (v60)
      {
        v49 = (unint64_t *)&v60->__shared_owners_;
        do
          v50 = __ldaxr(v49);
        while (__stlxr(v50 - 1, v49));
        if (!v50)
        {
          ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
          std::__shared_weak_count::__release_weak(v60);
          *(_QWORD *)&v12 = v22;
        }
      }
      *((_QWORD *)&v12 + 1) = v21;
    }
    v51 = (std::__shared_weak_count *)*((_QWORD *)self + 4);
    *(_OWORD *)((char *)self + 24) = v12;
    if (v51)
    {
      v52 = (unint64_t *)&v51->__shared_owners_;
      do
        v53 = __ldaxr(v52);
      while (__stlxr(v53 - 1, v52));
      if (!v53)
      {
        ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
        std::__shared_weak_count::__release_weak(v51);
      }
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *((_QWORD *)self + 11) = &off_1E42B4D50;
  *((_QWORD *)self + 12) = 0;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_QWORD *)self + 20) = 850045863;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 216) = 0u;
  *(_OWORD *)((char *)self + 232) = 0u;
  *(_OWORD *)((char *)self + 248) = 0u;
  *((_QWORD *)self + 59) = 0;
  *(_OWORD *)((char *)self + 168) = 0u;
  *(_OWORD *)((char *)self + 264) = 0u;
  *(_OWORD *)((char *)self + 280) = 0u;
  *(_OWORD *)((char *)self + 296) = 0u;
  *(_OWORD *)((char *)self + 312) = 0u;
  *(_OWORD *)((char *)self + 328) = 0u;
  *(_OWORD *)((char *)self + 344) = 0u;
  *(_OWORD *)((char *)self + 360) = 0u;
  *(_OWORD *)((char *)self + 376) = 0u;
  *(_OWORD *)((char *)self + 392) = 0u;
  *(_OWORD *)((char *)self + 408) = 0u;
  *(_OWORD *)((char *)self + 424) = 0u;
  *(_OWORD *)((char *)self + 440) = 0u;
  *(_OWORD *)((char *)self + 456) = 0u;
  return self;
}

- (void)removeSizeObserver:(id)a3
{
  objc_msgSend(*((id *)self + 73), "removeObject:", a3);
}

- (void)blitRenderTarget
{
  return (void *)*((_QWORD *)self + 41);
}

- (Swapchain)swapchain
{
  return (Swapchain *)*((_QWORD *)self + 3);
}

- (void)renderer
{
  return (void *)*((_QWORD *)self + 19);
}

- (unint64_t)signpost
{
  return *((_QWORD *)self + 69);
}

- (void)dealloc
{
  NSObject *v3;
  uint64_t v4;
  md::DebugConsoleManager *v5;
  void *v6;
  const void *v7;
  void *v8;
  objc_super v9;
  _QWORD block[6];
  _QWORD v11[5];
  id v12;

  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  GEOConfigRemoveBlockListener();
  GEOConfigRemoveBlockListener();
  GEOConfigRemoveBlockListener();
  v4 = *((_QWORD *)self + 19);
  *((_QWORD *)self + 19) = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__27436;
  v11[4] = __Block_byref_object_dispose__27437;
  v12 = *((id *)self + 12);
  v5 = (md::DebugConsoleManager *)*((_QWORD *)self + 28);
  *((_QWORD *)self + 28) = 0;
  if (v5)
  {
    md::DebugConsoleManager::~DebugConsoleManager(v5);
    MEMORY[0x1A1AF4E00]();
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__MDDisplayLayer_dealloc__block_invoke;
  block[3] = &unk_1E42F5808;
  block[4] = v11;
  block[5] = v4;
  dispatch_async(v3, block);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  v7 = (const void *)*((_QWORD *)self + 62);
  if (v7)
    CFRelease(v7);
  -[MDDisplayLayer layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeFromSuperlayer");

  _Block_object_dispose(v11, 8);
  v9.receiver = self;
  v9.super_class = (Class)MDDisplayLayer;
  -[MDDisplayLayer dealloc](&v9, sel_dealloc);
}

- (void)prepareTargetsForPlatormsWithoutFramebufferFetch:(const void *)a3 isDrawable:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  ggl::RenderQueue *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  unint64_t *v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  unint64_t v23;
  _QWORD *v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  unint64_t *v28;
  unint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  int v42;
  _QWORD *v43;
  std::__shared_weak_count *v44;
  unint64_t *v45;
  unint64_t v46;
  std::__shared_weak_count *v47;
  uint64_t v48;
  unint64_t *v49;
  unint64_t v50;
  std::__shared_weak_count *v51;
  uint64_t v52;
  unint64_t *p_shared_owners;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t *v67;
  unint64_t v68;
  std::__shared_weak_count *v69;
  unint64_t *v70;
  unint64_t v71;
  _QWORD *v72;
  std::__shared_weak_count *v73;
  unint64_t *v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  char *v80;
  uint64_t v81;
  int v82;
  uint64_t v83;
  uint64_t v84;
  _QWORD *v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  int v89;
  int v90;
  _QWORD *v91;
  char *v92;
  std::__shared_weak_count *v93;
  unint64_t *v94;
  unint64_t v95;
  uint64_t v96;
  int v97;
  uint64_t v98;
  uint64_t v99;
  _QWORD *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  __int128 v106;
  uint64_t v107;
  unint64_t *v108;
  unint64_t v109;
  uint64_t v110;
  int v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t *v115;
  unint64_t v116;
  std::__shared_weak_count *v117;
  unint64_t *v118;
  unint64_t v119;
  _QWORD *v120;
  uint64_t *v121;
  std::__shared_weak_count *v122;
  unint64_t *v123;
  unint64_t v124;
  std::__shared_weak_count *v125;
  unint64_t *v126;
  unint64_t v127;
  unint64_t *v128;
  unint64_t v129;
  uint64_t *v130;
  ggl::RenderQueue *v131;
  ggl::RenderQueue *v132;
  ggl::RenderQueue *v133;
  ggl::CommandBuffer *v134;
  double v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  ggl::RenderQueue *v139;
  uint64_t v140;
  uint64_t v141;
  std::__shared_weak_count *v142;
  std::__shared_weak_count *v143;
  uint64_t v144;
  std::__shared_weak_count *v145;

  if (*((_BYTE *)self + 489))
    return;
  v4 = a4;
  v7 = *(_QWORD *)a3;
  if (*(_DWORD *)(*(_QWORD *)a3 + 56) > 1u)
  {
    v141 = 0;
    if (*((_QWORD *)self + 50))
      goto LABEL_9;
  }
  else
  {
    LODWORD(v141) = *(_DWORD *)(v7 + 84);
    HIDWORD(v141) = *(_DWORD *)(v7 + 80);
    if (*((_QWORD *)self + 50))
      goto LABEL_9;
  }
  v8 = operator new();
  *(_QWORD *)(v8 + 16) = 0;
  *(_QWORD *)(v8 + 24) = 0;
  *(_DWORD *)(v8 + 32) = 0;
  *(_QWORD *)v8 = &off_1E42B6370;
  *(_QWORD *)(v8 + 8) = 0;
  *(_QWORD *)(v8 + 40) = &unk_1E42B6390;
  *(_QWORD *)(v8 + 48) = "MDDisplayLayer Linear Target";
  *(_QWORD *)(v8 + 336) = 0;
  *(_OWORD *)(v8 + 72) = 0u;
  *(_OWORD *)(v8 + 88) = 0u;
  *(_OWORD *)(v8 + 104) = 0u;
  *(_OWORD *)(v8 + 120) = 0u;
  *(_OWORD *)(v8 + 136) = 0u;
  *(_OWORD *)(v8 + 152) = 0u;
  *(_OWORD *)(v8 + 168) = 0u;
  *(_OWORD *)(v8 + 184) = 0u;
  *(_OWORD *)(v8 + 200) = 0u;
  *(_OWORD *)(v8 + 216) = 0u;
  *(_OWORD *)(v8 + 232) = 0u;
  *(_OWORD *)(v8 + 248) = 0u;
  *(_DWORD *)(v8 + 328) = 0;
  *(_BYTE *)(v8 + 344) = 0;
  v9 = *((_QWORD *)self + 50);
  *((_QWORD *)self + 50) = v8;
  *(_OWORD *)(v8 + 56) = 0u;
  v8 += 56;
  *(_OWORD *)(v8 + 208) = 0u;
  *(_OWORD *)(v8 + 224) = 0u;
  *(_OWORD *)(v8 + 240) = 0u;
  *(_OWORD *)(v8 + 256) = 0u;
  if (v9)
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
LABEL_9:
  if (!*((_BYTE *)self + 506) || *((_BYTE *)self + 488) || !v4)
  {
    v11 = *((_QWORD *)self + 59);
    *((_QWORD *)self + 59) = 0;
    if (v11)
    {
      v12 = *(_QWORD *)(v11 + 8);
      *(_QWORD *)(v11 + 8) = 0;
      if (v12)
        (*(void (**)(uint64_t, SEL))(*(_QWORD *)v12 + 8))(v12, a2);
      v13 = *(ggl::RenderQueue **)v11;
      *(_QWORD *)v11 = 0;
      if (v13)
      {
        ggl::RenderQueue::~RenderQueue(v13);
        MEMORY[0x1A1AF4E00]();
      }
      MEMORY[0x1A1AF4E00](v11, 0x20C40A4A59CD2);
    }
    v14 = *((_QWORD *)self + 41);
    *((_QWORD *)self + 41) = 0;
    if (!v14)
    {
      if (!*((_BYTE *)self + 488))
      {
LABEL_63:
        v52 = *(_QWORD *)a3;
        v51 = (std::__shared_weak_count *)*((_QWORD *)a3 + 1);
        if (v51)
        {
          p_shared_owners = (unint64_t *)&v51->__shared_owners_;
          do
            v54 = __ldxr(p_shared_owners);
          while (__stxr(v54 + 1, p_shared_owners));
        }
        v144 = v52;
        v145 = v51;
        v36 = *((_QWORD *)self + 30);
        if (!v36)
          goto LABEL_67;
LABEL_61:
        if (__PAIR64__(*(_DWORD *)(v36 + 80), *(_DWORD *)(v36 + 84)) == v141)
          goto LABEL_69;
        goto LABEL_67;
      }
LABEL_48:
      v37 = (_QWORD *)*((_QWORD *)self + 29);
      v38 = *(_QWORD *)a3;
      if (v37[23] != *(_QWORD *)a3)
      {
        v37[24] = 0;
        v37[25] = 0;
        v37[23] = v38;
      }
      v39 = *((_QWORD *)self + 31);
      if (!v39 || __PAIR64__(*(_DWORD *)(v39 + 80), *(_DWORD *)(v39 + 84)) != v141)
      {
        v40 = operator new();
        v41 = *((_DWORD *)self + 28);
        v42 = *((_DWORD *)self + 34);
        *(_QWORD *)(v40 + 16) = 0;
        *(_QWORD *)(v40 + 24) = 0;
        *(_DWORD *)(v40 + 32) = 0;
        *(_QWORD *)(v40 + 56) = 0x200000000;
        *(_DWORD *)(v40 + 64) = 2;
        *(_DWORD *)(v40 + 68) = v41;
        *(_DWORD *)(v40 + 72) = v42;
        *(_QWORD *)(v40 + 76) = 0;
        *(_QWORD *)(v40 + 84) = 0;
        *(_QWORD *)(v40 + 92) = 0;
        *(_DWORD *)(v40 + 100) = 0;
        *(_QWORD *)v40 = &off_1E42B6330;
        *(_QWORD *)(v40 + 8) = 0;
        *(_QWORD *)(v40 + 40) = &unk_1E42B6350;
        *(_QWORD *)(v40 + 48) = "MDDisplayLayer";
        *(_DWORD *)(v40 + 80) = HIDWORD(v141);
        *(_DWORD *)(v40 + 84) = v141;
        v43 = (_QWORD *)operator new();
        *v43 = &off_1E42E7790;
        v43[1] = 0;
        v43[2] = 0;
        v43[3] = v40;
        v44 = (std::__shared_weak_count *)*((_QWORD *)self + 32);
        *((_QWORD *)self + 31) = v40;
        *((_QWORD *)self + 32) = v43;
        if (v44)
        {
          v45 = (unint64_t *)&v44->__shared_owners_;
          do
            v46 = __ldaxr(v45);
          while (__stlxr(v46 - 1, v45));
          if (!v46)
          {
            ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
            std::__shared_weak_count::__release_weak(v44);
          }
        }
      }
      v48 = *((_QWORD *)self + 31);
      v47 = (std::__shared_weak_count *)*((_QWORD *)self + 32);
      if (v47)
      {
        v49 = (unint64_t *)&v47->__shared_owners_;
        do
          v50 = __ldxr(v49);
        while (__stxr(v50 + 1, v49));
      }
      v144 = v48;
      v145 = v47;
      v36 = *((_QWORD *)self + 30);
      if (!v36)
        goto LABEL_67;
      goto LABEL_61;
    }
    v10 = 0;
LABEL_22:
    (*(void (**)(uint64_t, SEL))(*(_QWORD *)v14 + 8))(v14, a2);
    goto LABEL_23;
  }
  if (*((_QWORD *)self + 41))
  {
    v10 = 1;
    goto LABEL_23;
  }
  v130 = (uint64_t *)operator new();
  *v130 = 0;
  v130[1] = 0;
  v131 = (ggl::RenderQueue *)operator new();
  v132 = ggl::RenderQueue::RenderQueue(v131, 1);
  v133 = (ggl::RenderQueue *)*v130;
  *v130 = (uint64_t)v132;
  if (v133)
  {
    ggl::RenderQueue::~RenderQueue(v133);
    MEMORY[0x1A1AF4E00]();
  }
  v134 = (ggl::CommandBuffer *)operator new();
  v135 = ggl::CommandBuffer::CommandBuffer(v134, 0, "");
  v136 = v130[1];
  v130[1] = (uint64_t)v134;
  if (v136)
  {
    (*(void (**)(uint64_t, double))(*(_QWORD *)v136 + 8))(v136, v135);
    v134 = (ggl::CommandBuffer *)v130[1];
  }
  ggl::RenderQueue::setBufferForLayer(*v130, 0, v134);
  v137 = *((_QWORD *)self + 59);
  *((_QWORD *)self + 59) = v130;
  if (v137)
  {
    v138 = *(_QWORD *)(v137 + 8);
    *(_QWORD *)(v137 + 8) = 0;
    if (v138)
      (*(void (**)(uint64_t))(*(_QWORD *)v138 + 8))(v138);
    v139 = *(ggl::RenderQueue **)v137;
    *(_QWORD *)v137 = 0;
    if (v139)
    {
      ggl::RenderQueue::~RenderQueue(v139);
      MEMORY[0x1A1AF4E00]();
    }
    MEMORY[0x1A1AF4E00](v137, 0x20C40A4A59CD2);
  }
  v140 = operator new();
  *(_QWORD *)(v140 + 16) = 0;
  *(_QWORD *)(v140 + 24) = 0;
  *(_DWORD *)(v140 + 32) = 0;
  *(_QWORD *)v140 = &off_1E42B6370;
  *(_QWORD *)(v140 + 8) = 0;
  *(_QWORD *)(v140 + 40) = &unk_1E42B6390;
  *(_QWORD *)(v140 + 48) = "MDDisplayLayer Blit Target";
  *(_QWORD *)(v140 + 336) = 0;
  *(_OWORD *)(v140 + 72) = 0u;
  *(_OWORD *)(v140 + 88) = 0u;
  *(_OWORD *)(v140 + 104) = 0u;
  *(_OWORD *)(v140 + 120) = 0u;
  *(_OWORD *)(v140 + 136) = 0u;
  *(_OWORD *)(v140 + 152) = 0u;
  *(_OWORD *)(v140 + 168) = 0u;
  *(_OWORD *)(v140 + 184) = 0u;
  *(_OWORD *)(v140 + 200) = 0u;
  *(_OWORD *)(v140 + 216) = 0u;
  *(_OWORD *)(v140 + 232) = 0u;
  *(_OWORD *)(v140 + 248) = 0u;
  *(_DWORD *)(v140 + 328) = 0;
  *(_BYTE *)(v140 + 344) = 0;
  *(_OWORD *)(v140 + 56) = 0u;
  v14 = *((_QWORD *)self + 41);
  *((_QWORD *)self + 41) = v140;
  *(_OWORD *)(v140 + 264) = 0u;
  *(_OWORD *)(v140 + 280) = 0u;
  *(_OWORD *)(v140 + 296) = 0u;
  *(_OWORD *)(v140 + 312) = 0u;
  v10 = 1;
  if (v14)
    goto LABEL_22;
LABEL_23:
  if (*((_BYTE *)self + 488))
    goto LABEL_48;
  if (!v10)
    goto LABEL_63;
  v15 = *((_QWORD *)self + 33);
  if (!v15 || __PAIR64__(*(_DWORD *)(v15 + 80), *(_DWORD *)(v15 + 84)) != v141)
  {
    v16 = (char *)operator new(0x58uLL);
    *((_QWORD *)v16 + 1) = 0;
    v17 = (unint64_t *)(v16 + 8);
    *((_QWORD *)v16 + 2) = 0;
    *((_QWORD *)v16 + 3) = &off_1E42B63B0;
    *(_QWORD *)v16 = &off_1E42DED18;
    *((_QWORD *)v16 + 5) = 0;
    *((_QWORD *)v16 + 6) = 0;
    *((_QWORD *)v16 + 4) = 0;
    *((_DWORD *)v16 + 14) = 0;
    *(_QWORD *)&v18 = 0x100000001;
    *((_QWORD *)&v18 + 1) = 0x100000001;
    *(_OWORD *)(v16 + 60) = v18;
    *(_QWORD *)(v16 + 76) = 0x100000001;
    *((_DWORD *)v16 + 21) = 0;
    v142 = (std::__shared_weak_count *)v16;
    v19 = operator new();
    v20 = v19;
    v21 = *((_DWORD *)self + 28);
    v22 = *((_DWORD *)self + 34);
    *(_QWORD *)(v19 + 16) = 0;
    *(_QWORD *)(v19 + 24) = 0;
    *(_DWORD *)(v19 + 32) = 0;
    *(_QWORD *)(v19 + 56) = 0x300000001;
    *(_DWORD *)(v19 + 64) = 0;
    *(_DWORD *)(v19 + 68) = v21;
    *(_DWORD *)(v19 + 72) = v22;
    *(_QWORD *)(v19 + 76) = 0;
    *(_QWORD *)(v19 + 92) = 0;
    *(_QWORD *)(v19 + 84) = 0;
    *(_QWORD *)(v19 + 100) = 0x100000000;
    *(_QWORD *)v19 = &off_1E42BE438;
    *(_QWORD *)(v19 + 8) = 0;
    *(_QWORD *)(v19 + 40) = &unk_1E42BE458;
    *(_QWORD *)(v19 + 48) = "";
    *(_QWORD *)(v19 + 112) = 0;
    *(_QWORD *)(v19 + 120) = 0;
    *(_WORD *)(v19 + 128) = 0;
    *(_BYTE *)(v19 + 130) = 1;
    *(_QWORD *)(v19 + 136) = v16 + 24;
    *(_QWORD *)(v19 + 144) = v16;
    do
      v23 = __ldxr(v17);
    while (__stxr(v23 + 1, v17));
    *(_DWORD *)(v19 + 80) = HIDWORD(v141);
    *(_DWORD *)(v19 + 84) = v141;
    v24 = (_QWORD *)operator new();
    *v24 = &off_1E42E7DE8;
    v24[1] = 0;
    v24[2] = 0;
    v24[3] = v20;
    v25 = (std::__shared_weak_count *)*((_QWORD *)self + 34);
    *((_QWORD *)self + 33) = v20;
    *((_QWORD *)self + 34) = v24;
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
    if (v142)
    {
      v28 = (unint64_t *)&v142->__shared_owners_;
      do
        v29 = __ldaxr(v28);
      while (__stlxr(v29 - 1, v28));
      if (!v29)
      {
        ((void (*)(std::__shared_weak_count *))v142->__on_zero_shared)(v142);
        std::__shared_weak_count::__release_weak(v142);
      }
    }
    v15 = *((_QWORD *)self + 33);
  }
  v30 = (std::__shared_weak_count *)*((_QWORD *)self + 34);
  if (v30)
  {
    v31 = (unint64_t *)&v30->__shared_owners_;
    do
      v32 = __ldxr(v31);
    while (__stxr(v32 + 1, v31));
  }
  v144 = v15;
  v145 = v30;
  v33 = *((_QWORD *)self + 41);
  v34 = *(_QWORD *)a3;
  *(_QWORD *)(v33 + 96) = 0;
  *(_QWORD *)(v33 + 104) = 0;
  *(_QWORD *)(v33 + 88) = v34;
  *(_DWORD *)(v33 + 80) = *(_DWORD *)(v34 + 72);
  v35 = *(_QWORD *)(v33 + 72);
  if (v35 <= 1)
    v35 = 1;
  *(_QWORD *)(v33 + 72) = v35;
  *(_DWORD *)(v33 + 56) = *(_DWORD *)(v34 + 68);
  v36 = *((_QWORD *)self + 30);
  if (v36)
    goto LABEL_61;
LABEL_67:
  v36 = operator new();
  *(_DWORD *)(v36 + 32) = 0;
  *(_QWORD *)(v36 + 16) = 0;
  *(_QWORD *)(v36 + 24) = 0;
  *(_QWORD *)(v36 + 56) = 0x200000000;
  *(_DWORD *)(v36 + 64) = 2;
  *(int32x2_t *)(v36 + 68) = vrev64_s32(*(int32x2_t *)((char *)self + 136));
  *(_QWORD *)(v36 + 76) = 0;
  *(_QWORD *)(v36 + 84) = 0;
  *(_QWORD *)(v36 + 92) = 0;
  *(_DWORD *)(v36 + 100) = 0;
  *(_QWORD *)v36 = &off_1E42B6330;
  *(_QWORD *)(v36 + 8) = 0;
  *(_QWORD *)(v36 + 40) = &unk_1E42B6350;
  *(_QWORD *)(v36 + 48) = "MDDisplayLayer";
  *(_DWORD *)(v36 + 80) = HIDWORD(v141);
  *(_DWORD *)(v36 + 84) = v141;
  v55 = *((_QWORD *)self + 30);
  *((_QWORD *)self + 30) = v36;
  if (v55)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v55 + 8))(v55);
    v36 = *((_QWORD *)self + 30);
  }
LABEL_69:
  v56 = *((_QWORD *)self + 29);
  *(_QWORD *)(v56 + 288) = 0;
  *(_QWORD *)(v56 + 296) = 0;
  *(_QWORD *)(v56 + 280) = v36;
  *(_DWORD *)(v56 + 84) = *(_DWORD *)(v36 + 68);
  if (!*(_DWORD *)(v56 + 80))
    *(_DWORD *)(v56 + 80) = *(_DWORD *)(v36 + 72);
  v57 = *((_QWORD *)self + 50);
  v58 = *((_QWORD *)self + 30);
  *(_QWORD *)(v57 + 288) = 0;
  *(_QWORD *)(v57 + 296) = 0;
  *(_QWORD *)(v57 + 280) = v58;
  *(_DWORD *)(v57 + 84) = *(_DWORD *)(v58 + 68);
  if (!*(_DWORD *)(v57 + 80))
    *(_DWORD *)(v57 + 80) = *(_DWORD *)(v58 + 72);
  v59 = *((_QWORD *)self + 29);
  *(_QWORD *)(v59 + 96) = 0;
  *(_QWORD *)(v59 + 104) = 0;
  *(_QWORD *)(v59 + 88) = v144;
  *(_DWORD *)(v59 + 80) = *(_DWORD *)(v144 + 72);
  v60 = *(_QWORD *)(v59 + 72);
  if (v60 <= 1)
    v60 = 1;
  *(_QWORD *)(v59 + 72) = v60;
  *(_DWORD *)(v59 + 56) = *(_DWORD *)(v144 + 68);
  v61 = *(_QWORD *)(*((_QWORD *)self + 50) + 88);
  if (!v61 || *(_QWORD *)(v61 + 88) != v144)
  {
    v62 = operator new();
    v63 = v62;
    v64 = *((_DWORD *)self + 92);
    v65 = *(_QWORD *)(v144 + 60);
    v66 = *(_QWORD *)(v144 + 72);
    *(_QWORD *)(v62 + 16) = 0;
    *(_QWORD *)(v62 + 24) = 0;
    *(_DWORD *)(v62 + 32) = 0;
    *(_DWORD *)(v62 + 56) = 0;
    *(_QWORD *)(v62 + 60) = v65;
    *(_DWORD *)(v62 + 68) = v64;
    *(_QWORD *)(v62 + 72) = v66;
    *(_QWORD *)(v62 + 88) = 0;
    *(_QWORD *)(v62 + 96) = 0;
    *(_QWORD *)v62 = &off_1E42B6330;
    *(_QWORD *)(v62 + 8) = 0;
    *(_QWORD *)(v62 + 40) = &unk_1E42B6350;
    *(_QWORD *)(v62 + 48) = "MDDisplayLayer";
    *(_QWORD *)(v62 + 80) = *(_QWORD *)(v144 + 80);
    if (v145)
    {
      v67 = (unint64_t *)&v145->__shared_owners_;
      do
        v68 = __ldxr(v67);
      while (__stxr(v68 + 1, v67));
      v69 = *(std::__shared_weak_count **)(v62 + 96);
      *(_QWORD *)(v62 + 88) = v144;
      *(_QWORD *)(v62 + 96) = v145;
      if (v69)
      {
        v70 = (unint64_t *)&v69->__shared_owners_;
        do
          v71 = __ldaxr(v70);
        while (__stlxr(v71 - 1, v70));
        if (!v71)
        {
          ((void (*)(std::__shared_weak_count *))v69->__on_zero_shared)(v69);
          std::__shared_weak_count::__release_weak(v69);
        }
      }
    }
    else
    {
      *(_QWORD *)(v62 + 88) = v144;
      *(_QWORD *)(v62 + 96) = 0;
    }
    v72 = (_QWORD *)operator new();
    *v72 = &off_1E42E7790;
    v72[1] = 0;
    v72[2] = 0;
    v72[3] = v63;
    v73 = (std::__shared_weak_count *)*((_QWORD *)self + 52);
    *((_QWORD *)self + 51) = v63;
    *((_QWORD *)self + 52) = v72;
    if (v73)
    {
      v74 = (unint64_t *)&v73->__shared_owners_;
      do
        v75 = __ldaxr(v74);
      while (__stlxr(v75 - 1, v74));
      if (!v75)
      {
        ((void (*)(std::__shared_weak_count *))v73->__on_zero_shared)(v73);
        std::__shared_weak_count::__release_weak(v73);
      }
    }
    v76 = *((_QWORD *)self + 50);
    v77 = *((_QWORD *)self + 51);
    *(_QWORD *)(v76 + 96) = 0;
    *(_QWORD *)(v76 + 104) = 0;
    *(_QWORD *)(v76 + 88) = v77;
    *(_DWORD *)(v76 + 80) = *(_DWORD *)(v77 + 72);
    v78 = *(_QWORD *)(v76 + 72);
    if (v78 <= 1)
      v78 = 1;
    *(_QWORD *)(v76 + 72) = v78;
    *(_DWORD *)(v76 + 56) = *(_DWORD *)(v77 + 68);
  }
  v79 = *((_QWORD *)self + 16);
  if (v79 >= 2)
  {
    v80 = (char *)self + 280;
    v81 = 1;
    v82 = 1;
    do
    {
      v87 = &v80[16 * v81 - 16];
      if (!*(_QWORD *)v87 || __PAIR64__(*(_DWORD *)(*(_QWORD *)v87 + 80), *(_DWORD *)(*(_QWORD *)v87 + 84)) != v141)
      {
        v88 = operator new();
        v89 = *((_DWORD *)self + v81 + 28);
        v90 = *((_DWORD *)self + 34);
        *(_QWORD *)(v88 + 16) = 0;
        *(_QWORD *)(v88 + 24) = 0;
        *(_DWORD *)(v88 + 32) = 0;
        *(_QWORD *)(v88 + 56) = 0x200000000;
        *(_DWORD *)(v88 + 64) = 2;
        *(_DWORD *)(v88 + 68) = v89;
        *(_DWORD *)(v88 + 72) = v90;
        *(_QWORD *)(v88 + 76) = 0;
        *(_QWORD *)(v88 + 84) = 0;
        *(_QWORD *)(v88 + 92) = 0;
        *(_DWORD *)(v88 + 100) = 0;
        *(_QWORD *)v88 = &off_1E42B6330;
        *(_QWORD *)(v88 + 8) = 0;
        *(_QWORD *)(v88 + 40) = &unk_1E42B6350;
        *(_QWORD *)(v88 + 48) = "MDDisplayLayer";
        *(_DWORD *)(v88 + 80) = HIDWORD(v141);
        *(_DWORD *)(v88 + 84) = v141;
        v91 = (_QWORD *)operator new();
        *v91 = &off_1E42E7790;
        v91[1] = 0;
        v91[2] = 0;
        v91[3] = v88;
        *(_QWORD *)v87 = v88;
        v92 = &v80[16 * v81 - 16];
        v93 = (std::__shared_weak_count *)*((_QWORD *)v92 + 1);
        *((_QWORD *)v92 + 1) = v91;
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
        v83 = *((_QWORD *)self + 29);
        v84 = *(_QWORD *)v87;
        v85 = (_QWORD *)(v83 + 24 * v81);
        v85[12] = 0;
        v85[13] = 0;
        v85[11] = v84;
        *(_DWORD *)(v83 + 80) = *(_DWORD *)(v84 + 72);
        if (*(_QWORD *)(v83 + 72) <= (unint64_t)(v81 + 1))
          v86 = v81 + 1;
        else
          v86 = *(_QWORD *)(v83 + 72);
        *(_QWORD *)(v83 + 72) = v86;
        *(_DWORD *)(v83 + 4 * v81 + 56) = *(_DWORD *)(v84 + 68);
        v79 = *((_QWORD *)self + 16);
      }
      v81 = ++v82;
    }
    while (v79 > v82);
    if (v79 >= 2)
    {
      v96 = 1;
      v97 = 1;
      while (1)
      {
        v102 = *(_QWORD *)(*((_QWORD *)self + 50) + 24 * v96 + 88);
        if (!v102)
          break;
        v103 = v96 - 1;
        if (*(_QWORD *)(v102 + 88) != *(_QWORD *)&v80[16 * v96 - 16])
          goto LABEL_119;
LABEL_114:
        v96 = ++v97;
        if (v79 <= v97)
          goto LABEL_143;
      }
      v103 = v96 - 1;
LABEL_119:
      v104 = operator new();
      v105 = v104;
      v106 = *(_OWORD *)&v80[16 * v103];
      v143 = (std::__shared_weak_count *)*((_QWORD *)&v106 + 1);
      v107 = *(_QWORD *)&v80[16 * v103 + 8];
      if (*((_QWORD *)&v106 + 1))
      {
        v108 = (unint64_t *)(*((_QWORD *)&v106 + 1) + 8);
        do
          v109 = __ldxr(v108);
        while (__stxr(v109 + 1, v108));
        v107 = *((_QWORD *)&v106 + 1);
      }
      v110 = v106;
      v111 = *((_DWORD *)self + v96 + 92);
      v112 = v106;
      v113 = *(_QWORD *)(v106 + 60);
      v114 = *(_QWORD *)(v112 + 72);
      *(_QWORD *)(v104 + 16) = 0;
      *(_QWORD *)(v104 + 24) = 0;
      *(_DWORD *)(v104 + 32) = 0;
      *(_DWORD *)(v104 + 56) = 0;
      *(_QWORD *)(v104 + 60) = v113;
      *(_DWORD *)(v104 + 68) = v111;
      *(_QWORD *)(v104 + 72) = v114;
      *(_QWORD *)(v104 + 88) = 0;
      *(_QWORD *)(v104 + 96) = 0;
      *(_QWORD *)(v104 + 80) = 0;
      *(_QWORD *)v104 = &off_1E42B6330;
      *(_QWORD *)(v104 + 8) = 0;
      *(_QWORD *)(v104 + 40) = &unk_1E42B6350;
      *(_QWORD *)(v104 + 48) = "MDDisplayLayer";
      *(_QWORD *)(v104 + 80) = *(_QWORD *)(v110 + 80);
      if (v107)
      {
        v115 = (unint64_t *)(v107 + 8);
        do
          v116 = __ldxr(v115);
        while (__stxr(v116 + 1, v115));
        v117 = *(std::__shared_weak_count **)(v104 + 96);
        *(_QWORD *)(v104 + 88) = v110;
        *(_QWORD *)(v104 + 96) = v107;
        if (v117)
        {
          v118 = (unint64_t *)&v117->__shared_owners_;
          do
            v119 = __ldaxr(v118);
          while (__stlxr(v119 - 1, v118));
          if (!v119)
          {
            ((void (*)(std::__shared_weak_count *))v117->__on_zero_shared)(v117);
            std::__shared_weak_count::__release_weak(v117);
          }
        }
      }
      else
      {
        *(_QWORD *)(v104 + 88) = v110;
        *(_QWORD *)(v104 + 96) = 0;
      }
      v120 = (_QWORD *)operator new();
      v121 = (uint64_t *)((char *)self + 16 * v103 + 424);
      *v120 = &off_1E42E7790;
      v120[1] = 0;
      v120[2] = 0;
      v120[3] = v105;
      *v121 = v105;
      v122 = (std::__shared_weak_count *)v121[1];
      v121[1] = (uint64_t)v120;
      if (!v122)
        goto LABEL_136;
      v123 = (unint64_t *)&v122->__shared_owners_;
      do
        v124 = __ldaxr(v123);
      while (__stlxr(v124 - 1, v123));
      if (!v124)
      {
        ((void (*)(std::__shared_weak_count *))v122->__on_zero_shared)(v122);
        std::__shared_weak_count::__release_weak(v122);
        v125 = v143;
        if (v143)
          goto LABEL_137;
      }
      else
      {
LABEL_136:
        v125 = v143;
        if (v143)
        {
LABEL_137:
          v126 = (unint64_t *)&v125->__shared_owners_;
          do
            v127 = __ldaxr(v126);
          while (__stlxr(v127 - 1, v126));
          if (!v127)
          {
            ((void (*)(std::__shared_weak_count *))v125->__on_zero_shared)(v125);
            std::__shared_weak_count::__release_weak(v125);
          }
        }
      }
      v98 = *((_QWORD *)self + 50);
      v99 = *v121;
      v100 = (_QWORD *)(v98 + 24 * v96);
      v100[12] = 0;
      v100[13] = 0;
      v100[11] = v99;
      *(_DWORD *)(v98 + 80) = *(_DWORD *)(v99 + 72);
      if (*(_QWORD *)(v98 + 72) <= (unint64_t)(v96 + 1))
        v101 = v96 + 1;
      else
        v101 = *(_QWORD *)(v98 + 72);
      *(_QWORD *)(v98 + 72) = v101;
      *(_DWORD *)(v98 + 4 * v96 + 56) = *(_DWORD *)(v99 + 68);
      v79 = *((_QWORD *)self + 16);
      goto LABEL_114;
    }
  }
LABEL_143:
  if (v145)
  {
    v128 = (unint64_t *)&v145->__shared_owners_;
    do
      v129 = __ldaxr(v128);
    while (__stlxr(v129 - 1, v128));
    if (!v129)
    {
      ((void (*)(std::__shared_weak_count *))v145->__on_zero_shared)(v145);
      std::__shared_weak_count::__release_weak(v145);
    }
  }
}

- (BOOL)isDelayedRenderQueueConsumptionSupported
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)self + 7);
  v3 = objc_msgSend(WeakRetained, "isDelayedRenderQueueConsumptionSupported");

  return v3;
}

- (void)willUpdateFrameTexture
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint8_t v6[16];

  if (GEOGetVectorKitPerformanceLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitPerformanceLog_onceToken, &__block_literal_global_13_11780);
  v3 = (id)GEOGetVectorKitPerformanceLog_log;
  v4 = v3;
  v5 = *((_QWORD *)self + 69);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_19F029000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "UpdateFrameTexture", (const char *)&unk_1A0189141, v6, 2u);
  }

}

- (void)didUpdateFrameTexture
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint8_t v6[16];

  if (GEOGetVectorKitPerformanceLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitPerformanceLog_onceToken, &__block_literal_global_13_11780);
  v3 = (id)GEOGetVectorKitPerformanceLog_log;
  v4 = v3;
  v5 = *((_QWORD *)self + 69);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_19F029000, v4, OS_SIGNPOST_INTERVAL_END, v5, "UpdateFrameTexture", (const char *)&unk_1A0189141, v6, 2u);
  }

}

- (void)willPresent
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint8_t v6[16];

  if (GEOGetVectorKitPerformanceLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitPerformanceLog_onceToken, &__block_literal_global_13_11780);
  v3 = (id)GEOGetVectorKitPerformanceLog_log;
  v4 = v3;
  v5 = *((_QWORD *)self + 69);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_19F029000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "Present", (const char *)&unk_1A0189141, v6, 2u);
  }

}

- (void)enablePerformanceHUD:(id)a3
{
  (*(void (**)(_QWORD, uint64_t))(**((_QWORD **)self + 19) + 32))(*((_QWORD *)self + 19), 1);
}

- (void)disablePerformanceHUD:(id)a3
{
  (*(void (**)(_QWORD, _QWORD))(**((_QWORD **)self + 19) + 32))(*((_QWORD *)self + 19), 0);
}

- (void)expandedPerformanceHUD:(id)a3
{
  int v3;
  int v4;
  id v5;

  objc_msgSend(a3, "name");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "isEqualToString:", CFSTR("VKExtendedPeformanceHUD"));
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1)
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_40952);
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 0, 2);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1)
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_40952);
  if (v3)
    v4 = 2;
  else
    v4 = 0;
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 1u, v4);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1)
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_40952);
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 2u, v4);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1)
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_40952);
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 3u, v4);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1)
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_40952);
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 4u, v4);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1)
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_40952);
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 5u, v4);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1)
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_40952);
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 6u, v4);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1)
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_40952);
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 7u, v4);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1)
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_40952);
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 8u, v4);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1)
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_40952);
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 0x13u, 2);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1)
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_40952);
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 0x14u, 2);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1)
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_40952);
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 9u, 2);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1)
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_40952);
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 0xAu, 2);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1)
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_40952);
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 0xBu, 2);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1)
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_40952);
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 0xCu, v4);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1)
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_40952);
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 0xDu, v4);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1)
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_40952);
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 0xEu, v4);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1)
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_40952);
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 0xFu, v4);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1)
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_40952);
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 0x10u, v4);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1)
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_40952);
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 0x11u, v4);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1)
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_40952);
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 0x12u, v4);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1)
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_40952);
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 0x15u, v4);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1)
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_40952);
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 0x16u, v4);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1)
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_40952);
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 0x17u, v4);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1)
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_40952);
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 0x18u, v4);

}

- (void)setNeedsDisplayOnBoundsChange:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[MDDisplayLayer layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsDisplayOnBoundsChange:", v3);

}

- (void)setOpaque:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[MDDisplayLayer layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOpaque:", v3);

}

- (void)setContentsGravity:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MDDisplayLayer layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentsGravity:", v5);

}

- (void)setBackgroundColor:(CGColor *)a3
{
  id v4;

  -[MDDisplayLayer layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", a3);

}

- (void)drawInContext:(CGContext *)a3 registry:(void *)a4
{
  CGContext *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v18;
  int v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *p_shared_owners;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t v25;
  unint64_t *v26;
  unint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  dispatch_semaphore_t v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t (***v42)();
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  unint64_t *v46;
  unint64_t v47;
  std::__shared_weak_count *v48;
  unint64_t *v49;
  unint64_t v50;
  std::__shared_weak_count *v51;
  _BYTE v52[24];
  _BYTE *v53;
  uint64_t (**v54)();
  std::__shared_weak_count *v55;
  CFTimeInterval v56;
  uint64_t (***v57)();
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return;
  v6 = (CGContext *)*((_QWORD *)self + 62);
  if (v6)
    CGContextRelease(v6);
  *((_QWORD *)self + 62) = CGContextRetain(a3);
  -[MDDisplayLayer layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;

  -[MDDisplayLayer layer](self, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentsScale");
  v14 = v13;

  v15 = v14 * v9;
  v16 = v14 * v11;
  if (v15 < 1.0 || v16 < 1.0)
  {
    CGContextRelease(*((CGContextRef *)self + 62));
    *((_QWORD *)self + 62) = 0;
    return;
  }
  v18 = operator new();
  v19 = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)self + 18) + 8) + 60);
  v20 = operator new();
  *(_DWORD *)(v20 + 32) = 0;
  *(_QWORD *)(v20 + 16) = 0;
  *(_QWORD *)(v20 + 24) = 0;
  *(_QWORD *)v20 = &off_1E42B63B0;
  *(_QWORD *)(v20 + 8) = 0;
  *(_OWORD *)(v20 + 36) = xmmword_19FFB3C50;
  *(_QWORD *)(v20 + 52) = 0x100000000;
  *(_DWORD *)(v20 + 60) = 0;
  v54 = (uint64_t (**)())v20;
  v21 = (std::__shared_weak_count *)operator new();
  v21->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v21->__shared_owners_;
  v21->__vftable = (std::__shared_weak_count_vtbl *)&off_1E42E77C8;
  v21->__shared_weak_owners_ = 0;
  v21[1].__vftable = (std::__shared_weak_count_vtbl *)v20;
  v55 = v21;
  *(_QWORD *)(v18 + 16) = 0;
  *(_QWORD *)(v18 + 24) = 0;
  *(_DWORD *)(v18 + 32) = 0;
  *(_QWORD *)(v18 + 56) = 0x300000001;
  *(_DWORD *)(v18 + 64) = 0;
  *(_DWORD *)(v18 + 68) = v19;
  *(_DWORD *)(v18 + 72) = 1;
  *(_QWORD *)(v18 + 76) = 0;
  *(_QWORD *)(v18 + 92) = 0;
  *(_QWORD *)(v18 + 84) = 0;
  *(_QWORD *)v18 = &off_1E42BE438;
  *(_QWORD *)(v18 + 8) = 0;
  *(_QWORD *)(v18 + 40) = &unk_1E42BE458;
  *(_QWORD *)(v18 + 48) = "";
  *(_DWORD *)(v18 + 100) = 0;
  *(_DWORD *)(v18 + 104) = 1;
  *(_QWORD *)(v18 + 112) = 0;
  *(_QWORD *)(v18 + 120) = 0;
  *(_WORD *)(v18 + 128) = 0;
  *(_BYTE *)(v18 + 130) = 1;
  *(_QWORD *)(v18 + 136) = v20;
  *(_QWORD *)(v18 + 144) = v21;
  do
    v23 = __ldxr(p_shared_owners);
  while (__stxr(v23 + 1, p_shared_owners));
  *(_DWORD *)(v18 + 80) = v15;
  *(_DWORD *)(v18 + 84) = v16;
  v24 = (std::__shared_weak_count *)operator new();
  v24->__vftable = (std::__shared_weak_count_vtbl *)&off_1E42E7E58;
  v24->__shared_owners_ = 0;
  v24->__shared_weak_owners_ = 0;
  v24[1].__vftable = (std::__shared_weak_count_vtbl *)v18;
  v51 = v24;
  do
    v25 = __ldaxr(p_shared_owners);
  while (__stlxr(v25 - 1, p_shared_owners));
  if (!v25)
  {
    ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
    std::__shared_weak_count::__release_weak(v21);
  }
  v54 = (uint64_t (**)())v18;
  v55 = v51;
  if (v51)
  {
    v26 = (unint64_t *)&v51->__shared_owners_;
    do
      v27 = __ldxr(v26);
    while (__stxr(v27 + 1, v26));
  }
  -[MDDisplayLayer _prepareTexture:isDrawable:](self, "_prepareTexture:isDrawable:", &v54, 0, v18);
  v28 = v55;
  if (v55)
  {
    v29 = (unint64_t *)&v55->__shared_owners_;
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
  }
  v31 = dispatch_semaphore_create(0);
  v32 = *((_QWORD *)self + 60);
  v33 = *(_QWORD **)v32;
  v34 = *(_QWORD **)(v32 + 8);
  if (v33 != v34)
  {
    while (*v33 != 0x8C3843AC816FCBCLL)
    {
      v33 += 5;
      if (v33 == v34)
        goto LABEL_35;
    }
  }
  if (v33 == v34)
  {
LABEL_35:
    v35 = 0;
  }
  else
  {
    v35 = v33[3];
    v36 = (std::__shared_weak_count *)v33[4];
    if (v36)
    {
      v37 = (unint64_t *)&v36->__shared_owners_;
      do
        v38 = __ldxr(v37);
      while (__stxr(v38 + 1, v37));
      do
        v39 = __ldaxr(v37);
      while (__stlxr(v39 - 1, v37));
      if (!v39)
      {
        ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
        std::__shared_weak_count::__release_weak(v36);
      }
    }
  }
  LOBYTE(v54) = 1;
  BYTE4(v54) = 0;
  LOBYTE(v55) = 0;
  v56 = CACurrentMediaTime();
  LOBYTE(v57) = 0;
  v40 = (*(uint64_t (**)(uint64_t, uint64_t (***)()))(*(_QWORD *)v35 + 16))(v35, &v54);
  v41 = v31;
  v54 = &off_1E42C7A60;
  v55 = (std::__shared_weak_count *)v41;
  v57 = &v54;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t (***)()))(*(_QWORD *)v35 + 64))(v35, v40, 3, &v54);
  v42 = v57;
  if (v57 == &v54)
  {
    v43 = 4;
    v42 = &v54;
  }
  else
  {
    if (!v57)
      goto LABEL_41;
    v43 = 5;
  }
  (*v42)[v43]();
LABEL_41:
  v53 = 0;
  (*(void (**)(uint64_t, uint64_t, _BYTE *))(*(_QWORD *)v35 + 32))(v35, v40, v52);
  v44 = v53;
  if (v53 == v52)
  {
    v45 = 4;
    v44 = v52;
  }
  else
  {
    if (!v53)
      goto LABEL_46;
    v45 = 5;
  }
  (*(void (**)(void))(*v44 + 8 * v45))();
LABEL_46:
  dispatch_semaphore_wait(v41, 0xFFFFFFFFFFFFFFFFLL);

  -[MDDisplayLayer bitmapData](self, "bitmapData");
  -[MDDisplayLayer _didReadPixels:](self, "_didReadPixels:", &v54);
  if (v51)
  {
    v46 = (unint64_t *)&v51->__shared_owners_;
    do
      v47 = __ldaxr(v46);
    while (__stlxr(v47 - 1, v46));
    if (!v47)
    {
      ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
      std::__shared_weak_count::__release_weak(v51);
    }
  }
  CGContextRelease(*((CGContextRef *)self + 62));
  *((_QWORD *)self + 62) = 0;
  *((_QWORD *)self + 10) = 0;
  v48 = v55;
  if (v55)
  {
    v49 = (unint64_t *)&v55->__shared_owners_;
    do
      v50 = __ldaxr(v49);
    while (__stlxr(v50 - 1, v49));
    if (!v50)
    {
      ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
      std::__shared_weak_count::__release_weak(v48);
    }
  }
}

- (void)_didReadPixels:(void *)a3
{
  CGColorSpace *v5;
  const void *v6;
  CGDataProvider *v7;
  CGImage *v8;
  CGRect v9;

  if (*((_QWORD *)self + 62))
  {
    v5 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
    v6 = (const void *)(*(uint64_t (**)(_QWORD))(**(_QWORD **)a3 + 16))(*(_QWORD *)a3);
    v7 = CGDataProviderCreateWithData(0, v6, 4 * *(_QWORD *)(*(_QWORD *)a3 + 24) * *(_QWORD *)(*(_QWORD *)a3 + 32), 0);
    v8 = CGImageCreate(*(_QWORD *)(*(_QWORD *)a3 + 24), *(_QWORD *)(*(_QWORD *)a3 + 32), 8uLL, 0x20uLL, 4 * *(_QWORD *)(*(_QWORD *)a3 + 24), v5, 0x4001u, v7, 0, 0, kCGRenderingIntentDefault);
    CGContextSaveGState(*((CGContextRef *)self + 62));
    CGContextSetBlendMode(*((CGContextRef *)self + 62), kCGBlendModeCopy);
    v9.origin.x = *((CGFloat *)self + 64);
    v9.origin.y = *((CGFloat *)self + 65);
    v9.size.width = *((CGFloat *)self + 66);
    v9.size.height = *((CGFloat *)self + 67);
    CGContextDrawImage(*((CGContextRef *)self + 62), v9, v8);
    CGContextRestoreGState(*((CGContextRef *)self + 62));
    CGColorSpaceRelease(v5);
    CGImageRelease(v8);
    CGDataProviderRelease(v7);
  }
}

- (shared_ptr<ggl::BitmapDataBase>)bitmapData
{
  _OWORD *v2;
  _OWORD *v4;
  BitmapDataBase *v5;
  __shared_weak_count *v6;
  __int128 v7;
  shared_ptr<ggl::BitmapDataBase> result;

  v4 = v2;
  -[MDDisplayLayer multiSample](self, "multiSample");
  -[MDDisplayLayer finalRenderTarget](self, "finalRenderTarget");
  v5 = (BitmapDataBase *)(*(_QWORD *(**)(__int128 *__return_ptr))(**((_QWORD **)self + 19) + 24))(&v7);
  *v4 = v7;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (void)setSize:(CGSize)a3
{
  *((_QWORD *)self + 66) = *(_QWORD *)&a3.width;
  *((_QWORD *)self + 67) = *(_QWORD *)&a3.height;
  -[MDDisplayLayer setBounds:](self, "setBounds:", *((double *)self + 64), *((double *)self + 65), a3.width, a3.height);
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *((double *)self + 64);
  v3 = *((double *)self + 65);
  v4 = *((double *)self + 66);
  v5 = *((double *)self + 67);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (const)linearFormat
{
  return (const RenderTargetFormat *)((char *)self + 368);
}

- (void)linearRenderTarget
{
  return (void *)*((_QWORD *)self + 50);
}

- (void)destroyRenderTarget
{
  NSObject *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  void *v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  uint8_t v11[16];

  if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
  v3 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_19F029000, v3, OS_LOG_TYPE_INFO, "MDDisplayLayer destroying render layer", v11, 2u);
  }

  v4 = (std::__shared_weak_count *)*((_QWORD *)self + 4);
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  -[MDDisplayLayer layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperlayer");

  v8 = (std::__shared_weak_count *)*((_QWORD *)self + 2);
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  if (v8)
  {
    v9 = (unint64_t *)&v8->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
}

- (float)averageFPS
{
  float result;

  (*(void (**)(_QWORD))(**((_QWORD **)self + 19) + 56))(*((_QWORD *)self + 19));
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 toLayer:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[MDDisplayLayer layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:toLayer:", v7, x, y);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
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

  v5 = (std::mutex *)((char *)self + 160);
  std::mutex::lock((std::mutex *)((char *)self + 160));
  v6 = (_QWORD *)*((_QWORD *)self + 28);
  if (!v6)
  {
    v6 = (_QWORD *)operator new();
    v7 = *((_QWORD *)self + 19);
    v8 = *(_QWORD **)(*((_QWORD *)self + 18) + 24);
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
    v12 = (md::DebugConsoleManager *)*((_QWORD *)self + 28);
    *((_QWORD *)self + 28) = v6;
    if (v12)
    {
      md::DebugConsoleManager::~DebugConsoleManager(v12);
      MEMORY[0x1A1AF4E00]();
      v6 = (_QWORD *)*((_QWORD *)self + 28);
    }
  }
  v13 = (void *)md::DebugConsoleManager::console((uint64_t)v6, a3);
  std::mutex::unlock(v5);
  return v13;
}

- (__IOSurface)flipImage
{
  return 0;
}

- (GGLRenderQueueSource)renderSource
{
  return (GGLRenderQueueSource *)objc_loadWeakRetained((id *)self + 7);
}

- (BOOL)shouldRasterize
{
  return *((_BYTE *)self + 505);
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  ggl::RenderQueue *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t v18;
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
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  md::DebugConsoleManager *v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  std::__shared_weak_count *v41;
  unint64_t *v42;
  unint64_t v43;
  std::__shared_weak_count *v44;
  unint64_t *v45;
  unint64_t v46;
  std::__shared_weak_count *v47;
  unint64_t *v48;
  unint64_t v49;

  objc_storeStrong((id *)self + 73, 0);
  objc_storeStrong((id *)self + 72, 0);
  objc_storeStrong((id *)self + 71, 0);
  objc_storeStrong((id *)self + 70, 0);
  v3 = *((_QWORD *)self + 59);
  *((_QWORD *)self + 59) = 0;
  if (v3)
  {
    v4 = *(_QWORD *)(v3 + 8);
    *(_QWORD *)(v3 + 8) = 0;
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
    v5 = *(ggl::RenderQueue **)v3;
    *(_QWORD *)v3 = 0;
    if (v5)
    {
      ggl::RenderQueue::~RenderQueue(v5);
      MEMORY[0x1A1AF4E00]();
    }
    MEMORY[0x1A1AF4E00](v3, 0x20C40A4A59CD2);
  }
  v6 = (std::__shared_weak_count *)*((_QWORD *)self + 58);
  if (!v6)
    goto LABEL_11;
  p_shared_owners = (unint64_t *)&v6->__shared_owners_;
  do
    v8 = __ldaxr(p_shared_owners);
  while (__stlxr(v8 - 1, p_shared_owners));
  if (!v8)
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
    v9 = (std::__shared_weak_count *)*((_QWORD *)self + 56);
    if (!v9)
      goto LABEL_17;
  }
  else
  {
LABEL_11:
    v9 = (std::__shared_weak_count *)*((_QWORD *)self + 56);
    if (!v9)
      goto LABEL_17;
  }
  v10 = (unint64_t *)&v9->__shared_owners_;
  do
    v11 = __ldaxr(v10);
  while (__stlxr(v11 - 1, v10));
  if (!v11)
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
  }
LABEL_17:
  v12 = (std::__shared_weak_count *)*((_QWORD *)self + 54);
  if (!v12)
    goto LABEL_21;
  v13 = (unint64_t *)&v12->__shared_owners_;
  do
    v14 = __ldaxr(v13);
  while (__stlxr(v14 - 1, v13));
  if (!v14)
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
    v15 = (std::__shared_weak_count *)*((_QWORD *)self + 52);
    if (!v15)
      goto LABEL_27;
  }
  else
  {
LABEL_21:
    v15 = (std::__shared_weak_count *)*((_QWORD *)self + 52);
    if (!v15)
      goto LABEL_27;
  }
  v16 = (unint64_t *)&v15->__shared_owners_;
  do
    v17 = __ldaxr(v16);
  while (__stlxr(v17 - 1, v16));
  if (!v17)
  {
    ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
    std::__shared_weak_count::__release_weak(v15);
  }
LABEL_27:
  v18 = *((_QWORD *)self + 50);
  *((_QWORD *)self + 50) = 0;
  if (v18)
    (*(void (**)(uint64_t))(*(_QWORD *)v18 + 8))(v18);
  v19 = *((_QWORD *)self + 41);
  *((_QWORD *)self + 41) = 0;
  if (v19)
    (*(void (**)(uint64_t))(*(_QWORD *)v19 + 8))(v19);
  v20 = (std::__shared_weak_count *)*((_QWORD *)self + 40);
  if (!v20)
    goto LABEL_35;
  v21 = (unint64_t *)&v20->__shared_owners_;
  do
    v22 = __ldaxr(v21);
  while (__stlxr(v22 - 1, v21));
  if (!v22)
  {
    ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
    std::__shared_weak_count::__release_weak(v20);
    v23 = (std::__shared_weak_count *)*((_QWORD *)self + 38);
    if (!v23)
      goto LABEL_41;
  }
  else
  {
LABEL_35:
    v23 = (std::__shared_weak_count *)*((_QWORD *)self + 38);
    if (!v23)
      goto LABEL_41;
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
LABEL_41:
  v26 = (std::__shared_weak_count *)*((_QWORD *)self + 36);
  if (!v26)
    goto LABEL_45;
  v27 = (unint64_t *)&v26->__shared_owners_;
  do
    v28 = __ldaxr(v27);
  while (__stlxr(v28 - 1, v27));
  if (!v28)
  {
    ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
    std::__shared_weak_count::__release_weak(v26);
    v29 = (std::__shared_weak_count *)*((_QWORD *)self + 34);
    if (!v29)
      goto LABEL_51;
  }
  else
  {
LABEL_45:
    v29 = (std::__shared_weak_count *)*((_QWORD *)self + 34);
    if (!v29)
      goto LABEL_51;
  }
  v30 = (unint64_t *)&v29->__shared_owners_;
  do
    v31 = __ldaxr(v30);
  while (__stlxr(v31 - 1, v30));
  if (!v31)
  {
    ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
    std::__shared_weak_count::__release_weak(v29);
  }
LABEL_51:
  v32 = (std::__shared_weak_count *)*((_QWORD *)self + 32);
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
  v35 = *((_QWORD *)self + 30);
  *((_QWORD *)self + 30) = 0;
  if (v35)
    (*(void (**)(uint64_t))(*(_QWORD *)v35 + 8))(v35);
  v36 = *((_QWORD *)self + 29);
  *((_QWORD *)self + 29) = 0;
  if (v36)
    (*(void (**)(uint64_t))(*(_QWORD *)v36 + 8))(v36);
  v37 = (md::DebugConsoleManager *)*((_QWORD *)self + 28);
  *((_QWORD *)self + 28) = 0;
  if (v37)
  {
    md::DebugConsoleManager::~DebugConsoleManager(v37);
    MEMORY[0x1A1AF4E00]();
  }
  std::mutex::~mutex((std::mutex *)((char *)self + 160));
  *((_QWORD *)self + 11) = &off_1E42B4D50;

  v38 = (std::__shared_weak_count *)*((_QWORD *)self + 9);
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
  objc_destroyWeak((id *)self + 7);
  v41 = (std::__shared_weak_count *)*((_QWORD *)self + 6);
  if (!v41)
    goto LABEL_71;
  v42 = (unint64_t *)&v41->__shared_owners_;
  do
    v43 = __ldaxr(v42);
  while (__stlxr(v43 - 1, v42));
  if (!v43)
  {
    ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
    std::__shared_weak_count::__release_weak(v41);
    v44 = (std::__shared_weak_count *)*((_QWORD *)self + 4);
    if (!v44)
      goto LABEL_77;
  }
  else
  {
LABEL_71:
    v44 = (std::__shared_weak_count *)*((_QWORD *)self + 4);
    if (!v44)
      goto LABEL_77;
  }
  v45 = (unint64_t *)&v44->__shared_owners_;
  do
    v46 = __ldaxr(v45);
  while (__stlxr(v46 - 1, v45));
  if (!v46)
  {
    ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
    std::__shared_weak_count::__release_weak(v44);
  }
LABEL_77:
  v47 = (std::__shared_weak_count *)*((_QWORD *)self + 2);
  if (v47)
  {
    v48 = (unint64_t *)&v47->__shared_owners_;
    do
      v49 = __ldaxr(v48);
    while (__stlxr(v49 - 1, v48));
    if (!v49)
    {
      ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
      std::__shared_weak_count::__release_weak(v47);
    }
  }
}

- (uint64_t)drawInContext:registry:
{

  return a1;
}

- (void)drawInContext:registry:
{

  operator delete(a1);
}

- (_QWORD)drawInContext:registry:
{
  _QWORD *v2;
  void *v3;

  v2 = operator new(0x10uLL);
  v3 = *(void **)(a1 + 8);
  *v2 = &off_1E42C7A60;
  v2[1] = v3;
  return v2;
}

- (id)drawInContext:registry:
{
  void *v3;
  id result;

  v3 = *(void **)(a1 + 8);
  *a2 = &off_1E42C7A60;
  result = v3;
  a2[1] = result;
  return result;
}

- (intptr_t)drawInContext:registry:
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 8));
}

void __25__MDDisplayLayer_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

void __165__MDDisplayLayer_initWithContentScale_useMultisampling_extraColorFormats_shouldRasterize_allowBlitToDrawable_taskContext_device_sharedResources_services_signpostId___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t BOOL;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = WeakRetained[19];
    BOOL = GEOConfigGetBOOL();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v1 + 48))(v1, BOOL);
  }

}

void __165__MDDisplayLayer_initWithContentScale_useMultisampling_extraColorFormats_shouldRasterize_allowBlitToDrawable_taskContext_device_sharedResources_services_signpostId___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  ggl::MetalRenderer *v2;
  int BOOL;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (ggl::MetalRenderer *)WeakRetained[19];
    if (!*(_DWORD *)(*((_QWORD *)v2 + 1) + 96))
    {
      v4 = WeakRetained;
      BOOL = GEOConfigGetBOOL();
      ggl::MetalRenderer::enableCommandQueueResetOnError(v2, BOOL);
      WeakRetained = v4;
    }
  }

}

void __165__MDDisplayLayer_initWithContentScale_useMultisampling_extraColorFormats_shouldRasterize_allowBlitToDrawable_taskContext_device_sharedResources_services_signpostId___block_invoke_3(uint64_t a1)
{
  _QWORD *WeakRetained;
  ggl::MetalRenderer *v2;
  int UInteger;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (ggl::MetalRenderer *)WeakRetained[19];
    if (!*(_DWORD *)(*((_QWORD *)v2 + 1) + 96))
    {
      v4 = WeakRetained;
      UInteger = GEOConfigGetUInteger();
      ggl::MetalRenderer::setCommandQueueResetAttempts(v2, UInteger);
      WeakRetained = v4;
    }
  }

}

@end

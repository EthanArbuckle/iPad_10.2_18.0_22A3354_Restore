@implementation WebTextIndicatorLayer

- (BOOL)indicatorWantsBounce:(const void *)a3
{
  return (*((unsigned __int8 *)a3 + 112) < 4u) & (6u >> (*((_BYTE *)a3 + 112) & 0xF));
}

- (BOOL)indicatorWantsManualAnimation:(const void *)a3
{
  unsigned int v3;
  BOOL v4;
  int v5;

  v3 = *((unsigned __int8 *)a3 + 112);
  v4 = v3 >= 4;
  v5 = v3 & 0xF;
  return !v4 && v5 == 3;
}

- (WebTextIndicatorLayer)initWithFrame:(CGRect)a3 textIndicator:(void *)a4 margin:(CGSize)a5 offset:(CGPoint)a6
{
  double y;
  double x;
  CGFloat height;
  CGFloat width;
  double v11;
  double v12;
  double v13;
  double v14;
  WebTextIndicatorLayer *v15;
  WebTextIndicatorLayer *v16;
  void *v17;
  WebCore::TextIndicator *m_ptr;
  double *p_width;
  uint64_t v20;
  float v21;
  TextIndicator *v22;
  float v23;
  void *v24;
  float v25;
  float v26;
  float v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  WTF **v31;
  id v32;
  CGColorRef GenericGray;
  CGColorRef v34;
  WebTextIndicatorLayer *result;
  __n128 v36;
  TextIndicator *v37;
  uint64_t v38;
  WTF *v39;
  float v40;
  float v41;
  char *v42;
  uint64_t i;
  float v44;
  float v45;
  float v46;
  float v47;
  int v48;
  float v49;
  float v50;
  float v51;
  float v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  WebCore::PathCG *v56;
  CGPathRef *v57;
  double v58;
  double v59;
  id v60;
  float v61;
  float v62;
  double v63;
  id v64;
  WTF **v65;
  id v66;
  void *v67;
  void *v68;
  WTF *v69;
  uint64_t v70;
  _DWORD *v71;
  uint64_t v72;
  WTF *v73;
  WTF *v74;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  BOOL v79;
  int v80;
  WTF *v81;
  void *v82;
  WTF *v83;
  uint64_t v84;
  __n128 *v85;
  uint64_t v86;
  __n128 v87;
  uint64_t v88;
  CGColorRef v89;
  uint64_t v90;
  float v91;
  float v92;
  WebTextIndicatorLayer *v93;
  CGColorRef SRGB;
  WebTextIndicatorLayer *v95;
  void *v96;
  _OWORD v97[2];
  double v98;
  double v99;
  WTF *v100;
  int v101;
  unsigned int v102;
  WTF *v103;
  int v104;
  int v105;
  objc_super v106;
  WTF **v107;
  uint64_t v108;
  int v109;
  uint64_t v110;

  y = a6.y;
  x = a6.x;
  height = a5.height;
  width = a5.width;
  v11 = a3.size.height;
  v12 = a3.size.width;
  v13 = a3.origin.y;
  v14 = a3.origin.x;
  v110 = *MEMORY[0x1E0C80C00];
  v106.receiver = self;
  v106.super_class = (Class)WebTextIndicatorLayer;
  v15 = -[WebTextIndicatorLayer init](&v106, sel_init);
  v16 = v15;
  if (!v15)
    return v16;
  -[WebTextIndicatorLayer setAnchorPoint:](v15, "setAnchorPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  -[WebTextIndicatorLayer setFrame:](v16, "setFrame:", v14, v13, v12, v11);
  -[WebTextIndicatorLayer setName:](v16, "setName:", CFSTR("WebTextIndicatorLayer"));
  ++*(_DWORD *)a4;
  m_ptr = (WebCore::TextIndicator *)v16->_textIndicator.m_ptr;
  v16->_textIndicator.m_ptr = (TextIndicator *)a4;
  if (m_ptr)
  {
    if (*(_DWORD *)m_ptr == 1)
    {
      WebCore::TextIndicator::~TextIndicator(m_ptr, v17);
      WTF::fastFree(v81, v82);
      a4 = v16->_textIndicator.m_ptr;
    }
    else
    {
      --*(_DWORD *)m_ptr;
    }
  }
  p_width = &v16->_margin.width;
  v16->_margin.width = width;
  v16->_margin.height = height;
  v20 = *((_QWORD *)a4 + 12);
  if (v20)
  {
    v21 = (*(float (**)(uint64_t, _QWORD))(*(_QWORD *)v20 + 168))(v20, 0);
    v22 = v16->_textIndicator.m_ptr;
    v23 = *((float *)v22 + 18);
    v25 = v21 * (float)(1.0 / v23);
    v27 = v26 * (float)(1.0 / v23);
    if (indicatorWantsContentCrossfade((_BOOL8)v22, v24) && (v28 = *((_QWORD *)v16->_textIndicator.m_ptr + 10)) != 0)
    {
      v29 = atomic_load(&WebCore::knownColorSpace<&WebCore::sRGBColorSpaceRef>(void)::onceFlag);
      if (v29 != -1)
      {
        v107 = &v103;
        *(_QWORD *)&v97[0] = &v107;
        std::__call_once(&WebCore::knownColorSpace<&WebCore::sRGBColorSpaceRef>(void)::onceFlag, v97, (void (__cdecl *)(void *))std::__call_once_proxy[abi:sn180100]<std::tuple<WebCore::DestinationColorSpace const& WebCore::knownColorSpace<&WebCore::sRGBColorSpaceRef>(void)::{lambda(void)#1} &&>>);
      }
      (*(void (**)(WTF ***__return_ptr, uint64_t, uint64_t *))(*(_QWORD *)v28 + 288))(&v107, v28, &WebCore::knownColorSpace<&WebCore::sRGBColorSpaceRef>(void)::colorSpace);
    }
    else
    {
      v30 = atomic_load(&WebCore::knownColorSpace<&WebCore::sRGBColorSpaceRef>(void)::onceFlag);
      if (v30 != -1)
      {
        v107 = &v103;
        *(_QWORD *)&v97[0] = &v107;
        std::__call_once(&WebCore::knownColorSpace<&WebCore::sRGBColorSpaceRef>(void)::onceFlag, v97, (void (__cdecl *)(void *))std::__call_once_proxy[abi:sn180100]<std::tuple<WebCore::DestinationColorSpace const& WebCore::knownColorSpace<&WebCore::sRGBColorSpaceRef>(void)::{lambda(void)#1} &&>>);
      }
      (*(void (**)(WTF ***__return_ptr, uint64_t, uint64_t *))(*(_QWORD *)v20 + 288))(&v107, v20, &WebCore::knownColorSpace<&WebCore::sRGBColorSpaceRef>(void)::colorSpace);
    }
    v31 = v107;
  }
  else
  {
    v31 = 0;
    v25 = 1.0;
    v27 = 1.0;
  }
  v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  GenericGray = CGColorCreateGenericGray(0.0, 0.35);
  v34 = CGColorCreateGenericGray(0.0, 0.2);
  SRGB = CGColorCreateSRGB(0.96, 0.9, 0.0, 1.0);
  result = (WebTextIndicatorLayer *)CGColorCreateSRGB(0.99, 0.89, 0.22, 1.0);
  v95 = result;
  v96 = v32;
  v37 = v16->_textIndicator.m_ptr;
  v38 = *((unsigned int *)v37 + 17);
  v103 = 0;
  v104 = 0;
  v105 = v38;
  if (!(_DWORD)v38)
  {
LABEL_17:
    v89 = v34;
    v93 = v16;
    v36.n128_u32[0] = 0;
    WebCore::PathUtilities::pathsWithShrinkWrappedRects((uint64_t)&v103, (uint64_t)&v100, v36);
    if (v102)
    {
      v39 = v100;
      v40 = x;
      v41 = y;
      v91 = v41;
      v92 = v40;
      v90 = *MEMORY[0x1E0CD2F78];
      v42 = (char *)v100 + 8;
      for (i = 72 * v102; i; i -= 72)
      {
        v44 = 0.0;
        v45 = 0.0;
        v46 = 0.0;
        v47 = 0.0;
        if (!v39)
          goto LABEL_26;
        v48 = *((_DWORD *)v39 + 16);
        if (v48 == 2)
        {
          v53 = *((_QWORD *)v39 + 1);
          if (!v53)
            goto LABEL_26;
          v49 = (*(float (**)(uint64_t))(*(_QWORD *)v53 + 240))(v53);
        }
        else
        {
          if (v48 != 1)
            goto LABEL_26;
          v49 = WebCore::PathStream::computeBoundingRect((uint64_t)v42, 1);
        }
        v47 = v49;
        v46 = v50;
        v44 = v51;
        v45 = v52;
LABEL_26:
        v109 = 0;
        v97[0] = xmmword_1968C0D70;
        v97[1] = unk_1968C0D80;
        v98 = 0.0 - v47;
        v99 = 0.0 - v46;
        v54 = *((_DWORD *)v39 + 16);
        if (v54 == 2)
        {
          v55 = *((_QWORD *)v39 + 1);
          if (v55 && ((*(uint64_t (**)(uint64_t))(*(_QWORD *)v55 + 200))(v55) & 1) != 0)
            goto LABEL_32;
        }
        else if (!v54)
        {
          goto LABEL_32;
        }
        v56 = (WebCore::PathCG *)WebCore::Path::ensurePlatformPathImpl((WebCore::Path *)&v107);
        v57 = (CGPathRef *)WebCore::Path::ensurePlatformPathImpl(v39);
        WebCore::PathCG::addPath(v56, v57, (const WebCore::AffineTransform *)v97);
LABEL_32:
        v58 = *p_width;
        v59 = p_width[1];
        v60 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
        objc_msgSend(v60, "setDelegate:", +[WebActionDisablingCALayerDelegate shared](WebActionDisablingCALayerDelegate, "shared"));
        v61 = v58;
        v62 = v59;
        objc_msgSend(v60, "setFrame:", (float)((float)(v47 + v92) + v61), (float)((float)(v46 + v91) + v62), v44, v45);
        LODWORD(v63) = 0;
        objc_msgSend(v60, "setOpacity:", v63);
        objc_msgSend(v96, "addObject:", v60);
        v64 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
        objc_msgSend(v64, "setBackgroundColor:", v95);
        objc_msgSend(v64, "setBorderColor:", SRGB);
        objc_msgSend(v64, "setBorderWidth:", 0.0);
        objc_msgSend(v64, "setDelegate:", +[WebActionDisablingCALayerDelegate shared](WebActionDisablingCALayerDelegate, "shared"));
        if (v31)
          objc_msgSend(v64, "setContents:", *(_QWORD *)(*(uint64_t (**)(WTF *))(*(_QWORD *)v31[6] + 16))(v31[6]));
        v65 = v31;
        v66 = objc_alloc_init(MEMORY[0x1E0CD2840]);
        objc_msgSend(v66, "setPath:", WebCore::Path::platformPath((WebCore::Path *)&v107));
        objc_msgSend(v64, "setMask:", v66);
        objc_msgSend(v64, "setContentsRect:", (float)(v47 / v25), (float)(v46 / v27), (float)(v44 / v25), (float)(v45 / v27));
        objc_msgSend(v64, "setContentsGravity:", v90);
        objc_msgSend(v64, "setContentsScale:", *((float *)v93->_textIndicator.m_ptr + 18));
        objc_msgSend(v64, "setFrame:", 0.0, 0.0, v44, v45);
        objc_msgSend(v60, "setValue:forKey:", v64, CFSTR("TextLayer"));
        objc_msgSend(v60, "addSublayer:", v64);
        if (v66)
          CFRelease(v66);
        if (v64)
          CFRelease(v64);
        v31 = v65;
        if (v60)
          CFRelease(v60);
        if (v109 != -1)
          ((void (*)(_OWORD *, uint64_t *))off_1E32D5850[v109])(v97, &v108);
        v39 = (WTF *)((char *)v39 + 72);
        v42 += 72;
      }
    }
    v16 = v93;
    -[WebTextIndicatorLayer setSublayers:](v93, "setSublayers:", v96);
    if (v96)
      CFRetain(v96);
    v68 = v93->_bounceLayers.m_ptr;
    v93->_bounceLayers.m_ptr = v96;
    if (v68)
      CFRelease(v68);
    v69 = v100;
    if (v102)
    {
      v70 = 72 * v102;
      v71 = (_DWORD *)((char *)v100 + 64);
      do
      {
        v72 = *v71;
        if ((_DWORD)v72 != -1)
          ((void (*)(WTF ***, _DWORD *))off_1E32D5850[v72])(&v107, v71 - 14);
        *v71 = -1;
        v71 += 18;
        v70 -= 72;
      }
      while (v70);
      v69 = v100;
    }
    if (v69)
    {
      v100 = 0;
      v101 = 0;
      WTF::fastFree(v69, v67);
    }
    v73 = v103;
    if (v103)
    {
      v103 = 0;
      v104 = 0;
      WTF::fastFree(v73, v67);
      if (!SRGB)
      {
LABEL_57:
        if (!v89)
          goto LABEL_58;
        goto LABEL_67;
      }
    }
    else if (!SRGB)
    {
      goto LABEL_57;
    }
    CFRelease(SRGB);
    if (!v89)
    {
LABEL_58:
      if (!GenericGray)
        goto LABEL_59;
      goto LABEL_68;
    }
LABEL_67:
    CFRelease(v89);
    if (!GenericGray)
    {
LABEL_59:
      if (!v95)
        goto LABEL_60;
      goto LABEL_69;
    }
LABEL_68:
    CFRelease(GenericGray);
    if (!v95)
    {
LABEL_60:
      if (!v96)
        goto LABEL_62;
      goto LABEL_61;
    }
LABEL_69:
    CFRelease(v95);
    if (!v96)
    {
LABEL_62:
      if (!v31)
        return v16;
      v74 = v31[1];
      if (__ldaxr((unsigned __int8 *)v74))
      {
        __clrex();
      }
      else if (!__stxr(1u, (unsigned __int8 *)v74))
      {
        goto LABEL_73;
      }
      MEMORY[0x19AEA534C](v74);
LABEL_73:
      v76 = *((_QWORD *)v74 + 1);
      v77 = v76 - 1;
      *((_QWORD *)v74 + 1) = v76 - 1;
      if (v76 == 1)
      {
        v88 = *((_QWORD *)v74 + 2);
        v78 = *((_QWORD *)v74 + 3);
        *((_QWORD *)v74 + 3) = 0;
        v79 = v88 != 0;
      }
      else
      {
        v78 = 0;
        v79 = 1;
      }
      v80 = __ldxr((unsigned __int8 *)v74);
      if (v80 == 1)
      {
        if (!__stlxr(0, (unsigned __int8 *)v74))
        {
          if (!v77)
            goto LABEL_81;
          return v16;
        }
      }
      else
      {
        __clrex();
      }
      WTF::Lock::unlockSlow(v74);
      if (!v77)
      {
LABEL_81:
        if (v78)
          (*(void (**)(uint64_t))(*(_QWORD *)v78 + 8))(v78);
        if (!v79)
          WTF::fastFree(v74, v67);
      }
      return v16;
    }
LABEL_61:
    CFRelease(v96);
    goto LABEL_62;
  }
  if (!(v38 >> 28))
  {
    v83 = (WTF *)WTF::fastMalloc((WTF *)(16 * v38));
    v104 = v38;
    v103 = v83;
    v84 = *((unsigned int *)v37 + 17);
    if ((_DWORD)v84)
    {
      v85 = (__n128 *)*((_QWORD *)v37 + 7);
      v86 = 16 * v84;
      do
      {
        v87 = *v85++;
        v36 = v87;
        *(__n128 *)v83 = v87;
        v83 = (WTF *)((char *)v83 + 16);
        v86 -= 16;
      }
      while (v86);
    }
    goto LABEL_17;
  }
  __break(0xC471u);
  return result;
}

- (double)_animationDuration
{
  void *v3;
  _BOOL4 v4;
  double result;

  if (!-[WebTextIndicatorLayer indicatorWantsBounce:](self, "indicatorWantsBounce:", self->_textIndicator.m_ptr))
    return 0.15;
  v4 = indicatorWantsContentCrossfade((_BOOL8)self->_textIndicator.m_ptr, v3);
  result = 0.12;
  if (v4)
    return 0.3;
  return result;
}

- (BOOL)hasCompletedAnimation
{
  return self->_hasCompletedAnimation;
}

- (void)present
{
  WebTextIndicatorLayer *v2;
  TextIndicator *m_ptr;
  _BOOL4 v4;
  void *v5;
  _BOOL4 v6;
  unsigned int v7;
  BOOL v8;
  int v9;
  int v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  _OWORD *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  void *v26;
  void *v27;
  void *v28;
  _DWORD *v29;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  BOOL v40;
  int v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t i;
  void *v48;
  double v49;
  uint64_t j;
  void *v51;
  double v52;
  uint64_t k;
  void *v54;
  double v55;
  uint64_t m;
  void *v57;
  double v58;
  void *v59;
  WTF *v60;
  void *v61;
  uint64_t v62;
  CFTypeRef cf;
  int v64;
  WebTextIndicatorLayer *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _OWORD v70[8];
  CATransform3D v71;
  _OWORD v72[8];
  _BYTE v73[128];
  _QWORD v74[5];

  v2 = self;
  v74[3] = *MEMORY[0x1E0C80C00];
  m_ptr = self->_textIndicator.m_ptr;
  if (m_ptr)
    ++*(_DWORD *)m_ptr;
  v4 = -[WebTextIndicatorLayer indicatorWantsBounce:](self, "indicatorWantsBounce:", m_ptr);
  v6 = indicatorWantsContentCrossfade((_BOOL8)m_ptr, v5);
  v7 = *((unsigned __int8 *)m_ptr + 112);
  v8 = v7 >= 4;
  v9 = v7 & 0xF;
  v11 = !v8 && v9 == 3;
  v64 = v11;
  -[WebTextIndicatorLayer _animationDuration](v2, "_animationDuration");
  v13 = v12;
  v2->_hasCompletedAnimation = 0;
  if (v4)
  {
    v14 = (void *)objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform"));
    v15 = v14;
    if (v14)
      CFRetain(v14);
    v16 = (_OWORD *)MEMORY[0x1E0CD2610];
    v17 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    v72[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    v72[5] = v17;
    v18 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    v72[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    v72[7] = v18;
    v19 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    v72[0] = *MEMORY[0x1E0CD2610];
    v72[1] = v19;
    v20 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    v72[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    v72[3] = v20;
    v74[0] = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", v72);
    v21 = (void *)MEMORY[0x1E0CB3B18];
    CATransform3DMakeScale(&v71, 1.25, 1.25, 1.0);
    v74[1] = objc_msgSend(v21, "valueWithCATransform3D:", &v71);
    v22 = v16[5];
    v70[4] = v16[4];
    v70[5] = v22;
    v23 = v16[7];
    v70[6] = v16[6];
    v70[7] = v23;
    v24 = v16[1];
    v70[0] = *v16;
    v70[1] = v24;
    v25 = v16[3];
    v70[2] = v16[2];
    v70[3] = v25;
    v74[2] = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", v70);
    objc_msgSend(v15, "setValues:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 3));
    objc_msgSend(v15, "setDuration:", v13);
  }
  else if (v64)
  {
    v26 = (void *)objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
    v15 = v26;
    if (v26)
      CFRetain(v26);
    objc_msgSend(v15, "setFromValue:", &unk_1E349D798);
    objc_msgSend(v15, "setToValue:", &unk_1E349D780);
    objc_msgSend(v15, "setFillMode:", *MEMORY[0x1E0CD2B60]);
    objc_msgSend(v15, "setRemovedOnCompletion:", 0);
    objc_msgSend(v15, "setDuration:", v13);
  }
  else
  {
    v15 = 0;
  }
  v65 = v2;
  if (!v6)
  {
    cf = 0;
    v36 = 0;
    goto LABEL_48;
  }
  v27 = (void *)objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("contents"));
  v28 = v27;
  if (v27)
    CFRetain(v27);
  v29 = (_DWORD *)*((_QWORD *)m_ptr + 12);
  if (v29)
    ++v29[2];
  v30 = atomic_load(&WebCore::knownColorSpace<&WebCore::sRGBColorSpaceRef>(void)::onceFlag);
  if (v30 != -1)
  {
    *(_QWORD *)&v72[0] = v74;
    *(_QWORD *)&v71.m11 = v72;
    std::__call_once(&WebCore::knownColorSpace<&WebCore::sRGBColorSpaceRef>(void)::onceFlag, &v71, (void (__cdecl *)(void *))std::__call_once_proxy[abi:sn180100]<std::tuple<WebCore::DestinationColorSpace const& WebCore::knownColorSpace<&WebCore::sRGBColorSpaceRef>(void)::{lambda(void)#1} &&>>);
  }
  (*(void (**)(_OWORD *__return_ptr, _DWORD *, uint64_t *))(*(_QWORD *)v29 + 288))(v70, v29, &WebCore::knownColorSpace<&WebCore::sRGBColorSpaceRef>(void)::colorSpace);
  if (v29[2] == 1)
    (*(void (**)(_DWORD *))(*(_QWORD *)v29 + 8))(v29);
  else
    --v29[2];
  objc_msgSend(v28, "setToValue:", *(_QWORD *)(*(uint64_t (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)&v70[0] + 48) + 16))(*(_QWORD *)(*(_QWORD *)&v70[0] + 48)));
  v31 = *MEMORY[0x1E0CD2B60];
  objc_msgSend(v28, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v28, "setRemovedOnCompletion:", 0);
  objc_msgSend(v28, "setDuration:", v13);
  cf = v28;
  v33 = *(_QWORD *)&v70[0];
  *(_QWORD *)&v70[0] = 0;
  if (!v33)
    goto LABEL_45;
  v34 = *(_QWORD *)(v33 + 8);
  if (__ldaxr((unsigned __int8 *)v34))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v34))
  {
    goto LABEL_33;
  }
  MEMORY[0x19AEA534C](v34);
LABEL_33:
  v37 = *(_QWORD *)(v34 + 8);
  v38 = v37 - 1;
  *(_QWORD *)(v34 + 8) = v37 - 1;
  if (v37 == 1)
  {
    v62 = *(_QWORD *)(v34 + 16);
    v39 = *(_QWORD *)(v34 + 24);
    *(_QWORD *)(v34 + 24) = 0;
    v40 = v62 != 0;
  }
  else
  {
    v39 = 0;
    v40 = 1;
  }
  v41 = __ldxr((unsigned __int8 *)v34);
  if (v41 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)v34))
    {
      if (!v38)
        goto LABEL_41;
      goto LABEL_45;
    }
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)v34);
  if (!v38)
  {
LABEL_41:
    if (v39)
      (*(void (**)(uint64_t))(*(_QWORD *)v39 + 8))(v39);
    if (!v40)
      WTF::fastFree((WTF *)v34, v32);
  }
LABEL_45:
  v42 = (void *)objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("shadowOpacity"));
  v36 = v42;
  if (v42)
    CFRetain(v42);
  objc_msgSend(v36, "setFromValue:", &unk_1E349D798);
  v2 = v65;
  objc_msgSend(v36, "setToValue:", &unk_1E349D780);
  objc_msgSend(v36, "setFillMode:", v31);
  objc_msgSend(v36, "setRemovedOnCompletion:", 0);
  objc_msgSend(v36, "setDuration:", v13);
LABEL_48:
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v43 = v2->_bounceLayers.m_ptr;
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
  if (v44)
  {
    v45 = *(_QWORD *)v67;
    if (v6)
    {
      do
      {
        v46 = v43;
        for (i = 0; i != v44; ++i)
        {
          if (*(_QWORD *)v67 != v45)
            objc_enumerationMutation(v46);
          v48 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
          if (-[WebTextIndicatorLayer indicatorWantsManualAnimation:](v65, "indicatorWantsManualAnimation:", m_ptr))
          {
            LODWORD(v49) = 0;
            objc_msgSend(v48, "setSpeed:", v49);
          }
          if ((v64 & 1) == 0)
          {
            LODWORD(v49) = 1.0;
            objc_msgSend(v48, "setOpacity:", v49);
          }
          if (v15)
            objc_msgSend(v48, "addAnimation:forKey:", v15, CFSTR("presentation"));
          objc_msgSend((id)objc_msgSend(v48, "valueForKey:", CFSTR("TextLayer")), "addAnimation:forKey:", cf, CFSTR("contentTransition"));
          objc_msgSend((id)objc_msgSend(v48, "valueForKey:", CFSTR("DropShadowLayer")), "addAnimation:forKey:", v36, CFSTR("fadeShadowIn"));
          objc_msgSend((id)objc_msgSend(v48, "valueForKey:", CFSTR("RimShadowLayer")), "addAnimation:forKey:", v36, CFSTR("fadeShadowIn"));
        }
        v43 = v46;
        v44 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
      }
      while (v44);
    }
    else if (v15)
    {
      do
      {
        for (j = 0; j != v44; ++j)
        {
          if (*(_QWORD *)v67 != v45)
            objc_enumerationMutation(v43);
          v51 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * j);
          if (-[WebTextIndicatorLayer indicatorWantsManualAnimation:](v65, "indicatorWantsManualAnimation:", m_ptr))
          {
            LODWORD(v52) = 0;
            objc_msgSend(v51, "setSpeed:", v52);
          }
          if ((v64 & 1) == 0)
          {
            LODWORD(v52) = 1.0;
            objc_msgSend(v51, "setOpacity:", v52);
          }
          objc_msgSend(v51, "addAnimation:forKey:", v15, CFSTR("presentation"));
        }
        v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
      }
      while (v44);
    }
    else if ((v64 & 1) != 0)
    {
      do
      {
        for (k = 0; k != v44; ++k)
        {
          if (*(_QWORD *)v67 != v45)
            objc_enumerationMutation(v43);
          v54 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * k);
          if (-[WebTextIndicatorLayer indicatorWantsManualAnimation:](v65, "indicatorWantsManualAnimation:", m_ptr))
          {
            LODWORD(v55) = 0;
            objc_msgSend(v54, "setSpeed:", v55);
          }
        }
        v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
      }
      while (v44);
    }
    else
    {
      do
      {
        for (m = 0; m != v44; ++m)
        {
          if (*(_QWORD *)v67 != v45)
            objc_enumerationMutation(v43);
          v57 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * m);
          if (-[WebTextIndicatorLayer indicatorWantsManualAnimation:](v65, "indicatorWantsManualAnimation:", m_ptr))
          {
            LODWORD(v58) = 0;
            objc_msgSend(v57, "setSpeed:", v58);
          }
          LODWORD(v58) = 1.0;
          objc_msgSend(v57, "setOpacity:", v58);
        }
        v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
      }
      while (v44);
    }
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  if (v36)
    CFRelease(v36);
  if (cf)
    CFRelease(cf);
  if (v15)
    CFRelease(v15);
  if (*(_DWORD *)m_ptr == 1)
  {
    WebCore::TextIndicator::~TextIndicator((WebCore::TextIndicator *)m_ptr, v59);
    WTF::fastFree(v60, v61);
  }
  else
  {
    --*(_DWORD *)m_ptr;
  }
}

- (void)hideWithCompletionHandler:(id)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v6 = v5;
  if (v5)
    CFRetain(v5);
  objc_msgSend(v6, "setFromValue:", &unk_1E349D780);
  objc_msgSend(v6, "setToValue:", &unk_1E349D798);
  objc_msgSend(v6, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v6, "setRemovedOnCompletion:", 0);
  objc_msgSend(v6, "setDuration:", 0.3);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", a3);
  -[WebTextIndicatorLayer addAnimation:forKey:](self, "addAnimation:forKey:", v6, CFSTR("fadeOut"));
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  if (v6)
    CFRelease(v6);
}

- (void)setAnimationProgress:(float)a3
{
  void *m_ptr;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t j;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!self->_hasCompletedAnimation)
  {
    if (a3 == 1.0)
    {
      self->_hasCompletedAnimation = 1;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      m_ptr = self->_bounceLayers.m_ptr;
      v6 = objc_msgSend(m_ptr, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v27 != v8)
              objc_enumerationMutation(m_ptr);
            v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
            objc_msgSend(v10, "timeOffset");
            v12 = v11;
            LODWORD(v11) = 1.0;
            objc_msgSend(v10, "setSpeed:", v11);
            objc_msgSend(v10, "convertTime:fromLayer:", 0, CACurrentMediaTime());
            objc_msgSend(v10, "setBeginTime:", v13 - v12);
          }
          v7 = objc_msgSend(m_ptr, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        }
        while (v7);
      }
    }
    else
    {
      -[WebTextIndicatorLayer _animationDuration](self, "_animationDuration");
      v15 = v14;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v16 = self->_bounceLayers.m_ptr;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v23;
        v20 = v15 * a3;
        do
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v23 != v19)
              objc_enumerationMutation(v16);
            objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "setTimeOffset:", v20);
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        }
        while (v18);
      }
    }
  }
}

- (BOOL)isFadingOut
{
  return self->_fadingOut;
}

- (void)setFadingOut:(BOOL)a3
{
  self->_fadingOut = a3;
}

- (void).cxx_destruct
{
  void *m_ptr;
  TextIndicator *v4;
  WTF *v5;
  void *v6;

  m_ptr = self->_bounceLayers.m_ptr;
  self->_bounceLayers.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_textIndicator.m_ptr;
  self->_textIndicator.m_ptr = 0;
  if (v4)
  {
    if (*(_DWORD *)v4 == 1)
    {
      WebCore::TextIndicator::~TextIndicator((WebCore::TextIndicator *)v4, (void *)a2);
      WTF::fastFree(v5, v6);
    }
    else
    {
      --*(_DWORD *)v4;
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  return self;
}

@end

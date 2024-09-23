@implementation WebFixedPositionContent

- (WebFixedPositionContent)initWithWebView:(id)a3
{
  WebFixedPositionContent *v4;
  _QWORD *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WebFixedPositionContent;
  v4 = -[WebFixedPositionContent init](&v7, sel_init);
  if (v4)
  {
    v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v5 = a3;
    v5[1] = 0;
    v4->_private = v5;
  }
  return v4;
}

- (void)dealloc
{
  WTF *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const void *v7;
  WTF *v8;
  uint64_t v9;
  objc_super v10;

  v3 = (WTF *)self->_private;
  if (v3)
  {
    v4 = *((_QWORD *)v3 + 1);
    if (v4)
    {
      v5 = *(unsigned int *)(v4 - 4);
      if ((_DWORD)v5)
      {
        v6 = *((_QWORD *)v3 + 1);
        do
        {
          v7 = *(const void **)v6;
          if (*(_QWORD *)v6 != -1)
          {
            v8 = *(WTF **)(v6 + 8);
            *(_QWORD *)(v6 + 8) = 0;
            if (v8)
            {
              v9 = *((_QWORD *)v8 + 1);
              *((_QWORD *)v8 + 1) = 0;
              if (v9)
                (*(void (**)(uint64_t, SEL))(*(_QWORD *)v9 + 8))(v9, a2);
              WTF::fastFree(v8, (void *)a2);
              v7 = *(const void **)v6;
            }
            *(_QWORD *)v6 = 0;
            if (v7)
              CFRelease(v7);
          }
          v6 += 16;
          --v5;
        }
        while (v5);
      }
      WTF::fastFree((WTF *)(v4 - 16), (void *)a2);
    }
    WTF::fastFree(v3, (void *)a2);
  }
  v10.receiver = self;
  v10.super_class = (Class)WebFixedPositionContent;
  -[WebFixedPositionContent dealloc](&v10, sel_dealloc);
}

- (void)scrollOrZoomChanged:(CGRect)a3
{
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  int v9;
  void *v10;
  float *v11;
  int v12;
  float v13;
  float v14;
  float v15;
  float v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  float v23;
  float v24;
  float v25;
  float v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  _QWORD *v33;
  _BYTE v34[16];
  CGRect v35;

  v35 = a3;
  if (__ldaxr(webFixedPositionContentDataLock))
  {
    __clrex();
LABEL_4:
    MEMORY[0x1D82A3914](webFixedPositionContentDataLock, a2);
    goto LABEL_5;
  }
  if (__stxr(1u, webFixedPositionContentDataLock))
    goto LABEL_4;
LABEL_5:
  v5 = (_QWORD *)*((_QWORD *)self->_private + 1);
  if (v5)
  {
    v6 = *((unsigned int *)v5 - 1);
    v7 = &v5[2 * v6];
    if (*((_DWORD *)v5 - 3))
    {
      if ((_DWORD)v6)
      {
        v8 = 16 * v6;
        while ((unint64_t)(*v5 + 1) <= 1)
        {
          v5 += 2;
          v8 -= 16;
          if (!v8)
          {
            v5 = v7;
            break;
          }
        }
      }
      while (v5 != v7)
      {
        v10 = (void *)*v5;
        v11 = *(float **)(v5[1] + 8);
        v12 = (*(uint64_t (**)(float *, SEL))(*(_QWORD *)v11 + 16))(v11, a2);
        if (v12)
        {
          if (v12 == 1)
          {
            WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v34, &v35);
            WebCore::StickyPositionViewportConstraints::layerPositionForConstrainingRect((WebCore::StickyPositionViewportConstraints *)v11, (const WebCore::FloatRect *)v34);
            v14 = v13;
            v16 = v15;
            objc_msgSend(v10, "bounds");
            v18 = v17;
            v20 = v19;
            objc_msgSend(v10, "anchorPoint");
            objc_msgSend(v10, "setPosition:", (float)(v14 - v11[2]) + v21 * v18, (float)(v16 - v11[3]) + v22 * v20);
          }
        }
        else
        {
          WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v34, &v35);
          WebCore::FixedPositionViewportConstraints::layerPositionForViewportRect((WebCore::FixedPositionViewportConstraints *)v11, (const WebCore::FloatRect *)v34);
          v24 = v23;
          v26 = v25;
          objc_msgSend(v10, "bounds");
          v28 = v27;
          v30 = v29;
          objc_msgSend(v10, "anchorPoint");
          objc_msgSend(v10, "setPosition:", (float)(v24 - v11[2]) + v31 * v28, (float)(v26 - v11[3]) + v32 * v30);
        }
        v33 = v5 + 2;
        v5 = v7;
        if (v33 != v7)
        {
          v5 = v33;
          while ((unint64_t)(*v5 + 1) <= 1)
          {
            v5 += 2;
            if (v5 == v7)
            {
              v5 = v7;
              break;
            }
          }
        }
      }
    }
  }
  v9 = __ldxr(webFixedPositionContentDataLock);
  if (v9 != 1)
  {
    __clrex();
    goto LABEL_27;
  }
  if (__stlxr(0, webFixedPositionContentDataLock))
LABEL_27:
    WTF::Lock::unlockSlow((WTF::Lock *)webFixedPositionContentDataLock);
}

- (void)overflowScrollPositionForLayer:(id)a3 changedTo:(CGPoint)a4
{
  double y;
  double x;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  float v13;
  float v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  float v18;
  float v19;
  float v20;
  float v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  _QWORD *v28;
  int v29;
  _DWORD v30[2];
  uint64_t v31;

  y = a4.y;
  x = a4.x;
  if (__ldaxr(webFixedPositionContentDataLock))
  {
    __clrex();
LABEL_4:
    MEMORY[0x1D82A3914](webFixedPositionContentDataLock, a2);
    goto LABEL_5;
  }
  if (__stxr(1u, webFixedPositionContentDataLock))
    goto LABEL_4;
LABEL_5:
  v9 = (_QWORD *)*((_QWORD *)self->_private + 1);
  if (v9)
  {
    v10 = *((unsigned int *)v9 - 1);
    v11 = &v9[2 * v10];
    if (*((_DWORD *)v9 - 3))
    {
      if ((_DWORD)v10)
      {
        v12 = 16 * v10;
        while ((unint64_t)(*v9 + 1) <= 1)
        {
          v9 += 2;
          v12 -= 16;
          if (!v12)
          {
            v9 = v11;
            break;
          }
        }
      }
      if (v11 != v9)
      {
        v13 = x;
        v14 = y;
        do
        {
          v15 = v9[1];
          if (*(id *)v15 == a3)
          {
            v16 = (void *)*v9;
            v17 = *(_QWORD *)(v15 + 8);
            *(float *)v30 = v13;
            *(float *)&v30[1] = v14;
            v31 = *(_QWORD *)(v17 + 44);
            WebCore::StickyPositionViewportConstraints::layerPositionForConstrainingRect((WebCore::StickyPositionViewportConstraints *)v17, (const WebCore::FloatRect *)v30);
            v19 = v18;
            v21 = v20;
            objc_msgSend(v16, "bounds");
            v23 = v22;
            v25 = v24;
            objc_msgSend(v16, "anchorPoint");
            objc_msgSend(v16, "setPosition:", (float)(v19 - *(float *)(v17 + 8)) + v26 * v23, (float)(v21 - *(float *)(v17 + 12)) + v27 * v25);
          }
          v28 = v9 + 2;
          v9 = v11;
          if (v28 != v11)
          {
            v9 = v28;
            while ((unint64_t)(*v9 + 1) <= 1)
            {
              v9 += 2;
              if (v9 == v11)
              {
                v9 = v11;
                break;
              }
            }
          }
        }
        while (v9 != v11);
      }
    }
  }
  v29 = __ldxr(webFixedPositionContentDataLock);
  if (v29 != 1)
  {
    __clrex();
    goto LABEL_29;
  }
  if (__stlxr(0, webFixedPositionContentDataLock))
LABEL_29:
    WTF::Lock::unlockSlow((WTF::Lock *)webFixedPositionContentDataLock);
}

- (void)didFinishScrollingOrZooming
{
  WebThreadRun();
}

uint64_t __54__WebFixedPositionContent_didFinishScrollingOrZooming__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(**(id **)(*(_QWORD *)(a1 + 32) + 8), "_mainCoreFrame");
  if (result)
    return WebCore::LocalFrame::viewportOffsetChanged();
  return result;
}

- (void)setViewportConstrainedLayers:(void *)a3 stickyContainerMap:(const void *)a4
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  WTF *v13;
  uint64_t v14;
  const void **v15;
  uint64_t v16;
  const void **v17;
  const void **v18;
  uint64_t v19;
  const void **v20;
  const void *v21;
  _QWORD *v22;
  void *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  const void *v31;
  int v32;
  const void *v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  int v39;
  unint64_t v40;
  unint64_t v41;
  unsigned int v42;
  _QWORD *v43;
  const void *v44;
  _QWORD *v45;
  int v46;
  WTF *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unsigned int v52;
  WTF *v53;
  uint64_t v54;
  const void **v55;
  const void *v56;
  int v57;
  _QWORD *v58;

  if (__ldaxr(webFixedPositionContentDataLock))
  {
    __clrex();
  }
  else if (!__stxr(1u, webFixedPositionContentDataLock))
  {
    goto LABEL_5;
  }
  MEMORY[0x1D82A3914](webFixedPositionContentDataLock, a2);
LABEL_5:
  v8 = self->_private;
  v9 = v8[1];
  if (v9)
  {
    v8[1] = 0;
    v10 = *(unsigned int *)(v9 - 4);
    if ((_DWORD)v10)
    {
      v11 = v9;
      do
      {
        v12 = *(const void **)v11;
        if (*(_QWORD *)v11 != -1)
        {
          v13 = *(WTF **)(v11 + 8);
          *(_QWORD *)(v11 + 8) = 0;
          if (v13)
          {
            v14 = *((_QWORD *)v13 + 1);
            *((_QWORD *)v13 + 1) = 0;
            if (v14)
              (*(void (**)(uint64_t, SEL))(*(_QWORD *)v14 + 8))(v14, a2);
            WTF::fastFree(v13, (void *)a2);
            v12 = *(const void **)v11;
          }
          *(_QWORD *)v11 = 0;
          if (v12)
            CFRelease(v12);
        }
        v11 += 16;
        --v10;
      }
      while (v10);
    }
    WTF::fastFree((WTF *)(v9 - 16), (void *)a2);
  }
  v15 = *(const void ***)a3;
  if (!*(_QWORD *)a3)
  {
    v18 = 0;
    v17 = 0;
    goto LABEL_26;
  }
  v16 = *((unsigned int *)v15 - 1);
  v17 = &v15[2 * v16];
  if (!*((_DWORD *)v15 - 3))
  {
    v18 = &v15[2 * v16];
    v17 = v18;
    if (!v15)
      goto LABEL_30;
LABEL_27:
    v20 = &v15[2 * *((unsigned int *)v15 - 1)];
    if (v20 != v18)
      goto LABEL_33;
    goto LABEL_83;
  }
  v18 = *(const void ***)a3;
  if (!(_DWORD)v16)
  {
LABEL_26:
    if (!v15)
      goto LABEL_30;
    goto LABEL_27;
  }
  v19 = 16 * v16;
  v18 = *(const void ***)a3;
  do
  {
    if ((unint64_t)*v18 + 1 > 1)
      goto LABEL_26;
    v18 += 2;
    v19 -= 16;
  }
  while (v19);
  v18 = v17;
  if (v15)
    goto LABEL_27;
LABEL_30:
  v20 = 0;
  if (v18)
  {
    while (1)
    {
LABEL_33:
      v21 = *v18;
      v22 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
      v24 = v22;
      *v22 = 0;
      v22[1] = 0;
      v58 = v22;
      v25 = *(_QWORD *)a4;
      v26 = ~((_QWORD)v21 << 32);
      if (!*(_QWORD *)a4)
        goto LABEL_39;
      v27 = *(_DWORD *)(v25 - 8);
      v28 = (((unint64_t)v21 + v26) ^ (((unint64_t)v21 + v26) >> 22))
          + ~((((unint64_t)v21 + v26) ^ (((unint64_t)v21 + v26) >> 22)) << 13);
      v29 = (9 * (v28 ^ (v28 >> 8))) ^ ((9 * (v28 ^ (v28 >> 8))) >> 15);
      v30 = v27 & (((v29 + ~(v29 << 27)) >> 31) ^ ((_DWORD)v29 + ~((_DWORD)v29 << 27)));
      v31 = *(const void **)(v25 + 16 * v30);
      if (v31 == v21)
        break;
      v32 = 1;
      while (v31)
      {
        v30 = ((_DWORD)v30 + v32) & v27;
        v31 = *(const void **)(v25 + 16 * v30);
        ++v32;
        if (v31 == v21)
          goto LABEL_38;
      }
      v56 = v18[1];
      v18[1] = 0;
      v34 = v22[1];
      *v24 = 0;
      v24[1] = v56;
      if (v34)
        goto LABEL_40;
LABEL_41:
      v35 = self->_private;
      if (v21)
        CFRetain(v21);
      v38 = v35[1];
      v37 = v35 + 1;
      v36 = v38;
      if (v38
        || (WTF::HashTable<WTF::RetainPtr<CALayer>,WTF::KeyValuePair<WTF::RetainPtr<CALayer>,std::unique_ptr<ViewportConstrainedLayerData>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::RetainPtr<CALayer>,std::unique_ptr<ViewportConstrainedLayerData>>>,WTF::DefaultHash<WTF::RetainPtr<CALayer>>,WTF::HashMap<WTF::RetainPtr<CALayer>,std::unique_ptr<ViewportConstrainedLayerData>,WTF::DefaultHash<WTF::RetainPtr<CALayer>>,WTF::HashTraits<WTF::RetainPtr<CALayer>>,WTF::HashTraits<std::unique_ptr<ViewportConstrainedLayerData>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::RetainPtr<CALayer>>>::rehash(v37, 8u), (v36 = *v37) != 0))
      {
        v39 = *(_DWORD *)(v36 - 8);
      }
      else
      {
        v39 = 0;
      }
      v40 = (((unint64_t)v21 + v26) ^ (((unint64_t)v21 + v26) >> 22))
          + ~((((unint64_t)v21 + v26) ^ (((unint64_t)v21 + v26) >> 22)) << 13);
      v41 = (9 * (v40 ^ (v40 >> 8))) ^ ((9 * (v40 ^ (v40 >> 8))) >> 15);
      v42 = v39 & (((v41 + ~(v41 << 27)) >> 31) ^ (v41 + ~((_DWORD)v41 << 27)));
      v43 = (_QWORD *)(v36 + 16 * v42);
      v44 = (const void *)*v43;
      if (*v43)
      {
        v45 = 0;
        v46 = 1;
        while (v44 != v21)
        {
          if (v44 == (const void *)-1)
            v45 = v43;
          v42 = (v42 + v46) & v39;
          v43 = (_QWORD *)(v36 + 16 * v42);
          v44 = (const void *)*v43;
          ++v46;
          if (!*v43)
          {
            if (v45)
            {
              *v45 = 0;
              v45[1] = 0;
              --*(_DWORD *)(*v37 - 16);
              v43 = v45;
            }
            goto LABEL_54;
          }
        }
        v53 = (WTF *)v43[1];
        v43[1] = v24;
        if (v53)
        {
          v54 = *((_QWORD *)v53 + 1);
          *((_QWORD *)v53 + 1) = 0;
          if (v54)
            (*(void (**)(uint64_t))(*(_QWORD *)v54 + 8))(v54);
          WTF::fastFree(v53, v23);
        }
        if (v21)
          CFRelease(v21);
        goto LABEL_75;
      }
LABEL_54:
      *v43 = v21;
      v47 = (WTF *)v43[1];
      v43[1] = v58;
      if (v47)
      {
        v48 = *((_QWORD *)v47 + 1);
        *((_QWORD *)v47 + 1) = 0;
        if (v48)
          (*(void (**)(uint64_t))(*(_QWORD *)v48 + 8))(v48);
        WTF::fastFree(v47, v23);
      }
      if (*v37)
      {
        ++*(_DWORD *)(*v37 - 12);
        v49 = *v37;
        if (*v37)
          goto LABEL_60;
      }
      else
      {
        MEMORY[0xFFFFFFFFFFFFFFF4] = 1;
        v49 = *v37;
        if (*v37)
        {
LABEL_60:
          v50 = (*(_DWORD *)(v49 - 16) + *(_DWORD *)(v49 - 12));
          v51 = *(unsigned int *)(v49 - 4);
          if (v51 > 0x400)
            goto LABEL_72;
          goto LABEL_61;
        }
      }
      v50 = *(unsigned int *)(v49 - 16);
      v51 = *(unsigned int *)(v49 - 4);
      if (v51 > 0x400)
      {
LABEL_72:
        if (v51 <= 2 * v50)
          goto LABEL_73;
        goto LABEL_75;
      }
LABEL_61:
      if (3 * v51 <= 4 * v50)
      {
        if ((_DWORD)v51)
LABEL_73:
          v52 = (_DWORD)v51 << (6 * *(_DWORD *)(v49 - 12) >= (2 * v51));
        else
          v52 = 8;
        WTF::HashTable<WTF::RetainPtr<CALayer>,WTF::KeyValuePair<WTF::RetainPtr<CALayer>,std::unique_ptr<ViewportConstrainedLayerData>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::RetainPtr<CALayer>,std::unique_ptr<ViewportConstrainedLayerData>>>,WTF::DefaultHash<WTF::RetainPtr<CALayer>>,WTF::HashMap<WTF::RetainPtr<CALayer>,std::unique_ptr<ViewportConstrainedLayerData>,WTF::DefaultHash<WTF::RetainPtr<CALayer>>,WTF::HashTraits<WTF::RetainPtr<CALayer>>,WTF::HashTraits<std::unique_ptr<ViewportConstrainedLayerData>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::RetainPtr<CALayer>>>::rehash(v37, v52);
      }
LABEL_75:
      v55 = v18 + 2;
      v18 = v17;
      if (v55 != v17)
      {
        v18 = v55;
        while ((unint64_t)*v18 + 1 <= 1)
        {
          v18 += 2;
          if (v18 == v17)
          {
            v18 = v17;
            break;
          }
        }
      }
      if (v18 == v20)
        goto LABEL_83;
    }
LABEL_38:
    v25 = *(_QWORD *)(v25 + 16 * v30 + 8);
LABEL_39:
    v33 = v18[1];
    v18[1] = 0;
    v34 = v22[1];
    *v24 = v25;
    v24[1] = v33;
    if (!v34)
      goto LABEL_41;
LABEL_40:
    (*(void (**)(uint64_t))(*(_QWORD *)v34 + 8))(v34);
    goto LABEL_41;
  }
LABEL_83:
  v57 = __ldxr(webFixedPositionContentDataLock);
  if (v57 != 1)
  {
    __clrex();
    goto LABEL_87;
  }
  if (__stlxr(0, webFixedPositionContentDataLock))
LABEL_87:
    WTF::Lock::unlockSlow((WTF::Lock *)webFixedPositionContentDataLock);
}

- (BOOL)hasFixedOrStickyPositionLayers
{
  uint64_t v4;
  BOOL v5;
  int v6;
  int v8;

  if (__ldaxr(webFixedPositionContentDataLock))
  {
    __clrex();
  }
  else if (!__stxr(1u, webFixedPositionContentDataLock))
  {
    goto LABEL_5;
  }
  MEMORY[0x1D82A3914](webFixedPositionContentDataLock, a2);
LABEL_5:
  v4 = *((_QWORD *)self->_private + 1);
  if (v4)
  {
    v5 = *(_DWORD *)(v4 - 12) != 0;
    v6 = __ldxr(webFixedPositionContentDataLock);
    if (v6 == 1)
      goto LABEL_7;
LABEL_10:
    __clrex();
    goto LABEL_11;
  }
  v5 = 0;
  v8 = __ldxr(webFixedPositionContentDataLock);
  if (v8 != 1)
    goto LABEL_10;
LABEL_7:
  if (!__stlxr(0, webFixedPositionContentDataLock))
    return v5;
LABEL_11:
  WTF::Lock::unlockSlow((WTF::Lock *)webFixedPositionContentDataLock);
  return v5;
}

@end

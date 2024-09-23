@implementation RBDrawable

- (RBDrawable)initWithDevice:(id)a3
{
  RBDrawable *v4;
  RBDrawable *v5;
  id v6;
  RB::Drawable *v7;
  unsigned int *v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)RBDrawable;
  v4 = -[RBDrawable init](&v13, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = (id)*((_QWORD *)v4 + 5);
    if (v6 != a3)
    {

      *((_QWORD *)v5 + 5) = a3;
    }
    *((_QWORD *)v5 + 9) = 0x3FF0000000000000;
    v7 = (RB::Drawable *)operator new();
    RB::Drawable::Drawable(v7, 3u);
    v8 = (unsigned int *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v7;
    if (v8)
    {
      v9 = v8 + 2;
      do
      {
        v10 = __ldxr(v9);
        v11 = v10 - 1;
      }
      while (__stlxr(v11, v9));
      if (!v11)
      {
        __dmb(9u);
        (*(void (**)(unsigned int *))(*(_QWORD *)v8 + 8))(v8);
      }
    }
    *((_QWORD *)v5 + 10) = 0;
    *((_DWORD *)v5 + 16) = 2;
    *((_QWORD *)v5 + 14) = 0;
    *((_QWORD *)v5 + 15) = 0;
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v3;
  objc_super v4;

  v3 = *((_QWORD *)self + 1);
  if (v3)
    RB::Drawable::set_delegate(v3, 0);
  v4.receiver = self;
  v4.super_class = (Class)RBDrawable;
  -[RBDrawable dealloc](&v4, sel_dealloc);
}

- (RBDevice)device
{
  return (RBDevice *)*((_QWORD *)self + 5);
}

- (RBDrawableDelegate)delegate
{
  RBDrawableDelegate *v2;

  v2 = (RBDrawableDelegate *)objc_loadWeakRetained((id *)self + 4);

  return v2;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeakOrNil((id *)self + 4, a3);
}

- (MTLTexture)texture
{
  return (MTLTexture *)*((_QWORD *)self + 6);
}

- (void)setTexture:(id)a3
{
  id v4;

  v4 = (id)*((_QWORD *)self + 6);
  if (v4 != a3)
  {

    *((_QWORD *)self + 6) = a3;
  }
}

- (MTLEvent)event
{
  return (MTLEvent *)*((_QWORD *)self + 7);
}

- (void)setEvent:(id)a3
{
  id v4;

  v4 = (id)*((_QWORD *)self + 7);
  if (v4 != a3)
  {

    *((_QWORD *)self + 7) = a3;
  }
}

- (void)renderDisplayList:(id)a3 flags:(unsigned int)a4
{
  _QWORD v4[3];
  _QWORD v5[2];
  uint64x2_t v6;

  memset(v4, 0, sizeof(v4));
  v5[0] = 0;
  v5[1] = 0;
  v6 = vcvtq_u64_f64(*((float64x2_t *)self + 6));
  -[RBDrawable renderDisplayList:sourceRect:destinationOffset:flags:](self, "renderDisplayList:sourceRect:destinationOffset:flags:", a3, v5, v4, *(_QWORD *)&a4);
}

- (void)renderDisplayList:(id)a3 sourceRect:(id *)a4 destinationOffset:(id *)a5 flags:(unsigned int)a6
{
  float32x4_t v6;
  unsigned int v7;
  MTLPixelFormat v8;
  uint64_t v13;
  int32x2_t v14;
  uint32x2_t v15;
  const RB::DisplayList::Contents *v16;
  int32x2_t v17;
  int32x2_t v18;
  uint32x2_t v19;
  int8x8_t v20;
  const char *v21;
  unsigned int *v22;
  float32x4_t v23;
  unsigned int *v24;
  unsigned int v25;
  unsigned int v26;
  float v27;
  float32x4_t v28;
  unsigned int *v29;
  float32x2_t v30[5];
  unsigned int v31;
  float32x4_t v32;
  RB::DisplayList::State *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v7 = *((_DWORD *)self + 16);
  if (v7 >= 3)
    abort();
  v8 = *(_QWORD *)&a6;
  v6.i64[0] = *((_QWORD *)self + 14);
  v6.i32[2] = *((_DWORD *)self + 30);
  v28 = v6;
  v27 = *((float *)self + 31);
  v13 = objc_msgSend(a3, "_rb_contents");
  if (v13)
  {
    v14 = vmovn_s64(*(int64x2_t *)&a4->var2);
    v15 = (uint32x2_t)vcgt_s32((int32x2_t)0x100000001, v14);
    if ((vpmax_u32(v15, v15).u32[0] & 0x80000000) == 0)
    {
      v16 = (const RB::DisplayList::Contents *)v13;
      v17 = vmovn_s64(*(int64x2_t *)&a4->var0);
      if (*(_BYTE *)(v13 + 400))
      {
        RB::DisplayList::Builder::Builder((RB::DisplayList::Builder *)v30);
        RB::DisplayList::Builder::set_optimized((uint64_t)v30, 1);
        v18.i32[0] = 0;
        v19 = (uint32x2_t)vceq_s32(v14, (int32x2_t)0x8000000080000000);
        v20 = (int8x8_t)vdup_lane_s32(vcgt_s32(v18, (int32x2_t)vpmin_u32(v19, v19)), 0);
        RB::DisplayList::Builder::set_crop(v30, (float32x2_t)vbsl_s8(v20, (int8x8_t)0x100000001000000, (int8x8_t)vcvt_f32_s32(v17)), (float32x2_t)vbsl_s8(v20, (int8x8_t)vdup_n_s32(0x7F7FFFFFu), (int8x8_t)vcvt_f32_s32(v14)));
        RB::DisplayList::Builder::draw((RB::DisplayList::Builder *)v30, v16, v33, 1.0, 0, 0);
        RB::DisplayList::Builder::move_contents((RB::DisplayList::Builder *)v30, v21, &v29);
        v22 = v29;
        RB::DisplayList::Builder::~Builder((RB::DisplayList::Builder *)v30);
        v16 = (const RB::DisplayList::Contents *)v22;
      }
      else
      {
        v22 = 0;
      }
      v23 = v28;
      v23.i32[3] = 1.0;
      v30[0] = (float32x2_t)v16;
      v30[1] = 0;
      v30[2] = (float32x2_t)v17;
      v30[3] = (float32x2_t)v14;
      v30[4] = (float32x2_t)vmovn_s64(*(int64x2_t *)&a5->var0);
      v31 = v7;
      v32 = vmulq_n_f32(v23, v27);
      -[RBDrawable renderWithFlags:items:count:displayList:]((uint64_t)self, v8, (uint64_t)v30, 1, a3);
      if (v22)
      {
        v24 = v22 + 2;
        do
        {
          v25 = __ldxr(v24);
          v26 = v25 - 1;
        }
        while (__stlxr(v26, v24));
        if (!v26)
        {
          __dmb(9u);
          (*(void (**)(unsigned int *))(*(_QWORD *)v22 + 8))(v22);
        }
      }
    }
  }
}

- (void)renderWithFlags:(uint64_t)a3 items:(uint64_t)a4 count:(void *)a5 displayList:
{
  int32x2_t v6;
  uint32x2_t v7;
  double v8;
  int v12;
  unint64_t v13;
  void *v14;
  unsigned int *v15;
  unint64_t v16;
  BOOL v17;
  BOOL v18;
  unsigned __int8 v19;
  unsigned int *v20;
  unsigned int *v21;
  unsigned int v22;
  uint64_t v23;
  unsigned int *v24;
  unsigned int v25;
  RB::Drawable *v26;
  unsigned int *v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int *v30;
  unsigned int v31;
  unsigned int v32;
  id v33;
  unsigned __int8 v34;
  id v35;
  id WeakRetained;
  RB::Drawable *v37;
  id v38;
  _QWORD block[6];
  id v40;
  id v41;
  id v42;
  RB::Drawable *v43;
  unint64_t v44;
  int32x2_t v45;
  double v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  int v51;
  unsigned __int8 v52;
  BOOL v53;
  BOOL v54;

  if (!a1)
    return;
  v6 = vmovn_s64(vcvtq_s64_f64(*(float64x2_t *)(a1 + 96)));
  v7 = (uint32x2_t)vcgt_s32((int32x2_t)0x100000001, v6);
  if ((vpmax_u32(v7, v7).u32[0] & 0x80000000) != 0)
    return;
  v8 = *(double *)(a1 + 72);
  if (v8 == 0.0)
    return;
  v12 = a2;
  v13 = *(_QWORD *)(a1 + 80);
  if (!v13)
  {
    v14 = *(void **)(a1 + 48);
    if (v14)
      v13 = objc_msgSend(v14, "pixelFormat");
    else
      v13 = 80;
  }
  v15 = RB::pixel_format_traits(v13, a2);
  v16 = *v15 | ((unint64_t)*((unsigned __int16 *)v15 + 2) << 32);
  v17 = (v16 & 0x1000000000) != 0 || (v16 & 0x200000000) != 0 && *(unsigned int *)((char *)v15 + 18) == 0;
  v18 = !v17;
  if (*((_BYTE *)v15 + 17))
    v19 = *((_BYTE *)v15 + 16);
  else
    v19 = !v17;
  v34 = v19;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v38 = *(id *)(a1 + 40);
  v20 = *(unsigned int **)(a1 + 8);
  if (v20)
  {
    v21 = v20 + 2;
    do
      v22 = __ldxr(v21);
    while (__stxr(v22 + 1, v21));
  }
  v37 = (RB::Drawable *)v20;
  v35 = *(id *)(a1 + 48);
  v33 = *(id *)(a1 + 56);
  v23 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)(a1 + 88) = v23 + 1;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3321888768;
  block[2] = __54__RBDrawable_renderWithFlags_items_count_displayList___block_invoke;
  block[3] = &unk_24C222DC0;
  v40 = v35;
  v41 = WeakRetained;
  block[4] = a1;
  v51 = v12;
  v42 = v38;
  if (v37)
  {
    v24 = (unsigned int *)((char *)v37 + 8);
    do
      v25 = __ldxr(v24);
    while (__stxr(v25 + 1, v24));
  }
  v45 = v6;
  v46 = v8;
  v52 = v34;
  v53 = v18;
  v54 = (v16 & 0x200000000) != 0;
  v47 = a4;
  v48 = a3;
  v43 = v37;
  v44 = v13;
  block[5] = a5;
  v49 = v33;
  v50 = v23;
  RB::Drawable::begin_frame(v37);
  if ((v12 & 8) != 0)
  {
    dispatch_async((dispatch_queue_t)objc_msgSend(v38, "queue"), block);
    if (!a5)
      goto LABEL_27;
    goto LABEL_26;
  }
  dispatch_sync((dispatch_queue_t)objc_msgSend(v38, "queue"), block);
  if (a5)
LABEL_26:
    RBXMLRecorderMarkFrame((const void *)a1, a5, v34, *(double *)(a1 + 96), *(double *)(a1 + 104));
LABEL_27:

  v26 = v43;
  if (v43)
  {
    v27 = (unsigned int *)((char *)v43 + 8);
    do
    {
      v28 = __ldxr(v27);
      v29 = v28 - 1;
    }
    while (__stlxr(v29, v27));
    if (!v29)
    {
      __dmb(9u);
      (*(void (**)(RB::Drawable *))(*(_QWORD *)v26 + 8))(v26);
    }
  }

  if (v37)
  {
    v30 = (unsigned int *)((char *)v37 + 8);
    do
    {
      v31 = __ldxr(v30);
      v32 = v31 - 1;
    }
    while (__stlxr(v32, v30));
    if (!v32)
    {
      __dmb(9u);
      (*(void (**)(RB::Drawable *))(*(_QWORD *)v37 + 8))(v37);
    }
  }

}

- (void)renderItems:(id)a3 flags:(unsigned int)a4
{
  unint64_t v7;
  uint64_t v8;
  size_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int8x8_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  const RB::DisplayList::Contents *v23;
  int64x2_t v24;
  int64x2_t v25;
  int32x2_t v26;
  uint32x2_t v27;
  int32x2_t v28;
  int32x2_t v29;
  uint32x2_t v30;
  int8x8_t v31;
  const char *v32;
  int v33;
  unsigned int v34;
  _BYTE *v35;
  int32x2_t *v36;
  int64x2_t v37;
  int v38;
  float32x4_t *v39;
  unsigned int v40;
  unsigned int v41;
  float32x4_t v42;
  unsigned int v43;
  float v44;
  void *v45;
  void *v46;
  _BYTE *v47;
  unint64_t v48;
  unsigned int *v49;
  unsigned int *v50;
  unsigned int v51;
  unsigned int v52;
  uint64_t v53;
  RBDrawable *v54;
  unsigned int v55;
  unint64_t v56;
  __int128 v57;
  uint64_t v58;
  int64x2_t v59;
  int64x2_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  int64x2_t v65;
  uint64_t v66;
  RB::DisplayList::State *v67;
  _BYTE v68[128];
  _BYTE __dst[64];
  _BYTE *v70;
  uint64_t v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v7 = objc_msgSend(a3, "count");
  if (!(v7 >> 58))
  {
    v56 = v7 << 6;
    if (v7 << 6 > 0x1000)
    {
      v10 = (char *)malloc_type_malloc(v7 << 6, 0xDD00DD05uLL);
      if (!v10)
      {
LABEL_51:
        free(v10);
        return;
      }
    }
    else
    {
      MEMORY[0x24BDAC7A8](v7, v8);
      v10 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v10, v9);
    }
    v70 = 0;
    v71 = 0x800000000;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
    v54 = self;
    v55 = a4;
    v12 = 0;
    if (v11)
    {
      v13 = *(_QWORD *)v62;
      __asm { FMOV            V0.4S, #1.0 }
      v57 = _Q0;
      v19 = (int8x8_t)vdup_n_s32(0x7F7FFFFFu);
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v62 != v13)
            objc_enumerationMutation(a3);
          v21 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
          v22 = (void *)objc_msgSend(v21, "displayList");
          if (v22)
          {
            v23 = (const RB::DisplayList::Contents *)objc_msgSend(v22, "_rb_contents");
            if (v23)
            {
              v24 = 0uLL;
              v59 = 0u;
              v60 = 0u;
              if (v21)
              {
                objc_msgSend(v21, "sourceRect");
                v24 = v59;
                v25 = v60;
              }
              else
              {
                v25 = 0uLL;
              }
              v26 = vmovn_s64(v25);
              v27 = (uint32x2_t)vcgt_s32((int32x2_t)0x100000001, v26);
              if ((vpmax_u32(v27, v27).u32[0] & 0x80000000) == 0)
              {
                v28 = vmovn_s64(v24);
                if (*((_BYTE *)v23 + 400))
                {
                  RB::DisplayList::Builder::Builder((RB::DisplayList::Builder *)&v65);
                  RB::DisplayList::Builder::set_optimized((uint64_t)&v65, 1);
                  v29.i32[0] = 0;
                  v30 = (uint32x2_t)vceq_s32(v26, (int32x2_t)0x8000000080000000);
                  v31 = (int8x8_t)vdup_lane_s32(vcgt_s32(v29, (int32x2_t)vpmin_u32(v30, v30)), 0);
                  RB::DisplayList::Builder::set_crop((float32x2_t *)&v65, (float32x2_t)vbsl_s8(v31, (int8x8_t)0x100000001000000, (int8x8_t)vcvt_f32_s32(v28)), (float32x2_t)vbsl_s8(v31, v19, (int8x8_t)vcvt_f32_s32(v26)));
                  RB::DisplayList::Builder::draw((RB::DisplayList::Builder *)&v65, v23, v67, 1.0, 0, 0);
                  RB::DisplayList::Builder::move_contents((RB::DisplayList::Builder *)&v65, v32, &v58);
                  v33 = v71;
                  v34 = v71 + 1;
                  if (HIDWORD(v71) < (v71 + 1))
                  {
                    RB::vector<RB::objc_ptr<void({block_pointer})(NSError *)>,8ul,unsigned int>::reserve_slow(__dst, v34);
                    v33 = v71;
                    v34 = v71 + 1;
                  }
                  v35 = v70;
                  if (!v70)
                    v35 = __dst;
                  *(_QWORD *)&v35[8 * v33] = v58;
                  LODWORD(v71) = v34;
                  v23 = *(const RB::DisplayList::Contents **)&v35[8 * v33];
                  RB::DisplayList::Builder::~Builder((RB::DisplayList::Builder *)&v65);
                }
                v36 = (int32x2_t *)&v10[64 * v12];
                *v36 = (int32x2_t)v23;
                v36[2] = v28;
                v36[3] = v26;
                v66 = 0;
                v37 = 0uLL;
                v65 = 0u;
                if (v21)
                {
                  objc_msgSend(v21, "destinationOffset");
                  v37 = v65;
                }
                v36[4] = vmovn_s64(v37);
                v38 = objc_msgSend(v21, "initialState");
                if (v38)
                {
                  if (v38 == 1)
                  {
                    *(_DWORD *)&v10[64 * v12 + 40] = 1;
                  }
                  else if (v38 == 2)
                  {
                    v39 = (float32x4_t *)&v10[64 * v12];
                    v39[2].i32[2] = 2;
                    objc_msgSend(v21, "clearColor");
                    v42.i64[0] = __PAIR64__(v41, v40);
                    v42.i64[1] = __PAIR64__(HIDWORD(v57), v43);
                    v39[3] = vmulq_n_f32(v42, v44);
                  }
                }
                else
                {
                  *(_DWORD *)&v10[64 * v12 + 40] = 0;
                }
                ++v12;
              }
            }
          }
        }
        v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
      }
      while (v11);
    }
    if (objc_msgSend(a3, "count") == 1)
      v45 = (void *)objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "displayList");
    else
      v45 = 0;
    -[RBDrawable renderWithFlags:items:count:displayList:]((uint64_t)v54, (MTLPixelFormat)v55, (uint64_t)v10, v12, v45);
    v46 = v70;
    if (v70)
      v47 = v70;
    else
      v47 = __dst;
    if ((_DWORD)v71)
    {
      v48 = 0;
      do
      {
        v49 = *(unsigned int **)&v47[8 * v48];
        if (v49)
        {
          v50 = v49 + 2;
          do
          {
            v51 = __ldxr(v50);
            v52 = v51 - 1;
          }
          while (__stlxr(v52, v50));
          if (!v52)
          {
            __dmb(9u);
            (*(void (**)(unsigned int *))(*(_QWORD *)v49 + 8))(v49);
          }
        }
        ++v48;
      }
      while (v48 < v71);
      v46 = v70;
    }
    if (v46)
      free(v46);
    if (v56 > 0x1000)
      goto LABEL_51;
  }
}

void __54__RBDrawable_renderWithFlags_items_count_displayList___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  RB::Device *v5;
  float v6;
  id v7;
  char v8;
  double v9;
  uint64_t v10;
  __int128 v11;
  char v12;
  _QWORD v13[2];
  uint64_t (*v14)(uint64_t);
  void *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  uint64_t v31;
  id v32[3];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x20BD168EC]();
  v26 = 0;
  v27 = &v26;
  v28 = 0x3052000000;
  v29 = __Block_byref_object_copy__1;
  v30 = __Block_byref_object_dispose__1;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3052000000;
  v23 = __Block_byref_object_copy__1;
  v24 = __Block_byref_object_dispose__1;
  v3 = *(void **)(a1 + 56);
  v25 = *(_QWORD *)(a1 + 48);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3321888768;
  v14 = __54__RBDrawable_renderWithFlags_items_count_displayList___block_invoke_3;
  v15 = &unk_24C222E90;
  v17 = &v20;
  v18 = &v26;
  v19 = v3;
  v16 = *(_QWORD *)(a1 + 32);
  v4 = *(_DWORD *)(a1 + 136);
  v5 = (RB::Device *)-[RBDecodedFontMetadata fontUID](*(_QWORD *)(a1 + 64));
  RB::RenderFrame::RenderFrame((RB::RenderFrame *)v32, v5, *(RB::Drawable **)(a1 + 72), (v4 & 5) != 0);
  v6 = *(double *)(a1 + 96);
  RB::RenderParams::RenderParams((uint64_t)&v11, (uint64_t)v32, *(_QWORD *)(a1 + 80), *(_BYTE *)(a1 + 140), *(_BYTE *)(a1 + 141), *(_BYTE *)(a1 + 142), *(double *)(a1 + 88), v6);
  v12 = (*(_BYTE *)(a1 + 136) >> 2) & 4 | v12 & 0xFB;
  RB::DisplayList::render_many(&v11, (uint64_t)v13, *(_QWORD *)(a1 + 104), *(int32x2_t **)(a1 + 112));
  if ((*((_BYTE *)v32[0] + 292) & 2) != 0)
  {
    v7 = *(id *)(a1 + 40);
    if (v7)
    {
      if (v33 != v7)
      {

        v33 = v7;
      }
    }
  }
  if ((*(_BYTE *)(a1 + 136) & 1) != 0)
  {
    if (!v21[5])
      v14((uint64_t)v13);
    if (v27[5])
    {
      v8 = objc_opt_respondsToSelector();
      v9 = 0.0;
      if ((v8 & 1) != 0)
        objc_msgSend(*(id *)(a1 + 56), "RBDrawablePresentationTime:", *(_QWORD *)(a1 + 32), 0.0);
      RB::RenderFrame::present((uint64_t)v32, v27[5], v9);
    }
  }
  if ((*(_BYTE *)(a1 + 136) & 2) != 0)
    RBStrokeRef::clip(v32);
  v10 = *(_QWORD *)(a1 + 120);
  if (v10)
    RB::RenderFrame::signal_event(v32, v10, *(_QWORD *)(a1 + 128));
  RB::RenderFrame::~RenderFrame((RB::RenderFrame *)v32);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);
  objc_autoreleasePoolPop(v2);
}

uint64_t __54__RBDrawable_renderWithFlags_items_count_displayList___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v2 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "RBDrawableLayer:", *(_QWORD *)(a1 + 32)), "nextDrawable");
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v2;
      v3 = objc_msgSend(v2, "texture");
LABEL_6:
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v3;
      return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v3 = objc_msgSend(*(id *)(a1 + 56), "RBDrawableTexture:", *(_QWORD *)(a1 + 32));
      goto LABEL_6;
    }
  }
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
}

- (void)finish
{
  RB::Drawable::finish(*((_QWORD *)self + 1));
}

- (void)dumpTexture:(id)a3 name:(id)a4
{
  NSObject *v7;
  _QWORD block[7];

  v7 = objc_msgSend(*((id *)self + 5), "queue");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__RBDrawable_dumpTexture_name___block_invoke;
  block[3] = &unk_24C22B0E0;
  block[4] = self;
  block[5] = a4;
  block[6] = a3;
  dispatch_sync(v7, block);
}

uint64_t __31__RBDrawable_dumpTexture_name___block_invoke(_QWORD *a1)
{
  id *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v2 = (id *)-[RBDecodedFontMetadata fontUID](*(_QWORD *)(a1[4] + 40));
  v3 = (void *)objc_msgSend(RB::Device::command_queue(v2), "commandBuffer");
  v4 = objc_opt_respondsToSelector();
  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_msgSend(v3, "debugCommandEncoder");
    v6 = objc_opt_respondsToSelector();
    if ((v6 & 1) != 0)
    {
      v7 = (void *)a1[5];
      if (v7)
        v8 = (const char *)objc_msgSend(v7, "UTF8String");
      else
        v8 = "RBDrawable_texture";
      objc_msgSend(v5, "dumpTexture:name:", a1[6], v8);
    }
    else
    {
      v16 = RB::error_log((RB *)v6);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __31__RBDrawable_dumpTexture_name___block_invoke_cold_1((uint64_t)v5, v16, v17, v18, v19, v20, v21, v22);
    }
    objc_msgSend(v5, "endEncoding");
  }
  else
  {
    v9 = RB::error_log((RB *)v4);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __31__RBDrawable_dumpTexture_name___block_invoke_cold_2((uint64_t)v3, v9, v10, v11, v12, v13, v14, v15);
  }
  objc_msgSend(v3, "commit");
  return objc_msgSend(v3, "waitUntilCompleted");
}

- (double)GPUDuration
{
  return *(double *)(*((_QWORD *)self + 1) + 24);
}

- (void)resetStatistics:(unint64_t)a3 alpha:(double)a4
{
  RBDrawable *v6;

  RB::Drawable::reset_statistics(*((os_unfair_lock_s **)self + 1), a3, a4);
  if (a3)
    v6 = self;
  else
    v6 = 0;
  RB::Drawable::set_delegate(*((_QWORD *)self + 1), (uint64_t)v6);
}

- (NSDictionary)statistics
{
  _BYTE v3[288];

  RB::Drawable::statistics(*((os_unfair_lock_s **)self + 1), v3);
  return (NSDictionary *)RB::Drawable::Statistics::dictionary((RB::Drawable::Statistics *)v3);
}

- (id)statisticsHandler
{
  os_unfair_lock_s *v3;
  void *v4;

  v3 = (os_unfair_lock_s *)((char *)self + 16);
  os_unfair_lock_lock((os_unfair_lock_t)self + 4);
  v4 = (void *)*((_QWORD *)self + 3);
  os_unfair_lock_unlock(v3);
  return v4;
}

- (void)setStatisticsHandler:(id)a3
{
  os_unfair_lock_s *v5;
  uint64_t v6;

  v5 = (os_unfair_lock_s *)((char *)self + 16);
  os_unfair_lock_lock((os_unfair_lock_t)self + 4);
  if (*((id *)self + 3) != a3)
  {
    v6 = objc_msgSend(a3, "copy");

    *((_QWORD *)self + 3) = v6;
  }
  os_unfair_lock_unlock(v5);
}

- (void)_RBDrawableStatisticsDidChange
{
  os_unfair_lock_s *v3;
  id v4;

  v3 = (os_unfair_lock_s *)((char *)self + 16);
  os_unfair_lock_lock((os_unfair_lock_t)self + 4);
  v4 = (id)*((_QWORD *)self + 3);
  if (v4)
  {

    v4 = v4;
    os_unfair_lock_unlock(v3);
    if (v4)
      (*((void (**)(id, RBDrawable *))v4 + 2))(v4, self);
  }
  else
  {
    os_unfair_lock_unlock(v3);
  }

}

- (CGSize)size
{
  double v2;
  double v3;
  CGSize result;

  v2 = *((double *)self + 12);
  v3 = *((double *)self + 13);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setSize:(CGSize)a3
{
  *((_QWORD *)self + 12) = *(_QWORD *)&a3.width;
  *((_QWORD *)self + 13) = *(_QWORD *)&a3.height;
}

- (double)scale
{
  return *((double *)self + 9);
}

- (void)setScale:(double)a3
{
  *((double *)self + 9) = a3;
}

- (unint64_t)pixelFormat
{
  return *((_QWORD *)self + 10);
}

- (void)setPixelFormat:(unint64_t)a3
{
  *((_QWORD *)self + 10) = a3;
}

- (int)initialState
{
  return *((_DWORD *)self + 16);
}

- (void)setInitialState:(int)a3
{
  *((_DWORD *)self + 16) = a3;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)clearColor
{
  float v2;
  float v3;
  float v4;
  float v5;
  $C28CD4A45FD07A4F97CC9D5F91F25271 result;

  v2 = *((float *)self + 28);
  v3 = *((float *)self + 29);
  v4 = *((float *)self + 30);
  v5 = *((float *)self + 31);
  result.var3 = v5;
  result.var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)setClearColor:(id)a3
{
  *((_DWORD *)self + 28) = LODWORD(a3.var0);
  *((_DWORD *)self + 29) = LODWORD(a3.var1);
  *((_DWORD *)self + 30) = LODWORD(a3.var2);
  *((_DWORD *)self + 31) = LODWORD(a3.var3);
}

- (unint64_t)eventValue
{
  return *((_QWORD *)self + 11);
}

- (void)setEventValue:(unint64_t)a3
{
  *((_QWORD *)self + 11) = a3;
}

- (void).cxx_destruct
{
  unsigned int *v3;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;

  objc_destroyWeak((id *)self + 4);
  v3 = (unsigned int *)*((_QWORD *)self + 1);
  if (v3)
  {
    v4 = v3 + 2;
    do
    {
      v5 = __ldxr(v4);
      v6 = v5 - 1;
    }
    while (__stlxr(v6, v4));
    if (!v6)
    {
      __dmb(9u);
      (*(void (**)(unsigned int *))(*(_QWORD *)v3 + 8))(v3);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_DWORD *)self + 4) = 0;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *((_QWORD *)self + 7) = 0;
  return self;
}

- (void)renderWithFlags:(id *)a3 items:count:displayList:.cold.1(id *a1, id *a2, id *a3)
{

}

- (uint64_t)renderWithFlags:(uint64_t)a1 items:count:displayList:.cold.3(uint64_t a1)
{
  unsigned int *v1;
  unsigned int v2;
  unsigned int v3;

  v1 = (unsigned int *)(a1 + 8);
  do
  {
    v2 = __ldxr(v1);
    v3 = v2 - 1;
  }
  while (__stlxr(v3, v1));
  if (!v3)
    return RB::CustomShader::Library::intern_function(a1);
  return a1;
}

void __31__RBDrawable_dumpTexture_name___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_209ACA000, a2, a3, "%@ does not respond to -dumpTexture:name:", a5, a6, a7, a8, 2u);
}

void __31__RBDrawable_dumpTexture_name___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_209ACA000, a2, a3, "%@ does not respond to -debugCommandEncoder", a5, a6, a7, a8, 2u);
}

@end

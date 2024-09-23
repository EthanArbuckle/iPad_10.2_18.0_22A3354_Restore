@implementation RBSurface

- (RBSurface)init
{
  RBSurface *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RBSurface;
  result = -[RBSurface init](&v3, sel_init);
  if (result)
  {
    result->_scale = 1.0;
    result->_colorMode = 1;
    *(_WORD *)&result->_clearsBackground = 1;
    *(_QWORD *)&result->_clearColor.red = 0;
    *(_QWORD *)&result->_clearColor.blue = 0;
  }
  return result;
}

- (void)dealloc
{
  Drawable *p;
  objc_super v4;

  p = self->_drawable._p;
  if (p)
    RB::Drawable::finish((intptr_t)p);
  v4.receiver = self;
  v4.super_class = (Class)RBSurface;
  -[RBSurface dealloc](&v4, sel_dealloc);
}

- (void)setSize:(CGSize)a3
{
  if (self->_size.width != a3.width || self->_size.height != a3.height)
  {
    self->_size = a3;
    -[RBSurface invalidate](self, "invalidate");
  }
}

- (void)setScale:(double)a3
{
  if (self->_scale != a3)
  {
    self->_scale = a3;
    -[RBSurface invalidate](self, "invalidate");
  }
}

- (void)setColorMode:(int)a3
{
  if (self->_colorMode != a3)
  {
    self->_colorMode = a3;
    -[RBSurface invalidate](self, "invalidate");
  }
}

- (void)setClearsBackground:(BOOL)a3
{
  if (self->_clearsBackground != a3)
  {
    self->_clearsBackground = a3;
    -[RBSurface invalidate](self, "invalidate");
  }
}

- (void)setClearColor:(id)a3
{
  if (self->_clearColor.red != a3.var0
    || self->_clearColor.green != a3.var1
    || self->_clearColor.blue != a3.var2
    || self->_clearColor.alpha != a3.var3)
  {
    self->_clearColor = ($F6F15AA9EF86AD1416F06DA9210B6734)a3;
    -[RBSurface invalidate](self, "invalidate");
  }
}

- (RBDisplayList)displayList
{
  return self->_displayList._p;
}

- (void)setDisplayList:(id)a3
{
  RBDisplayList *p;

  p = self->_displayList._p;
  if (p != a3)
  {

    self->_displayList._p = (RBDisplayList *)a3;
    -[RBSurface invalidate](self, "invalidate");
  }
}

- (void)setDisplayList:(id)a3 dirtyRect:(CGRect)a4
{
  RBDisplayList *p;
  float64x2_t v7;
  float64x2_t v8;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;

  p = self->_displayList._p;
  if (p != a3)
  {
    height = a4.size.height;
    y = a4.origin.y;
    width = a4.size.width;
    x = a4.origin.x;

    self->_displayList._p = (RBDisplayList *)a3;
    v7.f64[0] = x;
    v7.f64[1] = y;
    v8.f64[0] = width;
    v8.f64[1] = height;
    -[RBSurface invalidateInRect:]((int32x2_t *)self, vcvt_f32_f64(v7), vcvt_f32_f64(v8));
  }
}

- (int32x2_t)invalidateInRect:(float32x2_t)a3
{
  int32x2_t *v3;
  float32x2_t v4;
  int32x2_t *v5;
  int32x2_t v6[2];

  if (result)
  {
    v3 = result;
    v4 = vrndm_f32(a2);
    v5 = result + 6;
    RB::Bounds::Bounds(v6, v4, vsub_f32(vrndp_f32(vadd_f32(a3, a2)), v4));
    result = RB::Bounds::Union(v5, v6[0], v6[1]);
    v3[5] = 0;
  }
  return result;
}

- (CGImage)copyCGImageUsingDevice:(id)a3
{
  NSObject *v5;
  int HasExtendedRange;
  char v7;
  int width;
  int height;
  char v10;
  signed int v11;
  void *v12;
  void *v13;
  RB *v14;
  CGDataProvider *v15;
  uint64_t v16;
  CGImage *v17;
  CGColorSpace *v18;
  CGBitmapInfo v19;
  size_t v20;
  size_t v21;
  _QWORD v23[6];
  _QWORD block[7];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v5 = objc_msgSend(a3, "queue");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__RBSurface_copyCGImageUsingDevice___block_invoke;
  block[3] = &unk_24C22C300;
  block[5] = a3;
  block[6] = &v25;
  block[4] = self;
  dispatch_sync(v5, block);
  if (!*((_BYTE *)v26 + 24))
    goto LABEL_9;
  RB::Drawable::finish((intptr_t)self->_drawable._p);
  HasExtendedRange = RBColorModeHasExtendedRange(self->_colorMode);
  v7 = HasExtendedRange;
  width = (int)self->_size.width;
  height = (int)self->_size.height;
  v10 = HasExtendedRange ? 3 : 2;
  v11 = ((width << v10) + 63) & 0xFFFFFFC0;
  v12 = malloc_type_malloc(v11 * height, 0xE3EDA7DDuLL);
  if (v12)
  {
    v13 = (void *)*((_QWORD *)self->_texture._p + 2);
    memset(v23, 0, 24);
    v23[3] = width;
    v23[4] = height;
    v23[5] = 1;
    objc_msgSend(v13, "getBytes:bytesPerRow:fromRegion:mipmapLevel:", v12, v11, v23, 0);
    v14 = CGDataProviderCreateWithData(0, v12, v11 * height, (CGDataProviderReleaseDataCallback)free_data);
    v15 = v14;
    if ((v7 & 1) != 0)
    {
      if (self->_colorMode == 2)
        v16 = RB::extended_linear_srgb_colorspace(v14);
      else
        v16 = RB::extended_srgb_colorspace(v14);
      v18 = (CGColorSpace *)v16;
      v19 = 4353;
      v20 = 16;
      v21 = 64;
    }
    else
    {
      v18 = (CGColorSpace *)RB::srgb_colorspace(v14);
      v19 = 8194;
      v20 = 8;
      v21 = 32;
    }
    v17 = CGImageCreate(width, height, v20, v21, v11, v18, v19, v15, 0, 1, kCGRenderingIntentDefault);
    CGDataProviderRelease(v15);
  }
  else
  {
LABEL_9:
    v17 = 0;
  }
  _Block_object_dispose(&v25, 8);
  return v17;
}

uint64_t __36__RBSurface_copyCGImageUsingDevice___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  RB::Device *v3;
  uint64_t result;

  v2 = a1[4];
  v3 = (RB::Device *)-[RBDecodedFontMetadata fontUID](a1[5]);
  result = -[RBSurface _updateWithDevice:frame:synchronized:](v2, v3, 0, 1);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (uint64_t)_updateWithDevice:(RB:(int)a4 :RenderFrame *)a3 frame:synchronized:
{
  uint64_t v4;
  id v8;
  void *v9;
  RB::Drawable *v10;
  unsigned int *v11;
  unsigned int *v12;
  unsigned int v13;
  unsigned int v14;
  void *v15;
  void *v16;
  char v17;
  unint64_t v18;
  float32x4_t v19;
  uint64_t v20;
  int32x2_t *v21;
  _BOOL4 v22;
  __n128 v23;
  _DWORD *v24;
  int v25;
  int32x2_t v26;
  int v27;
  RB::RenderFrame *v28;
  NSObject *v29;
  uint64_t v30;
  double v31;
  double v32;
  char v33;
  char v34;
  char HasExtendedRange;
  float v36;
  const RB::DisplayList::Contents *v37;
  const RB::DisplayList::Contents *v38;
  float32x4_t v39;
  _BYTE v41[304];
  float32x4_t v42;
  float32x4_t v43;
  __int128 v44;
  char v45;
  int32x2_t v46;
  int32x2_t v47;
  _QWORD v48[5];
  int v49;
  __int16 v50;
  unsigned __int8 v51[8];
  uint64_t v52;

  v4 = a1;
  v52 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v8 = *(id *)(a1 + 8);
    RB::ColorMode::ColorMode(v51, *(unsigned int *)(v4 + 68));
    if (!v8)
    {
      v9 = (void *)objc_opt_new();

      objc_msgSend(v9, "setProfile:", 2);
      objc_msgSend(v9, "setDefaultColorSpace:", rb_color_space(((v51[4] & 1) == 0) | 0x100u));
      v8 = v9;
    }
    if (!*(_QWORD *)(v4 + 16))
    {
      v10 = (RB::Drawable *)operator new();
      RB::Drawable::Drawable(v10, 3u);
      v11 = *(unsigned int **)(v4 + 16);
      *(_QWORD *)(v4 + 16) = v10;
      if (v11)
      {
        v12 = v11 + 2;
        do
        {
          v13 = __ldxr(v12);
          v14 = v13 - 1;
        }
        while (__stlxr(v14, v12));
        if (!v14)
        {
          __dmb(9u);
          (*(void (**)(unsigned int *))(*(_QWORD *)v11 + 8))(v11);
        }
      }
    }
    if (*(_QWORD *)(v4 + 24) != *((_QWORD *)a2 + 3))
    {
      objc_msgSend((id)v4, "invalidate");
      v15 = (void *)*((_QWORD *)a2 + 3);
      v16 = *(void **)(v4 + 24);
      if (v16 != v15)
      {

        *(_QWORD *)(v4 + 24) = v15;
      }
    }
    v17 = *(_BYTE *)(v4 + 65) == 0;
    v50 = 0;
    v49 = 0;
    v18 = RB::ColorMode::pixel_format(v51, (uint64_t)a2, v17, (_BYTE *)&v50 + 1, (BOOL *)&v50, &v49);
    v20 = v18;
    v21 = *(int32x2_t **)(v4 + 32);
    if (v21 && *(_QWORD *)&v21[7] == v18)
    {
      v22 = *(_QWORD *)(v4 + 40) == 0;
    }
    else
    {
      v23 = (__n128)vcvtq_s64_f64(*(float64x2_t *)(v4 + 80));
      v23.n128_u64[0] = (unint64_t)vmovn_s64((int64x2_t)v23);
      RB::Texture::alloc((uint64_t)a2, v18, 0, SHIBYTE(v50), 1, 0, (uint64_t *)&v44, v23);
      v24 = *(_DWORD **)(v4 + 32);
      v21 = (int32x2_t *)v44;
      *(_QWORD *)(v4 + 32) = v44;
      *(_QWORD *)&v44 = v24;
      if (v24)
      {
        v25 = v24[2] - 1;
        v24[2] = v25;
        if (!v25)
          (*(void (**)(_DWORD *))(*(_QWORD *)v24 + 8))(v24);
        v21 = *(int32x2_t **)(v4 + 32);
      }
      if (!v21)
      {
        v4 = 0;
LABEL_39:

        return v4;
      }
      if ((v49 & 4) != 0)
      {
        v21[9].i8[5] |= 4u;
        v21 = *(int32x2_t **)(v4 + 32);
      }
      *(int32x2_t *)(v4 + 48) = vdup_n_s32(0xC0000001);
      *(_QWORD *)(v4 + 56) = 0x8000000080000000;
      *(_QWORD *)(v4 + 40) = 0;
      v22 = 1;
    }
    v48[0] = MEMORY[0x24BDAC760];
    v48[1] = 3221225472;
    v48[2] = __50__RBSurface__updateWithDevice_frame_synchronized___block_invoke;
    v48[3] = &__block_descriptor_40_e19____MTLTexture__8__0l;
    v48[4] = v21;
    v26 = v21[8];
    v46 = 0;
    v47 = v26;
    v27 = 1;
    if (v22)
    {
      if (*(_BYTE *)(v4 + 64))
        v27 = 2;
      else
        v27 = 1;
      RB::Bounds::intersect(&v46, *(int32x2_t *)(v4 + 48), *(int32x2_t *)(v4 + 56));
    }
    v19.i64[0] = *(_QWORD *)(v4 + 96);
    v19.i32[2] = *(_DWORD *)(v4 + 104);
    v43 = v19;
    v19.i32[0] = *(_DWORD *)(v4 + 108);
    v42 = v19;
    v28 = a3;
    if (!a3)
    {
      v29 = RB::Drawable::begin_frame(*(RB::Drawable **)(v4 + 16));
      MEMORY[0x24BDAC7A8](v29, v30);
      v28 = (RB::RenderFrame *)v41;
      memset(v41, 0, sizeof(v41));
      RB::RenderFrame::RenderFrame((RB::RenderFrame *)v41, a2, *(RB::Drawable **)(v4 + 16), 0);
    }
    v31 = *(double *)&v21[8];
    v32 = *(double *)(v4 + 72);
    v33 = HIBYTE(v50);
    v34 = v50;
    HasExtendedRange = RBColorModeHasExtendedRange(*(_DWORD *)(v4 + 68));
    v36 = v32;
    RB::RenderParams::RenderParams((uint64_t)&v44, (uint64_t)v28, v20, v33, v34, HasExtendedRange, v31, v36);
    v45 = (2 * v49) & 8 | v45 & 0xF7;
    v37 = (const RB::DisplayList::Contents *)objc_msgSend(v8, "_rb_contents");
    v38 = v37;
    if (v37)
    {
      v39 = v43;
      v39.i32[3] = 1.0;
      RB::DisplayList::render(v37, &v44, (uint64_t)v48, v27, *(_QWORD *)(v4 + 40), v46, v47, (__n128)vmulq_n_f32(v39, v42.f32[0]));
      *(_QWORD *)(v4 + 40) = *((_QWORD *)v38 + 41);
    }
    if (a4)
      RBStrokeRef::clip(v28);
    if (!a3)
      RB::RenderFrame::~RenderFrame(v28);
    *(_QWORD *)(v4 + 48) = 0;
    *(_QWORD *)(v4 + 56) = 0;
    RBXMLRecorderMarkFrame((const void *)v4, v8, HIBYTE(v50), *(double *)(v4 + 80), *(double *)(v4 + 88));
    v4 = 1;
    goto LABEL_39;
  }
  return v4;
}

- (void)updateUsingDevice:(id)a3
{
  NSObject *v5;
  _QWORD v6[6];

  v5 = objc_msgSend(a3, "queue");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __31__RBSurface_updateUsingDevice___block_invoke;
  v6[3] = &unk_24C22C328;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);
}

uint64_t __31__RBSurface_updateUsingDevice___block_invoke(uint64_t a1)
{
  uint64_t v1;
  RB::Device *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (RB::Device *)-[RBDecodedFontMetadata fontUID](*(_QWORD *)(a1 + 40));
  return -[RBSurface _updateWithDevice:frame:synchronized:](v1, v2, 0, 0);
}

- (void)invalidate
{
  Texture *p;
  int v4;

  p = self->_texture._p;
  self->_texture._p = 0;
  if (p)
  {
    v4 = *((_DWORD *)p + 2) - 1;
    *((_DWORD *)p + 2) = v4;
    if (!v4)
      (*(void (**)(Texture *))(*(_QWORD *)p + 8))(p);
  }
}

uint64_t __50__RBSurface__updateWithDevice_frame_synchronized___block_invoke(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (int)colorMode
{
  return self->_colorMode;
}

- (BOOL)clearsBackground
{
  return self->_clearsBackground;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)clearColor
{
  float red;
  float green;
  float blue;
  float alpha;
  $C28CD4A45FD07A4F97CC9D5F91F25271 result;

  red = self->_clearColor.red;
  green = self->_clearColor.green;
  blue = self->_clearColor.blue;
  alpha = self->_clearColor.alpha;
  result.var3 = alpha;
  result.var2 = blue;
  result.var1 = green;
  result.var0 = red;
  return result;
}

- (BOOL)isOpaque
{
  return self->_opaque;
}

- (void)setOpaque:(BOOL)a3
{
  self->_opaque = a3;
}

- (void).cxx_destruct
{
  Texture *p;
  int v4;
  Drawable *v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  p = self->_texture._p;
  if (p)
  {
    v4 = *((_DWORD *)p + 2) - 1;
    *((_DWORD *)p + 2) = v4;
    if (!v4)
      (*(void (**)(Texture *, SEL))(*(_QWORD *)p + 8))(p, a2);
  }

  v5 = self->_drawable._p;
  if (v5)
  {
    v6 = (unsigned int *)((char *)v5 + 8);
    do
    {
      v7 = __ldxr(v6);
      v8 = v7 - 1;
    }
    while (__stlxr(v8, v6));
    if (!v8)
    {
      __dmb(9u);
      (*(void (**)(Drawable *))(*(_QWORD *)v5 + 8))(v5);
    }
  }

}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  return self;
}

@end

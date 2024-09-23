@implementation PXGMetalCaptureSpriteTexture

- (PXGMetalCaptureSpriteTexture)initWithPayload:(id)a3 presentationType:(unsigned __int8)a4
{
  uint64_t v4;
  id v7;
  PXGMetalCaptureSpriteTexture *v8;
  void *v9;
  uint64_t v10;
  MTLTexture *snapshotTexture;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v4 = a4;
  v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXGMetalCaptureSpriteTexture;
  v8 = -[PXGPayloadTexture initWithPayload:presentationType:](&v17, sel_initWithPayload_presentationType_, v7, v4);
  if (v8)
  {
    objc_msgSend(v7, "renderSnapshot");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "px_descriptionForAssertionMessage");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("PXGMetalCaptureSpriteTexture.m"), 41, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("payload.renderSnapshot"), v15, v16);

      }
    }
    objc_msgSend(v9, "texture");
    v10 = objc_claimAutoreleasedReturnValue();
    snapshotTexture = v8->_snapshotTexture;
    v8->_snapshotTexture = (MTLTexture *)v10;

    v8->_behavior = objc_msgSend(v7, "behavior");
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PXGMetalCaptureSpriteTexture *v4;
  void *v5;
  PXGMetalCaptureSpriteTexture *v6;
  void *v7;

  v4 = [PXGMetalCaptureSpriteTexture alloc];
  -[PXGMetalCaptureSpriteTexture payload](self, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXGMetalCaptureSpriteTexture initWithPayload:presentationType:](v4, "initWithPayload:presentationType:", v5, -[PXGPayloadTexture presentationType](self, "presentationType"));

  -[PXGBaseTexture spriteIndexes](self, "spriteIndexes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGBaseTexture addSpriteIndexes:](v6, "addSpriteIndexes:", v7);

  return v6;
}

- (PXGCaptureSpritePayload)payload
{
  void *v4;
  void *v6;
  objc_class *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXGMetalCaptureSpriteTexture;
  -[PXGPayloadTexture payload](&v11, sel_payload);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGMetalCaptureSpriteTexture.m"), 55, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("super.payload"), v8);
LABEL_6:

    return (PXGCaptureSpritePayload *)v4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "px_descriptionForAssertionMessage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGMetalCaptureSpriteTexture.m"), 55, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("super.payload"), v8, v10);

    goto LABEL_6;
  }
  return (PXGCaptureSpritePayload *)v4;
}

- (MTLTexture)chromaTexture
{
  return 0;
}

- (void)getTextureInfos:(id *)a3 forSpriteIndexes:(const unsigned int *)a4 geometries:(id *)a5 spriteStyles:(id *)a6 spriteInfos:(id *)a7 screenScale:(double)a8 count:(unsigned int)a9
{
  void *v14;
  const $E2C29196C7A5C696474C6955C5A9CE06 *v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  int v29;
  void *v30;
  _QWORD v31[17];
  int v32;
  unsigned int v33;
  _QWORD v34[4];

  if (-[PXGBaseTexture spriteCount](self, "spriteCount", a3, a4, a5, a6, a8) < a9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGMetalCaptureSpriteTexture.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("count <= self.spriteCount"));

  }
  -[PXGMetalCaptureSpriteTexture texture](self, "texture");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PXGMetalCaptureSpriteTexture spriteGeometries](self, "spriteGeometries");
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGMetalCaptureSpriteTexture.m"), 68, CFSTR("%@ must have geometries at this point"), self);

    if (v14)
      goto LABEL_5;
LABEL_7:
    v16 = 1;
    v17 = 1;
    goto LABEL_8;
  }
  if (!v14)
    goto LABEL_7;
LABEL_5:
  v16 = objc_msgSend(v14, "width");
  v17 = objc_msgSend(v14, "height");
LABEL_8:
  -[PXGMetalCaptureSpriteTexture captureRect](self, "captureRect");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  -[PXGMetalCaptureSpriteTexture alpha](self, "alpha");
  v29 = v28;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v34[3] = 0;
  -[PXGBaseTexture spriteIndexes](self, "spriteIndexes");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __119__PXGMetalCaptureSpriteTexture_getTextureInfos_forSpriteIndexes_geometries_spriteStyles_spriteInfos_screenScale_count___block_invoke;
  v31[3] = &unk_1E5144010;
  *(double *)&v31[6] = (double)v16;
  *(double *)&v31[7] = (double)v17;
  v31[8] = v15;
  v31[9] = v21;
  v31[10] = v23;
  *(double *)&v31[11] = v25;
  v31[12] = v27;
  *(double *)&v31[13] = (double)v16 / v25;
  v31[4] = v34;
  v31[5] = a7;
  v31[14] = a3;
  v31[15] = v16;
  v31[16] = v17;
  v32 = v29;
  v33 = a9;
  objc_msgSend(v30, "enumerateRangesUsingBlock:", v31);

  _Block_object_dispose(v34, 8);
}

- (PXGColorProgram)colorProgram
{
  return 0;
}

- (BOOL)isOpaque
{
  void *v2;
  BOOL v3;

  -[PXGMetalCaptureSpriteTexture payload](self, "payload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "behavior") == 0;

  return v3;
}

- (float)alpha
{
  return 1.0;
}

- (BOOL)isAtlas
{
  return 0;
}

- (BOOL)isCaptureTexture
{
  return 1;
}

- (int)shaderFlags
{
  return 0;
}

- (int64_t)renderPipelineIndex
{
  return self->_renderPipelineIndex;
}

- (void)setRenderPipelineIndex:(int64_t)a3
{
  self->_renderPipelineIndex = a3;
}

- (unint64_t)behavior
{
  return self->_behavior;
}

- (MTLTexture)snapshotTexture
{
  return self->_snapshotTexture;
}

- (CGRect)captureRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_captureRect.origin.x;
  y = self->_captureRect.origin.y;
  width = self->_captureRect.size.width;
  height = self->_captureRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCaptureRect:(CGRect)a3
{
  self->_captureRect = a3;
}

- (MTLTexture)texture
{
  return self->_texture;
}

- (void)setTexture:(id)a3
{
  objc_storeStrong((id *)&self->_texture, a3);
}

- (const)spriteGeometries
{
  return self->_spriteGeometries;
}

- (void)setSpriteGeometries:(id *)a3
{
  self->_spriteGeometries = a3;
}

- (double)drawingScale
{
  return self->_drawingScale;
}

- (void)setDrawingScale:(double)a3
{
  self->_drawingScale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_texture, 0);
  objc_storeStrong((id *)&self->_snapshotTexture, 0);
}

uint64_t __119__PXGMetalCaptureSpriteTexture_getTextureInfos_forSpriteIndexes_geometries_spriteStyles_spriteInfos_screenScale_count___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  unint64_t v4;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  unsigned int v9;
  uint64_t v10;
  float32x2_t v11;
  float32x2_t v12;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  float64_t v17;
  float64x2_t v18;
  float64_t v19;
  float64x2_t v20;
  uint64_t v21;
  float32x2_t v22;
  float32x2_t v23;
  int v24;
  __int128 v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v4 = a2 + a3;
  if (a2 + a3 > (unint64_t)a2)
  {
    v6 = result;
    v7 = a2;
    v8 = *(_OWORD *)off_1E50B83E0;
    v9 = a2 + 1;
    v26 = *(_OWORD *)off_1E50B83E0;
    while (1)
    {
      if ((*(_BYTE *)(*(_QWORD *)(v6 + 40) + 40 * v7 + 34) & 8) != 0)
      {
        v18 = *(float64x2_t *)(v6 + 48);
        v20 = 0uLL;
      }
      else
      {
        v10 = *(_QWORD *)(v6 + 64) + 20 * v7;
        v11 = *(float32x2_t *)(v10 + 12);
        v12 = vmul_f32(v11, (float32x2_t)0x3F0000003F000000);
        v29.origin.x = (float)(*(float *)v10 - v12.f32[0]);
        v29.origin.y = (float)(*(float *)(v10 + 4) - v12.f32[1]);
        v29.size.width = v11.f32[0];
        v29.size.height = v11.f32[1];
        v27 = CGRectIntersection(*(CGRect *)(v6 + 72), v29);
        x = v27.origin.x;
        y = v27.origin.y;
        width = v27.size.width;
        height = v27.size.height;
        if (!CGRectIsEmpty(v27))
        {
          v28.origin.x = x;
          v28.origin.y = y;
          v28.size.width = width;
          v28.size.height = height;
          CGRectOffset(v28, -*(double *)(v6 + 72), -*(double *)(v6 + 80));
        }
        PXRectScale();
        result = PXRectRoundToPixel();
        v18.f64[1] = v17;
        v20.f64[1] = v19;
        v8 = v26;
      }
      v21 = *(_QWORD *)(v6 + 112) + (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 32) + 8) + 24) << 6);
      v22 = vcvt_f32_f64(v18);
      v23 = vcvt_f32_f64(vcvtq_f64_u64(*(uint64x2_t *)(v6 + 120)));
      v24 = *(_DWORD *)(v6 + 136);
      *(float32x2_t *)v21 = vcvt_f32_f64(v20);
      *(float32x2_t *)(v21 + 8) = v22;
      *(float32x2_t *)(v21 + 16) = v23;
      *(_OWORD *)(v21 + 32) = v8;
      *(_DWORD *)(v21 + 48) = v24;
      if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 32) + 8) + 24) == *(_DWORD *)(v6 + 140))
        break;
      v7 = v9;
      if (v4 <= v9++)
        return result;
    }
    *a4 = 1;
  }
  return result;
}

@end

@implementation PVInstructionGraphImageBufferSourceNode

- (PVInstructionGraphImageBufferSourceNode)initWithPVImageBuffer:(id)a3 transform:(CGAffineTransform *)a4
{
  id v7;
  PVInstructionGraphImageBufferSourceNode *v8;
  PVInstructionGraphImageBufferSourceNode *v9;
  PVInstructionGraphImageBufferSourceNode *v10;
  PVImageBuffer *imageBuffer;
  PVImageBuffer *v12;
  __int128 v13;
  _OWORD v15[3];
  PVImageBuffer *v16;
  objc_super v17;

  v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PVInstructionGraphImageBufferSourceNode;
  v8 = -[PVInstructionGraphSourceNode init](&v17, sel_init);
  v9 = v8;
  v10 = v8;
  if (v8)
  {
    PVRenderManager::INSTANCE((PVRenderManager *)v8, &v16);
    imageBuffer = v10->_imageBuffer;
    v12 = v16;
    if (imageBuffer == v16)
    {
      if (imageBuffer)
        (*((void (**)(PVImageBuffer *))imageBuffer->super.isa + 3))(imageBuffer);
    }
    else
    {
      if (imageBuffer)
      {
        (*((void (**)(PVImageBuffer *))imageBuffer->super.isa + 3))(imageBuffer);
        v12 = v16;
      }
      v10->_imageBuffer = v12;
    }
    objc_storeStrong((id *)&v9->super._transform.ty, a3);
    v13 = *(_OWORD *)&a4->c;
    v15[0] = *(_OWORD *)&a4->a;
    v15[1] = v13;
    v15[2] = *(_OWORD *)&a4->tx;
    -[PVInstructionGraphSourceNode setTransform:](v10, "setTransform:", v15);
  }

  return v10;
}

- (void)loadIGNode:(HGRef<PVInstructionGraphContext>)a3
{
  objc_msgSend(*(id *)&self->super._transform.ty, "cvPixelBuffer", a3.m_Obj);
}

- (HGRef<HGNode>)internalHGNodeForTime:(id *)a3 trackInputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  HGNode **v6;
  HGNode **v10;
  HGNode *v11;
  void *v12;
  CGImage *v13;
  uint64_t v14;
  int v15;
  CGFloat ty;
  __CVBuffer *v17;
  PVInstructionGraphContext *v18;
  HGNode *v19;
  HGNode *v20;
  __CVBuffer *v21;
  HGSolidColor *v22;
  PVInstructionGraphContext *v23;
  CGFloat v24;
  HGBitmapLoader *v25;
  HGNode *v26;
  const void *Storage;
  id *v28;
  id *v29;
  id v30;
  void *v31;
  int v32;
  HGColorConform *v33;
  void (*v34)(HGNode *);
  HGXForm *v35;
  int v36;
  HGNode *v37;
  __int128 v38[3];
  HGXForm *v39;
  HGNode *v40;
  HGColorClamp *v41;
  HGColorConform *v42;
  PVInstructionGraphContext *v43;
  __int128 v44;
  int64_t var3;
  PVInstructionGraphContext *v46;
  __int128 v47;
  int64_t v48;
  HGNode *v49;

  v10 = v6;
  if ((objc_msgSend(*(id *)&self->super._transform.ty, "canCreateCVPixelBuffer", a3, a4, a5) & 1) == 0
    && (objc_msgSend(*(id *)&self->super._transform.ty, "canCreateHGBitmap") & 1) == 0)
  {
    v22 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
    HGSolidColor::HGSolidColor(v22);
    v23 = (PVInstructionGraphContext *)(*(uint64_t (**)(HGSolidColor *, _QWORD, float, float, float, float))(*(_QWORD *)v22 + 96))(v22, 0, 1.0, 1.0, 0.0, 1.0);
    *v10 = (HGNode *)v22;
    return (HGRef<HGNode>)v23;
  }
  v11 = (HGNode *)HGObject::operator new(0x1A0uLL);
  HGNode::HGNode(v11);
  *v10 = v11;
  if ((objc_msgSend(*(id *)&self->super._transform.ty, "cvPixelBufferRequiresCopy") & 1) != 0)
  {
    +[PVColorSpace preferredDisplayColorSpace](PVColorSpace, "preferredDisplayColorSpace");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (CGImage *)objc_msgSend(*(id *)&self->super._transform.ty, "cgImage");
    if (v13)
    {
      +[PVColorSpace pvColorSpaceFromCGColorSpace:](PVColorSpace, "pvColorSpaceFromCGColorSpace:", CGImageGetColorSpace(v13));
      v14 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v14;
    }
    if (!v12)
    {
      +[PVColorSpace sRGBColorSpace](PVColorSpace, "sRGBColorSpace");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = objc_msgSend(*(id *)&self->super._transform.ty, "canCreateCVPixelBuffer");
    ty = self->super._transform.ty;
    if (v15)
    {
      v17 = (__CVBuffer *)objc_msgSend(*(id *)&ty, "cvPixelBufferWithColorSpace:", v12);
      if (v17)
      {
        v44 = *(_OWORD *)&a3->var0;
        var3 = a3->var3;
        v18 = *(PVInstructionGraphContext **)a6.m_Obj;
        v43 = v18;
        if (v18)
          (*(void (**)(PVInstructionGraphContext *))(*(_QWORD *)v18 + 16))(v18);
        PVCreateInputGraphForPixelBuffer(v17, &v43, &v49);
        v19 = *v10;
        v20 = v49;
        if (*v10 == v49)
        {
          if (v19)
            (*(void (**)(HGNode *))(*(_QWORD *)v19 + 24))(v19);
        }
        else
        {
          if (v19)
          {
            (*(void (**)(HGNode *))(*(_QWORD *)v19 + 24))(v19);
            v20 = v49;
          }
          *v10 = v20;
          v49 = 0;
        }
        if (v43)
          (*(void (**)(PVInstructionGraphContext *))(*(_QWORD *)v43 + 24))(v43);
      }
      else
      {
        NSLog(CFSTR("WARNING: PVIGImageBufferSourceNode: unable to create CVPixelBuffer for image buffer (%@)!"), *(_QWORD *)&self->super._transform.ty);
      }
    }
    else if (objc_msgSend(*(id *)&ty, "canCreateHGBitmap"))
    {
      v24 = self->super._transform.ty;
      if (v24 == 0.0)
      {
        v49 = 0;
      }
      else
      {
        objc_msgSend(*(id *)&v24, "hgBitmapWithColorSpace:", v12);
        if (v49)
        {
          v25 = (HGBitmapLoader *)HGObject::operator new(0x1F0uLL);
          HGBitmapLoader::HGBitmapLoader(v25, (HGBitmap *)v49);
          v26 = *v10;
          if (*v10 == (HGNode *)v25)
          {
            if (v25)
              (*(void (**)(HGBitmapLoader *))(*(_QWORD *)v25 + 24))(v25);
          }
          else
          {
            if (v26)
              (*(void (**)(HGNode *))(*(_QWORD *)v26 + 24))(v26);
            *v10 = (HGNode *)v25;
          }
          Storage = (const void *)HGBitmap::GetStorage((HGBitmap *)v49);
          if (Storage)
          {
            if (v28)
            {
              v29 = v28;
              v41 = v25;
              if (v25)
                (*(void (**)(HGBitmapLoader *))(*(_QWORD *)v25 + 16))(v25);
              v30 = v29[3];
              PVInstructionGraphContext::WorkingColorSpace(*(PVInstructionGraphContext **)a6.m_Obj);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = PVInstructionGraphContext::WorkingColorSpaceConformIntent(*(PVInstructionGraphContext **)a6.m_Obj);
              ColorConformInput(&v41, v30, v31, v32, 0, &v42);
              v33 = v42;
              if (v25 == v42)
              {
                if (v25)
                  (*(void (**)(HGBitmapLoader *))(*(_QWORD *)v25 + 24))(v25);
              }
              else
              {
                if (v25)
                {
                  (*(void (**)(HGBitmapLoader *))(*(_QWORD *)v25 + 24))(v25);
                  v33 = v42;
                }
                *v10 = (HGNode *)v33;
                v42 = 0;
              }

              if (v41)
                (*(void (**)(HGColorClamp *))(*(_QWORD *)v41 + 24))(v41);
            }
          }
          if (v49)
            (*(void (**)(HGNode *))(*(_QWORD *)v49 + 24))(v49);
        }
      }
    }

    v11 = *v10;
    if (*v10)
    {
LABEL_61:
      v40 = v11;
      (*(void (**)(HGNode *))(*(_QWORD *)v11 + 16))(v11);
      -[PVInstructionGraphSourceNode applyWrapModeToInput:](self, "applyWrapModeToInput:", &v40);
      v34 = *(void (**)(HGNode *))(*(_QWORD *)v11 + 24);
      if (v11 == v49)
      {
        v34(v11);
      }
      else
      {
        v34(v11);
        *v10 = v49;
        v49 = 0;
      }
      if (v40)
        (*(void (**)(HGNode *))(*(_QWORD *)v40 + 24))(v40);
      v35 = (HGXForm *)*v10;
      v39 = v35;
      if (v35)
        (*(void (**)(HGXForm *))(*(_QWORD *)v35 + 16))(v35);
      -[PVInstructionGraphSourceNode transform](self, "transform");
      v36 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 64))(*(_QWORD *)a6.m_Obj);
      HGXFormForCGAffineTransform(&v39, v38, v36, (HGXForm **)&v49);
      v37 = v49;
      if (v35 == (HGXForm *)v49)
      {
        if (v35)
          (*(void (**)(HGXForm *))(*(_QWORD *)v35 + 24))(v35);
      }
      else
      {
        if (v35)
        {
          (*(void (**)(HGXForm *))(*(_QWORD *)v35 + 24))(v35);
          v37 = v49;
        }
        *v10 = v37;
        v49 = 0;
      }
      v23 = (PVInstructionGraphContext *)v39;
      if (v39)
        return (HGRef<HGNode>)(*(uint64_t (**)(HGXForm *))(*(_QWORD *)v39 + 24))(v39);
    }
  }
  else
  {
    v21 = (__CVBuffer *)objc_msgSend(*(id *)&self->super._transform.ty, "cvPixelBuffer");
    if (v21)
    {
      v47 = *(_OWORD *)&a3->var0;
      v48 = a3->var3;
      v46 = *(PVInstructionGraphContext **)a6.m_Obj;
      if (v46)
        (*(void (**)(PVInstructionGraphContext *))(*(_QWORD *)v46 + 16))(v46);
      PVCreateInputGraphForPixelBuffer(v21, &v46, &v49);
      if (v11 == v49)
      {
        if (v11)
          (*(void (**)(HGNode *))(*(_QWORD *)v11 + 24))(v11);
      }
      else
      {
        if (v11)
          (*(void (**)(HGNode *))(*(_QWORD *)v11 + 24))(v11);
        v11 = v49;
        *v10 = v49;
        v49 = 0;
      }
      v23 = v46;
      if (v46)
        v23 = (PVInstructionGraphContext *)(*(uint64_t (**)(PVInstructionGraphContext *))(*(_QWORD *)v46 + 24))(v46);
    }
    else
    {
      NSLog(CFSTR("WARNING: PVIGImageBufferSourceNode: unable to retrieve CVPixelBuffer for image buffer (%@)!"), *(_QWORD *)&self->super._transform.ty);
    }
    if (v11)
      goto LABEL_61;
  }
  return (HGRef<HGNode>)v23;
}

- (PCRect<double>)inputSizeForPVEffect:(id)a3 igContext:(HGRef<PVInstructionGraphContext>)a4
{
  uint64_t v4;
  uint64_t v6;
  id v7;
  double v13;
  double v14;
  float64x2_t v15;
  double v16;
  float64x2_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;
  PCRect<double> result;

  v6 = v4;
  v7 = a3;
  *(_QWORD *)v6 = 0;
  *(_QWORD *)(v6 + 8) = 0;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)(v6 + 16) = _Q0;
  if ((objc_msgSend(*(id *)&self->super._transform.ty, "canCreateCVPixelBuffer") & 1) != 0
    || (objc_msgSend(*(id *)&self->super._transform.ty, "canCreateHGBitmap") & 1) != 0)
  {
    objc_msgSend(*(id *)&self->super._transform.ty, "size");
    v26 = v13;
    v25 = v14;
    if (v14 > 0.0 && v13 > 0.0)
    {
      -[PVInstructionGraphSourceNode transform](self, "transform", v13);
      v15 = vaddq_f64(vmulq_n_f64(v28, v25), vmulq_n_f64(v29, v26));
      v16 = v15.f64[1];
      v27 = v15;
      if (v15.f64[1] >= v15.f64[0])
      {
        objc_msgSend(v7, "outputSize");
        v19 = v16 / v20;
        v17 = v27;
      }
      else
      {
        objc_msgSend(v7, "outputSize");
        v17 = v27;
        v19 = v27.f64[0] / v18;
      }
      *(float64x2_t *)(v6 + 16) = vdivq_f64(v17, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v19, 0));
    }
  }

  result.var3 = v24;
  result.var2 = v23;
  result.var1 = v22;
  result.var0 = v21;
  return result;
}

- (PCMatrix44Tmpl<double>)pixelTransformForPVEffect:(SEL)a3 igContext:(id)a4
{
  double v8;
  double v9;
  double v10;
  float v11;
  float v12;
  double v13;
  float v14;
  double v15;
  float64x2_t v16;
  PCMatrix44Tmpl<double> *result;
  id v18;

  v18 = a4;
  retstr->var0[3][3] = 1.0;
  retstr->var0[2][2] = 1.0;
  retstr->var0[1][1] = 1.0;
  retstr->var0[0][0] = 1.0;
  *(_OWORD *)&retstr->var0[0][1] = 0u;
  *(_OWORD *)&retstr->var0[0][3] = 0u;
  *(_OWORD *)&retstr->var0[1][2] = 0u;
  *(_OWORD *)&retstr->var0[2][0] = 0u;
  *(_OWORD *)&retstr->var0[2][3] = 0u;
  *(_OWORD *)&retstr->var0[3][1] = 0u;
  if ((objc_msgSend(*(id *)&self->super._transform.ty, "canCreateCVPixelBuffer") & 1) != 0
    || (objc_msgSend(*(id *)&self->super._transform.ty, "canCreateHGBitmap") & 1) != 0)
  {
    v8 = (*(double (**)(_QWORD))(**(_QWORD **)a5.m_Obj + 40))(*(_QWORD *)a5.m_Obj);
    v10 = v9;
    v11 = (*(float (**)(_QWORD))(**(_QWORD **)a5.m_Obj + 48))(*(_QWORD *)a5.m_Obj);
    objc_msgSend(v18, "outputSize");
    v12 = v10;
    v13 = (float)(v11 * v12);
    v14 = v8;
    *(float *)&v8 = v11 * v14;
    *(float *)&v15 = v13 / v15;
    v16 = PCMatrix44Tmpl<double>::leftScale((float64x2_t *)retstr, *(float *)&v15, (float)-*(float *)&v15, 1.0);
    v16.f64[0] = *(float *)&v8 * 0.5;
    PCMatrix44Tmpl<double>::leftTranslate((float64x2_t *)retstr, v16, v13 * 0.5, 0.0);
  }

  return result;
}

- (id)dotTreeLabel:(HGRef<PVInstructionGraphContext>)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *(_QWORD *)a3.m_Obj;
  if (v10)
    (*(void (**)(uint64_t, SEL))(*(_QWORD *)v10 + 16))(v10, a2);
  v9.receiver = self;
  v9.super_class = (Class)PVInstructionGraphImageBufferSourceNode;
  -[PVInstructionGraphNode dotTreeLabel:](&v9, sel_dotTreeLabel_, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    (*(void (**)(uint64_t))(*(_QWORD *)v10 + 24))(v10);
  objc_msgSend(*(id *)&self->super._transform.ty, "size");
  objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("\n[%.0f x %.0f]"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)instructionGraphNodeDescription
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PVInstructionGraphImageBufferSourceNode;
  -[PVInstructionGraphSourceNode instructionGraphNodeDescription](&v11, sel_instructionGraphNodeDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("class"));

  objc_msgSend(*(id *)&self->super._transform.ty, "size");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0f x %.0f"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("size"));

  return v4;
}

- (void).cxx_destruct
{
  PVImageBuffer *imageBuffer;

  imageBuffer = self->_imageBuffer;
  if (imageBuffer)
    (*((void (**)(PVImageBuffer *, SEL))imageBuffer->super.isa + 3))(imageBuffer, a2);
  objc_storeStrong((id *)&self->super._transform.ty, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 13) = 0;
  return self;
}

@end

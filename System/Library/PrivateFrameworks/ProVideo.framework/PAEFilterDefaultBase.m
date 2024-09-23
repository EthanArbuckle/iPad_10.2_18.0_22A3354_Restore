@implementation PAEFilterDefaultBase

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  *a3 = a5->var0;
  *a4 = a5->var1;
  return 1;
}

- (BOOL)renderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  __int128 v5;
  _OWORD v7[3];

  v5 = *(_OWORD *)&a5->var2;
  v7[0] = *(_OWORD *)&a5->var0.var0;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a5->var4;
  return -[PAEFilterDefaultBase canThrowRenderOutput:withInput:withInfo:](self, "canThrowRenderOutput:withInput:withInfo:", a3, a4, v7);
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  return 0;
}

- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6
{
  *a6 = 1;
  *a5 = 1;
  return 1;
}

- (BOOL)getInputBitmap:(id *)a3 withInfo:(id *)a4 atTime:(id)a5 withROI:(HGRect *)a6
{
  uint64_t v10;
  void *v11;
  __int128 v12;
  _OWORD v14[3];

  v10 = -[PROAPIAccessing apiForProtocol:](self->super._apiManager, "apiForProtocol:", &unk_1EF0B0088);
  if (v10)
  {
    v11 = (void *)v10;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v12 = *(_OWORD *)&a4->var2;
      v14[0] = *(_OWORD *)&a4->var0.var0;
      v14[1] = v12;
      v14[2] = *(_OWORD *)&a4->var4;
      LOBYTE(v10) = objc_msgSend(v11, "getInputBitmap:withInfo:atTime:withROI:", a3, v14, a5.var1, a6);
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  return v10;
}

- (BOOL)getInputBitmap:(id *)a3 withInfo:(id *)a4 atTime:(id)a5 appendHGGraph:(HGRef<HGNode>)a6
{
  uint64_t v10;
  void *v11;
  __int128 v12;
  uint64_t v13;
  char v14;
  uint64_t v16;
  _OWORD v17[3];

  v10 = -[PROAPIAccessing apiForProtocol:](self->super._apiManager, "apiForProtocol:", &unk_1EF0B0088);
  if (!v10)
    return 0;
  v11 = (void *)v10;
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 0;
  v12 = *(_OWORD *)&a4->var2;
  v17[0] = *(_OWORD *)&a4->var0.var0;
  v17[1] = v12;
  v17[2] = *(_OWORD *)&a4->var4;
  v13 = *(_QWORD *)a6.var0;
  v16 = v13;
  if (v13)
    (*(void (**)(uint64_t))(*(_QWORD *)v13 + 16))(v13);
  v14 = objc_msgSend(v11, "getInputBitmap:withInfo:atTime:appendHGGraph:", a3, v17, a5.var1, &v16);
  if (v16)
    (*(void (**)(uint64_t))(*(_QWORD *)v16 + 24))(v16);
  return v14;
}

- (id)getParamAPIWithError:(id *)a3
{
  void *v4;
  uint64_t v5;

  v4 = (void *)-[PROAPIAccessing apiForProtocol:](self->super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (!v4)
  {
    v5 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Unable to retrieve FxParameterRetrievalAPI object"), *MEMORY[0x1E0CB2D50], 0);
    if (a3)
      *a3 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", FxPlugErrorDomain, 100001, v5);
  }
  return v4;
}

- (id)getParamErrorFor:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to retrieve a parameter in [-%@             dynamicPropertiesAtTime:withError:]"), a3);
  v4 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v3, *MEMORY[0x1E0CB2D50], 0);
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", FxPlugErrorDomain, 100002, v4);
}

- (HGRef<HGNode>)preScaleDown:(float)a3 withOutputRadius:(float *)a4 withOutputScaleFactor:(float *)a5 withInput:(HGRef<HGNode>)a6 minInputScale:(float)a7 maxInputScale:(float)a8
{
  HGXForm **v8;
  HGXForm **v15;
  HGRef<HGNode> v16;
  float v17;
  float v18;
  float v19;
  HGXForm *v20;
  _BYTE v21[144];

  v15 = v8;
  v17 = log2f(a3);
  if (v17 <= a8)
    v18 = v17;
  else
    v18 = a8;
  if (v17 >= a7)
    v19 = v18;
  else
    v19 = a7;
  *a5 = v19;
  if (v19 <= 1.0)
  {
    *a4 = a3;
    *v15 = *(HGXForm **)a6.var0;
    *(_QWORD *)a6.var0 = 0;
  }
  else
  {
    *a4 = a3 / v19;
    v20 = (HGXForm *)HGObject::operator new(0x210uLL);
    HGXForm::HGXForm(v20);
    HGTransform::HGTransform((HGTransform *)v21);
    HGTransform::Scale((HGTransform *)v21, 1.0 / *a5, 1.0 / *a5, 1.0);
    (*(void (**)(HGXForm *, _QWORD, _QWORD))(*(_QWORD *)v20 + 120))(v20, 0, *(_QWORD *)a6.var0);
    (*(void (**)(HGXForm *, _BYTE *))(*(_QWORD *)v20 + 576))(v20, v21);
    (*(void (**)(HGXForm *, _QWORD, float))(*(_QWORD *)v20 + 592))(v20, 0, 0.0);
    *v15 = v20;
    HGTransform::~HGTransform((HGTransform *)v21);
  }
  return v16;
}

- (HGRef<HGNode>)preScaleUp:(float)a3 withInput:(HGRef<HGNode>)a4
{
  HGXForm **v4;
  HGXForm **v7;
  HGXForm *v8;
  _BYTE v9[144];

  v7 = v4;
  if (a3 <= 1.0)
  {
    *v4 = *(HGXForm **)a4.var0;
    *(_QWORD *)a4.var0 = 0;
  }
  else
  {
    v8 = (HGXForm *)HGObject::operator new(0x210uLL);
    HGXForm::HGXForm(v8);
    HGTransform::HGTransform((HGTransform *)v9);
    HGTransform::Scale((HGTransform *)v9, a3, a3, 1.0);
    (*(void (**)(HGXForm *, _QWORD, _QWORD))(*(_QWORD *)v8 + 120))(v8, 0, *(_QWORD *)a4.var0);
    (*(void (**)(HGXForm *, _BYTE *))(*(_QWORD *)v8 + 576))(v8, v9);
    (*(void (**)(HGXForm *, _QWORD, float))(*(_QWORD *)v8 + 592))(v8, 0, 0.0);
    *v7 = v8;
    HGTransform::~HGTransform((HGTransform *)v9);
  }
  return (HGRef<HGNode>)self;
}

- (HGRef<HGNode>)makePrescaledBlurNode:(HGRef<HGNode>)a3 radius:(float)a4 withScale:(PCVector2<float>)a5 minInputScale:(float)a6 maxInputScale:(float)a7
{
  float *v7;
  _QWORD *v8;
  float var1;
  float var0;
  float *v11;
  _QWORD *v14;
  uint64_t v15;
  double v16;
  HGaussianBlur *v17;
  int v18;
  double v19;
  HGaussianBlur *v20;
  HGRef<HGNode> v21;
  HGaussianBlur *v22;
  uint64_t v23;
  HGNode *v24;
  uint64_t v25;

  var1 = a5.var1;
  var0 = a5.var0;
  v11 = v7;
  v14 = v8;
  v15 = *(_QWORD *)a3.var0;
  v23 = v15;
  if (v15)
    (*(void (**)(uint64_t, SEL, float, __n128, __n128, float, float))(*(_QWORD *)v15 + 16))(v15, a2, a4, *(__n128 *)&a5.var0, *(__n128 *)&a5.var1, a6, a7);
  v25 = 0;
  if (!self)
  {
    v24 = 0;
    if (!v15)
      goto LABEL_8;
    goto LABEL_7;
  }
  *(float *)&v16 = a4;
  a5.var0 = var0;
  a5.var1 = var1;
  -[PAEFilterDefaultBase preScaleDown:withOutputRadius:withOutputScaleFactor:withInput:minInputScale:maxInputScale:](self, "preScaleDown:withOutputRadius:withOutputScaleFactor:withInput:minInputScale:maxInputScale:", (char *)&v25 + 4, &v25, &v23, v16, *(double *)&a5, *(double *)&a5.var1);
  v15 = v23;
  if (v23)
LABEL_7:
    (*(void (**)(uint64_t))(*(_QWORD *)v15 + 24))(v15);
LABEL_8:
  v17 = (HGaussianBlur *)HGObject::operator new(0x1B0uLL);
  HGaussianBlur::HGaussianBlur(v17);
  HGaussianBlur::init(v17, *((float *)&v25 + 1), *v11, v11[1], 0, 0, 0);
  (*(void (**)(HGaussianBlur *, _QWORD, HGNode *))(*(_QWORD *)v17 + 120))(v17, 0, v24);
  v18 = v25;
  v22 = v17;
  (*(void (**)(HGaussianBlur *))(*(_QWORD *)v17 + 16))(v17);
  if (!self)
  {
    *v14 = 0;
    v20 = v17;
    goto LABEL_12;
  }
  LODWORD(v19) = v18;
  -[PAEFilterDefaultBase preScaleUp:withInput:](self, "preScaleUp:withInput:", &v22, v19);
  v20 = v22;
  if (v22)
LABEL_12:
    (*(void (**)(HGaussianBlur *))(*(_QWORD *)v20 + 24))(v20);
  (*(void (**)(HGaussianBlur *))(*(_QWORD *)v17 + 24))(v17);
  v21.var0 = v24;
  if (v24)
    return (HGRef<HGNode>)(*(uint64_t (**)(HGNode *))(*(_QWORD *)v24 + 24))(v24);
  return v21;
}

@end

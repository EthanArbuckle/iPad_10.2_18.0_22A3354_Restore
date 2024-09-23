@implementation PAEStripesFilter

- (PAEStripesFilter)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEStripesFilter;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (id)properties
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("PositionIndependent"), v4, CFSTR("MayRemapTime"), v5, CFSTR("SupportsLargeRenderScale"), v6, CFSTR("SupportsHeliumRendering"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
}

- (BOOL)addParameters
{
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PAEStripesFilter;
  -[PAESharedDefaultBase addParameters](&v7, sel_addParameters);
  v3 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v4, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("StripesFilter::Center"), 0, 0), 1, 0, 0.5, 0.5);
    objc_msgSend(v4, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("StripesFilter::Angle"), 0, 0), 2, 0, 0.0, 0.0, 6.28318531);
    objc_msgSend(v4, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("StripesFilter::Offset"), 0, 0), 3, 0, 0.0, 0.0, 6.28318531);
  }
  return 1;
}

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  BOOL v6;
  BOOL result;

  if (a3)
    v6 = a4 == 0;
  else
    v6 = 1;
  result = !v6;
  if (!v6)
  {
    *a3 = a5->var0;
    *a4 = a5->var1;
  }
  return result;
}

- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4
{
  *a3 = 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v9;
  void *v10;
  signed int v11;
  int v12;
  double v13;
  HGTextureWrap *v14;
  char *v15;
  HGXForm *v16;
  HGCrop *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  HGTextureWrap *v21;
  char *v22;
  HGXForm *v23;
  HGXForm *v25;
  _BYTE v26[144];
  _BYTE v27[144];
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;

  v9 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (v9)
  {
    v10 = (void *)v9;
    v11 = objc_msgSend(a4, "width");
    v12 = objc_msgSend(a4, "height");
    v36 = 0.0;
    v37 = 0.0;
    objc_msgSend(v10, "getXValue:YValue:fromParm:atFxTime:", &v37, &v36, 1, a5->var0.var1);
    v36 = (v36 + -0.5) * (double)v12;
    v37 = (v37 + -0.5) * (double)v11;
    v35 = 0.0;
    objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v35, 2, a5->var0.var1);
    v34 = 0.0;
    objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v34, 3, a5->var0.var1);
    v33 = 0.0;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    if (a3)
    {
      objc_msgSend(a3, "imageInfo");
      v13 = v33;
      if (*((_QWORD *)&v31 + 1))
      {
        v34 = -v34;
        v35 = -v35;
      }
    }
    else
    {
      v13 = 0.0;
    }
    LODWORD(v9) = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1);
    if ((_DWORD)v9)
    {
      if (objc_msgSend(a4, "imageType") == 3)
      {
        if (a4)
          objc_msgSend(a4, "heliumRef");
        else
          v28 = 0;
        v14 = (HGTextureWrap *)HGObject::operator new(0x1D0uLL);
        HGTextureWrap::HGTextureWrap(v14);
        HGTextureWrap::SetTextureWrapMode((uint64_t)v14, (const char *)2, v15);
        (*(void (**)(HGTextureWrap *, _QWORD, uint64_t))(*(_QWORD *)v14 + 120))(v14, 0, v28);
        HGTransform::HGTransform((HGTransform *)v27);
        HGTransform::Translate((HGTransform *)v27, -v37, v36, 0.0);
        HGTransform::Scale((HGTransform *)v27, v13, 1.0, 1.0);
        HGTransform::Rotate((HGTransform *)v27, v35 * 180.0 / 3.14159265, 0.0, 0.0, 1.0);
        HGTransform::Rotate((HGTransform *)v27, v34 * -180.0 / 3.14159265, 0.0, 0.0, 1.0);
        v16 = (HGXForm *)HGObject::operator new(0x210uLL);
        HGXForm::HGXForm(v16);
        (*(void (**)(HGXForm *, _BYTE *))(*(_QWORD *)v16 + 576))(v16, v27);
        (*(void (**)(HGXForm *, _QWORD, HGTextureWrap *))(*(_QWORD *)v16 + 120))(v16, 0, v14);
        v17 = (HGCrop *)HGObject::operator new(0x1A0uLL);
        HGCrop::HGCrop(v17);
        v18 = HGRectMake4i(-v11, 0, v11, 1u);
        v20 = v19;
        (*(void (**)(HGCrop *, _QWORD, HGXForm *))(*(_QWORD *)v17 + 120))(v17, 0, v16);
        (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v17 + 96))(v17, 0, (float)(int)v18, (float)SHIDWORD(v18), (float)(int)v20, (float)SHIDWORD(v20));
        v21 = (HGTextureWrap *)HGObject::operator new(0x1D0uLL);
        HGTextureWrap::HGTextureWrap(v21);
        HGTextureWrap::SetTextureWrapMode((uint64_t)v21, (const char *)1, v22);
        (*(void (**)(HGTextureWrap *, _QWORD, HGCrop *))(*(_QWORD *)v21 + 120))(v21, 0, v17);
        HGTransform::HGTransform((HGTransform *)v26);
        HGTransform::Rotate((HGTransform *)v26, v35 * -57.2957795, 0.0, 0.0, 1.0);
        HGTransform::Scale((HGTransform *)v26, 1.0 / v13, 1.0, 1.0);
        HGTransform::Translate((HGTransform *)v26, v37, -v36, 0.0);
        v23 = (HGXForm *)HGObject::operator new(0x210uLL);
        HGXForm::HGXForm(v23);
        (*(void (**)(HGXForm *, _BYTE *))(*(_QWORD *)v23 + 576))(v23, v26);
        (*(void (**)(HGXForm *, _QWORD, HGTextureWrap *))(*(_QWORD *)v23 + 120))(v23, 0, v21);
        v25 = v23;
        (*(void (**)(HGXForm *))(*(_QWORD *)v23 + 16))(v23);
        -[PAESharedDefaultBase crop:fromImage:toImage:](self, "crop:fromImage:toImage:", &v25, a4, a3);
        objc_msgSend(a3, "setHeliumRef:", &v25);
        if (v25)
          (*(void (**)(HGXForm *))(*(_QWORD *)v25 + 24))(v25);
        (*(void (**)(HGXForm *))(*(_QWORD *)v23 + 24))(v23);
        HGTransform::~HGTransform((HGTransform *)v26);
        (*(void (**)(HGTextureWrap *))(*(_QWORD *)v21 + 24))(v21);
        (*(void (**)(HGCrop *))(*(_QWORD *)v17 + 24))(v17);
        (*(void (**)(HGXForm *))(*(_QWORD *)v16 + 24))(v16);
        HGTransform::~HGTransform((HGTransform *)v27);
        (*(void (**)(HGTextureWrap *))(*(_QWORD *)v14 + 24))(v14);
        if (v28)
          (*(void (**)(uint64_t))(*(_QWORD *)v28 + 24))(v28);
        LOBYTE(v9) = 1;
      }
      else
      {
        LOBYTE(v9) = 0;
      }
    }
  }
  return v9;
}

- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6
{
  __int128 v6;
  _OWORD v8[3];

  *a6 = 0;
  *a5 = 0;
  v6 = *(_OWORD *)&a3->var2;
  v8[0] = *(_OWORD *)&a3->var0.var0;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&a3->var4;
  -[PAESharedDefaultBase overrideFrameSetupForRenderMode:hardware:software:](self, "overrideFrameSetupForRenderMode:hardware:software:", v8, a5, a6);
  return 1;
}

@end

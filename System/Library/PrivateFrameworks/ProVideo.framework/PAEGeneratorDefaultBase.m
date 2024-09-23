@implementation PAEGeneratorDefaultBase

- (BOOL)renderOutput:(id)a3 withInfo:(id *)a4
{
  __int128 v6;
  BOOL v7;
  void *v8;
  CGColorSpace *v9;
  uint64_t v11;
  uint64_t v12;
  _OWORD v13[3];

  v6 = *(_OWORD *)&a4->var2;
  v13[0] = *(_OWORD *)&a4->var0.var0;
  v13[1] = v6;
  v13[2] = *(_OWORD *)&a4->var4;
  v7 = -[PAEGeneratorDefaultBase canThrowRenderOutput:withInfo:](self, "canThrowRenderOutput:withInfo:", a3, v13);
  if (objc_msgSend(a3, "imageType") == 3)
  {
    v8 = (void *)-[PROAPIAccessing apiForProtocol:](self->super._apiManager, "apiForProtocol:", &unk_1EF0A2958);
    if (v8)
    {
      if (objc_msgSend(v8, "colorPrimaries") == 1)
      {
        v9 = (CGColorSpace *)objc_msgSend(a3, "colorSpace");
        if (a3)
          objc_msgSend(a3, "heliumRef");
        else
          v11 = 0;
        FxApplySDRToHDR(v9, (uint64_t)&v11, (uint64_t)v9, 1, &v12);
        if (v11)
          (*(void (**)(uint64_t))(*(_QWORD *)v11 + 24))(v11);
        objc_msgSend(a3, "setHeliumRef:", &v12, v11);
        if (v12)
          (*(void (**)(uint64_t))(*(_QWORD *)v12 + 24))(v12);
      }
    }
  }
  return v7;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInfo:(id *)a4
{
  return 0;
}

- (BOOL)frameSetup:(id *)a3 hardware:(BOOL *)a4 software:(BOOL *)a5
{
  *a5 = 0;
  *a4 = 0;
  return 1;
}

- (void)filteredEdges:(BOOL *)a3 withInfo:(id *)a4
{
  *a3 = 0;
}

@end

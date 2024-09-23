@implementation PAEComicTown

- (PAEComicTown)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEComicTown;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PAEComicTown;
  -[PAESharedDefaultBase dealloc](&v2, sel_dealloc);
}

- (id)properties
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 65792);
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 65792);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("MayRemapTime"), v4, CFSTR("SupportsHeliumRendering"), v5, CFSTR("PositionIndependent"), v6, CFSTR("PixelIndependent"), v7, CFSTR("SDRWorkingSpace"), v8, CFSTR("HDRWorkingSpace"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1), CFSTR("AutoColorProcessingSupport"), 0);
}

- (BOOL)variesOverTime
{
  return 0;
}

- (BOOL)addParameters
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PAEComicTown;
  -[PAESharedDefaultBase addParameters](&v17, sel_addParameters);
  v3 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A6DD0);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend((id)v5, "localizedStringForKey:value:table:", CFSTR("ComicTown::P1"), 0, 0), 1, 2, 2.0, 0.0, 5.0, 0.0, 5.0, 0.1);
    v7 = v6 & objc_msgSend(v4, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend((id)v5, "localizedStringForKey:value:table:", CFSTR("ComicTown::Style"), 0, 0), 2, 5, &unk_1E6649860, 0);
    LODWORD(v11) = 0;
    LODWORD(v5) = objc_msgSend(v4, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", CFSTR("ComicTown::Smooth"), 3, 22, 0, 100, 0, 0x100000064, v11);
    LODWORD(v12) = 0;
    v8 = v7 & v5 & objc_msgSend(v4, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", CFSTR("ComicTown::Brightness"), 4, 22, 0, 100, 0, 0x100000064, v12);
    LODWORD(v13) = 0;
    LODWORD(v5) = objc_msgSend(v4, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", CFSTR("ComicTown::Loose"), 5, 30, 0, 100, 0, 0x100000064, v13);
    LODWORD(v14) = 0;
    LODWORD(v5) = v5 & objc_msgSend(v4, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", CFSTR("ComicTown::BlackFill"), 6, 50, 0, 100, 0, 0x100000064, v14);
    LODWORD(v15) = 0;
    v9 = v8 & v5 & objc_msgSend(v4, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", CFSTR("ComicTown::color"), 9, 0, 0, 5, 0, 0x100000005, v15);
    LODWORD(v16) = 0;
    LOBYTE(v5) = objc_msgSend(v4, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", CFSTR("ComicTown::quantizeLevels"), 10, 6, 2, 1000, 2, 0x100000032, v16);
    LOBYTE(v3) = v9 & v5 & objc_msgSend(v4, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", CFSTR("ComicTown::useHelium"), 11, 0, 0);
  }
  return v3;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  uint64_t v10;
  BOOL v11;
  int v12;
  HGComicDesignerInterface *v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  float v20;
  float v21;
  void (*v22)(HGComicDesignerInterface *);
  double v24;
  double v25;
  HGComicDesignerInterface *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  int v32;
  uint64_t v33;

  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A4590);
  v10 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v9)
    v11 = v10 == 0;
  else
    v11 = 1;
  if (v11)
    goto LABEL_9;
  v33 = 0;
  v32 = 0;
  v31 = 0;
  v29 = 0;
  v30 = 0;
  v28 = 0;
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v33, 1, a5->var0.var1);
  objc_msgSend(v9, "getIntValue:fromParm:atFxTime:", &v32, 2, a5->var0.var1);
  objc_msgSend(v9, "getIntValue:fromParm:atFxTime:", &v31, 3, a5->var0.var1);
  objc_msgSend(v9, "getIntValue:fromParm:atFxTime:", (char *)&v30 + 4, 4, a5->var0.var1);
  objc_msgSend(v9, "getIntValue:fromParm:atFxTime:", &v30, 5, a5->var0.var1);
  objc_msgSend(v9, "getIntValue:fromParm:atFxTime:", &v29, 6, a5->var0.var1);
  objc_msgSend(v9, "getIntValue:fromParm:atFxTime:", (char *)&v29 + 4, 9, a5->var0.var1);
  objc_msgSend(v9, "getIntValue:fromParm:atFxTime:", &v28, 10, a5->var0.var1);
  v12 = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1);
  if (!v12)
    return v12;
  if (objc_msgSend(a4, "imageType") != 3)
  {
LABEL_9:
    LOBYTE(v12) = 0;
    return v12;
  }
  if (a4)
    objc_msgSend(a4, "heliumRef");
  else
    v27 = 0;
  v26 = 0;
  v13 = (HGComicDesignerInterface *)HGObject::operator new(0x1A0uLL);
  HGComicDesignerInterface::HGComicDesignerInterface(v13);
  (*(void (**)(HGComicDesignerInterface *, _QWORD, uint64_t))(*(_QWORD *)v13 + 120))(v13, 0, v27);
  (*(void (**)(HGComicDesignerInterface *, _QWORD, float, float, float, float))(*(_QWORD *)v13 + 96))(v13, 0, (float)v31, 0.0, 0.0, 0.0);
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, float, float, float))(*(_QWORD *)v13 + 96))(v13, 1, (float)SHIDWORD(v30), 0.0, 0.0, 0.0);
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, float, float, float))(*(_QWORD *)v13 + 96))(v13, 2, (float)(int)v30, 0.0, 0.0, 0.0);
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, float, float, float))(*(_QWORD *)v13 + 96))(v13, 4, (float)v28, 0.0, 0.0, 0.0);
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, float, float, float))(*(_QWORD *)v13 + 96))(v13, 5, 720.0, 0.0, 0.0, 0.0);
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, float, float, float))(*(_QWORD *)v13 + 96))(v13, 6, (float)v32, 0.0, 0.0, 0.0);
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, float, float, float))(*(_QWORD *)v13 + 96))(v13, 7, (float)(int)v29, 0.0, 0.0, 0.0);
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, float, float, float))(*(_QWORD *)v13 + 96))(v13, 3, (float)SHIDWORD(v29), 0.0, 0.0, 0.0);
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, float, float, float))(*(_QWORD *)v13 + 96))(v13, 10, 1.0, 0.0, 0.0, 0.0);
  v14 = objc_msgSend(a4, "dod");
  v17 = HGRectMake4i((int)v14 + 1, HIDWORD(v14) + 1, v15 - 1, v16 - 1);
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, float, float, float))(*(_QWORD *)v13 + 96))(v13, 8, (float)(int)v17, (float)SHIDWORD(v17), (float)v18, (float)v19);
  -[PAESharedDefaultBase getScaleForImage:](self, "getScaleForImage:", a4);
  v20 = v24;
  v21 = v25;
  (*(void (**)(HGComicDesignerInterface *, uint64_t, float, float, float, float))(*(_QWORD *)v13 + 96))(v13, 9, v20, v21, 0.0, 0.0);
  v22 = *(void (**)(HGComicDesignerInterface *))(*(_QWORD *)v13 + 16);
  v26 = v13;
  v22(v13);
  (*(void (**)(HGComicDesignerInterface *))(*(_QWORD *)v13 + 24))(v13);
  objc_msgSend(a3, "setHeliumRef:", &v26);
  if (v26)
    (*(void (**)(HGComicDesignerInterface *))(*(_QWORD *)v26 + 24))(v26);
  if (v27)
    (*(void (**)(uint64_t))(*(_QWORD *)v27 + 24))(v27);
  LOBYTE(v12) = 1;
  return v12;
}

@end

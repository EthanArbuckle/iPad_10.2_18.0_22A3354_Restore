@implementation PAEPageCurlFilter

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  BOOL result;
  objc_super v8;

  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("PageCurl::Open"), 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("PageCurl::Close"), 0, 0), 0);
  objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("PageCurl::Direction"), 0, 0), 9, 0, v5, 1);

  result = 0;
  if (v6)
  {
    v8.receiver = self;
    v8.super_class = (Class)PAEPageCurlFilter;
    return -[PAESharedDefaultBase addParameters](&v8, sel_addParameters);
  }
  return result;
}

- (BOOL)parameterChanged:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;
  int v8;
  unsigned int v10;
  unsigned __int8 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (a3 == 10)
  {
    v14 = v3;
    v15 = v4;
    v6 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A7268);
    v7 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
    v12 = *MEMORY[0x1E0CA2E68];
    v13 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    v11 = 0;
    v8 = objc_msgSend(v7, "getBoolValue:fromParm:atFxTime:", &v11, 10, &v12);
    if (v8)
    {
      v10 = 0;
      objc_msgSend(v7, "getParameterFlags:fromParm:", &v10, 11);
      v10 = v10 & 0xFFFFFFFB | (4 * v11);
      objc_msgSend(v6, "setParameterFlags:toParm:");
      LOBYTE(v8) = 1;
    }
  }
  else
  {
    LOBYTE(v8) = 1;
  }
  return v8;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  BOOL v15;
  BOOL v16;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var1;
  __int128 *v18;
  __int128 v19;
  __int128 v20;
  double Seconds;
  CMTimeEpoch v22;
  double v23;
  float v24;
  uint64_t v25;
  CMTime v27;
  CMTime time;
  CMTime rhs;
  CMTime lhs;
  CMTime v31;
  __int128 *v32;
  __int128 v33;
  uint64_t v34;
  __int128 *v35;
  __int128 v36;
  uint64_t v37;
  int v38;
  char v39;

  if (objc_msgSend(a4, "imageType") != 3)
    return 0;
  if (objc_msgSend(a3, "imageType") != 3)
    return 0;
  v9 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A7DB0);
  if (!v9)
    return 0;
  v10 = (void *)v9;
  v11 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (!v11)
    return 0;
  v12 = v11;
  v39 = 0;
  v13 = objc_msgSend(v11, "getBoolValue:fromParm:atFxTime:", &v39, 10, a5->var0.var1);
  v38 = 0;
  v14 = objc_msgSend(v12, "getIntValue:fromParm:atFxTime:", &v38, 9, a5->var0.var1);
  v15 = 0;
  if (v13)
    v16 = v14 == 0;
  else
    v16 = 1;
  if (v16)
    return v15;
  if (!v39)
  {
    *(_QWORD *)&v36 = 0;
    if (objc_msgSend(v12, "getFloatValue:fromParm:atFxTime:", &v36, 11, a5->var0.var1))
    {
      v23 = *(double *)&v36 / 100.0;
      goto LABEL_13;
    }
    return 0;
  }
  var1 = a5->var0.var1;
  v18 = (__int128 *)MEMORY[0x1E0CA2E10];
  v36 = *MEMORY[0x1E0CA2E10];
  v37 = *(_QWORD *)(MEMORY[0x1E0CA2E10] + 16);
  v35 = &v36;
  objc_msgSend(v10, "startFxTimeForEffect:", &v35);
  v33 = *v18;
  v34 = *((_QWORD *)v18 + 2);
  v32 = &v33;
  objc_msgSend(v10, "durationFxTimeForEffect:", &v32);
  memset(&v31, 0, sizeof(v31));
  v19 = *(_OWORD *)var1;
  lhs.epoch = *((_QWORD *)var1 + 2);
  *(_OWORD *)&lhs.value = v19;
  v20 = *v35;
  rhs.epoch = *((_QWORD *)v35 + 2);
  *(_OWORD *)&rhs.value = v20;
  CMTimeSubtract(&v31, &lhs, &rhs);
  time = v31;
  Seconds = CMTimeGetSeconds(&time);
  v22 = *((_QWORD *)v32 + 2);
  *(_OWORD *)&v27.value = *v32;
  v27.epoch = v22;
  v23 = Seconds / CMTimeGetSeconds(&v27);
LABEL_13:
  v24 = v23;
  if (v38)
    v24 = 1.0 - v24;
  v25 = v36;
  v15 = (_QWORD)v36 != 0;
  if ((_QWORD)v36)
  {
    *(_QWORD *)&v33 = v36;
    (*(void (**)(_QWORD))(*(_QWORD *)v36 + 16))(v36);
    objc_msgSend(a3, "setHeliumRef:", &v33);
    if ((_QWORD)v33)
      (*(void (**)(_QWORD))(*(_QWORD *)v33 + 24))(v33);
    (*(void (**)(uint64_t))(*(_QWORD *)v25 + 24))(v25);
  }
  return v15;
}

@end

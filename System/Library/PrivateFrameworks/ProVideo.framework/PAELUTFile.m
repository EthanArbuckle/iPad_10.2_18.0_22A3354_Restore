@implementation PAELUTFile

- (PAELUTFile)initWithAPIManager:(id)a3
{
  PAELUTFile *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAELUTFile;
  result = -[PAEPhotosFilters initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
  if (result)
    result->super.whichFilter = -1;
  return result;
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super.super._apiManager, "apiForProtocol:", &unk_1EF0A6DD0);
  if (v4)
    LOBYTE(v4) = objc_msgSend(v4, "addStringParameterWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("LUT File::LUT File"), 0, 0), 101, &stru_1E65EDDA0, 3);
  return (char)v4;
}

- (HGRef<HGBitmap>)lutBitmapForFilter:(int)a3 lutDimensions:(int *)a4
{
  _QWORD *v4;
  uint64_t v6;
  _QWORD *v8;
  void *v9;
  HGRef<HGBitmap> v10;
  BOOL v11;
  HGBitmap *m_Obj;
  void *v13;
  void *v14;
  void *v15;
  int *v16;
  objc_super v17;
  uint64_t v18;

  v6 = *(_QWORD *)&a3;
  v8 = v4;
  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super.super._apiManager, "apiForProtocol:", &unk_1EF0A4590);
  v10.m_Obj = (HGBitmap *)-[PROAPIAccessing apiForProtocol:](self->super.super.super._apiManager, "apiForProtocol:", &unk_1EF0A3D08);
  if (v9)
    v11 = v10.m_Obj == 0;
  else
    v11 = 1;
  if (!v11)
  {
    m_Obj = v10.m_Obj;
    v18 = 0;
    objc_msgSend(v9, "getStringParameterValue:fromParm:", &v18, 101);
    v13 = (void *)-[HGBitmap URLForMediaFolder](m_Obj, "URLForMediaFolder");
    v14 = (void *)objc_msgSend(v13, "URLByAppendingPathComponent:", v18);
    v15 = (void *)objc_msgSend(v14, "pathExtension");
    if ((objc_msgSend(v15, "isEqualToString:", CFSTR("cube")) & 1) != 0)
    {
      v6 = 30;
      v16 = &OBJC_IVAR___PAEPhotosFilters_LUTCubeURL;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("scube")) & 1) != 0)
    {
      v6 = 31;
      v16 = &OBJC_IVAR___PAEPhotosFilters_LUTScubeURL;
    }
    else
    {
      if (!objc_msgSend(v15, "isEqualToString:", CFSTR("ccube")))
      {
LABEL_14:
        v17.receiver = self;
        v17.super_class = (Class)PAELUTFile;
        return -[PAEPhotosFilters lutBitmapForFilter:lutDimensions:](&v17, sel_lutBitmapForFilter_lutDimensions_, v6, a4);
      }
      v6 = 32;
      v16 = &OBJC_IVAR___PAEPhotosFilters_LUTCcubeURL;
    }
    *(Class *)((char *)&self->super.super.super.super.isa + *v16) = (Class)v14;
    goto LABEL_14;
  }
  *v8 = 0;
  return v10;
}

@end

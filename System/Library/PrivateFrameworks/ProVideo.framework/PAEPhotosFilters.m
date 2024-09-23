@implementation PAEPhotosFilters

- (PAEPhotosFilters)initWithAPIManager:(id)a3
{
  PAEPhotosFilters *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PAEPhotosFilters;
  v3 = -[PAESharedDefaultBase initWithAPIManager:](&v5, sel_initWithAPIManager_, a3);
  if (v3)
  {
    v3->LUTcache = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    v3->LUTCubeURL = 0;
    v3->LUTScubeURL = 0;
    v3->LUTCcubeURL = 0;
    v3->whichFilter = -1;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;
  PCMutex *p_cacheMutex;
  char v5;

  p_cacheMutex = &self->cacheMutex;
  PCMutex::lock(&self->cacheMutex);
  v5 = 1;

  self->LUTCubeURL = 0;
  self->LUTScubeURL = 0;

  self->LUTCcubeURL = 0;
  PCMutex::unlock(&self->cacheMutex);
  v3.receiver = self;
  v3.super_class = (Class)PAEPhotosFilters;
  -[PAESharedDefaultBase dealloc](&v3, sel_dealloc);
}

- (id)properties
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 67584);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 591872);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("MayRemapTime"), v4, CFSTR("SupportsHeliumRendering"), v5, CFSTR("PixelTransformSupport"), v6, CFSTR("SDRWorkingSpace"), v7, CFSTR("HDRWorkingSpace"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1), CFSTR("AutoColorProcessingSupport"), 0);
}

- (BOOL)variesOverTime
{
  return 0;
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAEPhotosFilters;
  -[PAESharedDefaultBase addParameters](&v6, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A6DD0);
  if (v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("PhotosFilter::Filter"), 0, 0), 1, 0, objc_msgSend((id)objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("PhotosFilter::Entries"), 0, 0), "componentsSeparatedByString:", CFSTR("|")), 1);
  }
  return v3 != 0;
}

- (BOOL)read:(id)a3 red:(float *)a4 green:(float *)a5 blue:(float *)a6
{
  if (objc_msgSend(a3, "scanFloat:", a4) && objc_msgSend(a3, "scanFloat:", a5))
    return objc_msgSend(a3, "scanFloat:", a6);
  else
    return 0;
}

- (BOOL)readCubeLine:(id)a3 intoLUTEntries:(void *)a4
{
  void *v6;
  _BOOL4 v7;
  char v8;
  char v10;
  char v11;
  char v12;
  int v13;
  int v14;
  __int128 v15;

  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", a3);
  objc_msgSend(v6, "setCaseSensitive:", 0);
  if ((objc_msgSend(v6, "scanString:intoString:", CFSTR("TITLE "), 0) & 1) != 0)
  {
    LOBYTE(v7) = 1;
    return v7;
  }
  if (objc_msgSend(v6, "scanString:intoString:", CFSTR("DOMAIN_MIN "), 0)
    || objc_msgSend(v6, "scanString:intoString:", CFSTR("DOMAIN_MAX "), 0))
  {
    v8 = -[PAEPhotosFilters read:red:green:blue:](self, "read:red:green:blue:", v6, &v15, (char *)&v15 + 4, (char *)&v15 + 8);
LABEL_9:
    LOBYTE(v7) = v8;
    return v7;
  }
  if (objc_msgSend(v6, "scanString:intoString:", CFSTR("LUT_1D_SIZE "), 0)
    || objc_msgSend(v6, "scanString:intoString:", CFSTR("LUT_3D_SIZE "), 0))
  {
    *(_QWORD *)&v15 = 0;
    v8 = objc_msgSend(v6, "scanInteger:", &v15);
    goto LABEL_9;
  }
  v15 = xmmword_1B304EFF0;
  v7 = -[PAEPhotosFilters read:red:green:blue:](self, "read:red:green:blue:", v6, &v15, (char *)&v15 + 4, (char *)&v15 + 8);
  if (v7)
  {
    if (*(float *)&v15 >= 0.0)
    {
      if (*(float *)&v15 <= 1.0)
        v10 = (int)(float)(*(float *)&v15 * 255.0);
      else
        v10 = -1;
    }
    else
    {
      v10 = 0;
    }
    LOBYTE(v14) = v10;
    if (*((float *)&v15 + 1) >= 0.0)
    {
      if (*((float *)&v15 + 1) <= 1.0)
        v11 = (int)(float)(*((float *)&v15 + 1) * 255.0);
      else
        v11 = -1;
    }
    else
    {
      v11 = 0;
    }
    BYTE1(v14) = v11;
    if (*((float *)&v15 + 2) >= 0.0)
    {
      if (*((float *)&v15 + 2) <= 1.0)
        v12 = (int)(float)(*((float *)&v15 + 2) * 255.0);
      else
        v12 = -1;
    }
    else
    {
      v12 = 0;
    }
    BYTE2(v14) = v12;
    if (*((float *)&v15 + 3) >= 0.0)
    {
      if (*((float *)&v15 + 3) <= 1.0)
        v13 = (int)(float)(*((float *)&v15 + 3) * 255.0);
      else
        LOBYTE(v13) = -1;
    }
    else
    {
      LOBYTE(v13) = 0;
    }
    HIBYTE(v14) = v13;
    std::vector<RGBA8Pixel>::push_back[abi:ne180100]((void **)a4, &v14);
  }
  return v7;
}

- (id)readCubeData:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  void *__p;
  _BYTE *v20;
  uint64_t v21;

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", a3, 4);
  v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v6);
  v8 = objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  __p = 0;
  v20 = 0;
  v9 = 1;
  v21 = 0;
  while (1)
  {
    if ((objc_msgSend(v7, "isAtEnd") & 1) != 0)
    {

      v10 = (void *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", __p, v20 - (_BYTE *)__p);
      goto LABEL_20;
    }
    if ((objc_msgSend(v7, "scanString:intoString:", CFSTR("#"), 0) & 1) != 0)
    {
      if ((objc_msgSend(v7, "scanUpToCharactersFromSet:intoString:", v8, 0) & 1) == 0)
      {
        if (a4)
        {
          v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error on line %lu: Invalid comment"), v9);
          v12 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v11, *MEMORY[0x1E0CB2D68], 0);
          *a4 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("Color Cube Converter Domain"), 1, v12);
          NSLog(CFSTR("%@"), v11);
        }
        else
        {
          NSLog(CFSTR("Error on line %lu: Invalid comment"), v9);
        }
        goto LABEL_19;
      }
      goto LABEL_8;
    }
    v18 = 0;
    if ((objc_msgSend(v7, "scanUpToCharactersFromSet:intoString:", v8, &v18) & 1) == 0)
      break;
    if (!-[PAEPhotosFilters readCubeLine:intoLUTEntries:](self, "readCubeLine:intoLUTEntries:", v18, &__p))
    {
      if (a4)
      {
        v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error on line %lu: Unable to parse line: \"%@\"."), v9, v18);
        v16 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v15, *MEMORY[0x1E0CB2D68], 0);
        *a4 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("Color Cube Converter Domain"), 3, v16);
        NSLog(CFSTR("%@"), v15);
      }
      else
      {
        NSLog(CFSTR("Error on line %lu: Unable to parse line: \"%@\"."), v9, v18);
      }
      goto LABEL_19;
    }
LABEL_8:
    ++v9;
  }
  if (a4)
  {
    v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error on line %lu: Unable to read text"), v9);
    v14 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v13, *MEMORY[0x1E0CB2D68], 0);
    *a4 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("Color Cube Converter Domain"), 2, v14);
    NSLog(CFSTR("%@"), v13);
  }
  else
  {
    NSLog(CFSTR("Error on line %lu: Unable to read text"), v9);
  }
LABEL_19:

  v10 = 0;
LABEL_20:
  if (__p)
  {
    v20 = __p;
    operator delete(__p);
  }
  return v10;
}

- (id)lutFromCubeFile:(id)a3
{
  uint64_t v5;
  id result;
  uint64_t v7;

  v7 = 0;
  v5 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:");
  if (v5)
  {
    result = -[PAEPhotosFilters readCubeData:error:](self, "readCubeData:error:", v5, &v7);
    if (result)
      return result;
    NSLog(CFSTR("Error reading .cube file: %@"), v7);
  }
  else
  {
    NSLog(CFSTR("Error opening .cube file: %@"), a3);
  }
  return 0;
}

- (id)lutFromScubeFile:(id)a3
{
  if (a3)
    return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:");
  else
    return 0;
}

- (id)lutFromCcubeFile:(id)a3
{
  void *v3;
  uint64_t v4;
  unsigned int *v5;
  uint64_t v6;
  unint64_t v7;
  float *v8;
  float v9;
  int v10;
  float v11;
  int v12;
  float v13;
  int v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char *v18;
  unsigned int *v19;
  unsigned int *v20;
  unsigned int v21;
  void *v22;
  unsigned int *__p;
  unsigned int *v25;
  unsigned int *v26;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", a3);
  v4 = objc_msgSend(v3, "bytes");
  v5 = 0;
  v6 = 0;
  __p = 0;
  v25 = 0;
  v26 = 0;
  v7 = (unint64_t)objc_msgSend(v3, "length") >> 4;
  do
  {
    v8 = (float *)(v4 + 16 * v6);
    v9 = *v8;
    if (*v8 >= 0.0)
    {
      if (v9 <= 1.0)
        v10 = (int)(float)(v9 * 255.0);
      else
        v10 = 255;
    }
    else
    {
      v10 = 0;
    }
    v11 = v8[1];
    if (v11 >= 0.0)
    {
      if (v11 <= 1.0)
        v12 = (int)(float)(v11 * 255.0);
      else
        v12 = 255;
    }
    else
    {
      v12 = 0;
    }
    v13 = v8[2];
    if (v13 >= 0.0)
    {
      if (v13 <= 1.0)
        v14 = (int)(float)(v13 * 255.0);
      else
        v14 = 255;
    }
    else
    {
      v14 = 0;
    }
    if (v5 >= v26)
    {
      v15 = v5 - __p;
      if ((unint64_t)(v15 + 1) >> 62)
        std::vector<double>::__throw_length_error[abi:ne180100]();
      v16 = ((char *)v26 - (char *)__p) >> 1;
      if (v16 <= v15 + 1)
        v16 = v15 + 1;
      if ((unint64_t)((char *)v26 - (char *)__p) >= 0x7FFFFFFFFFFFFFFCLL)
        v17 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v17 = v16;
      if (v17)
        v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&v26, v17);
      else
        v18 = 0;
      v19 = (unsigned int *)&v18[4 * v15];
      *v19 = (v12 << 8) | (v14 << 16) | v10 | 0xFF000000;
      v5 = v19 + 1;
      v20 = v25;
      if (v25 != __p)
      {
        do
        {
          v21 = *--v20;
          *--v19 = v21;
        }
        while (v20 != __p);
        v20 = __p;
      }
      __p = v19;
      v26 = (unsigned int *)&v18[4 * v17];
      if (v20)
        operator delete(v20);
    }
    else
    {
      *v5++ = (v12 << 8) | (v14 << 16) | v10 | 0xFF000000;
    }
    v25 = v5;
    ++v6;
  }
  while (v6 != v7);
  v22 = (void *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", __p, (char *)v5 - (char *)__p);
  if (__p)
    operator delete(__p);
  return v22;
}

- (id)LUTFromCache:(int)a3 atPath:(id)a4
{
  uint64_t v7;
  PAEPhotosFilters *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  __CFString *v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  id v29;
  id v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  PCMutex *p_cacheMutex;
  char v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
  p_cacheMutex = &self->cacheMutex;
  PCMutex::lock(&self->cacheMutex);
  v37 = 1;
  v8 = self;
  v9 = (void *)-[NSMutableDictionary objectForKey:](self->LUTcache, "objectForKey:", v7);
  v10 = (id)objc_msgSend(v9, "objectForKey:", CFSTR("LUTData"));
  v11 = (void *)objc_msgSend(v9, "objectForKey:", CFSTR("LUT Path"));
  if (v10 && (objc_msgSend(v11, "isEqualToString:", a4) & 1) != 0)
    goto LABEL_43;
  if (a3 > 28)
  {
    switch(a3)
    {
      case 32:
        v18 = -[PAEPhotosFilters lutFromCcubeFile:](self, "lutFromCcubeFile:", a4);
        break;
      case 31:
        v18 = -[PAEPhotosFilters lutFromScubeFile:](self, "lutFromScubeFile:", a4);
        break;
      case 30:
        v18 = -[PAEPhotosFilters lutFromCubeFile:](self, "lutFromCubeFile:", a4);
        break;
      default:
        goto LABEL_18;
    }
    v10 = v18;
LABEL_18:
    if (!v10)
      goto LABEL_43;
    goto LABEL_30;
  }
  v12 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v13 = off_1E64DF890[a3];
  v14 = objc_msgSend(v12, "pathForResource:ofType:", v13, CFSTR("scube"));
  if (a3 >= 16)
  {
    v15 = off_1E64DF978[a3 - 16];
    v16 = (void *)objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", v15);
    if (v16
      || -[__CFString hasSuffix:](v15, "hasSuffix:", CFSTR("Background"))
      && (v16 = (void *)objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", -[__CFString stringByReplacingOccurrencesOfString:withString:](v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Background"), &stru_1E65EDDA0))) != 0)
    {
      if (a3 == 27)
        objc_msgSend(v16, "setValue:forKey:", &unk_1E66490C0, *MEMORY[0x1E0C9E288]);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        if (-[__CFString hasSuffix:](v15, "hasSuffix:", CFSTR("Background")))
          v17 = objc_msgSend(v16, "backgroundCubePath");
        else
          v17 = objc_msgSend(v16, "cubePath");
        v14 = v17;
      }
    }
    else
    {
      NSLog(CFSTR("Unable to find .scube from CI. Falling back to Clips bundle."));
    }
  }
  if (!v14)
  {
    v19 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.motion.contentfilters"));
    if (!v19 || (v14 = objc_msgSend(v19, "pathForResource:ofType:", v13, CFSTR("scube"))) == 0)
    {
      NSLog(CFSTR("Unable to load LUT: %@"), v13);
      v14 = 0;
    }
  }
  v10 = -[PAEPhotosFilters lutFromScubeFile:](self, "lutFromScubeFile:", v14);
  if (v10)
  {
LABEL_30:
    v31 = v7;
    if ((unint64_t)-[NSMutableDictionary count](self->LUTcache, "count") >= 2)
    {
      v20 = objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v21 = (void *)-[NSMutableDictionary allKeys](self->LUTcache, "allKeys");
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      if (v22)
      {
        v29 = v10;
        v30 = a4;
        v23 = 0;
        v24 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v33 != v24)
              objc_enumerationMutation(v21);
            v26 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
            v27 = (void *)objc_msgSend((id)-[NSMutableDictionary objectForKey:](v8->LUTcache, "objectForKey:", v26), "objectForKey:", CFSTR("CacheTime"));
            if (objc_msgSend(v27, "compare:", v20) == -1)
            {
              v23 = v26;
              v20 = (uint64_t)v27;
            }
          }
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
        }
        while (v22);
        v10 = v29;
        a4 = v30;
        if (v23)
          -[NSMutableDictionary removeObjectForKey:](v8->LUTcache, "removeObjectForKey:", v23);
      }
    }
    -[NSMutableDictionary setObject:forKey:](v8->LUTcache, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v10, CFSTR("LUTData"), objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0), CFSTR("CacheTime"), a4, CFSTR("LUT Path"), 0), v31);
  }
LABEL_43:
  if (p_cacheMutex && v37)
    PCMutex::unlock(p_cacheMutex);
  return v10;
}

- (HGRef<HGBitmap>)lutBitmapForFilter:(int)a3 lutDimensions:(int *)a4
{
  void ***v4;
  uint64_t v6;
  void ***v8;
  const __CFString *v9;
  id v10;
  void *v11;
  size_t v12;
  int v13;
  void **v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;

  v6 = *(_QWORD *)&a3;
  v8 = v4;
  *v4 = 0;
  if ((a3 - 30) > 2)
    v9 = &stru_1E65EDDA0;
  else
    v9 = (const __CFString *)objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *off_1E64DF9E0[a3 - 30]), "path");
  v10 = -[PAEPhotosFilters LUTFromCache:atPath:](self, "LUTFromCache:atPath:", v6, v9);
  if (v10)
  {
    v11 = v10;
    v12 = objc_msgSend(v10, "length");
    v13 = (int)cbrt((double)(v12 >> 2));
    *a4 = v13;
    v14 = (void **)HGObject::operator new(0x80uLL);
    v10 = (id)HGBitmap::HGBitmap(v14, 0, (v13 * v13 + 1) | ((unint64_t)(v13 + 1) << 32), 24);
    if (v14)
      *v8 = v14;
    v15 = *a4;
    v16 = 4 * v15 * v15;
    if (v14[8] == (void *)v16)
    {
      return (HGRef<HGBitmap>)memcpy(v14[10], (const void *)objc_msgSend(v11, "bytes"), v12);
    }
    else if (v15 >= 1)
    {
      v17 = 0;
      v18 = 0;
      v19 = v16;
      do
      {
        v10 = memcpy((char *)v14[10] + (_QWORD)v14[8] * v18++, (const void *)(objc_msgSend(v11, "bytes") + v17), v19);
        v17 += v19;
      }
      while (v18 < *a4);
    }
  }
  return (HGRef<HGBitmap>)v10;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  HGBitmap *v13;
  unsigned int v14;
  HGNode *v15;
  HGColorMatrix *v16;
  uint64_t v17;
  uint64_t CGColorSpace;
  HGNode *v19;
  HGNode *v20;
  HGNode *v22;
  CGColorSpace *v23;
  _OWORD v24[3];
  id v25;
  int v26;
  HGNode *v27;
  int whichFilter;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v10 = v9;
  if (!v9)
    return v10 != 0;
  whichFilter = self->whichFilter;
  if (whichFilter == -1)
    objc_msgSend(v9, "getIntValue:fromParm:atFxTime:", &whichFilter, 1, a5->var0.var1);
  if (a4)
    objc_msgSend(a4, "heliumRef");
  else
    v27 = 0;
  v26 = 32;
  v25 = 0;
  if (whichFilter == 29)
  {
    v11 = *(_OWORD *)&a5->var2;
    v12 = *(_OWORD *)&a5->var4;
    v24[0] = *(_OWORD *)&a5->var0.var0;
    v24[1] = v11;
    v24[2] = v12;
    -[PAESharedDefaultBase getHeliumImage:layerOffsetX:layerOffsetY:requestInfo:fromParm:atTime:](self, "getHeliumImage:layerOffsetX:layerOffsetY:requestInfo:fromParm:atTime:", &v25, 0, 0, v24, 2, a5->var0.var1);
    v13 = 0;
    v26 = objc_msgSend(v25, "height");
    v14 = 27;
  }
  else
  {
    -[PAEPhotosFilters lutBitmapForFilter:lutDimensions:](self, "lutBitmapForFilter:lutDimensions:");
    v13 = (HGBitmap *)v29;
    v14 = 24;
  }
  v15 = (HGNode *)HGObject::operator new(0x210uLL);
  HGApply3DLUT::HGApply3DLUT(v15, v26, v14, 1, 0, 1, 1, 1, 1.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0);
  if (whichFilter == 29)
  {
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    DWORD2(v29) = 1065353216;
    DWORD1(v30) = 1065353216;
    LODWORD(v31) = 1065353216;
    HIDWORD(v32) = 1065353216;
    v16 = (HGColorMatrix *)HGObject::operator new(0x1F0uLL);
    HGColorMatrix::HGColorMatrix(v16);
    (*(void (**)(HGColorMatrix *, _QWORD, uint64_t))(*(_QWORD *)v16 + 120))(v16, 0, objc_msgSend(v25, "heliumNode"));
    HGColorMatrix::LoadMatrix(v16, &v29, 0);
    (*(void (**)(HGNode *, uint64_t, HGColorMatrix *))(*(_QWORD *)v15 + 120))(v15, 1, v16);

    (*(void (**)(HGColorMatrix *))(*(_QWORD *)v16 + 24))(v16);
  }
  else
  {
    HGApply3DLUT::SetLUTBitmap((HGRect *)v15, v13);
  }
  if (whichFilter == 32 || whichFilter == 30)
  {
    (*(void (**)(HGNode *, _QWORD, HGNode *))(*(_QWORD *)v15 + 120))(v15, 0, v27);
    if (v27 != v15)
    {
      if (v27)
        (*(void (**)(void))(*(_QWORD *)v27 + 24))();
      v27 = v15;
      (*(void (**)(HGNode *))(*(_QWORD *)v15 + 16))(v15);
    }
    goto LABEL_43;
  }
  v17 = objc_msgSend(a4, "colorSpace");
  if (whichFilter > 15)
    PCColorSpaceHandle::PCColorSpaceHandle((PCColorSpaceHandle *)&v23, (CFStringRef)*MEMORY[0x1E0C9D908]);
  else
    PCColorSpaceCache::sRGB(&v23);
  if (v15)
    (*(void (**)(HGNode *))(*(_QWORD *)v15 + 16))(v15);
  CGColorSpace = PCColorSpaceHandle::getCGColorSpace((PCColorSpaceHandle *)&v23);
  FxApplyColorConform(&v27, v17, 1, CGColorSpace, 0);
  (*(void (**)(HGNode *, _QWORD, HGNode *))(*(_QWORD *)v15 + 120))(v15, 0, v22);
  if (v22 != v15)
  {
    if (v22)
      (*(void (**)(void))(*(_QWORD *)v22 + 24))();
    v22 = v15;
    (*(void (**)(HGNode *))(*(_QWORD *)v15 + 16))(v15);
  }
  FxApplyColorConform(&v22, CGColorSpace, 0, v17, 1);
  v19 = (HGNode *)v29;
  if (v22 != (HGNode *)v29)
  {
    if (v22)
    {
      (*(void (**)(HGNode *))(*(_QWORD *)v22 + 24))(v22);
      v19 = (HGNode *)v29;
    }
    v22 = v19;
LABEL_34:
    v20 = v27;
    if (v27 == v19)
    {
      if (v19)
        (*(void (**)(HGNode *))(*(_QWORD *)v19 + 24))(v19);
      goto LABEL_42;
    }
    if (!v27)
      goto LABEL_41;
    goto LABEL_40;
  }
  if (v22)
  {
    (*(void (**)(HGNode *))(*(_QWORD *)v22 + 24))(v22);
    v19 = v22;
    goto LABEL_34;
  }
  v20 = v27;
  if (v27)
  {
LABEL_40:
    (*(void (**)(HGNode *))(*(_QWORD *)v20 + 24))(v20);
    v19 = v22;
LABEL_41:
    v27 = v19;
    v22 = 0;
  }
LABEL_42:
  (*(void (**)(HGNode *))(*(_QWORD *)v15 + 24))(v15);
  PCCFRef<CGColorSpace *>::~PCCFRef(&v23);
LABEL_43:
  objc_msgSend(a3, "setHeliumRef:", &v27);
  (*(void (**)(HGNode *))(*(_QWORD *)v15 + 24))(v15);
  if (v13)
    (*(void (**)(HGBitmap *))(*(_QWORD *)v13 + 24))(v13);
  if (v27)
    (*(void (**)(HGNode *))(*(_QWORD *)v27 + 24))(v27);
  return v10 != 0;
}

- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6
{
  __int128 v6;
  _OWORD v8[3];

  v6 = *(_OWORD *)&a3->var2;
  v8[0] = *(_OWORD *)&a3->var0.var0;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&a3->var4;
  -[PAESharedDefaultBase overrideFrameSetupForRenderMode:hardware:software:](self, "overrideFrameSetupForRenderMode:hardware:software:", v8, a5, a6);
  return 1;
}

- (void).cxx_destruct
{
  PCMutex::~PCMutex(&self->cacheMutex);
}

- (id).cxx_construct
{
  PCMutex::PCMutex(&self->cacheMutex);
  return self;
}

@end

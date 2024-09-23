@implementation TRIPBEnumDescriptor

- (void)enumVerifier
{
  return self->enumVerifier_;
}

+ (id)allocDescriptorForName:(id)a3 valueNames:(const char *)a4 values:(const int *)a5 count:(unsigned int)a6 enumVerifier:(void *)a7 extraTextFormatInfo:(const char *)a8
{
  id result;

  result = (id)objc_msgSend(a1, "allocDescriptorForName:valueNames:values:count:enumVerifier:", a3, a4, a5, *(_QWORD *)&a6, a7);
  *((_QWORD *)result + 5) = a8;
  return result;
}

- (TRIPBEnumDescriptor)initWithName:(id)a3 valueNames:(const char *)a4 values:(const int *)a5 count:(unsigned int)a6 enumVerifier:(void *)a7
{
  TRIPBEnumDescriptor *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TRIPBEnumDescriptor;
  v12 = -[TRIPBEnumDescriptor init](&v14, sel_init);
  if (v12)
  {
    v12->name_ = (NSString *)objc_msgSend(a3, "copy");
    v12->valueNames_ = a4;
    v12->valueCount_ = a6;
    v12->values_ = a5;
    v12->enumVerifier_ = a7;
  }
  return v12;
}

+ (id)allocDescriptorForName:(id)a3 valueNames:(const char *)a4 values:(const int *)a5 count:(unsigned int)a6 enumVerifier:(void *)a7
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithName:valueNames:values:count:enumVerifier:", a3, a4, a5, *(_QWORD *)&a6, a7);
}

- (BOOL)getValue:(int *)a3 forEnumTextFormatName:(id)a4
{
  TRIPBEnumDescriptor *v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;

  v6 = self;
  if (!self->nameOffsets_)
    self = (TRIPBEnumDescriptor *)-[TRIPBEnumDescriptor calcValueNameOffsets](self, "calcValueNameOffsets");
  if (!v6->valueCount_)
    return 0;
  v7 = 0;
  while (1)
  {
    v8 = (void *)MEMORY[0x1940233A4](self, a2);
    v9 = v6->values_[v7];
    if (objc_msgSend(-[TRIPBEnumDescriptor textFormatNameForValue:](v6, "textFormatNameForValue:", v9), "isEqual:", a4))break;
    objc_autoreleasePoolPop(v8);
    if (++v7 >= (unint64_t)v6->valueCount_)
      return 0;
  }
  if (a3)
    *a3 = v9;
  objc_autoreleasePoolPop(v8);
  return 1;
}

- (id)textFormatNameForValue:(int)a3
{
  uint64_t valueCount;
  uint64_t v6;
  id result;
  __CFString *v8;
  char *extraTextFormatInfo;
  uint64_t v10;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  UniChar v20;
  BOOL v21;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  int64_t v27;
  uint64_t v28;
  _WORD *v29;
  _WORD *v30;
  uint64_t v31;
  int64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int64_t v36;
  UniChar v37;
  int64_t v38;
  uint64_t v40;
  uint64_t v41;
  int64_t v42;
  int64_t v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  CFStringRef theString;
  const UniChar *v54;
  const char *v55;
  uint64_t v56;
  int64_t v57;
  int64_t v58;
  int64_t v59;
  CFRange v60;
  CFRange v61;

  if (!self->nameOffsets_)
    -[TRIPBEnumDescriptor calcValueNameOffsets](self, "calcValueNameOffsets");
  valueCount = self->valueCount_;
  if (!(_DWORD)valueCount)
    return 0;
  v6 = 0;
  while (self->values_[v6] != a3)
  {
    if (valueCount == ++v6)
      return 0;
  }
  v8 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", &self->valueNames_[self->nameOffsets_[v6]]);
  extraTextFormatInfo = (char *)self->extraTextFormatInfo_;
  if (!extraTextFormatInfo || (result = (id)TRIPBDecodeTextFormatName(extraTextFormatInfo, v6, v8)) == 0)
  {
    v10 = -[__CFString length](v8, "length");
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    theString = v8;
    v56 = 0;
    v57 = v10;
    CharactersPtr = CFStringGetCharactersPtr(v8);
    CStringPtr = 0;
    v54 = CharactersPtr;
    if (!CharactersPtr)
      CStringPtr = CFStringGetCStringPtr(v8, 0x600u);
    v58 = 0;
    v59 = 0;
    v55 = CStringPtr;
    if (v10 < 1)
    {
      v16 = 0;
    }
    else
    {
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 64;
      do
      {
        if ((unint64_t)v15 >= 4)
          v18 = 4;
        else
          v18 = v15;
        v19 = v57;
        if (v57 <= v15)
        {
          v20 = 0;
        }
        else if (v54)
        {
          v20 = v54[v15 + v56];
        }
        else if (v55)
        {
          v20 = v55[v56 + v15];
        }
        else
        {
          if (v59 <= v15 || v14 > v15)
          {
            v24 = v18 + v13;
            v25 = v17 - v18;
            v26 = v15 - v18;
            v27 = v26 + 64;
            if (v26 + 64 >= v57)
              v27 = v57;
            v58 = v26;
            v59 = v27;
            if (v57 >= v25)
              v19 = v25;
            v60.length = v19 + v24;
            v60.location = v26 + v56;
            CFStringGetCharacters(theString, v60, (UniChar *)&v45);
            v14 = v58;
          }
          v20 = *((_WORD *)&v45 + v15 - v14);
        }
        if (v15)
          v21 = v20 > 0x40u;
        else
          v21 = 0;
        if (v21 && v20 < 0x5Bu)
          ++v16;
        ++v15;
        --v13;
        ++v17;
      }
      while (v10 != v15);
    }
    v28 = v16 + v10;
    v29 = malloc_type_malloc(2 * v28, 0x1000040BDFB0063uLL);
    if (v29)
    {
      v30 = v29;
      if (v10 >= 1)
      {
        v31 = 0;
        v32 = 0;
        v33 = 0;
        v34 = 64;
        do
        {
          if ((unint64_t)v32 >= 4)
            v35 = 4;
          else
            v35 = v32;
          v36 = v57;
          if (v57 <= v32)
          {
            LOBYTE(v37) = 0;
          }
          else if (v54)
          {
            v37 = v54[v32 + v56];
            if (v32)
              goto LABEL_69;
          }
          else
          {
            if (!v55)
            {
              v38 = v58;
              if (v59 <= v32 || v58 > v32)
              {
                v40 = v35 + v31;
                v41 = v34 - v35;
                v42 = v32 - v35;
                v43 = v42 + 64;
                if (v42 + 64 >= v57)
                  v43 = v57;
                v58 = v42;
                v59 = v43;
                if (v57 >= v41)
                  v36 = v41;
                v61.length = v36 + v40;
                v61.location = v42 + v56;
                CFStringGetCharacters(theString, v61, (UniChar *)&v45);
                v38 = v58;
              }
              v37 = *((_WORD *)&v45 + v32 - v38);
              if (!v32)
                goto LABEL_72;
LABEL_69:
              if (v37 >= 0x41u && v37 <= 0x5Au)
                v30[v33++] = 95;
              goto LABEL_72;
            }
            v37 = v55[v56 + v32];
            if (v32)
              goto LABEL_69;
          }
LABEL_72:
          v30[v33++] = __toupper((char)v37);
          ++v32;
          --v31;
          ++v34;
        }
        while (v10 != v32);
      }
      v44 = objc_alloc(MEMORY[0x1E0CB3940]);
      return (id)objc_msgSend(v44, "initWithCharactersNoCopy:length:freeWhenDone:", v30, v28, 1, v45, v46, v47, v48, v49, v50, v51, v52);
    }
    else
    {
      return CFSTR("UNKNOWN_MALLOC_FAILURE");
    }
  }
  return result;
}

- (void)calcValueNameOffsets
{
  unsigned int *v3;
  unint64_t v4;
  const char *valueNames;
  const char *v6;

  objc_sync_enter(self);
  if (!self->nameOffsets_)
  {
    v3 = (unsigned int *)malloc_type_malloc(4 * self->valueCount_, 0x100004052888210uLL);
    if (self->valueCount_)
    {
      v4 = 0;
      valueNames = self->valueNames_;
      v6 = valueNames;
      do
      {
        v3[v4] = (_DWORD)v6 - (_DWORD)valueNames;
        while (*(unsigned __int8 *)v6++)
          ;
        ++v4;
      }
      while (v4 < self->valueCount_);
    }
    self->nameOffsets_ = v3;
  }
  objc_sync_exit(self);
}

- (void)dealloc
{
  unsigned int *nameOffsets;
  objc_super v4;

  nameOffsets = self->nameOffsets_;
  if (nameOffsets)
    free(nameOffsets);
  v4.receiver = self;
  v4.super_class = (Class)TRIPBEnumDescriptor;
  -[TRIPBEnumDescriptor dealloc](&v4, sel_dealloc);
}

- (id)enumNameForValue:(int)a3
{
  uint64_t valueCount;
  unint64_t v6;
  uint64_t v7;

  if (!self->nameOffsets_)
    -[TRIPBEnumDescriptor calcValueNameOffsets](self, "calcValueNameOffsets");
  valueCount = self->valueCount_;
  if (!(_DWORD)valueCount)
    return 0;
  v6 = 0;
  v7 = 4 * valueCount;
  while (self->values_[v6 / 4] != a3)
  {
    v6 += 4;
    if (v7 == v6)
      return 0;
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%s"), self->name_, &self->valueNames_[self->nameOffsets_[v6 / 4]]);
}

- (BOOL)getValue:(int *)a3 forEnumName:(id)a4
{
  NSUInteger v7;
  NSUInteger v8;
  int v9;
  uint64_t v10;
  uint64_t valueCount;
  unint64_t v12;
  const char *v13;
  const char *valueNames;
  unsigned int *nameOffsets;
  uint64_t v16;

  v7 = -[NSString length](self->name_, "length");
  v8 = v7 + 1;
  if (objc_msgSend(a4, "length") <= v7 + 1)
    goto LABEL_10;
  v9 = objc_msgSend(a4, "hasPrefix:", self->name_);
  if (!v9)
    return v9;
  if (objc_msgSend(a4, "characterAtIndex:", v7) != 95)
    goto LABEL_10;
  v10 = objc_msgSend(a4, "UTF8String");
  if (!self->nameOffsets_)
    -[TRIPBEnumDescriptor calcValueNameOffsets](self, "calcValueNameOffsets");
  valueCount = self->valueCount_;
  if (!(_DWORD)valueCount)
  {
LABEL_10:
    LOBYTE(v9) = 0;
    return v9;
  }
  v12 = 0;
  v13 = (const char *)(v10 + v8);
  valueNames = self->valueNames_;
  nameOffsets = self->nameOffsets_;
  v16 = 4 * valueCount;
  while (strcmp(v13, &valueNames[nameOffsets[v12 / 4]]))
  {
    v12 += 4;
    if (v16 == v12)
      goto LABEL_10;
  }
  if (a3)
    *a3 = self->values_[v12 / 4];
  LOBYTE(v9) = 1;
  return v9;
}

- (NSString)name
{
  return self->name_;
}

@end

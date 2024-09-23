@implementation UINibDecoder

- (BOOL)decodeBoolForKey:(id)a3
{
  _BOOL4 v4;
  uint64_t objectID_low;
  UINibDecoderObjectEntry *v6;
  unsigned int var1;
  unsigned int var0;
  uint64_t nextValueSearchIndex;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  UINibDecoderValue *values;
  int v14;
  unsigned __int8 *valueData;
  uint64_t v16;
  uint64_t v18;

  v18 = 0;
  v4 = -[UINibStringIDTable lookupKey:identifier:](self->keyIDTable, "lookupKey:identifier:", a3, &v18);
  if (!v4)
    return v4;
  objectID_low = LODWORD(self->recursiveState.objectID);
  if (((self->keyMasks[objectID_low] >> v18) & 1) == 0)
    goto LABEL_21;
  v6 = &self->objects[objectID_low];
  var0 = v6->var0;
  var1 = v6->var1;
  nextValueSearchIndex = self->recursiveState.nextValueSearchIndex;
  if (nextValueSearchIndex >= var1)
  {
LABEL_7:
    if (!(_DWORD)nextValueSearchIndex)
    {
LABEL_11:
      LOBYTE(v4) = 0;
      if ((int)nextValueSearchIndex + 1 < var1)
        v12 = nextValueSearchIndex + 1;
      else
        v12 = 0;
      self->recursiveState.nextValueSearchIndex = v12;
      return v4;
    }
    v10 = 0;
    while (1)
    {
      v11 = var0 + v10;
      if (self->values[v11].var0 == (_DWORD)v18)
        break;
      if (nextValueSearchIndex == ++v10)
        goto LABEL_11;
    }
  }
  else
  {
    LODWORD(v10) = self->recursiveState.nextValueSearchIndex;
    while (1)
    {
      v11 = var0 + v10;
      if (self->values[v11].var0 == (_DWORD)v18)
        break;
      LODWORD(v10) = v10 + 1;
      if (var1 == (_DWORD)v10)
        goto LABEL_7;
    }
  }
  self->recursiveState.nextValueSearchIndex = v10;
  values = self->values;
  if (!values)
    goto LABEL_21;
  v14 = self->valueTypes[v11];
  if (v14 == 5)
  {
    LOBYTE(v4) = 1;
    return v4;
  }
  if (v14 == 4 || (char)v14 > 3)
  {
LABEL_21:
    LOBYTE(v4) = 0;
    return v4;
  }
  valueData = (unsigned __int8 *)self->valueData;
  switch(self->valueTypes[v11])
  {
    case 0:
      v16 = valueData[values[v11].var1];
      break;
    case 1:
      v16 = *(unsigned __int16 *)&valueData[values[v11].var1];
      break;
    case 2:
      v16 = *(unsigned int *)&valueData[values[v11].var1];
      break;
    case 3:
      v16 = *(_QWORD *)&valueData[values[v11].var1];
      break;
    default:
      v16 = 0;
      break;
  }
  LOBYTE(v4) = v16 != 0;
  return v4;
}

- (BOOL)containsValueForKey:(id)a3
{
  _BOOL4 v4;
  uint64_t objectID_low;
  UINibDecoderObjectEntry *v6;
  unsigned int var1;
  unsigned int var0;
  uint64_t nextValueSearchIndex;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  UINibDecoderValue *v13;
  unsigned int v14;
  uint64_t v16;

  v16 = 0;
  v4 = -[UINibStringIDTable lookupKey:identifier:](self->keyIDTable, "lookupKey:identifier:", a3, &v16);
  if (v4)
  {
    objectID_low = LODWORD(self->recursiveState.objectID);
    if (((self->keyMasks[objectID_low] >> v16) & 1) != 0)
    {
      v6 = &self->objects[objectID_low];
      var0 = v6->var0;
      var1 = v6->var1;
      nextValueSearchIndex = self->recursiveState.nextValueSearchIndex;
      if (nextValueSearchIndex >= var1)
      {
LABEL_7:
        if (!(_DWORD)nextValueSearchIndex)
        {
LABEL_11:
          v13 = 0;
          if ((int)nextValueSearchIndex + 1 < var1)
            v14 = nextValueSearchIndex + 1;
          else
            v14 = 0;
          self->recursiveState.nextValueSearchIndex = v14;
          goto LABEL_19;
        }
        v12 = 0;
        while (1)
        {
          v11 = var0 + v12;
          if (self->values[v11].var0 == (_DWORD)v16)
            break;
          if (nextValueSearchIndex == ++v12)
            goto LABEL_11;
        }
        self->recursiveState.nextValueSearchIndex = v12;
      }
      else
      {
        v10 = self->recursiveState.nextValueSearchIndex;
        while (1)
        {
          v11 = var0 + v10;
          if (self->values[v11].var0 == (_DWORD)v16)
            break;
          if (var1 == ++v10)
            goto LABEL_7;
        }
        self->recursiveState.nextValueSearchIndex = v10;
      }
      v13 = &self->values[v11];
    }
    else
    {
      v13 = 0;
    }
LABEL_19:
    LOBYTE(v4) = v13 != 0;
  }
  return v4;
}

- (id)decodeObjectForKey:(id)a3
{
  _BOOL4 v4;
  id result;
  uint64_t objectID_low;
  UINibDecoderObjectEntry *v7;
  unsigned int var1;
  unsigned int var0;
  uint64_t nextValueSearchIndex;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  UINibDecoderValue *values;
  uint64_t v15;

  v15 = 0;
  v4 = -[UINibStringIDTable lookupKey:identifier:](self->keyIDTable, "lookupKey:identifier:", a3, &v15);
  result = 0;
  if (v4)
  {
    objectID_low = LODWORD(self->recursiveState.objectID);
    if (((self->keyMasks[objectID_low] >> v15) & 1) == 0)
      return 0;
    v7 = &self->objects[objectID_low];
    var0 = v7->var0;
    var1 = v7->var1;
    nextValueSearchIndex = self->recursiveState.nextValueSearchIndex;
    if (nextValueSearchIndex < var1)
    {
      LODWORD(v11) = self->recursiveState.nextValueSearchIndex;
      while (1)
      {
        v12 = var0 + v11;
        if (self->values[v12].var0 == (_DWORD)v15)
          break;
        LODWORD(v11) = v11 + 1;
        if (var1 == (_DWORD)v11)
          goto LABEL_7;
      }
LABEL_15:
      self->recursiveState.nextValueSearchIndex = v11;
      values = self->values;
      if (values)
      {
        UINibDecoderDecodeObjectForValue((uint64_t)self, (uint64_t)&values[v12], self->valueTypes[v12]);
        return result;
      }
      return 0;
    }
LABEL_7:
    if ((_DWORD)nextValueSearchIndex)
    {
      v11 = 0;
      do
      {
        v12 = var0 + v11;
        if (self->values[v12].var0 == (_DWORD)v15)
          goto LABEL_15;
      }
      while (nextValueSearchIndex != ++v11);
    }
    result = 0;
    if ((int)nextValueSearchIndex + 1 < var1)
      v13 = nextValueSearchIndex + 1;
    else
      v13 = 0;
    self->recursiveState.nextValueSearchIndex = v13;
  }
  return result;
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (CGRect)decodeCGRectForKey:(id)a3
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  _QWORD v8[5];
  CGRect result;

  v8[4] = *MEMORY[0x1E0C80C00];
  v3 = -[UINibDecoder decodeArrayOfCGFloats:count:forKey:](self, "decodeArrayOfCGFloats:count:forKey:", v8, 4, a3);
  v4 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  if (v3)
  {
    v7 = *(double *)v8;
    v6 = *(double *)&v8[1];
    v5 = *(double *)&v8[2];
    v4 = *(double *)&v8[3];
  }
  result.size.height = v4;
  result.size.width = v5;
  result.origin.y = v6;
  result.origin.x = v7;
  return result;
}

- (id)initForReadingWithData:(id)a3 error:(id *)a4
{
  UINibDecoder *v6;
  UINibDecoder *v7;
  objc_super v9;
  void *v10;

  v9.receiver = self;
  v9.super_class = (Class)UINibDecoder;
  v10 = 0;
  v6 = -[UINibDecoder init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    if (a3 && -[UINibDecoder validateAndIndexData:error:](v6, "validateAndIndexData:error:", a3, &v10))
    {
      v7->recursiveState.objectID = 0;
      v7->valueCache.previousKey = -[UINibStringIDTable count](v7->keyIDTable, "count") + 1;
      if (!-[UINibStringIDTable lookupKey:identifier:](v7->keyIDTable, "lookupKey:identifier:", CFSTR("NSInlinedValue"), &v7->inlinedValueKey))v7->inlinedValueKey = -[UINibStringIDTable count](v7->keyIDTable, "count") + 1;
      v7->arrayClass = (Class)objc_opt_class();
      v7->setClass = (Class)objc_opt_class();
      v7->dictionaryClass = (Class)objc_opt_class();
    }
    else
    {

      v7 = 0;
    }
  }
  if (a4)
    *a4 = v10;
  return v7;
}

- (BOOL)validateAndIndexData:(id)a3 error:(id *)a4
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  const __CFString *v11;
  _BOOL4 v12;
  const __CFString *v13;
  unint64_t v15;

  v7 = objc_msgSend(a3, "bytes");
  v8 = objc_msgSend(a3, "length");
  if (v8 < 0xA)
    goto LABEL_16;
  v9 = *(_QWORD *)v7;
  *(_WORD *)&self->header.type[8] = *(_WORD *)(v7 + 8);
  *(_QWORD *)self->header.type = v9;
  if (v8 - 14 > 0xFFFFFFFFFFFFFFFBLL)
    goto LABEL_16;
  self->header.formatVersion = *(_DWORD *)(v7 + 10);
  if (v8 < 0x12)
    goto LABEL_16;
  self->header.coderVersion = *(_DWORD *)(v7 + 14);
  if (v8 - 22 > 0xFFFFFFFFFFFFFFFBLL)
    goto LABEL_16;
  self->header.objects.count = *(_DWORD *)(v7 + 18);
  if (v8 < 0x1A)
    goto LABEL_16;
  self->header.objects.offset = *(_DWORD *)(v7 + 22);
  if (v8 - 30 > 0xFFFFFFFFFFFFFFFBLL)
    goto LABEL_16;
  self->header.keys.count = *(_DWORD *)(v7 + 26);
  if (v8 < 0x22)
    goto LABEL_16;
  self->header.keys.offset = *(_DWORD *)(v7 + 30);
  if (v8 - 38 > 0xFFFFFFFFFFFFFFFBLL)
    goto LABEL_16;
  self->header.values.count = *(_DWORD *)(v7 + 34);
  if (v8 < 0x2A)
    goto LABEL_16;
  self->header.values.offset = *(_DWORD *)(v7 + 38);
  if (v8 - 46 > 0xFFFFFFFFFFFFFFFBLL)
    goto LABEL_16;
  self->header.classes.count = *(_DWORD *)(v7 + 42);
  if (v8 < 0x32)
    goto LABEL_16;
  self->header.classes.offset = *(_DWORD *)(v7 + 46);
  if (*(_QWORD *)self->header.type == 0x696863724142494ELL && *(_WORD *)&self->header.type[8] == 25974)
  {
    if (self->header.formatVersion <= 1)
    {
      v15 = v8;
      if (-[UINibDecoder validateAndIndexClasses:length:](self, "validateAndIndexClasses:length:", v7, v8))
      {
        if (-[UINibDecoder validateAndIndexKeys:length:](self, "validateAndIndexKeys:length:", v7, v15))
        {
          if (-[UINibDecoder validateAndIndexValues:length:](self, "validateAndIndexValues:length:", v7, v15))
          {
            v12 = -[UINibDecoder validateAndIndexObjects:length:](self, "validateAndIndexObjects:length:", v7, v15);
            v11 = CFSTR("The object data is invalid.");
            if (v12)
              v11 = 0;
          }
          else
          {
            LOBYTE(v12) = 0;
            v11 = CFSTR("The value data is invalid.");
          }
        }
        else
        {
          LOBYTE(v12) = 0;
          v11 = CFSTR("The key data is invalid.");
        }
      }
      else
      {
        LOBYTE(v12) = 0;
        v11 = CFSTR("The class data is invalid.");
      }
    }
    else
    {
      LOBYTE(v12) = 0;
      v11 = CFSTR("The NIB data is too new for this version of iOS.");
    }
  }
  else
  {
LABEL_16:
    v11 = 0;
    LOBYTE(v12) = 0;
  }
  if (a4 && !v12)
  {
    if (v11)
      v13 = v11;
    else
      v13 = CFSTR("The NIB data is invalid.");
    *a4 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 0, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v13, *MEMORY[0x1E0CB2D50]));
  }
  return v12;
}

- (CGPoint)decodeCGPointForKey:(id)a3
{
  _BOOL4 v3;
  double v4;
  double v5;
  _QWORD v6[3];
  CGPoint result;

  v6[2] = *MEMORY[0x1E0C80C00];
  v3 = -[UINibDecoder decodeArrayOfCGFloats:count:forKey:](self, "decodeArrayOfCGFloats:count:forKey:", v6, 2, a3);
  v4 = *(double *)v6;
  v5 = *(double *)&v6[1];
  if (!v3)
  {
    v5 = 0.0;
    v4 = 0.0;
  }
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGAffineTransform)decodeCGAffineTransformForKey:(SEL)a3
{
  CGAffineTransform *result;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  _OWORD v10[3];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  result = (CGAffineTransform *)-[UINibDecoder decodeArrayOfCGFloats:count:forKey:](self, "decodeArrayOfCGFloats:count:forKey:", v10, 6, a4);
  if ((_DWORD)result)
  {
    v6 = v10[1];
    *(_OWORD *)&retstr->a = v10[0];
    *(_OWORD *)&retstr->c = v6;
    v7 = v10[2];
  }
  else
  {
    v8 = MEMORY[0x1E0C9BAA8];
    v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&retstr->c = v9;
    v7 = *(_OWORD *)(v8 + 32);
  }
  *(_OWORD *)&retstr->tx = v7;
  return result;
}

- (UIEdgeInsets)decodeUIEdgeInsetsForKey:(id)a3
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  _QWORD v8[5];
  UIEdgeInsets result;

  v8[4] = *MEMORY[0x1E0C80C00];
  v3 = -[UINibDecoder decodeArrayOfCGFloats:count:forKey:](self, "decodeArrayOfCGFloats:count:forKey:", v8, 4, a3);
  v4 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  if (v3)
  {
    v7 = *(double *)v8;
    v6 = *(double *)&v8[1];
    v5 = *(double *)&v8[2];
    v4 = *(double *)&v8[3];
  }
  result.right = v4;
  result.bottom = v5;
  result.left = v6;
  result.top = v7;
  return result;
}

- (BOOL)decodeArrayOfCGFloats:(double *)a3 count:(int64_t)a4 forKey:(id)a5
{
  const char *v7;
  BOOL v8;
  unint64_t v9;
  int v10;
  unint64_t v11;
  float v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v16;

  v16 = 0;
  v7 = -[UINibDecoder decodeBytesForKey:returnedLength:](self, "decodeBytesForKey:returnedLength:", a5, &v16);
  v8 = 0;
  if (v7)
  {
    v9 = v16;
    if (v16)
    {
      v10 = *(unsigned __int8 *)v7;
      if (v10 == 7)
      {
        if (v16 - 1 == 8 * a4)
        {
          if (a4 >= 1)
          {
            v13 = 1;
            do
            {
              v14 = 0;
              if (v9 >= v13 && v9 - v13 >= 8)
              {
                v14 = *(_QWORD *)&v7[v13];
                v13 += 8;
              }
              *(_QWORD *)a3++ = v14;
              --a4;
            }
            while (a4);
          }
          return 1;
        }
      }
      else if (v10 == 6 && v16 - 1 == 4 * a4)
      {
        if (a4 >= 1)
        {
          v11 = 1;
          do
          {
            v12 = 0.0;
            if (v9 >= v11 && v9 - v11 >= 4)
            {
              v12 = *(float *)&v7[v11];
              v11 += 4;
            }
            *a3++ = v12;
            --a4;
          }
          while (a4);
        }
        return 1;
      }
      return 0;
    }
  }
  return v8;
}

- (const)decodeBytesForKey:(id)a3 returnedLength:(unint64_t *)a4
{
  _BOOL4 v6;
  const char *result;
  uint64_t objectID_low;
  UINibDecoderObjectEntry *v9;
  unsigned int var1;
  unsigned int var0;
  uint64_t nextValueSearchIndex;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  UINibDecoderValue *values;
  BOOL v17;
  char *valueData;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;

  v21 = 0;
  v20 = 0;
  v6 = -[UINibStringIDTable lookupKey:identifier:](self->keyIDTable, "lookupKey:identifier:", a3, &v20);
  result = 0;
  if (!v6)
  {
LABEL_21:
    if (!a4)
      return result;
    goto LABEL_22;
  }
  objectID_low = LODWORD(self->recursiveState.objectID);
  if (((self->keyMasks[objectID_low] >> v20) & 1) == 0)
  {
LABEL_20:
    result = 0;
    goto LABEL_21;
  }
  v9 = &self->objects[objectID_low];
  var0 = v9->var0;
  var1 = v9->var1;
  nextValueSearchIndex = self->recursiveState.nextValueSearchIndex;
  if (nextValueSearchIndex < var1)
  {
    LODWORD(v13) = self->recursiveState.nextValueSearchIndex;
    do
    {
      v14 = var0 + v13;
      if (self->values[v14].var0 == (_DWORD)v20)
        goto LABEL_16;
      LODWORD(v13) = v13 + 1;
    }
    while (var1 != (_DWORD)v13);
  }
  if ((_DWORD)nextValueSearchIndex)
  {
    v13 = 0;
    while (1)
    {
      v14 = var0 + v13;
      if (self->values[v14].var0 == (_DWORD)v20)
        break;
      if (nextValueSearchIndex == ++v13)
        goto LABEL_11;
    }
LABEL_16:
    self->recursiveState.nextValueSearchIndex = v13;
    values = self->values;
    if (values)
      v17 = self->valueTypes[v14] == 8;
    else
      v17 = 0;
    if (!v17)
      goto LABEL_20;
    v19 = values[v14].var1;
    valueData = (char *)self->valueData;
    UIReadNibArchiveVInt32((uint64_t)valueData, self->valueDataSize, &v19, (int *)&v21);
    result = &valueData[v19];
    if (!a4)
      return result;
LABEL_22:
    *a4 = v21;
    return result;
  }
LABEL_11:
  result = 0;
  if ((int)nextValueSearchIndex + 1 < var1)
    v15 = nextValueSearchIndex + 1;
  else
    v15 = 0;
  self->recursiveState.nextValueSearchIndex = v15;
  if (a4)
    goto LABEL_22;
  return result;
}

- (BOOL)validateAndIndexClasses:(const void *)a3 length:(unint64_t)a4
{
  UINibDecoderHeader *p_header;
  uint64_t v6;
  BOOL result;
  unint64_t count;
  unint64_t v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  Class *classes;
  Class v21;
  Class v22;
  BOOL v23;
  id v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  int v29;
  unint64_t v30;
  int v31;
  Class *v32;
  uint64_t v33;
  objc_class *v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t offset;

  p_header = &self->header;
  if (self->header.classes.offset > a4)
  {
    v6 = 0;
LABEL_3:
    UIFreeMissingClasses((void **)&self->missingClasses, v6);
    return 0;
  }
  offset = self->header.classes.offset;
  count = self->header.classes.count;
  if (!(_DWORD)count)
    return 1;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v6 = 0;
  do
  {
    v36 = 0;
    if (v11 == v12)
    {
      if ((uint64_t)(v11 + 128) >= (uint64_t)count)
        v12 = count;
      else
        v12 = v11 + 128;
      self->classes = (Class *)malloc_type_realloc(self->classes, 8 * v12, 0x80040B8603338uLL);
      self->missingClasses = (id *)malloc_type_realloc(self->missingClasses, 8 * v12, 0x80040B8603338uLL);
    }
    if (!UIReadNibArchiveVInt32((uint64_t)a3, a4, (uint64_t *)&offset, (int *)&v36 + 1))
      goto LABEL_3;
    if (!UIReadNibArchiveVInt32((uint64_t)a3, a4, (uint64_t *)&offset, (int *)&v36))
      goto LABEL_3;
    if (a4 < offset)
      goto LABEL_3;
    v14 = 4 * v36;
    if (a4 - offset < v14)
      goto LABEL_3;
    v15 = v14 + offset;
    v16 = a4 - (v14 + offset);
    if (a4 < v15)
      goto LABEL_3;
    if (v16 < HIDWORD(v36))
      goto LABEL_3;
    offset = v15 + HIDWORD(v36);
    if (!HIDWORD(v36))
      goto LABEL_3;
    v17 = (char *)a3 + v15;
    v18 = (HIDWORD(v36) - 1);
    if (*((_BYTE *)a3 + v15 + v18))
      goto LABEL_3;
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v17, v18, 4);
    if (v19)
    {
      self->classes[v11] = (Class)objc_msgSend(MEMORY[0x1E0CB3710], "classForClassName:", v19);
      classes = self->classes;
      v21 = classes[v11];
      if (!v21)
      {
        v21 = objc_lookUpClass(v17);
        classes = self->classes;
      }
      classes[v11] = v21;
      v22 = self->classes[v11];
      v23 = v22 == 0;
      if (v22)
        v24 = 0;
      else
        v24 = v19;
      v13 |= v23;
      self->missingClasses[v11] = v24;
      v6 = v11 + 1;
    }

    count = p_header->classes.count;
    if (!v19)
      break;
    ++v11;
  }
  while (v11 < count);
  if (!v19)
    goto LABEL_3;
  if ((v13 & 1) == 0)
    return 1;
  v25 = p_header->classes.offset;
  result = v25 <= a4;
  if (v25 > a4)
    v26 = 0;
  else
    v26 = p_header->classes.offset;
  offset = v26;
  if (count && v25 <= a4)
  {
    v27 = 0;
    while (1)
    {
      v36 = 0;
      if (!UIReadNibArchiveVInt32((uint64_t)a3, a4, (uint64_t *)&offset, (int *)&v36 + 1))
        return 0;
      v28 = UIReadNibArchiveVInt32((uint64_t)a3, a4, (uint64_t *)&offset, (int *)&v36);
      v29 = v36;
      v30 = offset;
      v31 = 0;
      if ((_DWORD)v36)
        break;
LABEL_50:
      if ((v28 & 1) == 0)
        return 0;
      if (a4 < v30)
        return 0;
      v35 = 4 * (v29 - v31);
      if (a4 - v30 < v35 || a4 < v30 + v35 || a4 - (v30 + v35) < HIDWORD(v36))
        return 0;
      offset = v30 + v35 + HIDWORD(v36);
      ++v27;
      result = 1;
      if (v27 >= p_header->classes.count)
        return result;
    }
    while (1)
    {
      v32 = self->classes;
      if (v32[v27])
        goto LABEL_50;
      if ((v28 & 1) != 0)
      {
        v28 = 0;
        if (a4 < v30 || a4 - v30 < 4)
          goto LABEL_48;
        v33 = *(unsigned int *)((char *)a3 + v30);
        v30 += 4;
        if (v33 < p_header->classes.count)
        {
          v34 = v32[v33];
          if (v34)
          {
            v32[v27] = v34;

            self->missingClasses[v27] = 0;
          }
          v28 = 1;
          goto LABEL_48;
        }
      }
      v28 = 0;
LABEL_48:
      if (v29 == ++v31)
      {
        v31 = v29;
        goto LABEL_50;
      }
    }
  }
  return result;
}

- (BOOL)validateAndIndexKeys:(const void *)a3 length:(unint64_t)a4
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  BOOL v12;
  uint64_t v13;
  _BYTE *v14;
  _BYTE *v15;
  BOOL v16;
  BOOL v17;
  uint64_t v18;
  unint64_t v20;
  uint64_t v21;
  unsigned int v23;
  unint64_t v24;
  _BYTE v25[2048];
  _BYTE v26[2048];
  uint64_t v27;

  v4 = ((uint64_t (*)(UINibDecoder *, SEL, const void *, unint64_t))MEMORY[0x1E0C80A78])(self, a2, a3, a4);
  v6 = v5;
  v8 = v7;
  v9 = v4;
  v27 = *MEMORY[0x1E0C80C00];
  v24 = 0;
  v10 = v4 + 88;
  v11 = *(unsigned int *)(v4 + 120);
  v12 = v11 <= v5;
  if (v11 <= v5)
    v24 = *(unsigned int *)(v4 + 120);
  v13 = *(unsigned int *)(v4 + 116);
  if (v13 <= 0x100)
  {
    v15 = v25;
    v14 = v26;
  }
  else
  {
    v14 = malloc_type_malloc(8 * v13, 0x80040B8603338uLL);
    v13 = *(unsigned int *)(v10 + 28);
    if (v13 < 0x101)
    {
      v15 = v25;
    }
    else
    {
      v15 = malloc_type_malloc(8 * v13, 0x100004000313F17uLL);
      LODWORD(v13) = *(_DWORD *)(v10 + 28);
    }
  }
  bzero(v14, 8 * v13);
  if (*(_DWORD *)(v10 + 28))
    v16 = v11 > v6;
  else
    v16 = 1;
  if (v16)
  {
LABEL_13:
    if (v12)
    {
      *(_QWORD *)(v9 + 208) = -[UINibStringIDTable initWithKeysTransferingOwnership:count:]([UINibStringIDTable alloc], "initWithKeysTransferingOwnership:count:", v14, *(unsigned int *)(v10 + 28));
      v17 = 1;
      goto LABEL_25;
    }
  }
  else
  {
    v18 = 0;
    while (1)
    {
      v23 = 0;
      if (!UIReadNibArchiveVInt32(v8, v6, (uint64_t *)&v24, (int *)&v23))
        break;
      if (v6 < v24 || v6 - v24 < v23)
        break;
      v20 = v8 + v24;
      v24 += v23;
      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v20, v23, 4);
      *(_QWORD *)&v14[8 * v18] = v21;
      v12 = v21 != 0;
      *(_QWORD *)&v15[8 * v18] = v18;
      if (++v18 >= (unint64_t)*(unsigned int *)(v10 + 28) || !v21)
        goto LABEL_13;
    }
  }
  v17 = 0;
LABEL_25:
  if (v14 != v26)
    free(v14);
  if (v15 != v25)
    free(v15);
  return v17;
}

- (BOOL)validateAndIndexObjects:(const void *)a3 length:(unint64_t)a4
{
  UINibDecoderHeader *p_header;
  size_t count;
  const void *v9;
  size_t v10;
  int64_t v11;
  unint64_t v12;
  size_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *longObjectClassIDs;
  size_t v18;
  size_t v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  char *shortObjectClassIDs;
  int *v24;
  uint64_t v25;
  int v26;
  unsigned int *keyMasks;
  UINibDecoderValue *values;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  size_t v33;
  unsigned int v34;
  unsigned int v36;
  uint64_t offset;

  if (!self->keyIDTable || !self->values || !self->classes)
    -[UINibDecoder validateAndIndexObjects:length:].cold.1();
  p_header = &self->header;
  if (self->header.objects.offset > a4)
    return 0;
  offset = self->header.objects.offset;
  count = self->header.objects.count;
  if ((_DWORD)count)
  {
    v9 = a3;
    v10 = 0;
    v11 = 0;
    v12 = 0x1EE06F000uLL;
    while (1)
    {
      if (v11 == v10)
      {
        if ((uint64_t)(v10 + 128) >= (uint64_t)count)
          v13 = count;
        else
          v13 = v10 + 128;
        v14 = v12;
        v15 = *(int *)(v12 + 1348);
        *(Class *)((char *)&self->super.super.isa + v15) = (Class)malloc_type_realloc(*(void **)((char *)&self->super.super.isa + v15), 8 * v13, 0x100004000313F17uLL);
        if (self->header.classes.count > 0xFF)
        {
          v18 = v13;
          v16 = 152;
          longObjectClassIDs = self->longObjectClassIDs;
          v19 = 4 * v13;
          v20 = 1384677904;
        }
        else
        {
          v16 = 160;
          longObjectClassIDs = self->shortObjectClassIDs;
          v18 = v13;
          v19 = v13;
          v20 = 2004306212;
        }
        *(Class *)((char *)&self->super.super.isa + v16) = (Class)malloc_type_realloc(longObjectClassIDs, v19, v20 | 0x100004000000000);
        self->keyMasks = (unsigned int *)malloc_type_realloc(self->keyMasks, 4 * v13, 0x100004052888210uLL);
        v12 = v14;
        v11 = v18;
        v9 = a3;
      }
      v36 = 0;
      if (!UIReadNibArchiveVInt32((uint64_t)v9, a4, &offset, (int *)&v36))
        return 0;
      v21 = *(int *)(v12 + 1348);
      if (!UIReadNibArchiveVInt32((uint64_t)v9, a4, &offset, *(int **)((char *)&self->super.super.isa + v21) + 2 * v10))return 0;
      if (!UIReadNibArchiveVInt32((uint64_t)v9, a4, &offset, *(int **)((char *)&self->super.super.isa + v21) + 2 * v10 + 1))return 0;
      if (v36 >= self->header.classes.count)
        return 0;
      v22 = *(uint64_t *)((char *)&self->super.super.isa + v21);
      if (*(_DWORD *)(v22 + 8 * v10 + 4) + *(_DWORD *)(v22 + 8 * v10) > self->header.values.count)
        return 0;
      shortObjectClassIDs = self->shortObjectClassIDs;
      if (shortObjectClassIDs)
      {
        shortObjectClassIDs[v10] = v36;
        v22 = *(uint64_t *)((char *)&self->super.super.isa + v21);
      }
      else
      {
        self->longObjectClassIDs[v10] = v36;
      }
      v24 = (int *)(v22 + 8 * v10);
      v25 = v24[1];
      if ((_DWORD)v25)
      {
        v26 = *v24;
        keyMasks = self->keyMasks;
        values = self->values;
        v29 = keyMasks[v10];
        do
        {
          v29 |= 1 << values[v26].var0;
          keyMasks[v10] = v29;
          ++v26;
          --v25;
        }
        while (v25);
      }
      ++v10;
      count = self->header.objects.count;
      if (v10 >= count)
      {
        if (!p_header->objects.count)
          goto LABEL_31;
        self->objectsByObjectID = (id *)malloc_type_calloc(count, 8uLL, 0x80040B8603338uLL);
        v30 = self->header.objects.count;
        goto LABEL_32;
      }
    }
  }
  v11 = 0;
LABEL_31:
  v30 = 0;
LABEL_32:
  if (v11 > v30)
  {
    self->objects = (UINibDecoderObjectEntry *)malloc_type_realloc(self->objects, 8 * v30, 0x100004000313F17uLL);
    v31 = 160;
    v32 = self->shortObjectClassIDs;
    if (v32)
    {
      v33 = self->header.objects.count;
      v34 = 2004306212;
    }
    else
    {
      v31 = 152;
      v32 = self->longObjectClassIDs;
      v33 = 4 * self->header.objects.count;
      v34 = 1384677904;
    }
    *(Class *)((char *)&self->super.super.isa + v31) = (Class)malloc_type_realloc(v32, v33, v34 | 0x100004000000000);
    self->keyMasks = (unsigned int *)malloc_type_realloc(self->keyMasks, 4 * self->header.objects.count, 0x100004052888210uLL);
  }
  return 1;
}

- (BOOL)validateAndIndexValues:(const void *)a3 length:(unint64_t)a4
{
  unint64_t v4;
  UINibDecoderHeader *p_header;
  BOOL result;
  int64_t count;
  _BYTE *v9;
  uint64_t v10;
  unint64_t v11;
  size_t v12;
  unint64_t v13;
  int v14;
  uint64_t v15;
  unsigned int v16;
  unsigned int v17;
  unint64_t v18;
  size_t v19;
  UINibDecoderValue *values;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  char *valueData;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  uint64_t v30;
  unint64_t valueDataSize;
  unsigned int v32;
  size_t v33;
  unint64_t v35;
  BOOL v36;
  size_t v37;
  char *v38;
  UINibDecoderHeader *v41;
  unint64_t v42;
  int64_t v44;
  uint64_t v45;
  unsigned int v46;
  unint64_t offset;
  unsigned int __src;
  char v49;

  if (!self->keyIDTable)
    -[UINibDecoder validateAndIndexValues:length:].cold.1();
  v4 = a4;
  p_header = &self->header;
  if (self->header.values.offset > a4)
    return 0;
  offset = self->header.values.offset;
  count = self->header.values.count;
  if (!(_DWORD)count)
    return 1;
  v9 = a3;
  v10 = 0;
  v44 = 0;
  v11 = 0;
  v41 = &self->header;
  while (1)
  {
    if (v44 == v10)
    {
      if (v10 + 128 >= count)
        v12 = count;
      else
        v12 = v10 + 128;
      self->values = (UINibDecoderValue *)malloc_type_realloc(self->values, 8 * v12, 0x100004000313F17uLL);
      v44 = v12;
      self->valueTypes = (char *)malloc_type_realloc(self->valueTypes, v12, 0x100004077774924uLL);
    }
    if ((UIReadNibArchiveVInt32((uint64_t)v9, v4, (uint64_t *)&offset, (int *)&self->values[v10]) & 1) != 0)
    {
      v13 = offset;
      if (offset >= v4)
      {
        v14 = 0;
      }
      else
      {
        self->valueTypes[v10] = v9[offset];
        offset = v13 + 1;
        v14 = 1;
      }
    }
    else
    {
      v14 = 0;
    }
    v15 = UIFixedByteLengthForType(self->valueTypes[v10]);
    result = 0;
    if (!v14 || v15 == -2)
      break;
    v45 = v10;
    v46 = 0;
    if (v15 == -1)
    {
      if (!UIReadNibArchiveVInt32((uint64_t)v9, v4, (uint64_t *)&offset, (int *)&v46))
        return 0;
      v16 = v46;
      v17 = v46;
    }
    else
    {
      v16 = 0;
      v17 = v15;
    }
    v18 = offset;
    if (v4 < offset)
      return 0;
    v19 = v17;
    if (v4 - offset < v17)
      return 0;
    values = self->values;
    offset += v17;
    values[v45].var1 = v11;
    if (v15 == -1)
    {
      v42 = v18;
      v21 = (2 * v16) & 0x7F00 | v16 & 0x7F;
      v22 = v21 | (4 * v16) & 0x7F0000 | (((v16 >> 21) & 0x7F) << 24);
      v23 = v21 | 0x8000;
      v24 = v21 | (((v16 >> 14) & 0x7F) << 16) | 0x800000;
      v25 = v16 | 0x80;
      valueData = (char *)self->valueData;
      if (v16 >= 0x80)
        v25 = v23;
      v27 = 1;
      if (v16 >= 0x80)
        v27 = 2;
      if (v16 < 0x4000)
        v24 = v25;
      v28 = 3;
      if (v16 < 0x4000)
        v28 = v27;
      if (v16 >= 0x200000)
        v29 = v22 | 0x80000000;
      else
        v29 = v24;
      if (v16 >= 0x200000)
        v30 = 4;
      else
        v30 = v28;
      while (1)
      {
        valueDataSize = self->valueDataSize;
        v32 = v29;
        v33 = v30;
        if (v16 >> 28)
        {
          v49 = v16 >> 28;
          v32 = v22;
          v33 = 5;
        }
        __src = v32;
        if (valueDataSize >= v11 && valueDataSize - v11 >= v33)
          break;
        self->valueDataSize = valueDataSize + 512;
        valueData = (char *)malloc_type_realloc(valueData, valueDataSize + 512, 0x4A6A3422uLL);
        self->valueData = valueData;
      }
      memcpy(&valueData[v11], &__src, v33);
      v11 += v33;
      v4 = a4;
      p_header = v41;
      v18 = v42;
    }
    v35 = self->valueDataSize;
    v36 = v35 >= v11;
    v37 = v35 - v11;
    v38 = (char *)self->valueData;
    while (!v36 || v37 < v19)
    {
      self->valueDataSize = v35 + 512;
      v38 = (char *)malloc_type_realloc(v38, v35 + 512, 0xA384DC14uLL);
      self->valueData = v38;
      v35 = self->valueDataSize;
      v36 = v35 >= v11;
      v37 = v35 - v11;
    }
    v9 = a3;
    memcpy(&v38[v11], (char *)a3 + v18, v19);
    v11 += v19;
    v10 = v45 + 1;
    count = p_header->values.count;
    if (v45 + 1 >= (unint64_t)count)
    {
      if (v44 > count)
      {
        self->values = (UINibDecoderValue *)malloc_type_realloc(self->values, 8 * count, 0x100004000313F17uLL);
        self->valueTypes = (char *)malloc_type_realloc(self->valueTypes, p_header->values.count, 0x100004077774924uLL);
      }
      return 1;
    }
  }
  return result;
}

- (int64_t)decodeIntegerForKey:(id)a3
{
  _BOOL4 v4;
  int64_t result;
  uint64_t objectID_low;
  UINibDecoderObjectEntry *v7;
  unsigned int var1;
  unsigned int var0;
  uint64_t nextValueSearchIndex;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  UINibDecoderValue *values;
  int v15;
  unsigned __int8 *valueData;
  uint64_t v17;

  v17 = 0;
  v4 = -[UINibStringIDTable lookupKey:identifier:](self->keyIDTable, "lookupKey:identifier:", a3, &v17);
  result = 0;
  if (!v4)
    return result;
  objectID_low = LODWORD(self->recursiveState.objectID);
  if (((self->keyMasks[objectID_low] >> v17) & 1) == 0)
    return 0;
  v7 = &self->objects[objectID_low];
  var0 = v7->var0;
  var1 = v7->var1;
  nextValueSearchIndex = self->recursiveState.nextValueSearchIndex;
  if (nextValueSearchIndex >= var1)
  {
LABEL_7:
    if (!(_DWORD)nextValueSearchIndex)
    {
LABEL_11:
      result = 0;
      if ((int)nextValueSearchIndex + 1 < var1)
        v13 = nextValueSearchIndex + 1;
      else
        v13 = 0;
      self->recursiveState.nextValueSearchIndex = v13;
      return result;
    }
    v11 = 0;
    while (1)
    {
      v12 = var0 + v11;
      if (self->values[v12].var0 == (_DWORD)v17)
        break;
      if (nextValueSearchIndex == ++v11)
        goto LABEL_11;
    }
  }
  else
  {
    LODWORD(v11) = self->recursiveState.nextValueSearchIndex;
    while (1)
    {
      v12 = var0 + v11;
      if (self->values[v12].var0 == (_DWORD)v17)
        break;
      LODWORD(v11) = v11 + 1;
      if (var1 == (_DWORD)v11)
        goto LABEL_7;
    }
  }
  self->recursiveState.nextValueSearchIndex = v11;
  values = self->values;
  if (!values)
    return 0;
  v15 = self->valueTypes[v12];
  if ((char)v15 > 3)
  {
    if ((v15 & 0xFE) == 4)
      return v15 == 5;
    return 0;
  }
  valueData = (unsigned __int8 *)self->valueData;
  switch(self->valueTypes[v12])
  {
    case 0:
      result = valueData[values[v12].var1];
      break;
    case 1:
      result = *(unsigned __int16 *)&valueData[values[v12].var1];
      break;
    case 2:
      result = *(unsigned int *)&valueData[values[v12].var1];
      break;
    case 3:
      result = *(_QWORD *)&valueData[values[v12].var1];
      break;
    default:
      return 0;
  }
  return result;
}

- (double)decodeDoubleForKey:(id)a3
{
  _BOOL4 v4;
  double result;
  uint64_t objectID_low;
  UINibDecoderObjectEntry *v7;
  unsigned int var1;
  unsigned int var0;
  uint64_t nextValueSearchIndex;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  UINibDecoderValue *values;
  int v15;
  BOOL v16;
  BOOL v17;
  uint64_t v18;

  v18 = 0;
  v4 = -[UINibStringIDTable lookupKey:identifier:](self->keyIDTable, "lookupKey:identifier:", a3, &v18);
  result = 0.0;
  if (!v4)
    return result;
  objectID_low = LODWORD(self->recursiveState.objectID);
  if (((self->keyMasks[objectID_low] >> v18) & 1) == 0)
    return result;
  v7 = &self->objects[objectID_low];
  var0 = v7->var0;
  var1 = v7->var1;
  nextValueSearchIndex = self->recursiveState.nextValueSearchIndex;
  if (nextValueSearchIndex >= var1)
  {
LABEL_7:
    if (!(_DWORD)nextValueSearchIndex)
    {
LABEL_11:
      if ((int)nextValueSearchIndex + 1 < var1)
        v13 = nextValueSearchIndex + 1;
      else
        v13 = 0;
      self->recursiveState.nextValueSearchIndex = v13;
      return result;
    }
    v11 = 0;
    while (1)
    {
      v12 = var0 + v11;
      if (self->values[v12].var0 == (_DWORD)v18)
        break;
      if (nextValueSearchIndex == ++v11)
        goto LABEL_11;
    }
  }
  else
  {
    LODWORD(v11) = self->recursiveState.nextValueSearchIndex;
    while (1)
    {
      v12 = var0 + v11;
      if (self->values[v12].var0 == (_DWORD)v18)
        break;
      LODWORD(v11) = v11 + 1;
      if (var1 == (_DWORD)v11)
        goto LABEL_7;
    }
  }
  self->recursiveState.nextValueSearchIndex = v11;
  values = self->values;
  v15 = self->valueTypes[v12];
  if (values)
    v16 = v15 == 7;
  else
    v16 = 0;
  if (v16)
    return *(double *)((char *)self->valueData + values[v12].var1);
  if (values)
    v17 = v15 == 6;
  else
    v17 = 0;
  if (v17)
    return *(float *)((char *)self->valueData + values[v12].var1);
  return result;
}

- (void)replaceObject:(id)a3 withObject:(id)a4
{
  id *objectsByObjectID;
  int64_t objectID;

  if (a3 != a4)
  {
    objectsByObjectID = self->objectsByObjectID;
    objectID = self->recursiveState.objectID;
    if (objectsByObjectID[objectID] == a3)
    {
      objectsByObjectID[objectID] = a4;
      self->recursiveState.replaced = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("This coder only supports replacing the object currently being decoded."));
    }
  }
}

- (void)finishDecoding
{
  UINibDecoderHeader *p_header;
  unint64_t v4;
  unint64_t count;
  size_t v6;

  p_header = &self->header;
  if (self->header.objects.count)
  {
    v4 = 0;
    do
    {

      count = p_header->objects.count;
    }
    while (v4 < count);
    v6 = 8 * count;
  }
  else
  {
    v6 = 0;
  }
  bzero(self->objectsByObjectID, v6);
  self->recursiveState.nextGenericKey = 0;
  *(_QWORD *)&self->recursiveState.nextValueSearchIndex = 0;
  self->recursiveState.objectID = 0;
}

- (int)decodeIntForKey:(id)a3
{
  _BOOL4 v4;
  uint64_t v5;
  uint64_t objectID_low;
  UINibDecoderObjectEntry *v7;
  unsigned int var1;
  unsigned int var0;
  uint64_t nextValueSearchIndex;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  UINibDecoderValue *values;
  int v15;
  unsigned __int8 *valueData;
  uint64_t v18;

  v18 = 0;
  v4 = -[UINibStringIDTable lookupKey:identifier:](self->keyIDTable, "lookupKey:identifier:", a3, &v18);
  LODWORD(v5) = 0;
  if (!v4)
    return v5;
  objectID_low = LODWORD(self->recursiveState.objectID);
  if (((self->keyMasks[objectID_low] >> v18) & 1) == 0)
    goto LABEL_21;
  v7 = &self->objects[objectID_low];
  var0 = v7->var0;
  var1 = v7->var1;
  nextValueSearchIndex = self->recursiveState.nextValueSearchIndex;
  if (nextValueSearchIndex >= var1)
  {
LABEL_7:
    if (!(_DWORD)nextValueSearchIndex)
    {
LABEL_11:
      LODWORD(v5) = 0;
      if ((int)nextValueSearchIndex + 1 < var1)
        v13 = nextValueSearchIndex + 1;
      else
        v13 = 0;
      self->recursiveState.nextValueSearchIndex = v13;
      return v5;
    }
    v11 = 0;
    while (1)
    {
      v12 = var0 + v11;
      if (self->values[v12].var0 == (_DWORD)v18)
        break;
      if (nextValueSearchIndex == ++v11)
        goto LABEL_11;
    }
  }
  else
  {
    LODWORD(v11) = self->recursiveState.nextValueSearchIndex;
    while (1)
    {
      v12 = var0 + v11;
      if (self->values[v12].var0 == (_DWORD)v18)
        break;
      LODWORD(v11) = v11 + 1;
      if (var1 == (_DWORD)v11)
        goto LABEL_7;
    }
  }
  self->recursiveState.nextValueSearchIndex = v11;
  values = self->values;
  if (!values)
  {
LABEL_21:
    LODWORD(v5) = 0;
    return v5;
  }
  v15 = self->valueTypes[v12];
  if ((char)v15 > 3)
  {
    if ((v15 & 0xFE) == 4)
    {
      LODWORD(v5) = v15 == 5;
      return v5;
    }
    goto LABEL_21;
  }
  valueData = (unsigned __int8 *)self->valueData;
  switch(self->valueTypes[v12])
  {
    case 0:
      LODWORD(v5) = valueData[values[v12].var1];
      break;
    case 1:
      LODWORD(v5) = *(unsigned __int16 *)&valueData[values[v12].var1];
      break;
    case 2:
      LODWORD(v5) = *(_DWORD *)&valueData[values[v12].var1];
      break;
    case 3:
      v5 = *(_QWORD *)&valueData[values[v12].var1];
      break;
    default:
      goto LABEL_21;
  }
  return v5;
}

- (float)decodeFloatForKey:(id)a3
{
  _BOOL4 v4;
  float result;
  uint64_t objectID_low;
  UINibDecoderObjectEntry *v7;
  unsigned int var1;
  unsigned int var0;
  uint64_t nextValueSearchIndex;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  UINibDecoderValue *values;
  int v15;
  BOOL v16;
  BOOL v17;
  uint64_t v18;

  v18 = 0;
  v4 = -[UINibStringIDTable lookupKey:identifier:](self->keyIDTable, "lookupKey:identifier:", a3, &v18);
  result = 0.0;
  if (!v4)
    return result;
  objectID_low = LODWORD(self->recursiveState.objectID);
  if (((self->keyMasks[objectID_low] >> v18) & 1) == 0)
    return result;
  v7 = &self->objects[objectID_low];
  var0 = v7->var0;
  var1 = v7->var1;
  nextValueSearchIndex = self->recursiveState.nextValueSearchIndex;
  if (nextValueSearchIndex >= var1)
  {
LABEL_7:
    if (!(_DWORD)nextValueSearchIndex)
    {
LABEL_11:
      if ((int)nextValueSearchIndex + 1 < var1)
        v13 = nextValueSearchIndex + 1;
      else
        v13 = 0;
      self->recursiveState.nextValueSearchIndex = v13;
      return result;
    }
    v11 = 0;
    while (1)
    {
      v12 = var0 + v11;
      if (self->values[v12].var0 == (_DWORD)v18)
        break;
      if (nextValueSearchIndex == ++v11)
        goto LABEL_11;
    }
  }
  else
  {
    LODWORD(v11) = self->recursiveState.nextValueSearchIndex;
    while (1)
    {
      v12 = var0 + v11;
      if (self->values[v12].var0 == (_DWORD)v18)
        break;
      LODWORD(v11) = v11 + 1;
      if (var1 == (_DWORD)v11)
        goto LABEL_7;
    }
  }
  self->recursiveState.nextValueSearchIndex = v11;
  values = self->values;
  v15 = self->valueTypes[v12];
  if (values)
    v16 = v15 == 6;
  else
    v16 = 0;
  if (v16)
    return *(float *)((char *)self->valueData + values[v12].var1);
  if (values)
    v17 = v15 == 7;
  else
    v17 = 0;
  if (v17)
    return *(double *)((char *)self->valueData + values[v12].var1);
  return result;
}

- (void)dealloc
{
  uint64_t v3;
  UIKeyToKeyIDCache *p_keyIDCache;
  unint64_t v5;
  objc_super v6;

  v3 = 0;
  p_keyIDCache = &self->keyIDCache;
  do

  while (v3 != 64);
  if (self->objectsByObjectID && self->header.objects.count)
  {
    v5 = 0;
    do

    while (v5 < self->header.objects.count);
  }
  UIFreeMissingClasses((void **)&self->missingClasses, self->header.classes.count);
  free(self->classes);
  free(self->objects);
  free(self->values);
  free(self->valueData);
  free(self->objectsByObjectID);
  free(self->shortObjectClassIDs);
  free(self->longObjectClassIDs);
  free(self->valueTypes);
  free(self->keyMasks);

  v6.receiver = self;
  v6.super_class = (Class)UINibDecoder;
  -[UINibDecoder dealloc](&v6, sel_dealloc);
}

- (CGSize)decodeCGSizeForKey:(id)a3
{
  _BOOL4 v3;
  double v4;
  double v5;
  _QWORD v6[3];
  CGSize result;

  v6[2] = *MEMORY[0x1E0C80C00];
  v3 = -[UINibDecoder decodeArrayOfCGFloats:count:forKey:](self, "decodeArrayOfCGFloats:count:forKey:", v6, 2, a3);
  v4 = *(double *)v6;
  v5 = *(double *)&v6[1];
  if (!v3)
  {
    v5 = 0.0;
    v4 = 0.0;
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (id)initForReadingWithData:(id)a3
{
  return -[UINibDecoder initForReadingWithData:error:](self, "initForReadingWithData:error:", a3, 0);
}

- (BOOL)isReusable
{
  return 1;
}

+ (id)unarchiveObjectWithData:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_msgSend(objc_alloc((Class)a1), "initForReadingWithData:error:", a3, 0);
  v4 = (id)objc_msgSend(v3, "decodeObjectForKey:", CFSTR("object"));
  objc_msgSend(v3, "finishDecoding");

  return v4;
}

+ (id)unarchiveObjectWithFile:(id)a3
{
  id result;

  result = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:", a3);
  if (result)
    return (id)objc_msgSend(a1, "unarchiveObjectWithData:", result);
  return result;
}

- (id)nextGenericKey
{
  void *v2;
  int64_t nextGenericKey;

  v2 = (void *)MEMORY[0x1E0CB3940];
  nextGenericKey = self->recursiveState.nextGenericKey;
  self->recursiveState.nextGenericKey = nextGenericKey + 1;
  return (id)objc_msgSend(v2, "stringWithFormat:", CFSTR("$%ld"), nextGenericKey);
}

- (int64_t)uniqueIDForCurrentlyDecodingObject
{
  return self->recursiveState.objectID;
}

- (int64_t)decodeInt64ForKey:(id)a3
{
  _BOOL4 v4;
  int64_t result;
  uint64_t objectID_low;
  UINibDecoderObjectEntry *v7;
  unsigned int var1;
  unsigned int var0;
  uint64_t nextValueSearchIndex;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  UINibDecoderValue *values;
  int v15;
  unsigned __int8 *valueData;
  uint64_t v17;

  v17 = 0;
  v4 = -[UINibStringIDTable lookupKey:identifier:](self->keyIDTable, "lookupKey:identifier:", a3, &v17);
  result = 0;
  if (!v4)
    return result;
  objectID_low = LODWORD(self->recursiveState.objectID);
  if (((self->keyMasks[objectID_low] >> v17) & 1) == 0)
    return 0;
  v7 = &self->objects[objectID_low];
  var0 = v7->var0;
  var1 = v7->var1;
  nextValueSearchIndex = self->recursiveState.nextValueSearchIndex;
  if (nextValueSearchIndex >= var1)
  {
LABEL_7:
    if (!(_DWORD)nextValueSearchIndex)
    {
LABEL_11:
      result = 0;
      if ((int)nextValueSearchIndex + 1 < var1)
        v13 = nextValueSearchIndex + 1;
      else
        v13 = 0;
      self->recursiveState.nextValueSearchIndex = v13;
      return result;
    }
    v11 = 0;
    while (1)
    {
      v12 = var0 + v11;
      if (self->values[v12].var0 == (_DWORD)v17)
        break;
      if (nextValueSearchIndex == ++v11)
        goto LABEL_11;
    }
  }
  else
  {
    LODWORD(v11) = self->recursiveState.nextValueSearchIndex;
    while (1)
    {
      v12 = var0 + v11;
      if (self->values[v12].var0 == (_DWORD)v17)
        break;
      LODWORD(v11) = v11 + 1;
      if (var1 == (_DWORD)v11)
        goto LABEL_7;
    }
  }
  self->recursiveState.nextValueSearchIndex = v11;
  values = self->values;
  if (!values)
    return 0;
  v15 = self->valueTypes[v12];
  if ((char)v15 > 3)
  {
    if ((v15 & 0xFE) == 4)
      return v15 == 5;
    return 0;
  }
  valueData = (unsigned __int8 *)self->valueData;
  switch(self->valueTypes[v12])
  {
    case 0:
      result = valueData[values[v12].var1];
      break;
    case 1:
      result = *(unsigned __int16 *)&valueData[values[v12].var1];
      break;
    case 2:
      result = *(unsigned int *)&valueData[values[v12].var1];
      break;
    case 3:
      result = *(_QWORD *)&valueData[values[v12].var1];
      break;
    default:
      return 0;
  }
  return result;
}

- (int)decodeInt32ForKey:(id)a3
{
  _BOOL4 v4;
  uint64_t v5;
  uint64_t objectID_low;
  UINibDecoderObjectEntry *v7;
  unsigned int var1;
  unsigned int var0;
  uint64_t nextValueSearchIndex;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  UINibDecoderValue *values;
  int v15;
  unsigned __int8 *valueData;
  uint64_t v18;

  v18 = 0;
  v4 = -[UINibStringIDTable lookupKey:identifier:](self->keyIDTable, "lookupKey:identifier:", a3, &v18);
  LODWORD(v5) = 0;
  if (!v4)
    return v5;
  objectID_low = LODWORD(self->recursiveState.objectID);
  if (((self->keyMasks[objectID_low] >> v18) & 1) == 0)
    goto LABEL_21;
  v7 = &self->objects[objectID_low];
  var0 = v7->var0;
  var1 = v7->var1;
  nextValueSearchIndex = self->recursiveState.nextValueSearchIndex;
  if (nextValueSearchIndex >= var1)
  {
LABEL_7:
    if (!(_DWORD)nextValueSearchIndex)
    {
LABEL_11:
      LODWORD(v5) = 0;
      if ((int)nextValueSearchIndex + 1 < var1)
        v13 = nextValueSearchIndex + 1;
      else
        v13 = 0;
      self->recursiveState.nextValueSearchIndex = v13;
      return v5;
    }
    v11 = 0;
    while (1)
    {
      v12 = var0 + v11;
      if (self->values[v12].var0 == (_DWORD)v18)
        break;
      if (nextValueSearchIndex == ++v11)
        goto LABEL_11;
    }
  }
  else
  {
    LODWORD(v11) = self->recursiveState.nextValueSearchIndex;
    while (1)
    {
      v12 = var0 + v11;
      if (self->values[v12].var0 == (_DWORD)v18)
        break;
      LODWORD(v11) = v11 + 1;
      if (var1 == (_DWORD)v11)
        goto LABEL_7;
    }
  }
  self->recursiveState.nextValueSearchIndex = v11;
  values = self->values;
  if (!values)
  {
LABEL_21:
    LODWORD(v5) = 0;
    return v5;
  }
  v15 = self->valueTypes[v12];
  if ((char)v15 > 3)
  {
    if ((v15 & 0xFE) == 4)
    {
      LODWORD(v5) = v15 == 5;
      return v5;
    }
    goto LABEL_21;
  }
  valueData = (unsigned __int8 *)self->valueData;
  switch(self->valueTypes[v12])
  {
    case 0:
      LODWORD(v5) = valueData[values[v12].var1];
      break;
    case 1:
      LODWORD(v5) = *(unsigned __int16 *)&valueData[values[v12].var1];
      break;
    case 2:
      LODWORD(v5) = *(_DWORD *)&valueData[values[v12].var1];
      break;
    case 3:
      v5 = *(_QWORD *)&valueData[values[v12].var1];
      break;
    default:
      goto LABEL_21;
  }
  return v5;
}

- (BOOL)decodeArrayOfFloats:(float *)a3 count:(int64_t)a4 forKey:(id)a5
{
  const char *v7;
  BOOL v8;
  unint64_t v9;
  int v10;
  unint64_t v11;
  int v12;
  unint64_t v13;
  double v14;
  float v15;
  unint64_t v17;

  v17 = 0;
  v7 = -[UINibDecoder decodeBytesForKey:returnedLength:](self, "decodeBytesForKey:returnedLength:", a5, &v17);
  v8 = 0;
  if (v7)
  {
    v9 = v17;
    if (v17)
    {
      v10 = *(unsigned __int8 *)v7;
      if (v10 == 7)
      {
        if (v17 - 1 == 8 * a4)
        {
          if (a4 >= 1)
          {
            v13 = 1;
            do
            {
              v14 = 0.0;
              if (v9 >= v13 && v9 - v13 >= 8)
              {
                v14 = *(double *)&v7[v13];
                v13 += 8;
              }
              v15 = v14;
              *a3++ = v15;
              --a4;
            }
            while (a4);
          }
          return 1;
        }
      }
      else if (v10 == 6 && v17 - 1 == 4 * a4)
      {
        if (a4 >= 1)
        {
          v11 = 1;
          do
          {
            v12 = 0;
            if (v9 >= v11 && v9 - v11 >= 4)
            {
              v12 = *(_DWORD *)&v7[v11];
              v11 += 4;
            }
            *(_DWORD *)a3++ = v12;
            --a4;
          }
          while (a4);
        }
        return 1;
      }
      return 0;
    }
  }
  return v8;
}

- (BOOL)decodeArrayOfDoubles:(double *)a3 count:(int64_t)a4 forKey:(id)a5
{
  const char *v7;
  BOOL v8;
  unint64_t v9;
  int v10;
  unint64_t v11;
  float v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v16;

  v16 = 0;
  v7 = -[UINibDecoder decodeBytesForKey:returnedLength:](self, "decodeBytesForKey:returnedLength:", a5, &v16);
  v8 = 0;
  if (v7)
  {
    v9 = v16;
    if (v16)
    {
      v10 = *(unsigned __int8 *)v7;
      if (v10 == 7)
      {
        if (v16 - 1 == 8 * a4)
        {
          if (a4 >= 1)
          {
            v13 = 1;
            do
            {
              v14 = 0;
              if (v9 >= v13 && v9 - v13 >= 8)
              {
                v14 = *(_QWORD *)&v7[v13];
                v13 += 8;
              }
              *(_QWORD *)a3++ = v14;
              --a4;
            }
            while (a4);
          }
          return 1;
        }
      }
      else if (v10 == 6 && v16 - 1 == 4 * a4)
      {
        if (a4 >= 1)
        {
          v11 = 1;
          do
          {
            v12 = 0.0;
            if (v9 >= v11 && v9 - v11 >= 4)
            {
              v12 = *(float *)&v7[v11];
              v11 += 4;
            }
            *a3++ = v12;
            --a4;
          }
          while (a4);
        }
        return 1;
      }
      return 0;
    }
  }
  return v8;
}

- (void)decodeValueOfObjCType:(const char *)a3 at:(void *)a4
{
  unsigned int v8;
  void *v9;
  SEL v10;
  UINibDecoder *v11;
  uint64_t v12;
  NSString *v13;
  id v14;
  double v15;
  const char *v16;
  size_t v17;
  uint64_t v18;
  uint64_t v19;

  if (strlen(a3) != 1)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = a2;
    v11 = self;
    v12 = 1073;
LABEL_9:
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", v10, v11, CFSTR("UINibDecoder.m"), v12, CFSTR("The UINibDecoder doesn't decode this type. Please switch your NSCoding implementation to using keyed archiving."));
    return;
  }
  v8 = *(unsigned __int8 *)a3;
  if (v8 > 0x63)
  {
    if (*(unsigned __int8 *)a3 > 0x68u)
    {
      if (v8 == 105)
      {
        *(_DWORD *)a4 = -[UINibDecoder decodeIntegerForKey:](self, "decodeIntegerForKey:", -[UINibDecoder nextGenericKey](self, "nextGenericKey"));
        return;
      }
      if (v8 != 113)
      {
        if (v8 == 115)
        {
          *(_WORD *)a4 = -[UINibDecoder decodeIntegerForKey:](self, "decodeIntegerForKey:", -[UINibDecoder nextGenericKey](self, "nextGenericKey"));
          return;
        }
        goto LABEL_29;
      }
      v14 = -[UINibDecoder decodeIntegerForKey:](self, "decodeIntegerForKey:", -[UINibDecoder nextGenericKey](self, "nextGenericKey"));
      goto LABEL_31;
    }
    if (v8 == 100)
    {
      -[UINibDecoder decodeDoubleForKey:](self, "decodeDoubleForKey:", -[UINibDecoder nextGenericKey](self, "nextGenericKey"));
      *(_QWORD *)a4 = v18;
      return;
    }
    if (v8 == 102)
    {
      -[UINibDecoder decodeDoubleForKey:](self, "decodeDoubleForKey:", -[UINibDecoder nextGenericKey](self, "nextGenericKey"));
      *(float *)&v15 = v15;
      *(_DWORD *)a4 = LODWORD(v15);
      return;
    }
LABEL_29:
    v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = a2;
    v11 = self;
    v12 = 1070;
    goto LABEL_9;
  }
  if (*(unsigned __int8 *)a3 > 0x3Fu)
  {
    if (v8 != 64)
    {
      if (v8 == 66)
      {
        *(_BYTE *)a4 = -[UINibDecoder decodeBoolForKey:](self, "decodeBoolForKey:", -[UINibDecoder nextGenericKey](self, "nextGenericKey"));
        return;
      }
      goto LABEL_29;
    }
    v14 = -[UINibDecoder decodeObjectForKey:](self, "decodeObjectForKey:", -[UINibDecoder nextGenericKey](self, "nextGenericKey"));
  }
  else if (v8 == 42)
  {
    v19 = 0;
    v16 = -[UINibDecoder decodeBytesForKey:returnedLength:](self, "decodeBytesForKey:returnedLength:", -[UINibDecoder nextGenericKey](self, "nextGenericKey"), &v19);
    if (v19)
      v17 = v19 - 1;
    else
      v17 = 0;
    v14 = strndup(v16, v17);
  }
  else
  {
    if (v8 != 58)
      goto LABEL_29;
    v13 = -[UINibDecoder decodeObjectForKey:](self, "decodeObjectForKey:", -[UINibDecoder nextGenericKey](self, "nextGenericKey"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = (id)NSSelectorFromString(v13);
    else
      v14 = 0;
  }
LABEL_31:
  *(_QWORD *)a4 = v14;
}

- (id)decodeNXObject
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINibDecoder.m"), 1078, CFSTR("Unimplemented"));
  return 0;
}

- (id)decodeDataObject
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINibDecoder.m"), 1083, CFSTR("Unimplemented"));
  return 0;
}

- (id)decodeObject
{
  void *v3;

  v3 = 0;
  -[UINibDecoder decodeValueOfObjCType:at:size:](self, "decodeValueOfObjCType:at:size:", "@", &v3, 8);
  return v3;
}

- (id)decodePropertyList
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINibDecoder.m"), 1094, CFSTR("Unimplemented"));
  return 0;
}

- (void)decodeValuesOfObjCTypes:(const char *)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINibDecoder.m"), 1099, CFSTR("Unimplemented"));
}

- (void)decodeArrayOfObjCType:(const char *)a3 count:(unint64_t)a4 at:(void *)a5
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINibDecoder.m"), 1103, CFSTR("Unimplemented"));
}

- (void)decodeBytesWithReturnedLength:(unint64_t *)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINibDecoder.m"), 1107, CFSTR("Unimplemented"));
  return 0;
}

- (unsigned)systemVersion
{
  return 2000;
}

- (int64_t)versionForClassName:(id)a3
{
  Class v3;

  v3 = NSClassFromString((NSString *)a3);
  if (v3)
    return -[objc_class version](v3, "version");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)delegate
{
  return self->delegate;
}

- (void)setDelegate:(id)a3
{
  self->delegate = a3;
}

- (void)validateAndIndexObjects:length:.cold.1()
{
  __assert_rtn("-[UINibDecoder validateAndIndexObjects:length:]", "UINibDecoder.m", 327, "keyIDTable && values && classes && \"The keys and objects need to be validated and indexed to index the objects.\");
}

- (void)validateAndIndexValues:length:.cold.1()
{
  __assert_rtn("-[UINibDecoder validateAndIndexValues:length:]", "UINibDecoder.m", 387, "keyIDTable && \"The keys need to be validated and indexed to index the values.\");
}

@end

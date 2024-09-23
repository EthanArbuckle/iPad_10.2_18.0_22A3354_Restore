@implementation _PASUTF8String

- (_PASUTF8String)initWithUTF8Data:(id)a3 asciiPrefixLength:(unsigned int)a4 nullTerminated:(BOOL)a5
{
  _BOOL4 v5;
  id v10;
  _PASUTF8String *v11;
  _PASUTF8String *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  size_t v17;
  $FFD6A2C194A3D238F07E602641A84D86 *v18;
  unint64_t v19;
  unsigned int v20;
  char *RuneUtf8;
  unint64_t v22;
  int v23;
  unsigned int v24;
  char *v25;
  unint64_t v26;
  int v27;
  int v28;
  unint64_t nchunks;
  _PASUTF8String *v30;
  $FFD6A2C194A3D238F07E602641A84D86 *v31;
  void *v33;
  id v34;
  SEL v35;
  unsigned int v36;
  objc_super v37;

  v5 = a5;
  v10 = a3;
  if (v10)
  {
    v37.receiver = self;
    v37.super_class = (Class)_PASUTF8String;
    v11 = -[_PASUTF8String init](&v37, sel_init);
    v12 = v11;
    if (!v11)
    {
LABEL_33:
      self = v12;
      v30 = self;
      goto LABEL_34;
    }
    objc_storeStrong((id *)&v11->_backingData, a3);
    v12->_nullTerminated = v5;
    v13 = objc_msgSend(v10, "length");
    if (HIDWORD(v13))
      __assert_rtn("-[_PASUTF8String initWithUTF8Data:asciiPrefixLength:nullTerminated:]", "NSString+_PASAdditions.m", 165, "asciiAndUtf8Length <= UINT32_MAX");
    v14 = v13 - v5;
    v12->_asciiPrefixLength = a4;
    v15 = -[NSData bytes](v12->_backingData, "bytes");
    v12->_buffer = (const char *)v15;
    if (v14 <= a4)
      __assert_rtn("-[_PASUTF8String initWithUTF8Data:asciiPrefixLength:nullTerminated:]", "NSString+_PASAdditions.m", 169, "asciiPrefixLength < asciiAndUtf8Length");
    if ((*(char *)(v15 + a4) & 0x80000000) == 0)
      __assert_rtn("-[_PASUTF8String initWithUTF8Data:asciiPrefixLength:nullTerminated:]", "NSString+_PASAdditions.m", 170, "!isascii(_buffer[asciiPrefixLength])");
    v16 = (char *)(v15 + v14);
    v12->_bufferEnd = (const char *)(v15 + v14);
    v17 = ((v14 - a4) >> 5) + 1;
    v12->_nchunks = v17;
    v18 = ($FFD6A2C194A3D238F07E602641A84D86 *)malloc_type_calloc(4uLL, v17, 0xFB3D29CBuLL);
    if (v18)
    {
      v12->_chunks = v18;
      if (!v12->_nchunks)
      {
        v24 = a4;
        goto LABEL_32;
      }
      v35 = a2;
      v19 = 0;
      v20 = 0;
      RuneUtf8 = (char *)&v12->_buffer[a4];
LABEL_9:
      v22 = 0;
      v12->_chunks[v19] = ($FFD6A2C194A3D238F07E602641A84D86)v20;
      LOBYTE(v23) = (v20 & 0x80) == 0;
      v24 = a4;
      v25 = RuneUtf8;
      while (1)
      {
        v36 = 0;
        RuneUtf8 = getRuneUtf8(v25, v16, (int *)&v36);
        if (!RuneUtf8)
          break;
        v23 = (v36 < 0x80) & v23;
        v26 = v22 + 1;
        a4 = v24 + 1;
        if (v36 - 0x10000 >= 0x100000 || (v20 & 0x80) != 0)
        {
          v27 = (_DWORD)RuneUtf8 - (_DWORD)v25;
        }
        else
        {
          if (v22 == 63)
          {
            v20 |= 0x80u;
            RuneUtf8 = v25;
LABEL_19:
            if (v23)
              v28 = 64;
            else
              v28 = 0;
            v12->_chunks[v19] = ($FFD6A2C194A3D238F07E602641A84D86)(*(_DWORD *)&v12->_chunks[v19] & 0xFFFFFFBF | v28);
            ++v19;
            nchunks = v12->_nchunks;
            if (v19 >= nchunks)
            {
              v24 = a4;
              goto LABEL_26;
            }
            goto LABEL_9;
          }
          v27 = (_DWORD)RuneUtf8 - (_DWORD)v25;
          v26 = v22 + 2;
          a4 = v24 + 2;
        }
        v20 = (v20 + (v27 << 8)) & 0xFFFFFF7F;
        v22 = v26;
        v24 = a4;
        v25 = RuneUtf8;
        if (v26 >= 0x40)
          goto LABEL_19;
      }
      LODWORD(v19) = v19 + 1;
      LODWORD(nchunks) = v12->_nchunks;
LABEL_26:
      if (v19 >= nchunks)
        goto LABEL_32;
      if (!(_DWORD)v19)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", v35, v12, CFSTR("NSString+_PASAdditions.m"), 236, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("i > 0"));

      }
      v31 = ($FFD6A2C194A3D238F07E602641A84D86 *)reallocf(v12->_chunks, 4 * v19);
      if (v31)
      {
        v12->_chunks = v31;
        v12->_nchunks = v19;
LABEL_32:
        v12->_length = v24;
        goto LABEL_33;
      }
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v34);
  }
  v30 = 0;
LABEL_34:

  return v30;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_chunks);
  v3.receiver = self;
  v3.super_class = (Class)_PASUTF8String;
  -[_PASUTF8String dealloc](&v3, sel_dealloc);
}

- (unint64_t)length
{
  return self->_length;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  int v3;
  uint64_t asciiPrefixLength;
  unint64_t v7;
  unsigned int v8;
  const char *v9;
  int v10;

  v3 = a3;
  if (self->_asciiPrefixLength > a3)
    return self->_buffer[a3];
  -[_PASUTF8String _validateRange:]((uint64_t)self, a3, 1);
  asciiPrefixLength = self->_asciiPrefixLength;
  v7 = self->_chunks[(v3 - asciiPrefixLength) >> 6];
  v10 = v7;
  v8 = (v3 - asciiPrefixLength) & 0x3F;
  v9 = &self->_buffer[asciiPrefixLength];
  if ((v7 & 0x40) != 0)
    return v9[(v7 >> 8) + v8];
  for (; v8; --v8)
    advanceCursor((uint64_t)v9, (char *)self->_bufferEnd, &v10);
  return advanceCursor((uint64_t)v9, (char *)self->_bufferEnd, &v10);
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t asciiPrefixLength;
  unsigned int v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  unsigned __int16 *v13;
  unsigned __int16 v14;
  const char *v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unint64_t v19;
  unsigned int v20;
  NSUInteger i;
  NSUInteger v22;
  unsigned __int16 v23;
  unint64_t v24;
  const char *v25;
  NSUInteger v26;
  int v27;

  length = a4.length;
  location = a4.location;
  -[_PASUTF8String _validateRange:]((uint64_t)self, a4.location, a4.length);
  if (length)
  {
    if ((a3 & 1) != 0)
    {
      v26 = length - 1;
      -[_PASUTF8String getCharacters:range:](self, "getCharacters:range:", (char *)a3 + 1, location, v26);
      memmove(a3, (char *)a3 + 1, 2 * v26);
      a3[v26] = -[_PASUTF8String characterAtIndex:](self, "characterAtIndex:", v26);
    }
    else
    {
      asciiPrefixLength = self->_asciiPrefixLength;
      if (location >= asciiPrefixLength)
        goto LABEL_10;
      v9 = location + length;
      if (asciiPrefixLength < (int)location + (int)length)
        v9 = self->_asciiPrefixLength;
      v10 = v9 - location;
      if (v9 <= location)
      {
LABEL_10:
        LODWORD(v10) = 0;
      }
      else
      {
        v11 = &self->_buffer[location];
        v12 = v10;
        v13 = a3;
        do
        {
          v14 = *(unsigned __int8 *)v11++;
          *v13++ = v14;
          --v12;
        }
        while (v12);
      }
      if (length != v10 && length > v10)
      {
        v15 = &self->_buffer[asciiPrefixLength];
        v16 = location - asciiPrefixLength + v10;
        v17 = v16 & 0x3F;
        v18 = v16 >> 6;
        do
        {
          v19 = self->_chunks[v18];
          v27 = v19;
          if ((v19 & 0x40) != 0)
          {
            i = v10;
            if (length > v10)
            {
              v24 = v17;
              v25 = &v15[v19 >> 8];
              do
              {
                a3[i] = v25[v24];
                i = (v10 + 1);
                LODWORD(v10) = v10 + 1;
                if (v24 > 0x3E)
                  break;
                ++v24;
              }
              while (length > i);
            }
          }
          else
          {
            if (v17)
            {
              v20 = v17;
              do
              {
                advanceCursor((uint64_t)v15, (char *)self->_bufferEnd, &v27);
                --v20;
              }
              while (v20);
            }
            for (i = v10; length > i; ++v17)
            {
              v22 = i;
              v23 = advanceCursor((uint64_t)v15, (char *)self->_bufferEnd, &v27);
              i = (v10 + 1);
              LODWORD(v10) = v10 + 1;
              a3[v22] = v23;
              if (v17 > 0x3E)
                break;
            }
          }
          v17 = 0;
          ++v18;
        }
        while (length > i);
      }
    }
  }
}

- (id)dataUsingEncoding:(unint64_t)a3
{
  NSData *v5;
  NSData *v6;
  CFIndex v7;
  const __CFAllocator *v8;
  CFDataRef v9;
  void *v11;
  void *v12;
  objc_super v13;
  CFAllocatorContext context;

  if (a3 == 4)
  {
    v5 = self->_backingData;
    v6 = v5;
    if (self->_nullTerminated)
    {
      v7 = self->_bufferEnd - self->_buffer;
      context.version = 0;
      context.info = v5;
      memset(&context.retain, 0, 24);
      context.allocate = (CFAllocatorAllocateCallBack)cfAllocateAlwaysFailing_1689;
      context.reallocate = 0;
      context.deallocate = (CFAllocatorDeallocateCallBack)cfDeallocateReleaseBackingObject;
      context.preferredSize = 0;
      v8 = CFAllocatorCreate(0, &context);
      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSString+_PASAdditions.m"), 440, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deallocator"));

      }
      v9 = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)self->_buffer, v7, v8);
      if (!v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSString+_PASAdditions.m"), 442, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cfData"));

      }
      CFRelease(v8);
    }
    else
    {
      v9 = v5;
    }

    return v9;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)_PASUTF8String;
    -[_PASUTF8String dataUsingEncoding:](&v13, sel_dataUsingEncoding_);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (unint64_t)lengthOfBytesUsingEncoding:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;

  if (a3 == 1)
    return 0;
  v7 = v3;
  v8 = v4;
  if (a3 == 4)
    return self->_bufferEnd - self->_buffer;
  v6.receiver = self;
  v6.super_class = (Class)_PASUTF8String;
  return -[_PASUTF8String lengthOfBytesUsingEncoding:](&v6, sel_lengthOfBytesUsingEncoding_);
}

- (unint64_t)maximumLengthOfBytesUsingEncoding:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;

  if (a3 == 4)
    return -[_PASUTF8String lengthOfBytesUsingEncoding:](self, "lengthOfBytesUsingEncoding:");
  v7 = v3;
  v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)_PASUTF8String;
  return -[_PASUTF8String maximumLengthOfBytesUsingEncoding:](&v6, sel_maximumLengthOfBytesUsingEncoding_);
}

- (BOOL)canBeConvertedToEncoding:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;

  if (a3 == 1)
    return 0;
  v7 = v3;
  v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)_PASUTF8String;
  return -[_PASUTF8String canBeConvertedToEncoding:](&v6, sel_canBeConvertedToEncoding_);
}

- (const)UTF8String
{
  __CFData *MutableCopy;

  if (self->_nullTerminated)
    return self->_buffer;
  MutableCopy = CFDataCreateMutableCopy(0, -[NSData length](self->_backingData, "length") + 1, (CFDataRef)self->_backingData);
  CFDataAppendBytes(MutableCopy, (const UInt8 *)"", 1);
  CFAutorelease(MutableCopy);
  return (const char *)CFDataGetMutableBytePtr(MutableCopy);
}

- (id)_pas_overrideStringBackedByUTF8CString
{
  _PASUTF8String *v3;
  __CFData *MutableCopy;

  if (self->_nullTerminated)
  {
    v3 = self;
  }
  else
  {
    MutableCopy = CFDataCreateMutableCopy(0, -[NSData length](self->_backingData, "length") + 1, (CFDataRef)self->_backingData);
    CFDataAppendBytes(MutableCopy, (const UInt8 *)"", 1);
    v3 = -[_PASUTF8String initWithUTF8Data:asciiPrefixLength:nullTerminated:]([_PASUTF8String alloc], "initWithUTF8Data:asciiPrefixLength:nullTerminated:", MutableCopy, self->_asciiPrefixLength, 1);

  }
  return v3;
}

- (const)cStringUsingEncoding:(unint64_t)a3
{
  objc_super v4;

  if (a3 == 1)
    return 0;
  if (a3 == 4)
    return -[_PASUTF8String UTF8String](objc_retainAutorelease(self), "UTF8String");
  v4.receiver = self;
  v4.super_class = (Class)_PASUTF8String;
  return -[_PASUTF8String cStringUsingEncoding:](&v4, sel_cStringUsingEncoding_);
}

- (unint64_t)fastestEncoding
{
  return 4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithBytes:length:encoding:", self->_buffer, self->_bufferEnd - self->_buffer, 4);
}

- (const)_pas_overrideFastUTF8StringPtrWithOptions:(unint64_t)a3 encodedLength:(unint64_t *)a4
{
  if ((a3 & 1) != 0 && !self->_nullTerminated)
    return 0;
  if (a4)
    *a4 = -[_PASUTF8String lengthOfBytesUsingEncoding:](self, "lengthOfBytesUsingEncoding:", 4);
  return self->_buffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingData, 0);
}

- (uint64_t)_validateRange:(uint64_t)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (result)
  {
    if (a2 + a3 > (unint64_t)*(unsigned int *)(result + 48))
    {
      v3 = (void *)MEMORY[0x1E0C99DA0];
      v4 = *MEMORY[0x1E0C99858];
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Range {%tu, %tu} out of bounds; string length %u"),
                     a2,
                     a3,
                     *(unsigned int *)(result + 48));
      objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
      v6 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v6);
    }
  }
  return result;
}

@end

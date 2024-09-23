@implementation RBArchiveDelegateImpl

- (RBArchiveDelegateImpl)initWithFlags:(unsigned int)a3
{
  RBArchiveDelegateImpl *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RBArchiveDelegateImpl;
  result = -[RBArchiveDelegateImpl init](&v5, sel_init);
  if (result)
    result->_flags = a3;
  return result;
}

- (id)encodedMetadata
{
  return self->_metadata._p;
}

- (void)decodedMetadata:(id)a3
{
  NSData *p;

  p = self->_metadata._p;
  if (p != a3)
  {

    self->_metadata._p = (NSData *)a3;
  }
}

- (id)encodedImageData:(id)a3 error:(id *)a4
{
  CGImage *var1;
  uint64_t v6;
  void *v7;
  CGImageDestination *v8;
  CGImageDestination *v9;
  BOOL v10;
  BOOL v11;
  Class v12;
  objc_class *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v18[3];
  char v19;

  if (!a3.var1)
    return 0;
  var1 = (CGImage *)a3.var1;
  v6 = *(_QWORD *)&a3.var0;
  if ((self->_flags & 1) != 0)
    goto LABEL_19;
  if (a3.var0 == 1)
  {
    v12 = NSClassFromString(CFSTR("CAIOSurfaceCodingProxy"));
    if (v12)
    {
      v13 = v12;
      if (-[objc_class instancesRespondToSelector:](v12, "instancesRespondToSelector:", sel_initWithObject_))
      {
        v14 = objc_msgSend([v13 alloc], "initWithObject:", var1);
        if (v14)
        {
          v15 = (void *)v14;
          v7 = (void *)objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v14, 1, 0);

LABEL_16:
          if (v7)
            return v7;
          goto LABEL_19;
        }

      }
    }
  }
  else if (!a3.var0)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v8 = CGImageDestinationCreateWithData((CFMutableDataRef)v7, CFSTR("public.png"), 1uLL, 0);
    if (v8)
    {
      v9 = v8;
      CGImageDestinationAddImage(v8, var1, 0);
      v10 = CGImageDestinationFinalize(v9);
      CFRelease(v9);
      if (v7)
        v11 = v10;
      else
        v11 = 0;
      if (v11)
        return v7;
      goto LABEL_19;
    }
    goto LABEL_16;
  }
LABEL_19:
  RB::ImageDescription::ImageDescription((RB::ImageDescription *)v18, v6, var1);
  v16 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6), CFSTR("type"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v18[0]), CFSTR("ident"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v18[1]), CFSTR("width"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v18[2]), CFSTR("height"));
  if (v19)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("alpha"));
  return (id)objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v16, 0, a4);
}

- (void)decodedImageContentsWithData:(id)a3 type:(int *)a4 error:(id *)a5
{
  uint64_t v7;
  unint64_t v8;
  void *v9;
  const void *placeholder;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  RB *v15;
  size_t v16;
  size_t v17;
  int v18;
  CGImageSource *v20;
  CGImageSource *v21;
  Class v23;
  void *v24;
  const void *v25;
  int v26;
  __int16 v27;
  char v28;

  v7 = objc_msgSend(a3, "length");
  v28 = 0;
  if (!v7)
    goto LABEL_19;
  v8 = v7;
  objc_msgSend(a3, "getBytes:length:", &v28, 1);
  if (v28 == 123)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, 0, 0);
    objc_opt_class();
    placeholder = 0;
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_10;
    v11 = (void *)objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("width"));
    v12 = (void *)objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("height"));
    v13 = (void *)objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ident"));
    v14 = (void *)objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("has_alpha"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = (RB *)objc_msgSend(v13, "unsignedLongLongValue");
          v16 = objc_msgSend(v11, "unsignedLongLongValue");
          v17 = objc_msgSend(v12, "unsignedLongLongValue");
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v18 = objc_msgSend(v14, "BOOLValue");
          else
            v18 = 0;
          placeholder = RB::cg_image_create_placeholder(v15, v16, v17, v18);
          goto LABEL_10;
        }
      }
    }
  }
  placeholder = 0;
LABEL_10:
  if (v8 >= 7 && !placeholder && v28 == 98)
  {
    objc_msgSend(a3, "getBytes:length:", &v26, 6);
    if (v26 != 1768714338 || v27 != 29811)
      goto LABEL_17;
    v23 = NSClassFromString(CFSTR("CAIOSurfaceCodingProxy"));
    placeholder = v23;
    if (v23)
    {
      if (!-[objc_class instancesRespondToSelector:](v23, "instancesRespondToSelector:", sel_decodedObject))
      {
LABEL_17:
        placeholder = 0;
        goto LABEL_18;
      }
      v24 = (void *)MEMORY[0x20BD168EC]();
      v25 = (const void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", placeholder, a3, 0), "decodedObject");
      if (v25)
        placeholder = CFRetain(v25);
      else
        placeholder = 0;
      objc_autoreleasePoolPop(v24);
      if (placeholder)
        *a4 = 1;
    }
  }
LABEL_18:
  if (placeholder)
  {
LABEL_21:
    CFAutorelease(placeholder);
    return (void *)placeholder;
  }
LABEL_19:
  v20 = CGImageSourceCreateWithData((CFDataRef)a3, 0);
  if (!v20)
    return 0;
  v21 = v20;
  placeholder = CGImageSourceCreateImageAtIndex(v20, 0, 0);
  *a4 = 0;
  CFRelease(v21);
  if (placeholder)
    goto LABEL_21;
  return (void *)placeholder;
}

- (id)encodedCGFontData:(CGFont *)a3 error:(id *)a4
{
  void *v6;
  CFStringRef v7;
  const void *v8;
  uint64_t v9;

  v6 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = CGFontCopyPostScriptName(a3);
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("postscriptName"));
LABEL_5:
    CFRelease(v8);
    return (id)objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v6, 0, a4);
  }
  v9 = CGFontCopyURL();
  if (v9)
  {
    v8 = (const void *)v9;
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("URL"));
    goto LABEL_5;
  }
  return (id)objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v6, 0, a4);
}

- (BOOL)shouldEncodeFontSubset:(CGFont *)a3
{
  return (LOBYTE(self->_flags) >> 1) & 1;
}

- (id)encodedFontSubsetData:(id)a3 cgFont:(CGFont *)a4 error:(id *)a5
{
  return a3;
}

- (CGFont)decodedCGFontWithData:(id)a3 error:(id *)a4
{
  void *v6;
  CGFont *v7;
  const __CFString *v8;
  CGDataProvider *v9;
  CGDataProvider *v10;
  const __CFURL *v11;
  CFTypeRef arg;
  char v14;

  v14 = 0;
  if (objc_msgSend(a3, "length") && (objc_msgSend(a3, "getBytes:length:", &v14, 1), v14 == 123))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, 0, a4);
    objc_opt_class();
    v7 = 0;
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return v7;
    v8 = (const __CFString *)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("postscriptName"));
    if (v8)
    {
      RB::cg_font_create_with_name(v8, (CGFontRef *)&arg);
      v7 = (CGFont *)arg;
      if (!arg)
        return v7;
      goto LABEL_9;
    }
    v11 = (const __CFURL *)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("URL"));
    if (!v11)
      return 0;
    v9 = CGDataProviderCreateWithURL(v11);
    if (!v9)
      return 0;
  }
  else
  {
    v9 = CGDataProviderCreateWithCFData((CFDataRef)a3);
    if (!v9)
      return 0;
  }
  v10 = v9;
  v7 = CGFontCreateWithDataProvider(v9);
  CFRelease(v10);
  if (v7)
LABEL_9:
    CFAutorelease(v7);
  return v7;
}

- (id)encodedShaderLibraryData:(id)a3 error:(id *)a4
{
  id result;
  id *v5;
  uint64_t v6;

  result = (id)-[RBDecodedFontMetadata fontUID]((uint64_t)a3);
  if (result)
  {
    v5 = (id *)result;
    result = 0;
    switch(*((_DWORD *)v5 + 6))
    {
      case 0:
        v6 = objc_msgSend(v5[2], "URLForResource:withExtension:", CFSTR("default"), CFSTR("metallib"));
        goto LABEL_5;
      case 1:
        v6 = (uint64_t)v5[2];
LABEL_5:
        result = (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v6);
        break;
      case 2:
        result = v5[2];
        break;
      case 4:
        result = (id)objc_msgSend(v5[2], "dataUsingEncoding:", 4);
        break;
      default:
        return result;
    }
  }
  return result;
}

- (id)decodedShaderLibraryWithData:(id)a3 error:(id *)a4
{
  _BYTE *v5;
  void *v7;
  RBShaderLibrary *v8;

  if ((unint64_t)objc_msgSend(a3, "length") >= 5)
  {
    v5 = (_BYTE *)objc_msgSend(a3, "bytes");
    if (*v5 == 77 && v5[1] == 84 && v5[2] == 76 && v5[3] == 66)
      return +[RBShaderLibrary libraryWithData:](RBShaderLibrary, "libraryWithData:", a3);
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", a3, 4);
  if (v7)
    v8 = +[RBShaderLibrary libraryWithSource:](RBShaderLibrary, "libraryWithSource:", v7);
  else
    v8 = 0;

  return v8;
}

- (void).cxx_destruct
{

}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end

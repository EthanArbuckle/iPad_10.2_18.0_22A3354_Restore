@implementation VKImageSourceKey

- (id)_initWithKeyType:(unsigned int)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VKImageSourceKey;
  result = -[VKImageSourceKey init](&v5, sel_init);
  if (result)
    *((_DWORD *)result + 2) = a3;
  return result;
}

- (VKImageSourceKey)initWithDataType:(unsigned __int8)a3
{
  VKImageSourceKey *result;

  result = -[VKImageSourceKey _initWithKeyType:](self, "_initWithKeyType:", 3);
  if (result)
    result->_dataType = a3;
  return result;
}

- (VKImageSourceKey)initWithShieldText:(const char *)a3 locale:(const char *)a4 type:(unsigned int)a5 color:(Color<unsigned)char
{
  unsigned __int8 *v6;
  VKImageSourceKey *v10;
  uint64_t v11;
  NSString *shieldText;
  uint64_t v13;
  NSString *shieldTextLocale;
  VKImageSourceKey *v15;

  v6 = *(unsigned __int8 **)a6._backing._e;
  v10 = -[VKImageSourceKey _initWithKeyType:](self, "_initWithKeyType:", 1);
  if (v10)
  {
    if (a3 && *a3)
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a3);
      shieldText = v10->_shieldText;
      v10->_shieldText = (NSString *)v11;

    }
    if (a4 && *a4)
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a4);
      shieldTextLocale = v10->_shieldTextLocale;
      v10->_shieldTextLocale = (NSString *)v13;

    }
    v10->_shieldType = a5;
    v10->_shieldColor._backing._e[0] = *v6;
    v10->_shieldColor._backing._e[1] = v6[1];
    v10->_shieldColor._backing._e[2] = v6[2];
    v10->_shieldColor._backing._e[3] = v6[3];
    v15 = v10;
  }

  return v10;
}

- (VKImageSourceKey)initWithShieldName:(const char *)a3 text:(const char *)a4 locale:(const char *)a5 color:(Color<unsigned)char
{
  unsigned __int8 *v6;
  VKImageSourceKey *v10;
  uint64_t v11;
  NSString *imageName;
  uint64_t v13;
  NSString *shieldText;
  uint64_t v15;
  NSString *shieldTextLocale;
  VKImageSourceKey *v17;

  v6 = *(unsigned __int8 **)a6._backing._e;
  v10 = -[VKImageSourceKey _initWithKeyType:](self, "_initWithKeyType:", 4);
  if (v10)
  {
    if (a3 && *a3)
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a3);
      imageName = v10->_imageName;
      v10->_imageName = (NSString *)v11;

    }
    if (a4 && *a4)
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a4);
      shieldText = v10->_shieldText;
      v10->_shieldText = (NSString *)v13;

    }
    if (a5 && *a5)
    {
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a5);
      shieldTextLocale = v10->_shieldTextLocale;
      v10->_shieldTextLocale = (NSString *)v15;

    }
    v10->_shieldColor._backing._e[0] = *v6;
    v10->_shieldColor._backing._e[1] = v6[1];
    v10->_shieldColor._backing._e[2] = v6[2];
    v10->_shieldColor._backing._e[3] = v6[3];
    v17 = v10;
  }

  return v10;
}

- (VKImageSourceKey)initWithIconAttributeKey:(unsigned int)a3 attributeValue:(unsigned int)a4
{
  VKImageSourceKey *v6;
  VKImageSourceKey *v7;
  VKImageSourceKey *v8;

  v6 = -[VKImageSourceKey _initWithKeyType:](self, "_initWithKeyType:", 2);
  v7 = v6;
  if (v6)
  {
    v6->_iconAttributeKey = a3;
    v6->_iconAttributeValue = a4;
    v8 = v6;
  }

  return v7;
}

- (VKImageSourceKey)initWithIconName:(const char *)a3
{
  VKImageSourceKey *v4;
  uint64_t v5;
  NSString *imageName;
  VKImageSourceKey *v7;

  v4 = -[VKImageSourceKey _initWithKeyType:](self, "_initWithKeyType:", 5);
  if (v4)
  {
    if (a3 && *a3)
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a3);
      imageName = v4->_imageName;
      v4->_imageName = (NSString *)v5;

    }
    v7 = v4;
  }

  return v4;
}

- (VKImageSourceKey)initWithLabelImageKey:(const void *)a3
{
  VKImageSourceKey *v4;
  VKImageSourceKey *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  VKImageSourceKey *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  int v15;
  int v16;

  v4 = self;
  v5 = 0;
  self->_sizeGroup = +[VKInternalIconManager convertGrlSizeGroup:](VKInternalIconManager, "convertGrlSizeGroup:", *(unsigned __int8 *)(*(_QWORD *)a3 + 168));
  v6 = *(_QWORD *)a3;
  v4->_contentScale = *(float *)(*(_QWORD *)a3 + 56);
  v4->_iconVariant = *(IconVariant *)(v6 + 172);
  v7 = *(_QWORD *)a3;
  v4->_countryCode = *(_DWORD *)(*(_QWORD *)a3 + 192);
  switch(*(_BYTE *)(v7 + 113))
  {
    case 1:
      v8 = (_QWORD *)(v7 + 120);
      if (*(char *)(v7 + 143) < 0)
        v8 = (_QWORD *)*v8;
      v9 = *(unsigned int *)(v7 + 152);
      v16 = *(_DWORD *)(v7 + 160);
      v10 = -[VKImageSourceKey initWithShieldText:locale:type:color:](v4, "initWithShieldText:locale:type:color:", v8, 0, v9, &v16);
      goto LABEL_14;
    case 2:
      v11 = (_QWORD *)(v7 + 16);
      if (*(char *)(v7 + 39) < 0)
        v11 = (_QWORD *)*v11;
      v12 = (_QWORD *)(v7 + 120);
      if (*(char *)(v7 + 143) < 0)
        v12 = (_QWORD *)*v12;
      v15 = *(_DWORD *)(v7 + 160);
      v10 = -[VKImageSourceKey initWithShieldName:text:locale:color:](v4, "initWithShieldName:text:locale:color:", v11, v12, 0, &v15);
      goto LABEL_14;
    case 8:
      v10 = -[VKImageSourceKey initWithIconAttributeKey:attributeValue:](v4, "initWithIconAttributeKey:attributeValue:", *(unsigned int *)(v7 + 60), *(unsigned __int16 *)(v7 + 64));
      goto LABEL_14;
    case 9:
      v13 = (_QWORD *)(v7 + 16);
      if (*(char *)(v7 + 39) < 0)
        v13 = (_QWORD *)*v13;
      v10 = -[VKImageSourceKey initWithIconName:](v4, "initWithIconName:", v13);
LABEL_14:
      v4 = v10;
      v5 = v4;
      break;
    default:
      break;
  }

  return v5;
}

- (void)setDataValue:(unsigned int)a3
{
  self->_dataValue = a3;
  self->_hasDataValue = 1;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)transitLineColor
{
  unsigned int v2;
  float v3;
  float v4;
  float v5;
  unsigned int v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  $C28CD4A45FD07A4F97CC9D5F91F25271 result;

  LOBYTE(v2) = self->_shieldColor._backing._e[0];
  v3 = (float)v2;
  LOBYTE(v2) = self->_shieldColor._backing._e[1];
  v4 = (float)v2;
  LOBYTE(v2) = self->_shieldColor._backing._e[2];
  v5 = (float)v2;
  v6 = self->_shieldColor._backing._e[3];
  if ((float)(v3 * 0.0039216) >= 0.0031308)
    v7 = (float)(powf(v3 * 0.0039216, 0.41667) * 1.055) + -0.055;
  else
    v7 = v3 * 0.050667;
  v8 = v5 * 0.0039216;
  if ((float)(v4 * 0.0039216) >= 0.0031308)
    v9 = (float)(powf(v4 * 0.0039216, 0.41667) * 1.055) + -0.055;
  else
    v9 = v4 * 0.050667;
  if (v8 >= 0.0031308)
    v10 = (float)(powf(v8, 0.41667) * 1.055) + -0.055;
  else
    v10 = v5 * 0.050667;
  v11 = (float)v6 * 0.0039216;
  v12 = v7;
  v13 = v9;
  result.var3 = v11;
  result.var2 = v10;
  result.var1 = v13;
  result.var0 = v12;
  return result;
}

- (unsigned)variant
{
  return self->_iconVariant.primary;
}

- (unsigned)secondaryVariant
{
  return self->_iconVariant.secondary;
}

- (unsigned)keyType
{
  return self->_keyType;
}

- (NSString)imageName
{
  return self->_imageName;
}

- (NSString)shieldText
{
  return self->_shieldText;
}

- (NSString)shieldTextLocale
{
  return self->_shieldTextLocale;
}

- (unsigned)shieldType
{
  return self->_shieldType;
}

- (unsigned)iconAttributeKey
{
  return self->_iconAttributeKey;
}

- (unsigned)iconAttributeValue
{
  return self->_iconAttributeValue;
}

- (unsigned)dataType
{
  return self->_dataType;
}

- (void)setDataType:(unsigned __int8)a3
{
  self->_dataType = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (NSString)relatedText
{
  return self->_relatedText;
}

- (void)setRelatedText:(id)a3
{
  objc_storeStrong((id *)&self->_relatedText, a3);
}

- (BOOL)hasDataValue
{
  return self->_hasDataValue;
}

- (unsigned)dataValue
{
  return self->_dataValue;
}

- (CGPoint)imageCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_imageCenter.x;
  y = self->_imageCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setImageCenter:(CGPoint)a3
{
  self->_imageCenter = a3;
}

- (NSArray)fallbackImageKeys
{
  return self->_fallbackImageKeys;
}

- (void)setFallbackImageKeys:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackImageKeys, a3);
}

- (int64_t)sizeGroup
{
  return self->_sizeGroup;
}

- (void)setSizeGroup:(int64_t)a3
{
  self->_sizeGroup = a3;
}

- (float)contentScale
{
  return self->_contentScale;
}

- (unsigned)countryCode
{
  return self->_countryCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackImageKeys, 0);
  objc_storeStrong((id *)&self->_relatedText, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_shieldTextLocale, 0);
  objc_storeStrong((id *)&self->_shieldText, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 29) = 0;
  *((_DWORD *)self + 30) = 0;
  return self;
}

@end

@implementation VFXRenderTarget

- (VFXRenderTarget)initWithDescription:(id *)a3 size:(unint64_t)a4 arrayLength:
{
  uint64_t v4;
  uint64_t v6;
  VFXRenderTarget *result;
  objc_super v9;

  v6 = v4;
  v9.receiver = self;
  v9.super_class = (Class)VFXRenderTarget;
  result = -[VFXRenderTarget init](&v9, sel_init);
  if (result)
  {
    result->_description = ($70D0A97A2D0AFAF0EE8A7EF308C233C5)*a3;
    *(_QWORD *)result->_size = v6;
    result->_arrayLength = a4;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXRenderTarget;
  -[VFXRenderTarget dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  __CFString *v4;
  const char *v5;
  uint64_t v6;
  id result;
  const char *v8;
  uint64_t v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = sub_1B181CB34(self->_description.format);
  result = (id)objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("Format: %@ ; Size: %gx%g[%d] ; Texture: <%p> ; [rc:%ld/ts:%ld]\n"),
                 v6,
                 v4,
                 COERCE_FLOAT(*(_QWORD *)self->_size),
                 COERCE_FLOAT(HIDWORD(*(_QWORD *)self->_size)),
                 LOBYTE(self->_arrayLength),
                 self->_texture,
                 self->_referenceCount,
                 self->_timeStamp);
  if (self->_name)
    return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v8, (uint64_t)CFSTR("Name: %@ ; %@"),
                 v9,
                 self->_name,
                 result);
  return result;
}

- (BOOL)viewportDependant
{
  return (*((unsigned __int8 *)&self->_description + 3) >> 2) & 1;
}

- (unsigned)renderBufferFormat
{
  return self->_description.format;
}

- (BOOL)matchesDescription:(id *)a3 size:(unint64_t)a4 arrayLength:
{
  float32x2_t v4;
  uint32x2_t v5;
  BOOL v6;
  BOOL result;

  v5 = (uint32x2_t)vcge_f32((float32x2_t)0x3400000034000000, vabd_f32(*(float32x2_t *)self->_size, v4));
  result = (vpmin_u32(v5, v5).u32[0] & 0x80000000) != 0
        && self->_description.format == a3->var0
        && self->_description.sampleCount == a3->var1
        && ((*((_BYTE *)a3 + 3) ^ *((_BYTE *)&self->_description + 3)) & 5) == 0
        && (((*((_BYTE *)a3 + 3) ^ *((_BYTE *)&self->_description + 3)) & 0x30) == 0
          ? (v6 = self->_description.textureUsage == a3->var2)
          : (v6 = 0),
            v6)
        && self->_arrayLength == a4;
  return result;
}

- (void)setName:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  self->_name = (NSString *)objc_msgSend_copy(a3, v5, v6, v7);
}

- (void)setTexture:(id)a3
{
  id texture;
  id v6;
  BOOL v7;
  const char *v8;
  uint64_t v9;

  texture = self->_texture;
  if (texture != a3)
  {

    v6 = a3;
    self->_texture = v6;
    if (self->_name)
      v7 = v6 == 0;
    else
      v7 = 1;
    if (!v7 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend_setLabel_(self->_texture, v8, (uint64_t)self->_name, v9);

    self->_ciImage = 0;
  }
}

- (id)textureForSliceIndex:(unint64_t)a3
{
  uint64_t v3;
  NSArray *sliceTextures;
  id texture;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;

  sliceTextures = self->_sliceTextures;
  if (sliceTextures)
    return (id)objc_msgSend_objectAtIndexedSubscript_(sliceTextures, a2, a3, v3);
  texture = self->_texture;
  if (objc_msgSend_textureType(texture, a2, a3, v3) == 3 || objc_msgSend_textureType(texture, v8, v9, v10) == 5)
  {
    v11 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v15 = objc_msgSend_arrayLength(texture, v12, v13, v14);
    sliceTextures = (NSArray *)objc_msgSend_initWithCapacity_(v11, v16, v15, v17);
    if (objc_msgSend_arrayLength(texture, v18, v19, v20))
    {
      v22 = 0;
      do
      {
        v23 = objc_msgSend_pixelFormat(texture, a2, v21, v3);
        v25 = (void *)objc_msgSend_newTextureViewWithPixelFormat_textureType_levels_slices_(texture, v24, v23, 2, 0, 1, v22, 1);
        objc_msgSend_setObject_atIndexedSubscript_(sliceTextures, v26, (uint64_t)v25, v22);

        ++v22;
      }
      while (v22 < objc_msgSend_arrayLength(texture, v27, v28, v29));
    }
    self->_sliceTextures = sliceTextures;
    return (id)objc_msgSend_objectAtIndexedSubscript_(sliceTextures, a2, a3, v3);
  }
  return self->_texture;
}

- (id)ciImage
{
  id result;
  id v4;
  const char *v5;

  result = self->_ciImage;
  if (!result)
  {
    if (self->_texture)
    {
      v4 = objc_alloc(MEMORY[0x1E0C9DDC8]);
      result = (id)objc_msgSend_initWithMTLTexture_options_(v4, v5, (uint64_t)self->_texture, 0);
      self->_ciImage = (CIImage *)result;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)texture
{
  return self->_texture;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)referenceCount
{
  return self->_referenceCount;
}

- (void)setReferenceCount:(int64_t)a3
{
  self->_referenceCount = a3;
}

- (int64_t)timeStamp
{
  return self->_timeStamp;
}

- (void)setTimeStamp:(int64_t)a3
{
  self->_timeStamp = a3;
}

@end

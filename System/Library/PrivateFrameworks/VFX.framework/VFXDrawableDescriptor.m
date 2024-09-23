@implementation VFXDrawableDescriptor

+ (NSString)drawableAttachment
{
  unsigned __int8 v2;
  CFX::RG::ResourceIdentifier *v4;
  uint64_t v5;

  v2 = atomic_load((unsigned __int8 *)&qword_1EEF66270);
  if ((v2 & 1) == 0)
  {
    v4 = (CFX::RG::ResourceIdentifier *)__cxa_guard_acquire(&qword_1EEF66270);
    if ((_DWORD)v4)
    {
      v5 = RGResourceIdentifierFinalColor(v4);
      qword_1EEF66268 = (uint64_t)RGResourceIdentifierGetPath(v5);
      __cxa_guard_release(&qword_1EEF66270);
    }
  }
  return (NSString *)qword_1EEF66268;
}

- (MTLTextureDescriptor)metalDescriptor
{
  return (MTLTextureDescriptor *)objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x1E0CC6BB0], a2, self->pixelFormat, self->width, self->height, 0);
}

- (int64_t)width
{
  return self->width;
}

- (void)setWidth:(int64_t)a3
{
  self->width = a3;
}

- (int64_t)height
{
  return self->height;
}

- (void)setHeight:(int64_t)a3
{
  self->height = a3;
}

- (unint64_t)pixelFormat
{
  return self->pixelFormat;
}

- (void)setPixelFormat:(unint64_t)a3
{
  self->pixelFormat = a3;
}

@end

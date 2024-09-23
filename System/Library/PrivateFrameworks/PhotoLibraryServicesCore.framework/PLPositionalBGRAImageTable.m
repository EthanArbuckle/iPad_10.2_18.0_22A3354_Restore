@implementation PLPositionalBGRAImageTable

+ (unint64_t)metalPixelFormat
{
  return 43;
}

+ (__CFString)colorSpaceName
{
  return (__CFString *)*MEMORY[0x1E0C9DA10];
}

- (CGImage)createImageWithIdentifier:(id)a3 orIndex:(unint64_t)a4
{
  OSQueueHead **v6;
  OSQueueHead **v7;
  unint64_t v8;
  size_t v9;
  size_t v10;
  size_t v11;
  uint64_t v12;
  PLPositionalBGRAImageTable *v13;
  char *v14;
  size_t v15;
  id *v16;
  CGDataProvider *v17;
  CGImage *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  if (self->super.super._readOnly)
  {
    if (a4 == 0x7FFFFFFFFFFFFFFFLL)
      return 0;
  }
  else if (self->super.super._entryCapacity <= a4)
  {
    return 0;
  }
  v23 = 0;
  v24 = 0;
  v21 = 0;
  v22 = 0;
  v20 = 0;
  v6 = (OSQueueHead **)PLPositionalTableMemoryPool_Alloc((OSQueueHead *)-[PLPositionalTable pool](self, "pool", a3), (void *)-[PLPositionalTable entryLength](self, "entryLength"));
  if (!v6)
    return 0;
  v7 = v6;
  if (!-[PLPositionalImageTable readImageDataAtIndex:intoPoolNode:bytesRead:imageWidth:imageHeight:imageDataWidth:imageDataHeight:startingOffset:bytesPerRow:uuidBytes:](self, "readImageDataAtIndex:intoPoolNode:bytesRead:imageWidth:imageHeight:imageDataWidth:imageDataHeight:startingOffset:bytesPerRow:uuidBytes:", a4, v6, &v20, (char *)&v24 + 4, &v24, (char *)&v23 + 4, &v23, &v21, &v22, 0))
  {
    PLPositionalTableMemoryPool_Free(v7);
    return 0;
  }
  v8 = -[PLPositionalTable entryLength](self, "entryLength");
  v10 = (int)v24;
  v9 = SHIDWORD(v24);
  v11 = -[PLPositionalImageTable formatMaxBytesPerRow](self, "formatMaxBytesPerRow");
  v12 = v21;
  v13 = self;
  if (_create5551BGRACGImageFromTableEntryNode_s_onceToken != -1)
    dispatch_once(&_create5551BGRACGImageFromTableEntryNode_s_onceToken, &__block_literal_global_9696);
  if (*v7)
  {
    v14 = (char *)*v7 + v12;
    v15 = v8 - v12 - 28;
    v16 = (id *)malloc_type_calloc(1uLL, 0x10uLL, 0xA0040AFF93C70uLL);
    *v16 = v7;
    objc_storeStrong(v16 + 1, self);
    v17 = CGDataProviderCreateWithData(v16, v14, v15, (CGDataProviderReleaseDataCallback)_freeCGImageDataProviderBuffer);
    v18 = CGImageCreate(v9, v10, 5uLL, 0x10uLL, v11, (CGColorSpaceRef)_create5551BGRACGImageFromTableEntryNode_s_colorSpace, 0x1006u, v17, 0, 0, kCGRenderingIntentDefault);
    CGDataProviderRelease(v17);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)getImageDataOffset:(int64_t *)a3 size:(CGSize *)a4 bytesPerRow:(unint64_t *)a5 fromEntryFooter:(PLImageTableEntryFooter_s *)a6
{
  uint64_t v11;
  int64_t v12;
  unsigned int var1;
  BOOL v14;
  unsigned int v15;
  void *v16;
  uint64_t v17;
  CGFloat v18;

  v11 = -[PLPositionalImageTable formatSideLen](self, "formatSideLen");
  if (-[PLPositionalImageTable formatIsCropped](self, "formatIsCropped"))
  {
    v12 = 0;
  }
  else
  {
    var1 = a6->var1;
    v14 = v11 >= var1;
    v15 = v11 - var1;
    if (v15 != 0 && v14)
      v12 = -[PLPositionalImageTable formatBytesPerPixel](self, "formatBytesPerPixel") * (v15 >> 1);
    else
      v12 = 0;
    if (a6->var2 < v11)
    {
      -[PLPositionalImageTable format](self, "format");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "tableFormatBytesPerRowForWidth:", v11);

      v12 += v17 * ((v11 - a6->var2 + 1) >> 1);
    }
  }
  v18 = (double)-[PLPositionalImageTable formatSideLen](self, "formatSideLen");
  *a3 = v12;
  *a5 = -[PLPositionalImageTable formatMaxBytesPerRow](self, "formatMaxBytesPerRow");
  a4->width = v18;
  a4->height = v18;
}

@end

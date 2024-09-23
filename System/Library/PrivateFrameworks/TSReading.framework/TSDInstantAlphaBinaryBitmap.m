@implementation TSDInstantAlphaBinaryBitmap

- (TSDInstantAlphaBinaryBitmap)initWithWidth:(int64_t)a3 height:(int64_t)a4
{
  void *v7;
  uint64_t v8;
  TSDInstantAlphaBinaryBitmap *v9;
  TSDInstantAlphaBinaryBitmap *v10;
  size_t AlignedBytesPerRow;
  char *v12;
  objc_super v14;

  if (a3 < 1 || a4 <= 0)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInstantAlphaBinaryBitmap initWithWidth:height:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInstantAlphaBinaryBitmap.m"), 19, CFSTR("Invalid parameter not satisfying: %s"), "width > 0 && height > 0");
  }
  v14.receiver = self;
  v14.super_class = (Class)TSDInstantAlphaBinaryBitmap;
  v9 = -[TSDInstantAlphaBinaryBitmap init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->mWidth = a3;
    v9->mHeight = a4;
    AlignedBytesPerRow = TSUBitmapGetAlignedBytesPerRow();
    v10->mRowBytes = AlignedBytesPerRow;
    v12 = (char *)malloc_type_calloc(v10->mHeight, AlignedBytesPerRow, 0x6DB49538uLL);
    v10->mData = v12;
    if (!v12)
    {

      return 0;
    }
  }
  return v10;
}

- (void)dealloc
{
  char *mData;
  objc_super v4;

  mData = self->mData;
  if (mData)
    free(mData);
  v4.receiver = self;
  v4.super_class = (Class)TSDInstantAlphaBinaryBitmap;
  -[TSDInstantAlphaBinaryBitmap dealloc](&v4, sel_dealloc);
}

- (void)unionWithBitmap:(id)a3
{
  int64_t mHeight;
  int64_t v4;
  uint64_t v5;
  char *mData;
  int64_t mRowBytes;
  int64_t i;
  void *v9;
  uint64_t v10;

  if (self->mWidth == *((_QWORD *)a3 + 1) && (mHeight = self->mHeight, mHeight == *((_QWORD *)a3 + 2)))
  {
    if (mHeight >= 1)
    {
      v4 = 0;
      v5 = *((_QWORD *)a3 + 4);
      mRowBytes = self->mRowBytes;
      mData = self->mData;
      do
      {
        if (mRowBytes >= 1)
        {
          for (i = 0; i < mRowBytes; ++i)
          {
            mData[i] |= *(_BYTE *)(v5 + i);
            mRowBytes = self->mRowBytes;
          }
          mHeight = self->mHeight;
        }
        ++v4;
        mData += mRowBytes;
        v5 += *((_QWORD *)a3 + 3);
      }
      while (mHeight > v4);
    }
  }
  else
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInstantAlphaBinaryBitmap unionWithBitmap:]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInstantAlphaBinaryBitmap.m"), 50, CFSTR("unionWithBitmap: sizes do not match"));
  }
}

@end

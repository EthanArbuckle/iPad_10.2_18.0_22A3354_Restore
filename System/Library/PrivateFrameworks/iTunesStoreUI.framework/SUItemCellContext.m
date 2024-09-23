@implementation SUItemCellContext

- (SUItemCellContext)init
{
  SUItemCellContext *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUItemCellContext;
  result = -[SUItemCellContext init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_stringSizeCacheKeyCallBacks.version = 0u;
    *(_OWORD *)&result->_stringSizeCacheKeyCallBacks.release = 0u;
    *(_OWORD *)&result->_stringSizeCacheKeyCallBacks.equal = 0u;
  }
  return result;
}

- (void)dealloc
{
  __CFDictionary *cachedRatingImages;
  __CFDictionary *stringSizes;
  objc_super v5;

  cachedRatingImages = self->_cachedRatingImages;
  if (cachedRatingImages)
  {
    CFRelease(cachedRatingImages);
    self->_cachedRatingImages = 0;
  }
  stringSizes = self->_stringSizes;
  if (stringSizes)
  {
    CFRelease(stringSizes);
    self->_stringSizes = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)SUItemCellContext;
  -[SUArtworkCellContext dealloc](&v5, sel_dealloc);
}

- (id)ratingImageForRating:(float)a3 style:(int64_t)a4
{
  __CFDictionary *cachedRatingImages;
  const void *v8;
  id Value;
  uint64_t v10;
  double v11;

  cachedRatingImages = self->_cachedRatingImages;
  if (!cachedRatingImages)
  {
    cachedRatingImages = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x24BDBD6B0]);
    self->_cachedRatingImages = cachedRatingImages;
  }
  v8 = (const void *)(uint64_t)rintf(a3 * 10.0);
  Value = (id)CFDictionaryGetValue(cachedRatingImages, v8);
  if (!Value)
  {
    v10 = objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    *(float *)&v11 = a3;
    Value = +[SUUserRatingView copyImageForRating:backgroundColor:style:](SUUserRatingView, "copyImageForRating:backgroundColor:style:", v10, a4, v11);
    if (Value)
    {
      CFDictionarySetValue(self->_cachedRatingImages, v8, Value);

    }
  }
  return Value;
}

- (CGSize)sizeForString:(id)a3 font:(id)a4 constrainedToSize:(CGSize)a5
{
  double height;
  double width;
  __CFDictionary *stringSizes;
  void *Value;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  height = a5.height;
  width = a5.width;
  stringSizes = self->_stringSizes;
  if (stringSizes)
  {
    if (a3)
      goto LABEL_3;
LABEL_10:
    width = *MEMORY[0x24BDBF148];
    height = *(double *)(MEMORY[0x24BDBF148] + 8);
    goto LABEL_12;
  }
  stringSizes = CFDictionaryCreateMutable(0, 0, (const CFDictionaryKeyCallBacks *)&self->_stringSizeCacheKeyCallBacks, MEMORY[0x24BDBD6B0]);
  self->_stringSizes = stringSizes;
  if (!a3)
    goto LABEL_10;
LABEL_3:
  Value = (void *)CFDictionaryGetValue(stringSizes, a3);
  if (Value)
  {
    objc_msgSend(Value, "CGSizeValue");
    if (v13 < height)
      height = v13;
    if (v12 < width)
      width = v12;
  }
  else
  {
    objc_msgSend(a3, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", a4, 4, width, height);
    width = v14;
    height = v15;
    CFDictionarySetValue(self->_stringSizes, a3, (const void *)objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:"));
  }
LABEL_12:
  v16 = width;
  v17 = height;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)resetLayoutCaches
{
  __CFDictionary *stringSizes;
  objc_super v4;

  stringSizes = self->_stringSizes;
  if (stringSizes)
  {
    CFRelease(stringSizes);
    self->_stringSizes = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SUItemCellContext;
  -[SUCellConfigurationContext resetLayoutCaches](&v4, sel_resetLayoutCaches);
}

- ($91CE74A43BC82DB31014AD40E653447B)stringSizeCacheKeyCallBacks
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var1;
  *(_OWORD *)&retstr->var2 = v3;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[1].var5;
  return self;
}

- (void)setStringSizeCacheKeyCallBacks:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->var2;
  v3 = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_stringSizeCacheKeyCallBacks.version = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->_stringSizeCacheKeyCallBacks.release = v4;
  *(_OWORD *)&self->_stringSizeCacheKeyCallBacks.equal = v3;
}

@end

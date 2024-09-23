@implementation FlyoverGlyphFrameList

- (FlyoverGlyphFrameList)init
{
  FlyoverGlyphFrameList *v2;
  void *v3;
  double v4;
  unint64_t v5;
  const $8F8FE36A74EEA149E734A88F81E85D6F *v6;
  FlyoverGlyphFrameList *v7;
  CGImage *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FlyoverGlyphFrameList;
  v2 = -[FlyoverGlyphFrameList init](&v10, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("FlyoverGlyphFrames")));
    objc_msgSend(v3, "scale");
    v5 = vcvtad_u64_f64(v4);
    if (v5 == 2)
    {
      v6 = (const $8F8FE36A74EEA149E734A88F81E85D6F *)&unk_100E37A70;
    }
    else
    {
      if (v5 != 3)
      {
        NSLog(CFSTR("%s: Unsupported scale: %ld"), "-[FlyoverGlyphFrameList init]", v5);
        goto LABEL_11;
      }
      v6 = (const $8F8FE36A74EEA149E734A88F81E85D6F *)&unk_100E38624;
    }
    v2->_frames = v6;
    v8 = (CGImage *)objc_msgSend(objc_retainAutorelease(v3), "CGImage");
    v2->_atlasImage = v8;
    if (v8)
    {
      v2->_inverseScaleFactor = 1.0 / (double)v5;
      v2->_horizontalScale = 1.0 / (double)CGImageGetWidth(v8);
      v2->_verticalScale = 1.0 / (double)CGImageGetHeight(v2->_atlasImage);
      v2->_frameCount = 214;
      v2->_frameDuration = 0.0166666667;
      v2->_introFrameRange = (_NSRange)xmmword_100E37A40;
      v2->_loopFrameRange = (_NSRange)xmmword_100E37A50;
      v2->_outroFrameRange = (_NSRange)xmmword_100E37A60;
      v7 = v2;
LABEL_12:

      goto LABEL_13;
    }
    NSLog(CFSTR("%s: couldn't get a CGImage for the texture atlas"), "-[FlyoverGlyphFrameList init]");
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  v7 = 0;
LABEL_13:

  return v7;
}

- ($6FF9910CDCD476ED463384A0FC482A98)frameAtIndex:(SEL)a3
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unsigned int v8;
  unsigned int v9;
  double width;
  double height;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  unint64_t v17;
  double var2;

  v7 = *(_QWORD *)&self->var0.y + 14 * a4;
  if (*(_BYTE *)(v7 + 12))
    v8 = *(unsigned __int16 *)(v7 + 10);
  else
    v8 = *(unsigned __int16 *)(v7 + 8);
  if (*(_BYTE *)(v7 + 12))
    v9 = *(unsigned __int16 *)(v7 + 8);
  else
    v9 = *(unsigned __int16 *)(v7 + 10);
  LOWORD(v4) = *(_WORD *)(v7 + 4);
  width = self->var1.width;
  height = self->var1.height;
  v12 = width * ((double)*(unsigned __int16 *)(v7 + 8) * 0.5 + (double)v4);
  LOWORD(v5) = *(_WORD *)(v7 + 6);
  v13 = width * ((double)*(unsigned __int16 *)(v7 + 10) * 0.5 + (double)v5);
  v14 = width * (double)v8;
  v15 = width * (double)v9;
  v16 = -1.57079633;
  v17 = 0;
  if (!*(_BYTE *)(v7 + 12))
    v16 = 0.0;
  LOWORD(v17) = *(_WORD *)v7;
  LOWORD(v6) = *(_WORD *)(v7 + 2);
  var2 = self->var2;
  retstr->var0.x = v12;
  retstr->var0.y = v13;
  retstr->var1.width = v14;
  retstr->var1.height = v15;
  retstr->var2 = v16;
  retstr->var3.origin.x = height * (double)v17;
  retstr->var3.origin.y = var2 * (double)v6;
  retstr->var3.size.width = height * (double)v8;
  retstr->var3.size.height = var2 * (double)v9;
  return self;
}

- (unint64_t)frameCount
{
  return self->_frameCount;
}

- (double)frameDuration
{
  return self->_frameDuration;
}

- (_NSRange)introFrameRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_introFrameRange.length;
  location = self->_introFrameRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (_NSRange)loopFrameRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_loopFrameRange.length;
  location = self->_loopFrameRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (_NSRange)outroFrameRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_outroFrameRange.length;
  location = self->_outroFrameRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (CGImage)atlasImage
{
  return self->_atlasImage;
}

@end

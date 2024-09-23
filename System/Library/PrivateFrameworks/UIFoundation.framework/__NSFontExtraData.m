@implementation __NSFontExtraData

- (unint64_t)hash
{
  unint64_t v2;

  v2 = ((unint64_t)*(_BYTE *)&self->_fFlags >> 1) & 1;
  return -[NSString hash](self->_textStyleForScaling, "hash") ^ v2 ^ (unint64_t)self->_pointSizeForScaling ^ (unint64_t)self->_maximumPointSizeAfterScaling;
}

- (double)initWithFont:(void *)a1
{
  double *v3;
  double Ascent;
  double Descent;
  double v6;
  const __CFString *v7;
  const __CFString *v8;
  objc_super v10;

  if (!a1)
    return 0;
  v10.receiver = a1;
  v10.super_class = (Class)__NSFontExtraData;
  v3 = (double *)objc_msgSendSuper2(&v10, sel_init);
  if (v3)
  {
    *((_BYTE *)v3 + 24) = (_BYTE)v3[3] & 0xFE | CTFontIsSystemUIFont();
    Ascent = CTFontGetAscent(a2);
    Descent = CTFontGetDescent(a2);
    v6 = 0.0;
    if ((CTFontIsTextStyleFont() & 1) == 0)
    {
      v7 = CTFontCopyPostScriptName(a2);
      if (v7)
      {
        v8 = v7;
        if (CFStringHasPrefix(v7, CFSTR("Times-"))
          || CFStringHasPrefix(v8, CFSTR("Helvetica-"))
          || CFEqual(v8, CFSTR("Helvetica")))
        {
          v6 = (Ascent + Descent) * 0.15;
        }
        CFRelease(v8);
      }
    }
    v3[1] = Ascent + v6;
    v3[2] = Descent + Ascent + v6;
  }
  return v3;
}

- (BOOL)isEqualToExtraData:(id)a3
{
  NSString *textStyleForScaling;
  int v6;

  if (!a3)
  {
    LOBYTE(v6) = 0;
    return v6;
  }
  if (self == a3)
  {
    LOBYTE(v6) = 1;
    return v6;
  }
  if (((*((unsigned __int8 *)a3 + 24) ^ *(_BYTE *)&self->_fFlags) & 2) != 0)
    goto LABEL_9;
  textStyleForScaling = self->_textStyleForScaling;
  if (textStyleForScaling == *((NSString **)a3 + 4)
    || (v6 = -[NSString isEqual:](textStyleForScaling, "isEqual:")) != 0)
  {
    if (self->_pointSizeForScaling == *((double *)a3 + 5))
    {
      LOBYTE(v6) = self->_maximumPointSizeAfterScaling == *((double *)a3 + 6);
      return v6;
    }
LABEL_9:
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)__NSFontExtraData;
  -[__NSFontExtraData dealloc](&v3, sel_dealloc);
}

- (BOOL)_hasVerticalMetricsWithPlatformFont:(__CTFont *)a3
{
  int v3;

  v3 = *(_BYTE *)&self->_fFlags & 0xC;
  if ((*(_BYTE *)&self->_fFlags & 0xC) == 0)
  {
    v3 = 8;
    if ((CTFontHasTable() & 1) == 0)
    {
      if (CTFontHasTable())
        v3 = 8;
      else
        v3 = 4;
    }
    *(_BYTE *)&self->_fFlags = *(_BYTE *)&self->_fFlags & 0xF3 | v3;
  }
  return v3 == 8;
}

@end

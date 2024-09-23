@implementation _BKDisplayInfo

- (BOOL)isExternal
{
  return self->_external;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (unsigned)nativeRotation
{
  return self->_nativeRotation;
}

- (CAWindowServerDisplay)windowServerDisplay
{
  return self->_windowServerDisplay;
}

- (CGRect)normalizedDigitizerRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizedDigitizerRect.origin.x;
  y = self->_normalizedDigitizerRect.origin.y;
  width = self->_normalizedDigitizerRect.size.width;
  height = self->_normalizedDigitizerRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (_BKDisplayInfo)init
{
  _BKDisplayInfo *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_BKDisplayInfo;
  result = -[_BKDisplayInfo init](&v8, "init");
  if (result)
  {
    result->_normalizedDigitizerRect.origin.x = 0.0;
    result->_normalizedDigitizerRect.origin.y = 0.0;
    __asm { FMOV            V0.2D, #1.0 }
    result->_normalizedDigitizerRect.size = _Q0;
  }
  return result;
}

- (id)description
{
  CAWindowServerDisplay *windowServerDisplay;
  double scale;
  __CFString *v5;
  void *v6;
  void *v7;
  CGSize size;

  windowServerDisplay = self->_windowServerDisplay;
  size = self->_size;
  scale = self->_scale;
  v5 = sub_100034718(self->_nativeRotation);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CAWindowServerDisplay:%p size:{%g,%g} scale:%g nativeRotation:%@ normalizedDigitizerRect:{{%g,%g},{%g,%g}} external:%d"), windowServerDisplay, size, *(_QWORD *)&scale, v6, *(_QWORD *)&self->_normalizedDigitizerRect.origin.x, *(_QWORD *)&self->_normalizedDigitizerRect.origin.y, *(_QWORD *)&self->_normalizedDigitizerRect.size.width, *(_QWORD *)&self->_normalizedDigitizerRect.size.height, self->_external));

  return v7;
}

- (void)setWindowServerDisplay:(id)a3
{
  objc_storeStrong((id *)&self->_windowServerDisplay, a3);
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (void)setNativeRotation:(unsigned __int8)a3
{
  self->_nativeRotation = a3;
}

- (void)setNormalizedDigitizerRect:(CGRect)a3
{
  self->_normalizedDigitizerRect = a3;
}

- (void)setExternal:(BOOL)a3
{
  self->_external = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowServerDisplay, 0);
}

@end

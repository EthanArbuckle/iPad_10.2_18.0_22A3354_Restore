@implementation HUDTheme

- (HUDTheme)initWithPreviousHangTextColor:(CGColor *)a3 currentHangTextColor:(CGColor *)a4 currentHangSevereTextColor:(CGColor *)a5 previousHangSevereTextColor:(CGColor *)a6 currentHangCriticalTextColor:(CGColor *)a7 previousHangCriticalTextColor:(CGColor *)a8 backgroundColor:(CGColor *)a9 currentProcessExitTextColor:(CGColor *)a10 processExitReasonNamespaceTextColor:(CGColor *)a11
{
  HUDTheme *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)HUDTheme;
  v17 = -[HUDTheme init](&v19, "init");
  if (v17)
  {
    v17->_previousHangTextColor = CGColorRetain(a3);
    v17->_currentHangTextColor = CGColorRetain(a4);
    v17->_currentHangSevereTextColor = CGColorRetain(a5);
    v17->_previousHangSevereTextColor = CGColorRetain(a6);
    v17->_currentHangCriticalTextColor = CGColorRetain(a7);
    v17->_previousHangCriticalTextColor = CGColorRetain(a8);
    v17->_backgroundColor = CGColorRetain(a9);
    v17->_currentProcessExitTextColor = CGColorRetain(a10);
    v17->_processExitReasonNamespaceTextColor = CGColorRetain(a11);
  }
  return v17;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_previousHangTextColor);
  CFRelease(self->_currentHangTextColor);
  CFRelease(self->_currentHangSevereTextColor);
  CFRelease(self->_previousHangSevereTextColor);
  CFRelease(self->_currentHangCriticalTextColor);
  CFRelease(self->_previousHangCriticalTextColor);
  CFRelease(self->_backgroundColor);
  CFRelease(self->_currentProcessExitTextColor);
  CFRelease(self->_processExitReasonNamespaceTextColor);
  v3.receiver = self;
  v3.super_class = (Class)HUDTheme;
  -[HUDTheme dealloc](&v3, "dealloc");
}

+ (id)lightModeTheme
{
  if (qword_10005FC48 != -1)
    dispatch_once(&qword_10005FC48, &stru_10004D3E0);
  return (id)qword_10005FC50;
}

+ (id)darkModeTheme
{
  if (qword_10005FC58 != -1)
    dispatch_once(&qword_10005FC58, &stru_10004D400);
  return (id)qword_10005FC60;
}

- (CGColor)currentHangTextColorForStatus:(int64_t)a3
{
  CGColor *v3;

  if ((unint64_t)a3 <= 3)
    return *(Class *)((char *)&self->super.isa + qword_1000371A8[a3]);
  return v3;
}

- (CGColor)previousHangTextColorForStatus:(int64_t)a3
{
  CGColor *v3;

  if ((unint64_t)a3 <= 3)
    return *(Class *)((char *)&self->super.isa + qword_1000371C8[a3]);
  return v3;
}

- (CGColor)previousHangTextColor
{
  return self->_previousHangTextColor;
}

- (CGColor)currentHangTextColor
{
  return self->_currentHangTextColor;
}

- (CGColor)currentHangSevereTextColor
{
  return self->_currentHangSevereTextColor;
}

- (CGColor)previousHangSevereTextColor
{
  return self->_previousHangSevereTextColor;
}

- (CGColor)currentHangCriticalTextColor
{
  return self->_currentHangCriticalTextColor;
}

- (CGColor)previousHangCriticalTextColor
{
  return self->_previousHangCriticalTextColor;
}

- (CGColor)backgroundColor
{
  return self->_backgroundColor;
}

- (CGColor)currentProcessExitTextColor
{
  return self->_currentProcessExitTextColor;
}

- (CGColor)processExitReasonNamespaceTextColor
{
  return self->_processExitReasonNamespaceTextColor;
}

@end

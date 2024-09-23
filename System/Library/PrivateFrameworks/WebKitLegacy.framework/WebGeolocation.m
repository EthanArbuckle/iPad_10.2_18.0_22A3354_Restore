@implementation WebGeolocation

- (id)_initWithWebCoreGeolocation:(void *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WebGeolocation;
  result = -[WebGeolocation init](&v5, sel_init);
  if (result)
  {
    ++*((_DWORD *)a3 + 8);
    *((_QWORD *)result + 1) = a3;
  }
  return result;
}

- (void)setIsAllowed:(BOOL)a3
{
  WebGeolocationPrivate *v3;
  StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;

  v3 = self->_private;
  v6 = 0;
  WebCore::Geolocation::setIsAllowed(v3, a3, (const WTF::String *)&v6);
  v5 = v6;
  v6 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v4);
    else
      *(_DWORD *)v5 -= 2;
  }
}

- (void)dealloc
{
  WebGeolocationPrivate *v3;
  uint64_t v4;
  objc_super v5;

  v3 = self->_private;
  if (v3)
  {
    if (*((_DWORD *)v3 + 8) == 1)
    {
      v4 = MEMORY[0x1D82A3E0C]();
      MEMORY[0x1D82A3E18](v4);
    }
    else
    {
      --*((_DWORD *)v3 + 8);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)WebGeolocation;
  -[WebGeolocation dealloc](&v5, sel_dealloc);
}

@end

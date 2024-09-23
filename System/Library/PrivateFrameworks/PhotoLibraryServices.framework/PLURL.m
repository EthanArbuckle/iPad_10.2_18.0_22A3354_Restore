@implementation PLURL

- (void)dealloc
{
  objc_super v4;
  objc_super v5;

  if (atomic_load(&self->_ssbCounter))
  {
    v5.receiver = self;
    v5.super_class = (Class)PLURL;
    -[PLURL stopAccessingSecurityScopedResource](&v5, sel_stopAccessingSecurityScopedResource);
  }
  v4.receiver = self;
  v4.super_class = (Class)PLURL;
  -[PLURL dealloc](&v4, sel_dealloc);
}

- (BOOL)startAccessingSecurityScopedResource
{
  unsigned __int16 *p_ssbCounter;
  int v3;
  BOOL result;
  objc_super v5;

  p_ssbCounter = &self->_ssbCounter;
  do
    v3 = __ldaxr(p_ssbCounter);
  while (__stlxr(v3 + 1, p_ssbCounter));
  if (v3)
    return 1;
  v5.receiver = self;
  v5.super_class = (Class)PLURL;
  if (-[PLURL startAccessingSecurityScopedResource](&v5, sel_startAccessingSecurityScopedResource))
    return 1;
  result = 0;
  atomic_store(0, p_ssbCounter);
  return result;
}

- (void)stopAccessingSecurityScopedResource
{
  unsigned __int16 *p_ssbCounter;
  int v3;
  objc_super v4;

  p_ssbCounter = &self->_ssbCounter;
  do
    v3 = __ldaxr(p_ssbCounter);
  while (__stlxr(v3 - 1, p_ssbCounter));
  if (v3 == 1)
  {
    v4.receiver = self;
    v4.super_class = (Class)PLURL;
    -[PLURL stopAccessingSecurityScopedResource](&v4, sel_stopAccessingSecurityScopedResource);
  }
}

- (id)replacementObjectForCoder:(id)a3
{
  void *v3;
  void *v4;

  -[PLURL absoluteString](self, "absoluteString", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v3);

  return v4;
}

@end

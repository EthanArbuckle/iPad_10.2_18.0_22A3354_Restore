@implementation _NSATSTypesetterGuts

- (_DWORD)initWithTypesetter:(void *)a1
{
  _DWORD *v3;
  int v4;
  uint64_t v5;
  objc_super v7;

  if (!a1)
    return 0;
  v7.receiver = a1;
  v7.super_class = (Class)_NSATSTypesetterGuts;
  v3 = objc_msgSendSuper2(&v7, sel_init);
  if (v3)
  {
    v3[21] = v3[21] & 0xFFFFFFFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = 2;
    else
      v4 = 0;
    v3[21] = v3[21] & 0xFFFFFFFD | v4;
    *((_QWORD *)v3 + 5) = objc_msgSend(a2, "_getAuxData");
    if (__NSLineFragmentRectIMP)
    {
      if (objc_opt_class() != __NSATSTypesetterClass)
      {
        v5 = objc_msgSend(a2, "methodForSelector:", sel_lineFragmentRectForProposedRect_remainingRect_);
        if (v5 != __NSLineFragmentRectIMP)
          *((_QWORD *)v3 + 6) = NSAllocateCollectable(0x20uLL, 0);
      }
    }
  }
  return v3;
}

- (void)dealloc
{
  NSZone *v3;
  __CTTypesetter *ctTypesetter;
  $500F09A0A86A1DC0979241A7D72823DF *lineFragmentRectArgs;
  char *bidiLevels;
  objc_super v7;

  v3 = (NSZone *)-[_NSATSTypesetterGuts zone](self, "zone");
  ctTypesetter = self->_ctTypesetter;
  if (ctTypesetter)
    CFRelease(ctTypesetter);

  lineFragmentRectArgs = self->_lineFragmentRectArgs;
  if (lineFragmentRectArgs)
    NSZoneFree(v3, lineFragmentRectArgs);
  bidiLevels = self->_bidiLevels;
  if (bidiLevels)
    NSZoneFree(v3, bidiLevels);
  v7.receiver = self;
  v7.super_class = (Class)_NSATSTypesetterGuts;
  -[_NSATSTypesetterGuts dealloc](&v7, sel_dealloc);
}

- (void)finalize
{
  NSZone *v3;
  __CTTypesetter *ctTypesetter;
  char *bidiLevels;
  objc_super v6;

  v3 = (NSZone *)-[_NSATSTypesetterGuts zone](self, "zone");
  ctTypesetter = self->_ctTypesetter;
  if (ctTypesetter)
    CFRelease(ctTypesetter);
  bidiLevels = self->_bidiLevels;
  if (bidiLevels)
    NSZoneFree(v3, bidiLevels);
  v6.receiver = self;
  v6.super_class = (Class)_NSATSTypesetterGuts;
  -[_NSATSTypesetterGuts finalize](&v6, sel_finalize);
}

@end

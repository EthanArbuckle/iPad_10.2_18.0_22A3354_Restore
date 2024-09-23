@implementation PXGLayoutSpriteModifier

- (PXGLayoutSpriteModifier)initWithStateHandler:(id)a3
{
  id v4;
  PXGLayoutSpriteModifier *v5;
  void *v6;
  id stateHandler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXGLayoutSpriteModifier;
  v5 = -[PXGLayoutSpriteModifier init](&v9, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    stateHandler = v5->_stateHandler;
    v5->_stateHandler = v6;

  }
  return v5;
}

- (void)modifySpriteDataStore:(id)a3 spriteIndexRange:(_PXGSpriteIndexRange)a4 forLayout:(id)a5
{
  uint64_t v8;
  id v9;
  _QWORD *stateHandler;
  void (*v11)(_QWORD *, id, _PXGSpriteIndexRange, _OWORD *, uint64_t);
  _OWORD v12[2];
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v9 = a5;
  v16 = 0;
  v14 = 0u;
  v15 = 0u;
  if (a3)
    objc_msgSend(a3, "spritesInRange:", a4);
  stateHandler = self->_stateHandler;
  v11 = (void (*)(_QWORD *, id, _PXGSpriteIndexRange, _OWORD *, uint64_t))stateHandler[2];
  v12[0] = v14;
  v12[1] = v15;
  v13 = v16;
  ((void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v11)(stateHandler, v9, a4, v12, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stateHandler, 0);
}

@end

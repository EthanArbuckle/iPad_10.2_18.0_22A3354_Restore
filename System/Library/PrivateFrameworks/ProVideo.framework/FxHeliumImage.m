@implementation FxHeliumImage

- (FxHeliumImage)initWithInfo:(id *)a3
{
  __int128 v3;
  __int128 v4;
  FxHeliumImage *v5;
  _QWORD *v6;
  objc_super v8;
  _OWORD v9[4];
  double var8;

  v3 = *(_OWORD *)&a3->var6;
  v9[2] = *(_OWORD *)&a3->var4;
  v9[3] = v3;
  var8 = a3->var8;
  v4 = *(_OWORD *)&a3->var2;
  v9[0] = *(_OWORD *)&a3->var0;
  v9[1] = v4;
  v8.receiver = self;
  v8.super_class = (Class)FxHeliumImage;
  v5 = -[FxImage initWithInfo:](&v8, sel_initWithInfo_, v9);
  if (v5)
  {
    v6 = (_QWORD *)operator new();
    *v6 = 0;
    v5->_heliumImagePriv = v6;
  }
  return v5;
}

- (FxHeliumImage)initWithInfo:(id *)a3 andHeliumNode:(void *)a4
{
  __int128 v5;
  __int128 v6;
  FxHeliumImage *v7;
  _QWORD *v8;
  void **heliumImagePriv;
  void *v10;
  objc_super v12;
  _OWORD v13[4];
  double var8;

  v5 = *(_OWORD *)&a3->var6;
  v13[2] = *(_OWORD *)&a3->var4;
  v13[3] = v5;
  var8 = a3->var8;
  v6 = *(_OWORD *)&a3->var2;
  v13[0] = *(_OWORD *)&a3->var0;
  v13[1] = v6;
  v12.receiver = self;
  v12.super_class = (Class)FxHeliumImage;
  v7 = -[FxImage initWithInfo:](&v12, sel_initWithInfo_, v13);
  if (v7)
  {
    v8 = (_QWORD *)operator new();
    *v8 = 0;
    v7->_heliumImagePriv = v8;
    if (a4)
    {
      (*(void (**)(void *))(*(_QWORD *)a4 + 16))(a4);
      heliumImagePriv = (void **)v7->_heliumImagePriv;
      v10 = *heliumImagePriv;
      if (*heliumImagePriv == a4)
      {
        (*(void (**)(void *))(*(_QWORD *)a4 + 24))(a4);
      }
      else
      {
        if (v10)
          (*(void (**)(void *))(*(_QWORD *)v10 + 24))(v10);
        *heliumImagePriv = a4;
      }
    }
  }
  return v7;
}

- (FxHeliumImage)initWithInfo:(id *)a3 andHeliumRef:(const void *)a4
{
  __int128 v5;
  __int128 v6;
  FxHeliumImage *v7;
  _QWORD *v8;
  uint64_t v9;
  objc_super v11;
  _OWORD v12[4];
  double var8;

  v5 = *(_OWORD *)&a3->var6;
  v12[2] = *(_OWORD *)&a3->var4;
  v12[3] = v5;
  var8 = a3->var8;
  v6 = *(_OWORD *)&a3->var2;
  v12[0] = *(_OWORD *)&a3->var0;
  v12[1] = v6;
  v11.receiver = self;
  v11.super_class = (Class)FxHeliumImage;
  v7 = -[FxImage initWithInfo:](&v11, sel_initWithInfo_, v12);
  if (v7)
  {
    v8 = (_QWORD *)operator new();
    *v8 = 0;
    v7->_heliumImagePriv = v8;
    v9 = *(_QWORD *)a4;
    if (*(_QWORD *)a4)
    {
      *v8 = v9;
      (*(void (**)(uint64_t))(*(_QWORD *)v9 + 16))(v9);
    }
  }
  return v7;
}

- (void)dealloc
{
  _QWORD *heliumImagePriv;
  objc_super v4;

  heliumImagePriv = self->_heliumImagePriv;
  if (heliumImagePriv)
  {
    if (*heliumImagePriv)
      (*(void (**)(_QWORD, SEL))(*(_QWORD *)*heliumImagePriv + 24))(*heliumImagePriv, a2);
    MEMORY[0x1B5E29170](heliumImagePriv, 0x20C4093837F09);
  }
  v4.receiver = self;
  v4.super_class = (Class)FxHeliumImage;
  -[FxImage dealloc](&v4, sel_dealloc);
}

- (void)setHeliumNode:(void *)a3
{
  void **heliumImagePriv;
  void *v6;

  if (a3)
  {
    (*(void (**)(void *, SEL))(*(_QWORD *)a3 + 16))(a3, a2);
    heliumImagePriv = (void **)self->_heliumImagePriv;
    v6 = *heliumImagePriv;
    if (*heliumImagePriv == a3)
    {
      (*(void (**)(void *))(*(_QWORD *)a3 + 24))(a3);
      return;
    }
  }
  else
  {
    heliumImagePriv = (void **)self->_heliumImagePriv;
    v6 = *heliumImagePriv;
    if (!*heliumImagePriv)
      return;
  }
  if (v6)
    (*(void (**)(void *))(*(_QWORD *)v6 + 24))(v6);
  *heliumImagePriv = a3;
}

- (void)heliumNode
{
  return *(void **)self->_heliumImagePriv;
}

- (void)setHeliumRef:(const void *)a3
{
  _QWORD *heliumImagePriv;
  uint64_t v4;
  uint64_t v5;

  heliumImagePriv = self->_heliumImagePriv;
  v4 = *heliumImagePriv;
  v5 = *(_QWORD *)a3;
  if (*heliumImagePriv != *(_QWORD *)a3)
  {
    if (v4)
    {
      (*(void (**)(_QWORD, SEL))(*(_QWORD *)v4 + 24))(*heliumImagePriv, a2);
      v5 = *(_QWORD *)a3;
    }
    *heliumImagePriv = v5;
    if (v5)
      (*(void (**)(uint64_t))(*(_QWORD *)v5 + 16))(v5);
  }
}

- (HGRef<HGNode>)heliumRef
{
  HGNode **v2;
  HGRef<HGNode> *heliumImagePriv;
  HGRef<HGNode> v4;

  heliumImagePriv = (HGRef<HGNode> *)self->_heliumImagePriv;
  v4.var0 = heliumImagePriv->var0;
  *v2 = heliumImagePriv->var0;
  if (v4.var0)
    return (HGRef<HGNode>)(*(uint64_t (**)(HGRef<HGNode>))(*(_QWORD *)v4.var0 + 16))(v4);
  return v4;
}

- (unint64_t)imageType
{
  return 3;
}

@end

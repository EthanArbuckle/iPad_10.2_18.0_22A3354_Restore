@implementation RBDisplayListTransform

- (void)removeAll
{
  RB::DisplayList::Transform::clear((RB::DisplayList::Transform *)&self->_transform);
}

- (void)addColorReplacementFrom:(id)a3 to:(id)a4 colorSpace:(int)a5
{
  __int16 v14;
  _WORD v27[5];
  _WORD v28[5];

  _S8 = a4.var3;
  _S9 = a4.var2;
  _S10 = a4.var1;
  _S11 = a4.var0;
  _S12 = a3.var3;
  _S13 = a3.var2;
  _S14 = a3.var1;
  _S15 = a3.var0;
  v14 = rb_color_space(a5);
  __asm
  {
    FCVT            H0, S15
    FCVT            H1, S14
    FCVT            H2, S13
    FCVT            H3, S12
  }
  v28[0] = _H0;
  v28[1] = _H1;
  v28[2] = _H2;
  v28[3] = _H3;
  v28[4] = v14;
  __asm
  {
    FCVT            H0, S11
    FCVT            H1, S10
    FCVT            H2, S9
    FCVT            H3, S8
  }
  v27[0] = _H0;
  v27[1] = _H1;
  v27[2] = _H2;
  v27[3] = _H3;
  v27[4] = v14;
  RB::DisplayList::Transform::add_color_from_to(self->_transform._terms._p, (const RB::Fill::Color *)v28, (const RB::Fill::Color *)v27);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0x100000000;
  return self;
}

- (id)applyingToDisplayList:(id)a3
{
  return -[RBDisplayListTransform copyApplyingToDisplayList:](self, "copyApplyingToDisplayList:", a3);
}

- (void).cxx_destruct
{
  Term *p_2;
  RB::DisplayList::Transform::Term *p_transform;
  unint64_t v5;
  uint64_t v6;

  p_2 = self->_transform._terms._p_2;
  if (p_2)
    p_transform = (RB::DisplayList::Transform::Term *)self->_transform._terms._p_2;
  else
    p_transform = (RB::DisplayList::Transform::Term *)&self->_transform;
  if (self->_transform._terms._size)
  {
    v5 = 0;
    do
    {
      RB::DisplayList::Transform::Term::~Term(p_transform);
      ++v5;
      p_transform = (RB::DisplayList::Transform::Term *)(v6 + 32);
    }
    while (v5 < self->_transform._terms._size);
    p_2 = self->_transform._terms._p_2;
  }
  if (p_2)
    free(p_2);
}

+ (id)transform
{
  return (id)objc_opt_new();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  const RB::DisplayList::Transform::Term *p_transform;
  char *v7;
  RB::DisplayList::Transform::Term *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int size;
  uint64_t v13;
  char *v14;
  RB::DisplayList::Transform::Term *v15;
  unsigned int v16;
  uint64_t v17;
  int v18;

  v4 = objc_opt_new();
  v5 = v4;
  p_transform = (const RB::DisplayList::Transform::Term *)&self->_transform;
  v7 = (char *)(v4 + 8);
  if (*(_QWORD *)(v4 + 40))
    v8 = *(RB::DisplayList::Transform::Term **)(v4 + 40);
  else
    v8 = (RB::DisplayList::Transform::Term *)(v4 + 8);
  v9 = *(unsigned int *)(v5 + 48);
  if ((_DWORD)v9)
  {
    v10 = 32 * v9;
    do
    {
      RB::DisplayList::Transform::Term::~Term(v8);
      v8 = (RB::DisplayList::Transform::Term *)(v11 + 32);
      v10 -= 32;
    }
    while (v10);
  }
  *(_DWORD *)(v5 + 48) = 0;
  if (self->_transform._terms._p_2)
    p_transform = (const RB::DisplayList::Transform::Term *)self->_transform._terms._p_2;
  size = self->_transform._terms._size;
  if (*(_DWORD *)(v5 + 52) < size)
  {
    RB::vector<RB::DisplayList::Transform::Term,1ul,unsigned int>::reserve_slow(v7, size);
    v13 = *(unsigned int *)(v5 + 48);
  }
  else
  {
    if (!size)
    {
      v18 = 0;
      goto LABEL_18;
    }
    v13 = 0;
  }
  v14 = *(char **)(v5 + 40);
  if (!v14)
    v14 = v7;
  v15 = (RB::DisplayList::Transform::Term *)&v14[32 * v13];
  v16 = size;
  do
  {
    v17 = RB::DisplayList::Transform::Term::Term(v15, p_transform);
    p_transform = (const RB::DisplayList::Transform::Term *)((char *)p_transform + 32);
    v15 = (RB::DisplayList::Transform::Term *)(v17 + 32);
    --v16;
  }
  while (v16);
  v18 = *(_DWORD *)(v5 + 48);
LABEL_18:
  *(_DWORD *)(v5 + 48) = v18 + size;
  return (id)v5;
}

- (void)addColorReplacementTo:(id)a3 colorSpace:(int)a4
{
  __int16 v9;
  _WORD v18[5];

  _S8 = a3.var3;
  _S9 = a3.var2;
  _S10 = a3.var1;
  _S11 = a3.var0;
  v9 = rb_color_space(a4);
  __asm
  {
    FCVT            H0, S11
    FCVT            H1, S10
    FCVT            H2, S9
  }
  v18[0] = _H0;
  v18[1] = _H1;
  __asm { FCVT            H0, S8 }
  v18[2] = _H2;
  v18[3] = _H0;
  v18[4] = v9;
  RB::DisplayList::Transform::add_color_to(self->_transform._terms._p, (const RB::Fill::Color *)v18);
}

- (void)addFontInterpolationTo:(CGFont *)a3 by:(float)a4 flags:(unsigned int)a5
{
  RB::DisplayList::Transform::add_font_mix_to(self->_transform._terms._p, a3, a4, a5);
}

- (void)applyToDisplayList:(id)a3
{
  RB::DisplayList::Contents *v4;

  v4 = (RB::DisplayList::Contents *)objc_msgSend(a3, "_rb_contents");
  if (v4)
    RB::DisplayList::Contents::apply_transform(v4, (const RB::DisplayList::Transform *)&self->_transform);
}

- (id)copyApplyingToDisplayList:(id)a3
{
  const RB::DisplayList::Contents *v5;
  const char *v6;
  _RBDrawingState *v7;
  RB::XML::Document *v8;
  const RB::DisplayList::Transform *v9;
  RB::XML::DisplayList *v10;
  const RB::XML::Document *v11;
  RBMovedDisplayListContents *v12;
  RB::XML::DisplayList *v13;
  _QWORD *v14;
  uint64_t v15;
  RB::XML::DisplayList *v16;
  RB::DisplayList::Contents *v17;
  unsigned int *v18;
  unsigned int v19;
  unsigned int v20;
  RB::XML::DisplayList *v22;
  RB::DisplayList::Contents *v23;
  RB::XML::DisplayList *v24;
  RB::DisplayList::Contents *v25;
  _BYTE v26[264];
  RB::DisplayList::State *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v24 = 0;
  v25 = 0;
  v5 = (const RB::DisplayList::Contents *)objc_msgSend(a3, "_rb_contents");
  if (v5)
  {
    RB::DisplayList::Builder::Builder((RB::DisplayList::Builder *)v26);
    RB::DisplayList::Builder::draw((RB::DisplayList::Builder *)v26, v5, v27, 1.0, 0, 0);
    RB::DisplayList::Builder::move_contents((RB::DisplayList::Builder *)v26, v6, &v23);
    v25 = v23;
    RB::DisplayList::Contents::apply_transform(v23, (const RB::DisplayList::Transform *)&self->_transform);
    RB::DisplayList::Builder::~Builder((RB::DisplayList::Builder *)v26);
  }
  v7 = (_RBDrawingState *)objc_msgSend(a3, "_rb_xml_document");
  if (v7)
  {
    v8 = (RB::XML::Document *)operator new();
    RB::XML::Document::Document(v8);
    v10 = v24;
    v24 = v8;
    if (v10)
    {
      std::default_delete<RB::XML::Document>::operator()[abi:nn180100]((uint64_t)&v24, (uint64_t)v10);
      v8 = v24;
    }
    RB::XML::DisplayList::add_transform_style(v8, 0, (_RBDrawingState *)&self->_transform, v9);
    RB::XML::DisplayList::draw_list(v24, 0, v7, v11, 1.0);
  }
  v12 = [RBMovedDisplayListContents alloc];
  v13 = v24;
  v24 = 0;
  v22 = v13;
  v14 = -[RBMovedDisplayListContents initWithContents:xmlDocument:](v12, &v25, (uint64_t *)&v22);
  v15 = (uint64_t)v22;
  v22 = 0;
  if (v15)
    std::default_delete<RB::XML::Document>::operator()[abi:nn180100]((uint64_t)&v22, v15);
  v16 = v24;
  v24 = 0;
  if (v16)
    std::default_delete<RB::XML::Document>::operator()[abi:nn180100]((uint64_t)&v24, (uint64_t)v16);
  v17 = v25;
  if (v25)
  {
    v18 = (unsigned int *)((char *)v25 + 8);
    do
    {
      v19 = __ldxr(v18);
      v20 = v19 - 1;
    }
    while (__stlxr(v20, v18));
    if (!v20)
    {
      __dmb(9u);
      (*(void (**)(RB::DisplayList::Contents *))(*(_QWORD *)v17 + 8))(v17);
    }
  }
  return v14;
}

@end

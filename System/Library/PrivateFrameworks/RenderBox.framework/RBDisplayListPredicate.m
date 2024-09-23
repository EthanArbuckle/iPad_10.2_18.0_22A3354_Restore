@implementation RBDisplayListPredicate

- (void)removeAll
{
  RB::DisplayList::Predicate::clear(self->_predicate.predicate._terms._p);
}

- (void)setInvertsResult:(BOOL)a3
{
  self->_predicate.inverts_result = a3;
}

- (void)addConditionWithFillColor:(id)a3 colorSpace:(int)a4
{
  InvertiblePredicate *p_predicate;
  _WORD v13[5];

  p_predicate = &self->_predicate;
  __asm
  {
    FCVT            H8, S0
    FCVT            H9, S1
    FCVT            H10, S2
    FCVT            H11, S3
  }
  v13[0] = _H8;
  v13[1] = _H9;
  v13[2] = _H10;
  v13[3] = _H11;
  v13[4] = rb_color_space(a4);
  RB::DisplayList::Predicate::add_color(p_predicate, (const RB::Fill::Color *)v13);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0x100000000;
  *((_BYTE *)self + 48) = 0;
  return self;
}

- (void).cxx_destruct
{
  Term *p_2;
  RB::DisplayList::Predicate::Term *p_predicate;
  unint64_t v5;
  uint64_t v6;

  p_2 = self->_predicate.predicate._terms._p_2;
  if (p_2)
    p_predicate = (RB::DisplayList::Predicate::Term *)self->_predicate.predicate._terms._p_2;
  else
    p_predicate = (RB::DisplayList::Predicate::Term *)&self->_predicate;
  if (self->_predicate.predicate._terms._size)
  {
    v5 = 0;
    do
    {
      RB::DisplayList::Predicate::Term::~Term(p_predicate);
      ++v5;
      p_predicate = (RB::DisplayList::Predicate::Term *)(v6 + 24);
    }
    while (v5 < self->_predicate.predicate._terms._size);
    p_2 = self->_predicate.predicate._terms._p_2;
  }
  if (p_2)
    free(p_2);
}

- (id)filteringDisplayList:(id)a3
{
  return -[RBDisplayListPredicate copyFilteredDisplayList:](self, "copyFilteredDisplayList:", a3);
}

+ (id)predicate
{
  return (id)objc_opt_new();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_opt_new();
  RB::DisplayList::Predicate::add_predicate((RB::DisplayList::Predicate *)(v4 + 8), (const RB::DisplayList::Predicate *)&self->_predicate, self->_predicate.inverts_result);
  return (id)v4;
}

- (void)addCondition:(int)a3
{
  RB::DisplayList::Predicate::add(self->_predicate.predicate._terms._p, a3);
}

- (void)addPredicate:(id)a3
{
  RB::DisplayList::Predicate::add_predicate((RB::DisplayList::Predicate *)&self->_predicate, (const RB::DisplayList::Predicate *)((char *)a3 + 8), *((_BYTE *)a3 + 48));
}

- (BOOL)invertsResult
{
  return self->_predicate.inverts_result;
}

- (id)copyFilteredDisplayList:(id)a3
{
  uint64_t v5;
  const RB::DisplayList::Contents *v6;
  InvertiblePredicate *p_predicate;
  _RBDrawingState *v8;
  RB::XML::Document *v9;
  const RB::DisplayList::InvertiblePredicate *v10;
  const RB::XML::Document *v11;
  RBMovedDisplayListContents *v12;
  const char *v13;
  RB::XML::DisplayList *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int *v18;
  unsigned int v19;
  unsigned int v20;
  RB::XML::DisplayList *v21;
  RB::XML::DisplayList *v23;
  uint64_t v24;
  RB::XML::DisplayList *v25;
  _BYTE v26[8];
  uint64_t v27;
  RB::DisplayList::State *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(a3, "_rb_contents");
  if (!v5)
    return (id)+[RBEmptyDisplayListContents shared]();
  v6 = (const RB::DisplayList::Contents *)v5;
  RB::DisplayList::Builder::Builder((RB::DisplayList::Builder *)v26);
  p_predicate = &self->_predicate;
  RB::DisplayList::Builder::draw((RB::DisplayList::Builder *)v26, v6, v28, 1.0, (const RB::DisplayList::InvertiblePredicate *)p_predicate, 0);
  if (*(_QWORD *)(v27 + 320))
  {
    v25 = 0;
    v8 = (_RBDrawingState *)objc_msgSend(a3, "_rb_xml_document");
    if (v8)
    {
      v9 = (RB::XML::Document *)operator new();
      RB::XML::Document::Document(v9);
      v25 = v9;
      RB::XML::DisplayList::add_predicate_style(v9, 0, (_RBDrawingState *)p_predicate, v10);
      RB::XML::DisplayList::draw_list(v25, 0, v8, v11, 1.0);
    }
    v12 = [RBMovedDisplayListContents alloc];
    RB::DisplayList::Builder::move_contents((RB::DisplayList::Builder *)v26, v13, &v24);
    v14 = v25;
    v25 = 0;
    v23 = v14;
    v15 = -[RBMovedDisplayListContents initWithContents:xmlDocument:](v12, &v24, (uint64_t *)&v23);
    v16 = (uint64_t)v23;
    v23 = 0;
    if (v16)
      std::default_delete<RB::XML::Document>::operator()[abi:nn180100]((uint64_t)&v23, v16);
    v17 = v24;
    if (v24)
    {
      v18 = (unsigned int *)(v24 + 8);
      do
      {
        v19 = __ldxr(v18);
        v20 = v19 - 1;
      }
      while (__stlxr(v20, v18));
      if (!v20)
      {
        __dmb(9u);
        (*(void (**)(uint64_t))(*(_QWORD *)v17 + 8))(v17);
      }
    }
    v21 = v25;
    v25 = 0;
    if (v21)
      std::default_delete<RB::XML::Document>::operator()[abi:nn180100]((uint64_t)&v25, (uint64_t)v21);
  }
  else
  {
    v15 = (id)+[RBEmptyDisplayListContents shared]();
  }
  RB::DisplayList::Builder::~Builder((RB::DisplayList::Builder *)v26);
  return v15;
}

@end

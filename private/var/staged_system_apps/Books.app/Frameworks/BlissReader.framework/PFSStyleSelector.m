@implementation PFSStyleSelector

+ (id)allElementsSelector
{
  id result;

  result = (id)qword_543440;
  if (!qword_543440)
  {
    qword_543440 = objc_alloc_init(PFSStyleSelector);
    sub_1D4F50((uint64_t *)objc_msgSend((id)qword_543440, "addSimpleSelector"), 33, "*", 1);
    objc_msgSend((id)qword_543440, "freeze");
    return (id)qword_543440;
  }
  return result;
}

- (PFSStyleSelector)initWithParseOrder:(unint64_t)a3
{
  PFSStyleSelector *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFSStyleSelector;
  v4 = -[PFSStyleSelector init](&v6, "init");
  if (v4)
  {
    v4->m_parseOrder = a3;
    operator new();
  }
  return 0;
}

- (PFSStyleSelector)init
{
  return -[PFSStyleSelector initWithParseOrder:](self, "initWithParseOrder:", 0);
}

- (void)dealloc
{
  _QWORD *m_simpleSelectors;
  uint64_t v4;
  PFSStyleSimpleSelector *v5;
  objc_super v6;

  m_simpleSelectors = self->m_simpleSelectors;
  v4 = m_simpleSelectors[1];
  if ((_QWORD *)v4 == m_simpleSelectors)
    goto LABEL_6;
  do
  {
    v5 = *(PFSStyleSimpleSelector **)(v4 + 16);
    if (v5)
    {
      PFSStyleSimpleSelector::~PFSStyleSimpleSelector(v5);
      operator delete();
    }
    *(_QWORD *)(v4 + 16) = 0;
    v4 = *(_QWORD *)(v4 + 8);
  }
  while ((_QWORD *)v4 != m_simpleSelectors);
  m_simpleSelectors = self->m_simpleSelectors;
  if (m_simpleSelectors)
  {
LABEL_6:
    sub_1C959C(m_simpleSelectors);
    operator delete();
  }
  self->m_simpleSelectors = 0;
  v6.receiver = self;
  v6.super_class = (Class)PFSStyleSelector;
  -[PFSStyleSelector dealloc](&v6, "dealloc");
}

- (void)freeze
{
  unint64_t v2;
  _QWORD *m_simpleSelectors;
  _QWORD *i;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (!self->m_frozen)
  {
    v2 = 2166136261;
    self->m_hash = 2166136261;
    m_simpleSelectors = self->m_simpleSelectors;
    for (i = (_QWORD *)m_simpleSelectors[1]; i != m_simpleSelectors; i = (_QWORD *)i[1])
    {
      v5 = 0;
      v6 = i[2];
      *(_BYTE *)(v6 + 32) = 1;
      v7 = *(_QWORD *)(v6 + 24);
      do
        v2 = 16777619 * (v2 ^ *((char *)&v7 + v5++));
      while (v5 != 8);
      self->m_hash = v2;
    }
    self->m_frozen = 1;
  }
}

- (unint64_t)hash
{
  return self->m_hash;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  uint64_t v6;
  void *m_simpleSelectors;
  void *v8;
  uint64_t v9;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(PFSStyleSelector));
  if (v5)
  {
    if (self->m_hash == *((_QWORD *)a3 + 3))
    {
      v6 = *((_QWORD *)a3 + 1);
      m_simpleSelectors = self->m_simpleSelectors;
      v8 = m_simpleSelectors;
      v9 = v6;
      while (1)
      {
        v9 = *(_QWORD *)(v9 + 8);
        v8 = (void *)*((_QWORD *)v8 + 1);
        if (v8 == m_simpleSelectors || v9 == v6)
          break;
        if (!PFSStyleSimpleSelector::isEqualTo(*((PFSStyleSimpleSelector **)v8 + 2), *(const PFSStyleSimpleSelector **)(v9 + 16)))goto LABEL_9;
      }
      LOBYTE(v5) = v8 == m_simpleSelectors && v9 == v6;
    }
    else
    {
LABEL_9:
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (BOOL)matchesTailOf:(id)a3
{
  uint64_t *v3;
  void *m_simpleSelectors;
  void *v5;
  uint64_t *v6;
  BOOL result;

  v3 = (uint64_t *)*((_QWORD *)a3 + 1);
  m_simpleSelectors = self->m_simpleSelectors;
  v5 = (void *)*((_QWORD *)m_simpleSelectors + 1);
  v6 = (uint64_t *)v3[1];
  while (1)
  {
    result = m_simpleSelectors == v5;
    if (m_simpleSelectors == v5 || v3 == v6)
      break;
    m_simpleSelectors = *(void **)m_simpleSelectors;
    v3 = (uint64_t *)*v3;
    if (!PFSStyleSimpleSelector::isSubsetOf(*((PFSStyleSimpleSelector **)m_simpleSelectors + 2), (const PFSStyleSimpleSelector *)v3[2]))return 0;
  }
  return result;
}

- (int)characterClass:(unsigned __int16)a3
{
  BOOL v5;
  BOOL v6;
  BOOL v7;
  BOOL v8;

  if ((unsigned __int16)PFXChA <= a3 && (unsigned __int16)PFXChZ >= a3)
    return 0;
  if ((unsigned __int16)PFXCha <= a3 && (unsigned __int16)PFXChz >= a3)
    return 0;
  v5 = (unsigned __int16)PFXCh9 < a3 || (unsigned __int16)PFXCh0 > a3;
  v6 = !v5 || (unsigned __int16)PFXChDash == a3;
  v7 = v6 || (unsigned __int16)PFXChUnderscore == a3;
  v8 = v7 || (unsigned __int16)PFXChTilde == a3;
  if (v8 || (unsigned __int16)PFXChColon == a3)
    return 0;
  if ((unsigned __int16)PFXChPeriod == a3)
    return 1;
  if ((unsigned __int16)PFXChHash == a3)
    return 3;
  if ((unsigned __int16)PFXChOpenSquareBracket == a3)
    return 4;
  if ((unsigned __int16)PFXChCloseSquareBracket == a3)
    return 5;
  return 6;
}

- (void)addSimpleSelector
{
  operator new();
}

- (void)curSimpleSelector
{
  _QWORD *m_simpleSelectors;

  m_simpleSelectors = self->m_simpleSelectors;
  if (m_simpleSelectors[2])
    return *(void **)(*m_simpleSelectors + 16);
  else
    return 0;
}

- (unint64_t)specificity
{
  _QWORD *m_simpleSelectors;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  m_simpleSelectors = self->m_simpleSelectors;
  v3 = (_QWORD *)m_simpleSelectors[1];
  if (v3 == m_simpleSelectors)
  {
    v6 = 0;
  }
  else
  {
    v4 = 0;
    do
    {
      v5 = v3 + 1;
      v3 = (_QWORD *)v3[1];
      v4 += *(unsigned int *)(v5[1] + 36);
    }
    while (v3 != m_simpleSelectors);
    v6 = v4 << 32;
  }
  return self->m_parseOrder + v6;
}

- (const)simpleSelectors
{
  return self->m_simpleSelectors;
}

@end

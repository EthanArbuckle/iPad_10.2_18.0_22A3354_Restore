@implementation RBTransition

+ (RBTransition)defaultTransition
{
  unsigned __int8 v2;
  uint64_t v4;

  {
    v4 = objc_opt_new();
    *(_BYTE *)(v4 + 16) = 1;
    +[RBTransition defaultTransition]::default_transition = v4;
  }
  return (RBTransition *)+[RBTransition defaultTransition]::default_transition;
}

- (RBTransition)init
{
  RBTransition *v2;
  uint64_t v3;
  Transition *p;
  unsigned int *v5;
  unsigned int v6;
  unsigned int v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RBTransition;
  v2 = -[RBTransition init](&v9, sel_init);
  if (v2)
  {
    v3 = operator new();
    *(_DWORD *)(v3 + 8) = 1;
    *(_QWORD *)v3 = off_24C224008;
    *(_WORD *)(v3 + 12) = 0;
    *(_BYTE *)(v3 + 14) = 32;
    *(_DWORD *)(v3 + 16) = -1;
    *(_QWORD *)(v3 + 40) = 0;
    *(_QWORD *)(v3 + 48) = 0x400000000;
    *(_QWORD *)(v3 + 80) = 0;
    *(_QWORD *)(v3 + 88) = 0x600000000;
    p = v2->_transition._p;
    v2->_transition._p = (Transition *)v3;
    if (p)
    {
      v5 = (unsigned int *)((char *)p + 8);
      do
      {
        v6 = __ldxr(v5);
        v7 = v6 - 1;
      }
      while (__stlxr(v7, v5));
      if (!v7)
      {
        __dmb(9u);
        (*(void (**)(Transition *))(*(_QWORD *)p + 8))(p);
      }
    }
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  Transition *v5;
  Transition *p;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int *v10;
  unsigned int v11;

  v4 = (_QWORD *)objc_opt_new();
  v5 = (Transition *)v4[1];
  p = self->_transition._p;
  if (v5 != p)
  {
    if (v5)
    {
      v7 = (unsigned int *)((char *)v5 + 8);
      do
      {
        v8 = __ldxr(v7);
        v9 = v8 - 1;
      }
      while (__stlxr(v9, v7));
      if (!v9)
      {
        __dmb(9u);
        (*(void (**)(Transition *))(*(_QWORD *)v5 + 8))(v5);
      }
      p = self->_transition._p;
    }
    if (p)
    {
      v10 = (unsigned int *)((char *)p + 8);
      do
        v11 = __ldxr(v10);
      while (__stxr(v11 + 1, v10));
    }
    v4[1] = p;
  }
  return v4;
}

- (unsigned)_copyOnWrite
{
  unsigned int *v1;
  RB::Transition *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;

  if (result)
  {
    v1 = result;
    if (*(_DWORD *)(*((_QWORD *)result + 1) + 8) == 1)
    {
      __dmb(9u);
    }
    else
    {
      v2 = (RB::Transition *)operator new();
      RB::Transition::Transition(v2, *((const RB::Transition **)v1 + 1));
      result = (unsigned int *)*((_QWORD *)v1 + 1);
      *((_QWORD *)v1 + 1) = v2;
      if (result)
      {
        v3 = result + 2;
        do
        {
          v4 = __ldxr(v3);
          v5 = v4 - 1;
        }
        while (__stlxr(v5, v3));
        if (!v5)
        {
          __dmb(9u);
          return (unsigned int *)(*(uint64_t (**)(unsigned int *))(*(_QWORD *)result + 8))(result);
        }
      }
    }
  }
  return result;
}

- (unsigned)method
{
  return rb_transition_method((Method)*((unsigned __int8 *)self->_transition._p + 12));
}

- (void)setMethod:(unsigned int)a3
{
  int v4;
  const char *v5;
  char v6;

  v4 = rb_transition_method(a3);
  if (*((unsigned __int8 *)self->_transition._p + 12) != v4)
  {
    if (self->_is_default)
      RB::precondition_failure((RB *)"modifying default transition", v5);
    v6 = v4;
    -[RBTransition _copyOnWrite]((unsigned int *)self);
    *((_BYTE *)self->_transition._p + 12) = v6;
  }
}

- (RBAnimation)animation
{
  _DWORD *v3;

  if (!*((_DWORD *)self->_transition._p + 22))
    return 0;
  v3 = (_DWORD *)objc_opt_new();
  -[RBAnimation setRBAnimation:](v3, (uint64_t)self->_transition._p + 56);
  return (RBAnimation *)v3;
}

- (void)setAnimation:(id)a3
{
  uint64_t v5;
  Transition *p;
  int *v7;
  unsigned int v8;
  uint64_t v9;
  char *v10;
  char *v11;
  unsigned int v12;
  int v13;
  int v14;

  if (self->_is_default)
    RB::precondition_failure((RB *)"modifying default transition", a2, a3);
  -[RBTransition _copyOnWrite]((unsigned int *)self);
  v5 = -[RBAnimation rb_animation]((uint64_t)a3);
  p = self->_transition._p;
  *((_DWORD *)p + 22) = 0;
  if (*(_QWORD *)(v5 + 24))
    v7 = *(int **)(v5 + 24);
  else
    v7 = (int *)v5;
  v8 = *(_DWORD *)(v5 + 32);
  if (*((_DWORD *)p + 23) < v8)
  {
    RB::vector<RB::Animation::TermOrArg,6ul,unsigned int>::reserve_slow((char *)p + 56, v8);
    v9 = *((unsigned int *)p + 22);
  }
  else
  {
    if (!v8)
    {
      v14 = 0;
      goto LABEL_14;
    }
    v9 = 0;
  }
  v10 = (char *)*((_QWORD *)p + 10);
  if (!v10)
    v10 = (char *)p + 56;
  v11 = &v10[4 * v9];
  v12 = v8;
  do
  {
    v13 = *v7++;
    *(_DWORD *)v11 = v13;
    v11 += 4;
    --v12;
  }
  while (v12);
  v14 = *((_DWORD *)p + 22);
LABEL_14:
  *((_DWORD *)p + 22) = v14 + v8;
}

- (unsigned)maxChanges
{
  return *((_DWORD *)self->_transition._p + 4);
}

- (void)setMaxChanges:(unsigned int)a3
{
  if (*((_DWORD *)self->_transition._p + 4) != a3)
  {
    -[RBTransition _copyOnWrite]((unsigned int *)self);
    *((_DWORD *)self->_transition._p + 4) = a3;
  }
}

- (BOOL)isReplaceable
{
  return *((_BYTE *)self->_transition._p + 13);
}

- (void)setReplaceable:(BOOL)a3
{
  if (*((_BYTE *)self->_transition._p + 13) != a3)
  {
    -[RBTransition _copyOnWrite]((unsigned int *)self);
    *((_BYTE *)self->_transition._p + 13) = a3;
  }
}

- (void)addEffect:(id)a3
{
  int v5;
  Transition *p;
  int v7;
  char *v8;
  int *v9;
  uint64_t v10;
  Transition *v11;
  int v12;
  char *v13;
  int v14;

  if (self->_is_default)
    RB::precondition_failure((RB *)"modifying default transition", a2, a3);
  if (a3)
  {
    -[RBTransition _copyOnWrite]((unsigned int *)self);
    v5 = *((_DWORD *)a3 + 2);
    p = self->_transition._p;
    v7 = *((_DWORD *)p + 12);
    if (*((_DWORD *)p + 13) < (v7 + 1))
    {
      RB::vector<RB::Symbol::Tag,4ul,unsigned int>::reserve_slow((char *)p + 24, v7 + 1);
      v7 = *((_DWORD *)p + 12);
    }
    v8 = (char *)*((_QWORD *)p + 5);
    if (!v8)
      v8 = (char *)p + 24;
    *(_DWORD *)&v8[4 * v7] = v5;
    ++*((_DWORD *)p + 12);
    if (((0x187FA3uLL >> v5) & 1) == 0)
    {
      v9 = (int *)((char *)a3 + 12);
      if (RB::Transition::_effect_args[v5 & 0x7F] <= 1u)
        v10 = 1;
      else
        v10 = RB::Transition::_effect_args[v5 & 0x7F];
      do
      {
        v11 = self->_transition._p;
        v12 = *((_DWORD *)v11 + 12);
        if (*((_DWORD *)v11 + 13) < (v12 + 1))
        {
          RB::vector<RB::Symbol::Tag,4ul,unsigned int>::reserve_slow((char *)v11 + 24, v12 + 1);
          v12 = *((_DWORD *)v11 + 12);
        }
        v13 = (char *)*((_QWORD *)v11 + 5);
        if (!v13)
          v13 = (char *)v11 + 24;
        v14 = *v9++;
        *(_DWORD *)&v13[4 * v12] = v14;
        ++*((_DWORD *)v11 + 12);
        --v10;
      }
      while (v10);
    }
  }
}

- (NSArray)effects
{
  NSArray *v3;
  Transition *p;
  unsigned int v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void *v10;
  int *v11;
  _DWORD *v12;
  uint64_t v13;
  int v14;
  int v15;

  if (!*((_DWORD *)self->_transition._p + 12))
    return (NSArray *)MEMORY[0x24BDBD1A8];
  v3 = (NSArray *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  p = self->_transition._p;
  if (*((_DWORD *)p + 12))
  {
    v5 = 0;
    do
    {
      v6 = (char *)p + 24;
      v7 = (char *)*((_QWORD *)p + 5);
      if (!v7)
        v7 = v6;
      v8 = &v7[4 * v5];
      v9 = objc_opt_new();
      v10 = (void *)v9;
      if (v9)
      {
        *(_DWORD *)(v9 + 8) = *(_DWORD *)v8;
        if (((0x187FA3uLL >> *(_WORD *)v8) & 1) == 0)
        {
          v11 = (int *)(v8 + 4);
          v12 = (_DWORD *)(v9 + 12);
          v13 = 4 * RB::Transition::_effect_args[*(_WORD *)v8 & 0x7FLL];
          do
          {
            v14 = *v11++;
            *v12++ = v14;
            v13 -= 4;
          }
          while (v13);
        }
      }
      -[NSArray addObject:](v3, "addObject:", v9);
      v15 = RB::Transition::_effect_args[*(_WORD *)v8 & 0x7F];

      v5 += v15 + 1;
      p = self->_transition._p;
    }
    while (v5 < *((_DWORD *)p + 12));
  }
  return v3;
}

- (float)addRemoveDuration
{
  unsigned int v2;

  LOBYTE(v2) = *((_BYTE *)self->_transition._p + 14);
  return (float)v2 * 0.0039216;
}

- (void)setAddRemoveDuration:(float)a3
{
  -[RBTransition _copyOnWrite]((unsigned int *)self);
  RB::Transition::set_add_remove_duration((uint64_t)self->_transition._p, a3);
}

- (uint64_t)setTransition:(uint64_t)result
{
  uint64_t v2;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int *v7;
  unsigned int v8;

  if (result)
  {
    v2 = result;
    if (*(_BYTE *)(result + 16))
      RB::precondition_failure((RB *)"modifying default transition", a2);
    result = *(_QWORD *)(result + 8);
    if ((const char *)result != a2)
    {
      if (result)
      {
        v4 = (unsigned int *)(result + 8);
        do
        {
          v5 = __ldxr(v4);
          v6 = v5 - 1;
        }
        while (__stlxr(v6, v4));
        if (!v6)
        {
          __dmb(9u);
          result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
        }
      }
      v7 = (unsigned int *)(a2 + 8);
      do
        v8 = __ldxr(v7);
      while (__stxr(v8 + 1, v7));
      *(_QWORD *)(v2 + 8) = a2;
    }
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && RB::Transition::operator==((uint64_t)self->_transition._p, *((_QWORD *)a3 + 1));
}

- (unint64_t)hash
{
  Transition *p;
  uint64_t v4;
  unint64_t result;
  Transition *v6;
  unsigned int v7;
  char *v8;
  char *v9;
  uint64_t v10;
  RB::Transition::Effect *v11;
  char v12;
  unsigned int v13;
  uint64_t v14;

  p = self->_transition._p;
  v4 = 33 * (-(uint64_t)*((char *)p + 13) ^ *((unsigned __int8 *)p + 12));
  result = v4 ^ RB::Animation::hash((RB::Animation *)((char *)p + 56));
  v6 = self->_transition._p;
  if (*((_DWORD *)v6 + 12))
  {
    v7 = 0;
    do
    {
      v8 = (char *)v6 + 24;
      v9 = (char *)*((_QWORD *)v6 + 5);
      v10 = v7;
      if (!v9)
        v9 = v8;
      v11 = (RB::Transition::Effect *)&v9[4 * v7];
      result = RB::Transition::Effect::hash(v11) ^ (33 * result);
      v12 = *(_WORD *)v11;
      v13 = RB::Transition::_effect_args[v12 & 0x7F];
      if (((0x187FA3uLL >> v12) & 1) == 0)
      {
        if (v13 <= 1)
          v14 = 1;
        else
          v14 = RB::Transition::_effect_args[v12 & 0x7F];
        do
        {
          result = (33 * result) ^ *((unsigned int *)v11 + v10 + 1);
          --v14;
        }
        while (v14);
      }
      v7 = v10 + v13 + 1;
      v6 = self->_transition._p;
    }
    while (v7 < *((_DWORD *)v6 + 12));
  }
  return result;
}

- (void).cxx_destruct
{
  Transition *p;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;

  p = self->_transition._p;
  if (p)
  {
    v3 = (unsigned int *)((char *)p + 8);
    do
    {
      v4 = __ldxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      __dmb(9u);
      (*(void (**)(Transition *))(*(_QWORD *)p + 8))(p);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end

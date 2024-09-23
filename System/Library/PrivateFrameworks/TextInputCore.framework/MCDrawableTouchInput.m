@implementation MCDrawableTouchInput

- (MCDrawableTouchInput)initWithTouchPoint:(CGPoint)a3 radius:(double)a4 timestamp:(double)a5
{
  double y;
  double x;
  uint64_t v10;
  MCDrawableTouchInput *v11;
  unsigned int *v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int *v16;

  y = a3.y;
  x = a3.x;
  v10 = operator new();
  *(_DWORD *)(v10 + 8) = 1;
  *(_QWORD *)v10 = &off_1EA104628;
  *(_OWORD *)(v10 + 16) = 0u;
  *(_OWORD *)(v10 + 32) = 0u;
  *(_QWORD *)(v10 + 48) = 0;
  *(_OWORD *)(v10 + 56) = xmmword_1DA911110;
  *(_QWORD *)(v10 + 72) = 0x7F0000007FLL;
  *(_DWORD *)(v10 + 80) = 0;
  *(_OWORD *)(v10 + 88) = 0u;
  *(_OWORD *)(v10 + 104) = 0u;
  *(_OWORD *)(v10 + 120) = 0u;
  *(_DWORD *)(v10 + 136) = 0;
  *(_QWORD *)(v10 + 140) = 0x7F0000007FLL;
  *(_DWORD *)(v10 + 148) = -8388608;
  v16 = (unsigned int *)v10;
  v11 = -[MCDrawableTouchInput initWithTouchPoint:radius:timestamp:inflectionPoint:touchHistory:](self, "initWithTouchPoint:radius:timestamp:inflectionPoint:touchHistory:", 0, &v16, x, y, a4, a5);
  if (v16)
  {
    v12 = v16 + 2;
    v13 = atomic_load(v16 + 2);
    if (v13 == 1)
    {
      (*(void (**)(void))(*(_QWORD *)v16 + 8))();
    }
    else
    {
      do
        v14 = __ldaxr(v12);
      while (__stlxr(v14 - 1, v12));
    }
  }

  return v11;
}

- (MCDrawableTouchInput)initWithTouchPoint:(CGPoint)a3 radius:(double)a4 timestamp:(double)a5 inflectionPoint:(BOOL)a6 touchHistory:(const void *)a7
{
  MCDrawableTouchInput *v9;
  MCDrawableTouchInput *v10;
  uint64_t v11;
  unsigned int *v12;
  unsigned int v13;
  unsigned int *m_ptr;
  unsigned int *v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  void *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)MCDrawableTouchInput;
  v9 = -[MCTouchInput initWithTouchPoint:radius:timestamp:](&v23, sel_initWithTouchPoint_radius_timestamp_, a3.x, a3.y, a4, a5);
  v10 = v9;
  if (v9)
  {
    v9->_isInflectionPoint = a6;
    v11 = *(_QWORD *)a7;
    if (*(_QWORD *)a7)
    {
      v12 = (unsigned int *)(v11 + 8);
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 + 1, v12));
    }
    m_ptr = (unsigned int *)v9->_touchHistory.m_ptr;
    v10->_touchHistory.m_ptr = (CMTouchHistory *)v11;
    if (m_ptr)
    {
      v15 = m_ptr + 2;
      v16 = atomic_load(m_ptr + 2);
      if (v16 == 1)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)m_ptr + 8))(m_ptr);
      }
      else
      {
        do
          v17 = __ldaxr(v15);
        while (__stlxr(v17 - 1, v15));
      }
    }
    v18 = *(_QWORD *)a7;
    if (v18)
    {
      v19 = (_QWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v18 + 64))(v18);
      v20 = objc_msgSend((id)objc_opt_class(), "maxNearbyKeysCountDefault");
      asMCNearbyKeys(v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }
    objc_storeStrong((id *)&v10->_nearbyKeys, v21);
    if (v18)

  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unsigned int **v4;
  unsigned int **v5;
  unsigned int *v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MCDrawableTouchInput;
  v4 = -[MCTouchInput copyWithZone:](&v11, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    *((_BYTE *)v4 + 64) = self->_isInflectionPoint;
    v6 = v4[10];
    v5[10] = 0;
    if (v6)
    {
      v7 = v6 + 2;
      v8 = atomic_load(v6 + 2);
      if (v8 == 1)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v6 + 8))(v6);
      }
      else
      {
        do
          v9 = __ldaxr(v7);
        while (__stlxr(v9 - 1, v7));
      }
    }
    objc_storeStrong((id *)v5 + 9, self->_nearbyKeys);
  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)MCDrawableTouchInput;
  -[MCTouchInput description](&v18, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", CFSTR("{"));
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[MCDrawableTouchInput nearbyKeys](self, "nearbyKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    v9 = 1;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
        if ((v9 & 1) == 0)
          objc_msgSend(v4, "appendString:", CFSTR(", "));
        objc_msgSend(v4, "appendFormat:", CFSTR("%c"), objc_msgSend(v11, "character"));
        v9 = 0;
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      v9 = 0;
    }
    while (v7);
  }

  objc_msgSend(v4, "appendString:", CFSTR("}"));
  v12 = (id)objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(", nearbyKeys=%@"), v4);

  return v3;
}

- (BOOL)isInflectionPoint
{
  return self->_isInflectionPoint;
}

- (NSArray)nearbyKeys
{
  return self->_nearbyKeys;
}

- (RefPtr<TI::Favonius::CMTouchHistory>)touchHistory
{
  CMTouchHistory **v2;
  CMTouchHistory *m_ptr;
  unsigned int *v4;
  unsigned int v5;

  m_ptr = self->_touchHistory.m_ptr;
  *v2 = m_ptr;
  if (m_ptr)
  {
    v4 = (unsigned int *)((char *)m_ptr + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 + 1, v4));
  }
  return (RefPtr<TI::Favonius::CMTouchHistory>)self;
}

- (void).cxx_destruct
{
  CMTouchHistory *m_ptr;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;

  m_ptr = self->_touchHistory.m_ptr;
  if (m_ptr)
  {
    v4 = (unsigned int *)((char *)m_ptr + 8);
    v5 = atomic_load((unsigned int *)m_ptr + 2);
    if (v5 == 1)
    {
      (*(void (**)(CMTouchHistory *, SEL))(*(_QWORD *)m_ptr + 8))(m_ptr, a2);
    }
    else
    {
      do
        v6 = __ldaxr(v4);
      while (__stlxr(v6 - 1, v4));
    }
  }
  objc_storeStrong((id *)&self->_nearbyKeys, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 10) = 0;
  return self;
}

@end

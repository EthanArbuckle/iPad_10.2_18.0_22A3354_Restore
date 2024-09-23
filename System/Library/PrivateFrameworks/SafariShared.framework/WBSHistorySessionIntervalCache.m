@implementation WBSHistorySessionIntervalCache

- (WBSHistorySessionIntervalCache)init
{
  void *v3;
  WBSHistorySessionIntervalCache *v4;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[WBSHistorySessionIntervalCache initWithCalendar:](self, "initWithCalendar:", v3);

  return v4;
}

- (WBSHistorySessionIntervalCache)initWithCalendar:(id)a3
{
  id v5;
  WBSHistorySessionIntervalCache *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  WBSHistorySessionIntervalCache *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WBSHistorySessionIntervalCache;
  v6 = -[WBSHistorySessionIntervalCache init](&v11, sel_init);
  if (v6)
  {
    v7 = dispatch_queue_create("com.apple.SafariShared.WBSHistorySessionIntervalCache", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_calendar, a3);
    v9 = v6;
  }

  return v6;
}

- (double)beginningOfSessionContainingTime:(double)a3
{
  NSObject *queue;
  double v4;
  _QWORD block[7];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__WBSHistorySessionIntervalCache_beginningOfSessionContainingTime___block_invoke;
  block[3] = &unk_1E4B3B368;
  block[4] = self;
  block[5] = &v7;
  *(double *)&block[6] = a3;
  dispatch_sync(queue, block);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __67__WBSHistorySessionIntervalCache_beginningOfSessionContainingTime___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "_beginningOfSessionContainingTime:", *(double *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)_beginningOfSessionContainingTime:(double)a3
{
  Vector<double, 0UL, WTF::CrashOnOverflow, 16UL, WTF::FastMalloc> *p_intervalCache;
  double *v5;
  uint64_t v6;
  double *v7;
  int64_t v8;
  double *v10;
  double *m_buffer;
  uint64_t v12;
  uint64_t m_size;
  double *v14;
  unsigned int m_capacity;
  uint64_t v16;
  double *v17;
  double *v18;
  uint64_t v19;
  double v20;
  double v21;

  v21 = a3;
  p_intervalCache = &self->_intervalCache;
  v5 = std::__equal_range[abi:sn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,double *,double *,double,std::__identity>(self->_intervalCache.m_buffer, &self->_intervalCache.m_buffer[self->_intervalCache.m_size], &v21);
  if (v6 - (_QWORD)v5 == 16)
    return v21;
  v7 = v5;
  v8 = (char *)v5 - (char *)p_intervalCache->m_buffer;
  if (v6 - (_QWORD)v5 == 8)
  {
    if ((v8 & 8) == 0)
      return v21;
    v7 = v5 + 1;
  }
  else if ((v8 & 8) != 0)
  {
    return *(v5 - 1);
  }
  v19 = 0;
  v20 = 0.0;
  v10 = &v20;
  -[WBSHistorySessionIntervalCache _getSessionIntervalForTime:beginningOfDay:beginningOfNextDay:](self, "_getSessionIntervalForTime:beginningOfDay:beginningOfNextDay:", &v20, &v19, v21);
  m_buffer = self->_intervalCache.m_buffer;
  v12 = v7 - m_buffer;
  m_size = self->_intervalCache.m_size;
  if ((_DWORD)m_size == self->_intervalCache.m_capacity)
  {
    v10 = (double *)WTF::Vector<double,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)p_intervalCache, m_size + 1, (unint64_t)&v20);
    LODWORD(m_size) = self->_intervalCache.m_size;
    m_buffer = self->_intervalCache.m_buffer;
  }
  v14 = &m_buffer[v12];
  memmove(v14 + 1, v14, 8 * m_size - 8 * v12);
  *v14 = *v10;
  m_capacity = self->_intervalCache.m_capacity;
  v16 = self->_intervalCache.m_size + 1;
  self->_intervalCache.m_size = v16;
  if ((_DWORD)v16 == m_capacity)
  {
    v17 = (double *)WTF::Vector<double,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)p_intervalCache, v16 + 1, (unint64_t)&v19);
    LODWORD(v16) = self->_intervalCache.m_size;
  }
  else
  {
    v17 = (double *)&v19;
  }
  v18 = &self->_intervalCache.m_buffer[v12 + 1];
  memmove(v18 + 1, v18, 8 * v16 - 8 * (v12 + 1));
  *v18 = *v17;
  ++self->_intervalCache.m_size;
  return v20;
}

- (void)_getSessionIntervalForTime:(double)a3 beginningOfDay:(double *)a4 beginningOfNextDay:(double *)a5
{
  void *v8;
  id v9;
  double v10;
  id v11;
  double v12;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = 0.0;
  -[NSCalendar rangeOfUnit:startDate:interval:forDate:](self->_calendar, "rangeOfUnit:startDate:interval:forDate:", 16, &v11, &v12, v8);
  v9 = v11;
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  *a4 = v10;
  *a5 = v10 + v12;

}

- (void).cxx_destruct
{
  double *m_buffer;

  m_buffer = self->_intervalCache.m_buffer;
  if (m_buffer)
  {
    self->_intervalCache.m_buffer = 0;
    self->_intervalCache.m_capacity = 0;
    WTF::fastFree((WTF *)m_buffer, (void *)a2);
  }
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end

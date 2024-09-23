@implementation WebCoreNSURLSessionTaskTransactionMetrics

- (id)_initWithMetrics:(void *)a3 onTarget:(RefCountedSerialFunctionDispatcher *)a4
{
  char *v6;
  WTF::StringImpl *v7;
  char *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  WTF::StringImpl *v14;
  __int128 v15;
  uint64_t v16;
  _DWORD *v17;
  uint64_t v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)WebCoreNSURLSessionTaskTransactionMetrics;
  v6 = -[WebCoreNSURLSessionTaskTransactionMetrics init](&v20, sel_init);
  v8 = v6;
  if (v6)
  {
    v9 = *(_OWORD *)a3;
    *(_OWORD *)(v6 + 24) = *((_OWORD *)a3 + 1);
    *(_OWORD *)(v6 + 8) = v9;
    v10 = *((_OWORD *)a3 + 2);
    v11 = *((_OWORD *)a3 + 3);
    v12 = *((_OWORD *)a3 + 4);
    *((_QWORD *)v6 + 11) = *((_QWORD *)a3 + 10);
    *(_OWORD *)(v6 + 72) = v12;
    *(_OWORD *)(v6 + 56) = v11;
    *(_OWORD *)(v6 + 40) = v10;
    v13 = *((_QWORD *)a3 + 11);
    *((_QWORD *)a3 + 11) = 0;
    v14 = (WTF::StringImpl *)*((_QWORD *)v6 + 12);
    *((_QWORD *)v8 + 12) = v13;
    if (v14)
    {
      if (*(_DWORD *)v14 == 2)
        WTF::StringImpl::destroy(v14, v7);
      else
        *(_DWORD *)v14 -= 2;
    }
    v15 = *((_OWORD *)a3 + 6);
    *((_QWORD *)v8 + 15) = *((_QWORD *)a3 + 14);
    *(_OWORD *)(v8 + 104) = v15;
    v16 = *((_QWORD *)a3 + 15);
    *((_QWORD *)a3 + 15) = 0;
    v17 = (_DWORD *)*((_QWORD *)v8 + 16);
    *((_QWORD *)v8 + 16) = v16;
    if (v17)
      WTF::RefCounted<WebCore::AdditionalNetworkLoadMetricsForWebInspector>::deref(v17, v7);
    if (a4)
      (*((void (**)(RefCountedSerialFunctionDispatcher *))a4->var0 + 4))(a4);
    v18 = *((_QWORD *)v8 + 17);
    *((_QWORD *)v8 + 17) = a4;
    if (v18)
      (*(void (**)(uint64_t))(*(_QWORD *)v18 + 40))(v18);
  }
  return v8;
}

- (void)dealloc
{
  StringImpl *m_ptr;
  AdditionalNetworkLoadMetricsForWebInspector *v4;
  RefCountedSerialFunctionDispatcher *v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  double v11;
  uint64_t v12;
  objc_super v13;
  __int128 v14;
  unint64_t responseBodyDecodedSize;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  double m_value;
  uint64_t v22;

  m_ptr = self->_metrics.protocol.m_impl.m_ptr;
  m_value = self->_metrics.workerStart.m_value;
  v4 = self->_metrics.additionalNetworkLoadMetricsForWebInspector.m_ptr;
  responseBodyDecodedSize = self->_metrics.responseBodyDecodedSize;
  v5 = self->_targetDispatcher.m_ptr;
  v6 = *(_OWORD *)&self->_metrics.connectEnd.m_value;
  v18 = *(_OWORD *)&self->_metrics.connectStart.m_value;
  v19 = v6;
  v20 = *(_OWORD *)&self->_metrics.responseStart.m_value;
  v7 = *(_OWORD *)&self->_metrics.domainLookupStart.m_value;
  v16 = *(_OWORD *)&self->_metrics.redirectStart.m_value;
  v17 = v7;
  self->_metrics.protocol.m_impl.m_ptr = 0;
  v14 = *(_OWORD *)&self->_metrics.redirectCount;
  self->_metrics.additionalNetworkLoadMetricsForWebInspector.m_ptr = 0;
  v8 = WTF::fastMalloc((WTF *)0x88);
  *(_OWORD *)(v8 + 72) = v20;
  v9 = v18;
  *(_OWORD *)(v8 + 56) = v19;
  *(_OWORD *)(v8 + 40) = v9;
  v10 = v17;
  *(_OWORD *)(v8 + 8) = v16;
  *(_QWORD *)v8 = &off_1E3485C10;
  v11 = m_value;
  *(_OWORD *)(v8 + 24) = v10;
  *(double *)(v8 + 88) = v11;
  *(_QWORD *)(v8 + 96) = m_ptr;
  *(_OWORD *)(v8 + 104) = v14;
  *(_QWORD *)(v8 + 120) = responseBodyDecodedSize;
  *(_QWORD *)(v8 + 128) = v4;
  v22 = v8;
  (*((void (**)(RefCountedSerialFunctionDispatcher *, uint64_t *))v5->var0 + 2))(v5, &v22);
  v12 = v22;
  v22 = 0;
  if (v12)
    (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
  v13.receiver = self;
  v13.super_class = (Class)WebCoreNSURLSessionTaskTransactionMetrics;
  -[WebCoreNSURLSessionTaskTransactionMetrics dealloc](&v13, sel_dealloc);
}

- (NSDate)fetchStartDate
{
  double v2;
  double m_value;

  m_value = self->_metrics.fetchStart.m_value;
  if (m_value == 0.0)
    return 0;
  WTF::MonotonicTime::approximateWallTime((WTF::MonotonicTime *)&m_value);
  if (v2 <= 0.0)
    return 0;
  else
    return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:");
}

- (NSDate)domainLookupStartDate
{
  double v2;
  double m_value;

  m_value = self->_metrics.domainLookupStart.m_value;
  if (m_value == 0.0)
    return 0;
  WTF::MonotonicTime::approximateWallTime((WTF::MonotonicTime *)&m_value);
  if (v2 <= 0.0)
    return 0;
  else
    return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:");
}

- (NSDate)domainLookupEndDate
{
  double v2;
  double m_value;

  m_value = self->_metrics.domainLookupEnd.m_value;
  if (m_value == 0.0)
    return 0;
  WTF::MonotonicTime::approximateWallTime((WTF::MonotonicTime *)&m_value);
  if (v2 <= 0.0)
    return 0;
  else
    return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:");
}

- (NSDate)connectStartDate
{
  double v2;
  double m_value;

  m_value = self->_metrics.connectStart.m_value;
  if (m_value == 0.0)
    return 0;
  WTF::MonotonicTime::approximateWallTime((WTF::MonotonicTime *)&m_value);
  if (v2 <= 0.0)
    return 0;
  else
    return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:");
}

- (NSDate)secureConnectionStartDate
{
  double m_value;
  double v4;
  double v5;

  m_value = self->_metrics.secureConnectionStart.m_value;
  if (m_value == -1.0)
    return 0;
  v5 = self->_metrics.secureConnectionStart.m_value;
  if (m_value == 0.0)
    return 0;
  WTF::MonotonicTime::approximateWallTime((WTF::MonotonicTime *)&v5);
  if (v4 <= 0.0)
    return 0;
  else
    return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:");
}

- (NSDate)connectEndDate
{
  double v2;
  double m_value;

  m_value = self->_metrics.connectEnd.m_value;
  if (m_value == 0.0)
    return 0;
  WTF::MonotonicTime::approximateWallTime((WTF::MonotonicTime *)&m_value);
  if (v2 <= 0.0)
    return 0;
  else
    return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:");
}

- (NSDate)requestStartDate
{
  double v2;
  double m_value;

  m_value = self->_metrics.requestStart.m_value;
  if (m_value == 0.0)
    return 0;
  WTF::MonotonicTime::approximateWallTime((WTF::MonotonicTime *)&m_value);
  if (v2 <= 0.0)
    return 0;
  else
    return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:");
}

- (NSDate)responseStartDate
{
  double v2;
  double m_value;

  m_value = self->_metrics.responseStart.m_value;
  if (m_value == 0.0)
    return 0;
  WTF::MonotonicTime::approximateWallTime((WTF::MonotonicTime *)&m_value);
  if (v2 <= 0.0)
    return 0;
  else
    return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:");
}

- (NSDate)responseEndDate
{
  double v2;
  double m_value;

  m_value = self->_metrics.responseEnd.m_value;
  if (m_value == 0.0)
    return 0;
  WTF::MonotonicTime::approximateWallTime((WTF::MonotonicTime *)&m_value);
  if (v2 <= 0.0)
    return 0;
  else
    return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:");
}

- (NSString)networkProtocolName
{
  if (self->_metrics.protocol.m_impl.m_ptr)
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E3487BC0;
}

- (BOOL)isReusedConnection
{
  return (*((unsigned __int8 *)&self->_metrics + 98) >> 5) & 1;
}

- (int)_privacyStance
{
  if (self->_metrics.privacyStance - 1 < 5)
    return (self->_metrics.privacyStance - 1) + 1;
  else
    return 0;
}

- (BOOL)cellular
{
  return (*((unsigned __int8 *)&self->_metrics + 98) >> 1) & 1;
}

- (BOOL)expensive
{
  return (*((unsigned __int8 *)&self->_metrics + 98) >> 2) & 1;
}

- (BOOL)constrained
{
  return (*((unsigned __int8 *)&self->_metrics + 98) >> 3) & 1;
}

- (BOOL)multipath
{
  return (*((unsigned __int8 *)&self->_metrics + 98) >> 4) & 1;
}

- (void).cxx_destruct
{
  RefCountedSerialFunctionDispatcher *m_ptr;
  AdditionalNetworkLoadMetricsForWebInspector *v4;
  StringImpl *v5;

  m_ptr = self->_targetDispatcher.m_ptr;
  self->_targetDispatcher.m_ptr = 0;
  if (m_ptr)
    (*((void (**)(RefCountedSerialFunctionDispatcher *, SEL))m_ptr->var0 + 5))(m_ptr, a2);
  v4 = self->_metrics.additionalNetworkLoadMetricsForWebInspector.m_ptr;
  self->_metrics.additionalNetworkLoadMetricsForWebInspector.m_ptr = 0;
  if (v4)
    WTF::RefCounted<WebCore::AdditionalNetworkLoadMetricsForWebInspector>::deref(v4, (WTF::StringImpl *)a2);
  v5 = self->_metrics.protocol.m_impl.m_ptr;
  self->_metrics.protocol.m_impl.m_ptr = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy((WTF::StringImpl *)v5, (WTF::StringImpl *)a2);
    else
      *(_DWORD *)v5 -= 2;
  }
}

- (id).cxx_construct
{
  *((_DWORD *)self + 26) = 0;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_QWORD *)self + 14) = -1;
  *((_QWORD *)self + 15) = -1;
  *((_QWORD *)self + 16) = 0;
  *((_QWORD *)self + 17) = 0;
  return self;
}

- (_QWORD)dealloc
{
  _DWORD *v3;
  WTF::StringImpl *v4;

  *a1 = &off_1E3485C10;
  v3 = (_DWORD *)a1[16];
  a1[16] = 0;
  if (v3)
    WTF::RefCounted<WebCore::AdditionalNetworkLoadMetricsForWebInspector>::deref(v3, a2);
  v4 = (WTF::StringImpl *)a1[12];
  a1[12] = 0;
  if (v4)
  {
    if (*(_DWORD *)v4 == 2)
      WTF::StringImpl::destroy(v4, a2);
    else
      *(_DWORD *)v4 -= 2;
  }
  return a1;
}

- (uint64_t)dealloc
{
  _DWORD *v3;
  WTF::StringImpl *v4;

  *(_QWORD *)this = &off_1E3485C10;
  v3 = (_DWORD *)*((_QWORD *)this + 16);
  *((_QWORD *)this + 16) = 0;
  if (v3)
    WTF::RefCounted<WebCore::AdditionalNetworkLoadMetricsForWebInspector>::deref(v3, a2);
  v4 = (WTF::StringImpl *)*((_QWORD *)this + 12);
  *((_QWORD *)this + 12) = 0;
  if (v4)
  {
    if (*(_DWORD *)v4 == 2)
      WTF::StringImpl::destroy(v4, a2);
    else
      *(_DWORD *)v4 -= 2;
  }
  return WTF::fastFree(this, a2);
}

@end

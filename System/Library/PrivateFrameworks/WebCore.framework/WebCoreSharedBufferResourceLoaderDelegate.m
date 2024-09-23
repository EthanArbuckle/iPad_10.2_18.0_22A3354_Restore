@implementation WebCoreSharedBufferResourceLoaderDelegate

- (WebCoreSharedBufferResourceLoaderDelegate)initWithParent:(void *)a3
{
  WebCoreSharedBufferResourceLoaderDelegate *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WebCoreSharedBufferResourceLoaderDelegate;
  result = -[WebCoreSharedBufferResourceLoaderDelegate init](&v5, sel_init);
  if (result)
    result->_parent = a3;
  return result;
}

- (NSData)data
{
  return (NSData *)self->_data.m_ptr;
}

- (void)setExpectedContentSize:(int64_t)a3
{
  Lock *p_dataLock;
  int v7;

  p_dataLock = &self->_dataLock;
  if (__ldaxr(&self->_dataLock.m_byte.value.__a_.__a_value))
  {
    __clrex();
  }
  else if (!__stxr(1u, &p_dataLock->m_byte.value.__a_.__a_value))
  {
    goto LABEL_5;
  }
  MEMORY[0x19AEA534C](&self->_dataLock, a2);
LABEL_5:
  self->_expectedContentSize = a3;
  -[WebCoreSharedBufferResourceLoaderDelegate fulfillPendingRequests](self, "fulfillPendingRequests");
  v7 = __ldxr(&p_dataLock->m_byte.value.__a_.__a_value);
  if (v7 != 1)
  {
    __clrex();
    goto LABEL_9;
  }
  if (__stlxr(0, &p_dataLock->m_byte.value.__a_.__a_value))
LABEL_9:
    WTF::Lock::unlockSlow((WTF::Lock *)p_dataLock);
}

- (void)updateData:(id)a3 complete:(BOOL)a4
{
  Lock *p_dataLock;
  void *m_ptr;
  int v10;

  p_dataLock = &self->_dataLock;
  if (__ldaxr(&self->_dataLock.m_byte.value.__a_.__a_value))
  {
    __clrex();
  }
  else if (!__stxr(1u, &p_dataLock->m_byte.value.__a_.__a_value))
  {
    goto LABEL_5;
  }
  MEMORY[0x19AEA534C](&self->_dataLock, a2);
LABEL_5:
  if (a3)
    CFRetain(a3);
  m_ptr = self->_data.m_ptr;
  self->_data.m_ptr = a3;
  if (m_ptr)
    CFRelease(m_ptr);
  self->_complete = a4;
  -[WebCoreSharedBufferResourceLoaderDelegate fulfillPendingRequests](self, "fulfillPendingRequests");
  v10 = __ldxr(&p_dataLock->m_byte.value.__a_.__a_value);
  if (v10 != 1)
  {
    __clrex();
    goto LABEL_13;
  }
  if (__stlxr(0, &p_dataLock->m_byte.value.__a_.__a_value))
LABEL_13:
    WTF::Lock::unlockSlow((WTF::Lock *)p_dataLock);
}

- (BOOL)canFulfillRequest:(id)a3
{
  void *v6;
  uint64_t v7;

  if (!a3)
    return 0;
  if ((objc_msgSend(a3, "isFinished") & 1) != 0
    || (objc_msgSend(a3, "isCancelled") & 1) != 0
    || !self->_complete && !self->_expectedContentSize)
  {
    return 0;
  }
  v6 = (void *)objc_msgSend(a3, "dataRequest");
  if (v6)
  {
    v7 = objc_msgSend(v6, "requestedOffset");
    if (v7 > objc_msgSend(self->_data.m_ptr, "length"))
      return 0;
  }
  return 1;
}

- (void)enqueueRequest:(id)a3
{
  unint64_t m_size;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  WTF *m_buffer;
  void *v10;
  WTF *v11;
  uint64_t v12;
  WTF *v13;
  const void *v14;
  const void *v15;

  m_size = self->_requests.m_size;
  if ((_DWORD)m_size != self->_requests.m_capacity)
  {
    *((_QWORD *)self->_requests.m_buffer + m_size) = a3;
    if (!a3)
    {
LABEL_23:
      self->_requests.m_size = m_size + 1;
      return;
    }
LABEL_22:
    CFRetain(a3);
    LODWORD(m_size) = self->_requests.m_size;
    goto LABEL_23;
  }
  v6 = m_size + (m_size >> 2);
  if (v6 >= 0x10)
    v7 = v6 + 1;
  else
    v7 = 16;
  if (v7 <= m_size + 1)
    v8 = m_size + 1;
  else
    v8 = v7;
  if (!(v8 >> 29))
  {
    m_buffer = (WTF *)self->_requests.m_buffer;
    v11 = (WTF *)WTF::fastMalloc((WTF *)(8 * v8));
    self->_requests.m_capacity = v8;
    self->_requests.m_buffer = v11;
    if ((_DWORD)m_size)
    {
      v12 = 8 * m_size;
      v13 = m_buffer;
      do
      {
        v14 = *(const void **)v13;
        *(_QWORD *)v13 = 0;
        *(_QWORD *)v11 = v14;
        v15 = *(const void **)v13;
        *(_QWORD *)v13 = 0;
        if (v15)
          CFRelease(v15);
        v11 = (WTF *)((char *)v11 + 8);
        v13 = (WTF *)((char *)v13 + 8);
        v12 -= 8;
      }
      while (v12);
      v11 = (WTF *)self->_requests.m_buffer;
    }
    if (m_buffer)
    {
      if (v11 == m_buffer)
      {
        self->_requests.m_buffer = 0;
        self->_requests.m_capacity = 0;
      }
      WTF::fastFree(m_buffer, v10);
      v11 = (WTF *)self->_requests.m_buffer;
    }
    m_size = self->_requests.m_size;
    *((_QWORD *)v11 + m_size) = a3;
    if (!a3)
      goto LABEL_23;
    goto LABEL_22;
  }
  __break(0xC471u);
}

- (void)fulfillPendingRequests
{
  id *m_buffer;
  uint64_t m_size;
  uint64_t v5;
  uint64_t v6;
  id *v7;
  int v8;
  id *v9;
  id *v10;
  id *v11;
  id *v12;
  id *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  id *v23;
  id v24;
  id v25;
  _QWORD *v26;
  uint64_t v27;
  id v28;

  m_buffer = (id *)self->_requests.m_buffer;
  m_size = self->_requests.m_size;
  if ((_DWORD)m_size)
  {
    v5 = 8 * m_size;
    do
    {
      if (-[WebCoreSharedBufferResourceLoaderDelegate canFulfillRequest:](self, "canFulfillRequest:", *m_buffer))
        -[WebCoreSharedBufferResourceLoaderDelegate fulfillRequest:](self, "fulfillRequest:", *m_buffer);
      ++m_buffer;
      v5 -= 8;
    }
    while (v5);
    m_buffer = (id *)self->_requests.m_buffer;
    v6 = self->_requests.m_size;
    v7 = &m_buffer[v6];
    if ((_DWORD)v6)
    {
      v8 = 0;
      v9 = &m_buffer[v6];
      v10 = v9;
      do
      {
        if (objc_msgSend(*m_buffer, "isFinished"))
        {
          v11 = m_buffer;
          if (v10 != (id *)self->_requests.m_buffer + self->_requests.m_size)
          {
            if (v9 == m_buffer)
            {
              v11 = v10;
            }
            else
            {
              if (v9 <= v10)
              {
                v17 = 0;
                v16 = m_buffer - v9;
                do
                {
                  v18 = &m_buffer[v17];
                  v19 = m_buffer[v17 - 1];
                  *(v18 - 1) = 0;
                  *(id *)((char *)v10 + (((char *)m_buffer - (char *)v9) & 0xFFFFFFFFFFFFFFF8) + v17 * 8 - 8) = v19;
                  v20 = m_buffer[v17 - 1];
                  *(v18 - 1) = 0;
                  if (v20)
                    CFRelease(v20);
                  --v17;
                }
                while (&m_buffer[v17] != v9);
              }
              else
              {
                v12 = v10;
                v13 = v9;
                do
                {
                  v14 = *v13;
                  *v13 = 0;
                  *v12 = v14;
                  v15 = *v13;
                  *v13 = 0;
                  if (v15)
                    CFRelease(v15);
                  ++v12;
                  ++v13;
                }
                while (v13 != m_buffer);
                v16 = m_buffer - v9;
              }
              v11 = &v10[v16];
            }
          }
          v21 = *m_buffer;
          *m_buffer = 0;
          v9 = m_buffer + 1;
          if (v21)
            CFRelease(v21);
          ++v8;
          v10 = v11;
        }
        ++m_buffer;
      }
      while (m_buffer < v7);
      m_buffer = (id *)self->_requests.m_buffer;
      v22 = self->_requests.m_size;
      v7 = v10;
    }
    else
    {
      v22 = 0;
      v8 = 0;
      v9 = v7;
    }
  }
  else
  {
    v22 = 0;
    v8 = 0;
    v7 = (id *)self->_requests.m_buffer;
    v9 = v7;
  }
  v23 = &m_buffer[v22];
  if (v9 != v23)
  {
    if (v9 <= v7)
    {
      v26 = (id *)((char *)v7 + (((char *)v23 - (char *)v9) & 0xFFFFFFFFFFFFFFF8) - 8);
      do
      {
        v27 = (uint64_t)*--v23;
        *v23 = 0;
        *v26 = v27;
        v28 = *v23;
        *v23 = 0;
        if (v28)
          CFRelease(v28);
        --v26;
      }
      while (v23 != v9);
    }
    else
    {
      do
      {
        v24 = *v9;
        *v9 = 0;
        *v7 = v24;
        v25 = *v9;
        *v9 = 0;
        if (v25)
          CFRelease(v25);
        ++v7;
        ++v9;
      }
      while (v9 != v23);
    }
  }
  self->_requests.m_size -= v8;
}

- (void)fulfillRequest:(id)a3
{
  uint64_t v5;
  void *v6;
  WTF::StringImpl *v7;
  const __CFString *v8;
  WTF::StringImpl *v9;
  int64_t expectedContentSize;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v5 = objc_msgSend(a3, "contentInformationRequest");
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (WTF::StringImpl *)*((_QWORD *)self->_parent + 3);
    if (v7)
    {
      *(_DWORD *)v7 += 2;
      v8 = (const __CFString *)WTF::StringImpl::operator NSString *();
    }
    else
    {
      v8 = &stru_1E3487BC0;
    }
    objc_msgSend(v6, "setContentType:", v8);
    if (v7)
    {
      if (*(_DWORD *)v7 == 2)
        WTF::StringImpl::destroy(v7, v9);
      else
        *(_DWORD *)v7 -= 2;
    }
    objc_msgSend(v6, "setByteRangeAccessSupported:", 1);
    if (self->_complete)
      expectedContentSize = objc_msgSend(self->_data.m_ptr, "length");
    else
      expectedContentSize = self->_expectedContentSize;
    objc_msgSend(v6, "setContentLength:", expectedContentSize);
  }
  v11 = objc_msgSend(a3, "dataRequest");
  if (!v11)
    goto LABEL_19;
  v12 = (void *)v11;
  v13 = objc_msgSend(self->_data.m_ptr, "length");
  v14 = v13 - objc_msgSend(v12, "requestedOffset");
  if (v14 >= 1)
  {
    if ((objc_msgSend(v12, "requestsAllDataToEndOfResource") & 1) == 0)
    {
      v15 = objc_msgSend(v12, "requestedLength");
      if (v15 < v14)
        v14 = v15;
    }
    v16 = objc_msgSend(self->_data.m_ptr, "subdataWithRange:", objc_msgSend(v12, "requestedOffset"), v14);
    if (v16)
    {
      objc_msgSend(v12, "respondWithData:", v16);
      if (objc_msgSend(v12, "requestsAllDataToEndOfResource"))
      {
        if (self->_complete)
LABEL_19:
          objc_msgSend(a3, "finishLoading");
      }
      else
      {
        v17 = objc_msgSend(v12, "requestedOffset");
        v18 = objc_msgSend(v12, "requestedLength") + v17;
        if (v18 <= objc_msgSend(v12, "currentOffset"))
          goto LABEL_19;
      }
    }
  }
}

- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4
{
  Lock *p_dataLock;
  int v8;

  p_dataLock = &self->_dataLock;
  if (__ldaxr(&self->_dataLock.m_byte.value.__a_.__a_value))
  {
    __clrex();
LABEL_4:
    MEMORY[0x19AEA534C](&self->_dataLock, a2, a3);
    goto LABEL_5;
  }
  if (__stxr(1u, &p_dataLock->m_byte.value.__a_.__a_value))
    goto LABEL_4;
LABEL_5:
  if (!-[WebCoreSharedBufferResourceLoaderDelegate canFulfillRequest:](self, "canFulfillRequest:", a4)
    || (-[WebCoreSharedBufferResourceLoaderDelegate fulfillRequest:](self, "fulfillRequest:", a4),
        (objc_msgSend(a4, "isFinished") & 1) == 0))
  {
    -[WebCoreSharedBufferResourceLoaderDelegate enqueueRequest:](self, "enqueueRequest:", a4);
  }
  v8 = __ldxr(&p_dataLock->m_byte.value.__a_.__a_value);
  if (v8 == 1)
  {
    if (!__stlxr(0, &p_dataLock->m_byte.value.__a_.__a_value))
      return 1;
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)p_dataLock);
  return 1;
}

- (void)resourceLoader:(id)a3 didCancelLoadingRequest:(id)a4
{
  Lock *p_dataLock;
  id *m_buffer;
  uint64_t m_size;
  id *v10;
  int v11;
  id *v12;
  id *v13;
  id v14;
  id *v15;
  id *v16;
  id *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id *v22;
  id v23;
  id v24;
  uint64_t v25;
  id *v26;
  id v27;
  id v28;
  _QWORD *v29;
  uint64_t v30;
  id v31;
  int v32;
  WTF::Lock *v33;

  p_dataLock = &self->_dataLock;
  if (__ldaxr(&self->_dataLock.m_byte.value.__a_.__a_value))
  {
    __clrex();
  }
  else if (!__stxr(1u, &p_dataLock->m_byte.value.__a_.__a_value))
  {
    goto LABEL_5;
  }
  MEMORY[0x19AEA534C](&self->_dataLock, a2, a3);
LABEL_5:
  m_buffer = (id *)self->_requests.m_buffer;
  m_size = self->_requests.m_size;
  v10 = &m_buffer[m_size];
  if ((_DWORD)m_size)
  {
    v33 = (WTF::Lock *)p_dataLock;
    v11 = 0;
    v12 = &m_buffer[m_size];
    v13 = v12;
    do
    {
      if (*m_buffer == a4)
      {
        v14 = a4;
        v15 = m_buffer;
        if (v13 != (id *)self->_requests.m_buffer + self->_requests.m_size)
        {
          if (v12 == m_buffer)
          {
            v14 = a4;
            v15 = v13;
          }
          else
          {
            if (v12 <= v13)
            {
              v21 = 0;
              v20 = m_buffer - v12;
              do
              {
                v22 = &m_buffer[v21];
                v23 = m_buffer[v21 - 1];
                *(v22 - 1) = 0;
                *(id *)((char *)v13 + (((char *)m_buffer - (char *)v12) & 0xFFFFFFFFFFFFFFF8) + v21 * 8 - 8) = v23;
                v24 = m_buffer[v21 - 1];
                *(v22 - 1) = 0;
                if (v24)
                  CFRelease(v24);
                --v21;
              }
              while (&m_buffer[v21] != v12);
            }
            else
            {
              v16 = v13;
              v17 = v12;
              do
              {
                v18 = *v17;
                *v17 = 0;
                *v16 = v18;
                v19 = *v17;
                *v17 = 0;
                if (v19)
                  CFRelease(v19);
                ++v16;
                ++v17;
              }
              while (v17 != m_buffer);
              v20 = m_buffer - v12;
            }
            v15 = &v13[v20];
            v14 = *m_buffer;
          }
        }
        *m_buffer = 0;
        v12 = m_buffer + 1;
        if (v14)
          CFRelease(v14);
        ++v11;
        v13 = v15;
      }
      ++m_buffer;
    }
    while (m_buffer < v10);
    m_buffer = (id *)self->_requests.m_buffer;
    v25 = self->_requests.m_size;
    v10 = v13;
    p_dataLock = (Lock *)v33;
  }
  else
  {
    v25 = 0;
    v11 = 0;
    v12 = v10;
  }
  v26 = &m_buffer[v25];
  if (v12 != v26)
  {
    if (v12 <= v10)
    {
      v29 = (id *)((char *)v10 + (((char *)v26 - (char *)v12) & 0xFFFFFFFFFFFFFFF8) - 8);
      do
      {
        v30 = (uint64_t)*--v26;
        *v26 = 0;
        *v29 = v30;
        v31 = *v26;
        *v26 = 0;
        if (v31)
          CFRelease(v31);
        --v29;
      }
      while (v26 != v12);
    }
    else
    {
      do
      {
        v27 = *v12;
        *v12 = 0;
        *v10 = v27;
        v28 = *v12;
        *v12 = 0;
        if (v28)
          CFRelease(v28);
        ++v10;
        ++v12;
      }
      while (v12 != v26);
    }
  }
  self->_requests.m_size -= v11;
  v32 = __ldxr(&p_dataLock->m_byte.value.__a_.__a_value);
  if (v32 != 1)
  {
    __clrex();
    goto LABEL_42;
  }
  if (__stlxr(0, &p_dataLock->m_byte.value.__a_.__a_value))
LABEL_42:
    WTF::Lock::unlockSlow((WTF::Lock *)p_dataLock);
}

- (void).cxx_destruct
{
  uint64_t m_size;
  const void **m_buffer;
  uint64_t v5;
  const void *v6;
  WTF *v7;
  void *m_ptr;

  m_size = self->_requests.m_size;
  if ((_DWORD)m_size)
  {
    m_buffer = (const void **)self->_requests.m_buffer;
    v5 = 8 * m_size;
    do
    {
      v6 = *m_buffer;
      *m_buffer = 0;
      if (v6)
        CFRelease(v6);
      ++m_buffer;
      v5 -= 8;
    }
    while (v5);
  }
  v7 = (WTF *)self->_requests.m_buffer;
  if (v7)
  {
    self->_requests.m_buffer = 0;
    self->_requests.m_capacity = 0;
    WTF::fastFree(v7, (void *)a2);
  }
  m_ptr = self->_data.m_ptr;
  self->_data.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_BYTE *)self + 56) = 0;
  return self;
}

@end

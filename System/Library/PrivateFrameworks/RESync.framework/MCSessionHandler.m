@implementation MCSessionHandler

- (MCSessionHandler)initWithSession:(id)a3 protocolLayer:(MultipeerProtocolLayer *)a4
{
  id v6;
  MCSessionHandler *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MCSessionHandler;
  v7 = -[MCSessionHandler init](&v21, sel_init);
  -[MCSessionHandler setSession:](v7, "setSession:", v6);
  -[MCSessionHandler setProtocolLayer:](v7, "setProtocolLayer:", a4);
  -[MCSessionHandler setListener:](v7, "setListener:", a4->var3);
  v8 = (void *)objc_opt_new();
  -[MCSessionHandler setHandlesLock:](v7, "setHandlesLock:", v8);

  objc_msgSend(v6, "privateDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCSessionHandler setNextDelegate:](v7, "setNextDelegate:", v9);

  objc_msgSend(v6, "setPrivateDelegate:", v7);
  objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v7, CFSTR("privateDelegate"), 1, 0);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v6, "connectedPeers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        if (v16)

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v12);
  }

  return v7;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  -[MCSession removeObserver:forKeyPath:](self->_session, "removeObserver:forKeyPath:", self, CFSTR("privateDelegate"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_nextDelegate);
  -[MCSession setPrivateDelegate:](self->_session, "setPrivateDelegate:", WeakRetained);

  -[MCSession disconnect](self->_session, "disconnect");
  v4.receiver = self;
  v4.super_class = (Class)MCSessionHandler;
  -[MCSessionHandler dealloc](&v4, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  MCSessionHandler *v7;
  id v8;

  -[MCSession privateDelegate](self->_session, "privateDelegate", a3, a4, a5, a6);
  v7 = (MCSessionHandler *)objc_claimAutoreleasedReturnValue();

  if (v7 != self)
  {
    -[MCSession privateDelegate](self->_session, "privateDelegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[MCSession setPrivateDelegate:](self->_session, "setPrivateDelegate:", self);
    -[MCSessionHandler setNextDelegate:](self, "setNextDelegate:", v8);

  }
}

- (void)session:(id)a3 didReceiveData:(id)a4 fromPeer:(id)a5 propagate:(BOOL *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  unsigned __int8 *v14;
  char *v15;
  char *v16;
  _BOOL8 SignatureUnsafe;
  unsigned int v18;
  NSObject *v19;
  BOOL v20;
  unsigned int v21;
  unsigned int v22;
  unint64_t m_size;
  uint64_t *m_data;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v29;
  void *v30;
  void *v31;
  re *v32;
  NSObject *v33;
  NSObject *v34;
  _BYTE *v35;
  int v36;
  _BYTE *v37;
  uint8_t buf[8];
  char v39;
  _BYTE v40[31];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_retainAutorelease(v11);
  v14 = (unsigned __int8 *)objc_msgSend(v13, "bytes");
  v15 = (char *)objc_msgSend(v13, "length");
  if ((unint64_t)v15 >= 0xA)
  {
    v16 = v15;
    if (SignatureUnsafe)
    {
      v18 = v14[8];
      if (v18 < 0xA)
      {
        v21 = v18 | 0x100;
        v20 = 1;
      }
      else
      {
        v19 = *re::networkLogObjects((re *)SignatureUnsafe);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v18;
          _os_log_impl(&dword_21C69B000, v19, OS_LOG_TYPE_DEFAULT, "MPC: Unsupported channelID=%hhu", buf, 8u);
        }
        v20 = 0;
        v21 = 0;
      }
    }
    else
    {
        goto LABEL_35;
      v22 = v14[8];
      v20 = v22 > 0xFD;
      if (v22 <= 0xFD)
        v21 = 0;
      else
        v21 = v14[8];
    }
    *a6 = 0;
    -[NSLock lock](self->_handlesLock, "lock");
    m_size = self->_handles.m_size;
    if (m_size)
    {
      m_data = (uint64_t *)self->_handles.m_data;
      v25 = 8 * m_size;
      while (1)
      {
        v26 = *m_data;
        v27 = *(id *)(*m_data + 1768);
        if (v27 && v27 == v12)
          break;
        ++m_data;
        v25 -= 8;
        if (!v25)
          goto LABEL_34;
      }
      if (v20)
      {
        if (v21 > 0xFF)
        {
          if (!*(_BYTE *)(v26 + 1776))
          {
            +[REMultipeerHelper makeAddressFromPeerID:](REMultipeerHelper, "makeAddressFromPeerID:", v12);
            v32 = (re *)((uint64_t (*)(ProtocolLayerListener *, MultipeerProtocolLayer *, uint64_t, uint8_t *))*self->_listener->var0)(self->_listener, self->_protocolLayer, *m_data, buf);
            *(_BYTE *)(*m_data + 1776) = 1;
            v33 = *re::networkLogObjects(v32);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              v34 = v33;
              if ((v39 & 1) != 0)
                v35 = *(_BYTE **)&v40[7];
              else
                v35 = v40;
              v36 = 136315138;
              v37 = v35;
              _os_log_impl(&dword_21C69B000, v34, OS_LOG_TYPE_DEFAULT, "MPC: Received data from a legacy client address=%s", (uint8_t *)&v36, 0xCu);

            }
            if (*(_QWORD *)buf && (v39 & 1) != 0)
              (*(void (**)(void))(**(_QWORD **)buf + 40))();
          }
          (*((void (**)(ProtocolLayerListener *, MultipeerProtocolLayer *, uint64_t, _QWORD, uint64_t, _QWORD))self->_listener->var0
           + 3))(self->_listener, self->_protocolLayer, *m_data, v21, objc_msgSend(objc_retainAutorelease(v13), "bytes") + 9, objc_msgSend(v13, "length") - 9);
        }
        else
        {
          if (!*(_BYTE *)(v26 + 1776))
          {
            +[REMultipeerHelper makeAddressFromPeerID:](REMultipeerHelper, "makeAddressFromPeerID:", v12);
            ((void (*)(ProtocolLayerListener *, MultipeerProtocolLayer *, uint64_t, uint8_t *))*self->_listener->var0)(self->_listener, self->_protocolLayer, *m_data, buf);
            if (*(_QWORD *)buf && (v39 & 1) != 0)
              (*(void (**)(void))(**(_QWORD **)buf + 40))();
            v26 = *m_data;
          }
          if (v21 == 255)
          {
            v29 = objc_retainAutorelease(v13);
            objc_msgSend(v29, "bytes");
            objc_msgSend(v29, "length");
          }
          else
          {
            *(_BYTE *)(v26 + 1776) = 1;
          }
        }
      }
      else if (*(_BYTE *)(v26 + 1776))
      {
        (*((void (**)(ProtocolLayerListener *, MultipeerProtocolLayer *, uint64_t, _QWORD))self->_listener->var0
         + 2))(self->_listener, self->_protocolLayer, *m_data, 0);
      }
    }
LABEL_34:
    -[NSLock unlock](self->_handlesLock, "unlock");
  }
LABEL_35:
  -[MCSessionHandler nextDelegate](self, "nextDelegate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[MCSessionHandler nextDelegate](self, "nextDelegate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "session:didReceiveData:fromPeer:propagate:", v10, v13, v12, a6);

  }
}

- (void)session:(id)a3 peer:(id)a4 didChangeState:(int64_t)a5 propagate:(BOOL *)a6
{
  id v10;
  MCPeerID *v11;
  unint64_t m_size;
  _QWORD *m_data;
  uint64_t v14;
  MCPeerID *v15;
  void *v17;
  void *v18;
  uint64_t v19;
  char v20;

  v10 = a3;
  v11 = (MCPeerID *)a4;
  -[NSLock lock](self->_handlesLock, "lock");
  if (a5)
  {
    if (a5 == 2)
    {
      if (v19)

    }
  }
  else
  {
    m_size = self->_handles.m_size;
    if (m_size)
    {
      m_data = self->_handles.m_data;
      v14 = 8 * m_size;
      while (1)
      {
        v15 = *(MCPeerID **)(*m_data + 1768);
        if (v15 && v15 == v11)
          break;
        ++m_data;
        v14 -= 8;
        if (!v14)
          goto LABEL_17;
      }
      *(_QWORD *)(*m_data + 1768) = 0;

      if (*(_BYTE *)(*m_data + 1776))
      {
        +[REMultipeerHelper makeAddressFromPeerID:](REMultipeerHelper, "makeAddressFromPeerID:", v11);
        (*((void (**)(ProtocolLayerListener *, MultipeerProtocolLayer *, _QWORD, uint64_t *))self->_listener->var0
         + 1))(self->_listener, self->_protocolLayer, *m_data, &v19);
        if (v19)
        {
          if ((v20 & 1) != 0)
            (*(void (**)(void))(*(_QWORD *)v19 + 40))();
        }
      }
    }
  }
LABEL_17:
  -[NSLock unlock](self->_handlesLock, "unlock");
  -[MCSessionHandler nextDelegate](self, "nextDelegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[MCSessionHandler nextDelegate](self, "nextDelegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "session:peer:didChangeState:propagate:", v10, v11, a5, a6);

  }
}

- (void)session:(id)a3 didStartReceivingResourceWithName:(id)a4 fromPeer:(id)a5 withProgress:(id)a6 propagate:(BOOL *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  -[MCSessionHandler nextDelegate](self, "nextDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[MCSessionHandler nextDelegate](self, "nextDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "session:didStartReceivingResourceWithName:fromPeer:withProgress:propagate:", v17, v12, v13, v14, a7);

  }
}

- (void)session:(id)a3 didFinishReceivingResourceWithName:(id)a4 fromPeer:(id)a5 atURL:(id)a6 withError:(id)a7 propagate:(BOOL *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  -[MCSessionHandler nextDelegate](self, "nextDelegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[MCSessionHandler nextDelegate](self, "nextDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "session:didFinishReceivingResourceWithName:fromPeer:atURL:withError:propagate:", v20, v14, v15, v16, v17, a8);

  }
}

- (void)session:(id)a3 didReceiveStream:(id)a4 withName:(id)a5 fromPeer:(id)a6 propagate:(BOOL *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  -[MCSessionHandler nextDelegate](self, "nextDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[MCSessionHandler nextDelegate](self, "nextDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "session:didReceiveStream:withName:fromPeer:propagate:", v17, v12, v13, v14, a7);

  }
}

- (MultipeerProtocolLayer)protocolLayer
{
  return self->_protocolLayer;
}

- (void)setProtocolLayer:(MultipeerProtocolLayer *)a3
{
  self->_protocolLayer = a3;
}

- (ProtocolLayerListener)listener
{
  return self->_listener;
}

- (void)setListener:(ProtocolLayerListener *)a3
{
  self->_listener = a3;
}

- (MCSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (NSLock)handlesLock
{
  return self->_handlesLock;
}

- (void)setHandlesLock:(id)a3
{
  objc_storeStrong((id *)&self->_handlesLock, a3);
}

- (DynamicArray<re::SharedPtr<(anonymous)handles
{
  Allocator *m_capacity;
  unint64_t *p_m_capacity;
  unint64_t v6;

  p_m_capacity = &self[1].m_capacity;
  m_capacity = (Allocator *)self[1].m_capacity;
  retstr->m_data = 0;
  retstr->m_capacity = 0;
  retstr->m_size = 0;
  retstr->m_allocator = 0;
  retstr->m_version = 0;
  if (m_capacity)
  {
    v6 = *(_QWORD *)&self[1].m_version;
    retstr->m_allocator = m_capacity;
    re::DynamicArray<re::SharedPtr<re::SessionParticipant>>::setCapacity(retstr, v6);
    ++retstr->m_version;
  }
  return self;
}

- (void)setHandles:(DynamicArray<re::SharedPtr<(anonymous)namespace
{
  DynamicArray<re::SharedPtr<(anonymous namespace)::MCProtocolHandle>> *p_handles;
  Allocator *m_allocator;
  unint64_t v7;
  unint64_t m_size;
  char *m_data;
  uint64_t v10;

  p_handles = &self->_handles;
  if (&self->_handles != a3)
  {
    m_allocator = a3->m_allocator;
    if (p_handles->m_allocator)
    {
      if (m_allocator)
      {
      }
      else
      {
        m_size = self->_handles.m_size;
        self->_handles.m_size = 0;
        if (m_size)
        {
          m_data = (char *)self->_handles.m_data;
          v10 = 8 * m_size;
          do
          {
            if (*(_QWORD *)m_data)
            {

              *(_QWORD *)m_data = 0;
            }
            m_data += 8;
            v10 -= 8;
          }
          while (v10);
        }
      }
      ++self->_handles.m_version;
    }
    else if (m_allocator)
    {
      v7 = a3->m_size;
      self->_handles.m_allocator = m_allocator;
      re::DynamicArray<re::SharedPtr<re::SessionParticipant>>::setCapacity(&self->_handles.m_allocator, v7);
      ++self->_handles.m_version;
    }
  }
}

- (MCSessionPrivateDelegate)nextDelegate
{
  return (MCSessionPrivateDelegate *)objc_loadWeakRetained((id *)&self->_nextDelegate);
}

- (void)setNextDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_nextDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_nextDelegate);
  objc_storeStrong((id *)&self->_handlesLock, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_DWORD *)self + 18) = 0;
  return self;
}

@end

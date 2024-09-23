@implementation TVRMSTouchRemoteSocket

- (TVRMSTouchRemoteSocket)initWithHost:(id)a3 port:(int)a4 encryptionKey:(int)a5
{
  id v9;
  TVRMSTouchRemoteSocket *v10;
  TVRMSTouchRemoteSocket *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TVRMSTouchRemoteSocket;
  v10 = -[TVRMSTouchRemoteSocket init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_host, a3);
    v11->_port = a4;
    v11->_encryptionKey = a5;
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[TVRMSTouchRemoteSocket disconnect](self, "disconnect");
  v3.receiver = self;
  v3.super_class = (Class)TVRMSTouchRemoteSocket;
  -[TVRMSTouchRemoteSocket dealloc](&v3, sel_dealloc);
}

- (void)disconnect
{
  NSObject *v3;
  NSOutputStream *outputStream;
  void *v5;
  NSOutputStream *v6;
  uint8_t v7[16];

  _TVRCRMSLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "Closing socket", v7, 2u);
  }

  -[NSOutputStream close](self->_outputStream, "close");
  outputStream = self->_outputStream;
  objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSOutputStream removeFromRunLoop:forMode:](outputStream, "removeFromRunLoop:forMode:", v5, *MEMORY[0x24BDBCA90]);

  v6 = self->_outputStream;
  self->_outputStream = 0;

}

- (void)connect
{
  NSOutputStream *outputStream;
  NSOutputStream *v4;
  void *v5;
  CFWriteStreamRef writeStream;

  writeStream = 0;
  CFStreamCreatePairWithSocketToHost(0, (CFStringRef)self->_host, self->_port, 0, &writeStream);
  outputStream = self->_outputStream;
  self->_outputStream = (NSOutputStream *)writeStream;

  -[NSOutputStream setDelegate:](self->_outputStream, "setDelegate:", self);
  v4 = self->_outputStream;
  objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSOutputStream scheduleInRunLoop:forMode:](v4, "scheduleInRunLoop:forMode:", v5, *MEMORY[0x24BDBCA90]);

  -[NSOutputStream open](self->_outputStream, "open");
}

- (BOOL)sendTouchCode:(int64_t)a3 timeInMilliseconds:(unsigned int)a4 location:(CGPoint)a5
{
  double y;
  double x;
  uint64_t v7;
  unsigned int v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  unsigned int v15;
  NSObject *v16;
  BOOL v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  int v25;
  uint8_t *v26;
  void *v27;
  void *v28;
  NSOutputStream *outputStream;
  id v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  int v38;
  unsigned int v39;
  int v40;
  unsigned int v41;
  uint64_t v42;

  y = a5.y;
  x = a5.x;
  v7 = *(_QWORD *)&a4;
  v8 = a3;
  v42 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v12);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (int)y | ((int)x << 16));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v13);

  v14 = objc_msgSend(v10, "count");
  v15 = v14;
  if (v14 < 0x15)
  {
    v18 = 4 * v14 + 20;
    *(_DWORD *)buf = bswap32(v18);
    v38 = 256;
    v39 = bswap32(v8);
    v40 = 0;
    v41 = bswap32(4 * v14);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v19 = v10;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v33;
      v23 = 5;
      do
      {
        v24 = 0;
        v25 = v23;
        v26 = &buf[4 * v23];
        do
        {
          if (*(_QWORD *)v33 != v22)
            objc_enumerationMutation(v19);
          *(_DWORD *)&v26[4 * v24] = bswap32(objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v24), "intValue", (_QWORD)v32));
          ++v24;
        }
        while (v21 != v24);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        v23 = v25 + v24;
      }
      while (v21);
    }

    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", buf, v18);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRMSTouchRemoteSocket _encryptData:](self, "_encryptData:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    outputStream = self->_outputStream;
    v30 = objc_retainAutorelease(v28);
    v17 = -[NSOutputStream write:maxLength:](outputStream, "write:maxLength:", objc_msgSend(v30, "bytes"), objc_msgSend(v30, "length")) != 0;

  }
  else
  {
    _TVRCRMSLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v38 = v15;
      _os_log_impl(&dword_21A51B000, v16, OS_LOG_TYPE_DEFAULT, "Touch remote socket attempted to write too much data: %d", buf, 8u);
    }

    v17 = 0;
  }

  return v17;
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id WeakRetained;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (a4 == 8)
  {
    _TVRCRMSLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "streamError");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v11;
      _os_log_impl(&dword_21A51B000, v10, OS_LOG_TYPE_DEFAULT, "Stream error: %@", (uint8_t *)&v13, 0xCu);

    }
    -[TVRMSTouchRemoteSocket disconnect](self, "disconnect");
    goto LABEL_13;
  }
  if (a4 == 1)
  {
    _TVRCRMSLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "Touch remote socket opened", (uint8_t *)&v13, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "touchRemoteSocketDidConnect:", self);
    goto LABEL_14;
  }
  if (objc_msgSend(v6, "streamStatus") == 6)
  {
    _TVRCRMSLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_21A51B000, v12, OS_LOG_TYPE_DEFAULT, "Touch remote socket closed", (uint8_t *)&v13, 2u);
    }

LABEL_13:
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "touchRemoteSocketDidDisconnect:", self);
LABEL_14:

  }
}

- (id)_encryptData:(id)a3
{
  id v4;
  int *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unsigned int *v10;
  int v11;
  void *v12;

  v4 = objc_retainAutorelease(a3);
  v5 = (int *)objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");
  v7 = malloc_type_malloc(objc_msgSend(v4, "length"), 0xC9D77B7FuLL);
  v8 = v7;
  if (v6 >= 4uLL)
  {
    v9 = v6 >> 2;
    v10 = (unsigned int *)v7;
    do
    {
      v11 = *v5++;
      *v10++ = self->_encryptionKey ^ v11;
      --v9;
    }
    while (v9);
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v7, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  free(v8);

  return v12;
}

- (TVRMSTouchRemoteSocketDelegate)delegate
{
  return (TVRMSTouchRemoteSocketDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
}

@end

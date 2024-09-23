@implementation Pipe

- (Pipe)initWithDelegate:(id)a3 pipe:(id)a4
{
  id v6;
  id v7;
  Pipe *v8;
  Pipe *v9;
  NSMutableArray *v10;
  NSMutableArray *txMessageQueue;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)Pipe;
  v8 = -[Pipe init](&v21, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_pipe, a4);
    v10 = objc_opt_new(NSMutableArray);
    txMessageQueue = v9->_txMessageQueue;
    v9->_txMessageQueue = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CBScalablePipe input](v9->_pipe, "input"));
    objc_msgSend(v12, "setDelegate:", v9);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CBScalablePipe output](v9->_pipe, "output"));
    objc_msgSend(v13, "setDelegate:", v9);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CBScalablePipe input](v9->_pipe, "input"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    objc_msgSend(v14, "scheduleInRunLoop:forMode:", v15, NSDefaultRunLoopMode);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CBScalablePipe output](v9->_pipe, "output"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    objc_msgSend(v16, "scheduleInRunLoop:forMode:", v17, NSDefaultRunLoopMode);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CBScalablePipe input](v9->_pipe, "input"));
    objc_msgSend(v18, "open");

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CBScalablePipe output](v9->_pipe, "output"));
    objc_msgSend(v19, "open");

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  objc_storeWeak((id *)&self->_delegate, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBScalablePipe input](self->_pipe, "input"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  objc_msgSend(v3, "removeFromRunLoop:forMode:", v4, NSDefaultRunLoopMode);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBScalablePipe output](self->_pipe, "output"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  objc_msgSend(v5, "removeFromRunLoop:forMode:", v6, NSDefaultRunLoopMode);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBScalablePipe input](self->_pipe, "input"));
  objc_msgSend(v7, "setDelegate:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBScalablePipe output](self->_pipe, "output"));
  objc_msgSend(v8, "setDelegate:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBScalablePipe input](self->_pipe, "input"));
  objc_msgSend(v9, "close");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBScalablePipe output](self->_pipe, "output"));
  objc_msgSend(v10, "close");

  v11.receiver = self;
  v11.super_class = (Class)Pipe;
  -[Pipe dealloc](&v11, "dealloc");
}

- (void)sendMessage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  OutboundMessage *v7;
  void *v8;
  id v9;
  char v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", a3, 0, 0));
  v10 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithData:](NSMutableData, "dataWithData:", v4));
  objc_msgSend(v5, "appendBytes:length:", &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[Pipe txMessageQueue](self, "txMessageQueue"));
  v7 = -[OutboundMessage initWithData:]([OutboundMessage alloc], "initWithData:", v5);
  objc_msgSend(v6, "addObject:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[Pipe txMessageQueue](self, "txMessageQueue"));
  v9 = objc_msgSend(v8, "count");

  if (v9 == (id)1)
    -[Pipe sendNextQueuedMessage](self, "sendNextQueuedMessage");

}

- (void)sendNextQueuedMessage
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  char *v7;
  void *v8;
  _BYTE *v9;
  int64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[Pipe txMessageQueue](self, "txMessageQueue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  if (v4)
  {
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "data")));
    v6 = objc_msgSend(v5, "bytes");
    v7 = (char *)objc_msgSend(v4, "offset") + (_QWORD)v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "data"));
    v9 = objc_msgSend(v8, "length");
    v10 = v9 - (_BYTE *)objc_msgSend(v4, "offset");

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[Pipe pipe](self, "pipe"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "output"));
    v13 = (uint64_t)objc_msgSend(v12, "write:maxLength:", v7, v10);

    if (v13 < 1)
    {
      if (v13 < 0)
      {
        v18 = (void *)qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
          sub_10006D8AC(v18, self);
      }
    }
    else
    {
      objc_msgSend(v4, "setOffset:", (char *)objc_msgSend(v4, "offset") + v13);
      v14 = objc_msgSend(v4, "offset");
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "data"));
      v16 = objc_msgSend(v15, "length");

      if (v14 >= v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[Pipe txMessageQueue](self, "txMessageQueue"));
        objc_msgSend(v17, "removeObject:", v4);

      }
    }
  }

}

- (void)receiveMessage:(char *)a3 length:(int64_t)a4
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int64_t v11;
  int64_t v12;
  void *v13;
  id v14;
  id WeakRetained;
  void *v16;
  int64_t v17;
  int *v18;
  id v19;
  uint8_t v20[4];
  int v21;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[Pipe receivedMessage](self, "receivedMessage"));
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
  v10 = v9;

  if (a4 < 1)
  {
    v12 = 0;
    v17 = 0;
  }
  else
  {
    v11 = 0;
    v12 = 0;
    v18 = &v21;
    do
    {
      if (a3[v11])
      {
        ++v11;
      }
      else
      {
        objc_msgSend(v10, "appendBytes:length:", &a3[v12], v11 - v12);
        v19 = 0;
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v10, 0, &v19));
        v14 = v19;
        if (v13)
        {
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(WeakRetained, "pipe:didReceiveMessage:", self, v13);

        }
        else
        {
          v16 = (void *)qword_1000C9178;
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
            sub_10006D988(v20, v16, v14, v18);
        }
        -[Pipe setReceivedMessage:](self, "setReceivedMessage:", 0, v18);
        ++v11;
        objc_msgSend(v10, "setLength:", 0);

        v12 = v11;
      }
    }
    while (v11 != a4);
    v17 = a4;
  }
  if (v12 < a4)
  {
    objc_msgSend(v10, "appendBytes:length:", &a3[v12], v17 - v12);
    -[Pipe setReceivedMessage:](self, "setReceivedMessage:", v10);
  }

}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  _OWORD v11[16];

  v6 = a3;
  v7 = v6;
  switch(a4)
  {
    case 0x10uLL:
      v9 = qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "End of stream found", (uint8_t *)v11, 2u);
      }
      break;
    case 4uLL:
      -[Pipe sendNextQueuedMessage](self, "sendNextQueuedMessage");
      break;
    case 2uLL:
      memset(v11, 0, sizeof(v11));
      v8 = objc_msgSend(v6, "read:maxLength:", v11, 256);
      if (v8)
      {
        -[Pipe receiveMessage:length:](self, "receiveMessage:length:", v11, v8);
      }
      else
      {
        v10 = (void *)qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
          sub_10006DA08(v10, self);
      }
      break;
  }

}

- (PipeDelegate)delegate
{
  return (PipeDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CBScalablePipe)pipe
{
  return self->_pipe;
}

- (NSSet)supportedCommands
{
  return self->_supportedCommands;
}

- (void)setSupportedCommands:(id)a3
{
  objc_storeStrong((id *)&self->_supportedCommands, a3);
}

- (NSMutableArray)txMessageQueue
{
  return self->_txMessageQueue;
}

- (void)setTxMessageQueue:(id)a3
{
  objc_storeStrong((id *)&self->_txMessageQueue, a3);
}

- (NSMutableData)receivedMessage
{
  return self->_receivedMessage;
}

- (void)setReceivedMessage:(id)a3
{
  objc_storeStrong((id *)&self->_receivedMessage, a3);
}

- (NSMutableData)incomingBuffer
{
  return self->_incomingBuffer;
}

- (void)setIncomingBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_incomingBuffer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incomingBuffer, 0);
  objc_storeStrong((id *)&self->_receivedMessage, 0);
  objc_storeStrong((id *)&self->_txMessageQueue, 0);
  objc_storeStrong((id *)&self->_supportedCommands, 0);
  objc_storeStrong((id *)&self->_pipe, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

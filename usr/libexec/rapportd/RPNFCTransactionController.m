@implementation RPNFCTransactionController

- (RPNFCTransactionController)initWithPreferredPollingType:(int64_t)a3 dispatchQueue:(id)a4
{
  id v7;
  RPNFCTransactionController *v8;
  objc_super v10;

  v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)RPNFCTransactionController;
  v8 = -[RPNFCTransactionController init](&v10, "init");
  if (v8)
  {
    if (dword_1001312B8 <= 30
      && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
    {
      LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController initWithPreferredPollingType:dispatchQueue:]", 30, "init with preferred polling type:%d\n", a3);
    }
    v8->_preferredPollingType = a3;
    objc_storeStrong((id *)&v8->_dispatchQueue, a4);
    v8->_receiverState = 0;
    v8->_initiatorState = 0;
  }

  return v8;
}

- (void)setPreferredPollingType:(int64_t)a3
{
  if (self->_preferredPollingType != a3)
  {
    self->_preferredPollingType = a3;
    -[RPNFCTransactionController _updatePolling](self, "_updatePolling");
  }
}

- (void)_updatePolling
{
  if (-[RPNFCTransactionController isRunning](self, "isRunning"))
  {
    if (dword_1001312B8 <= 30
      && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
    {
      LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController _updatePolling]", 30, "update polling for type:%d\n", -[RPNFCTransactionController preferredPollingType](self, "preferredPollingType"));
    }
    -[RPNFCTransactionController _finishCurrentTransactionWithError:](self, "_finishCurrentTransactionWithError:", 0);
    -[RPNFCTransactionController _startReceiver](self, "_startReceiver");
    if ((id)-[RPNFCTransactionController preferredPollingType](self, "preferredPollingType") == (id)2)
      -[RPNFCTransactionController _startInitiator](self, "_startInitiator");
    else
      -[RPNFCTransactionController _stopInitiator](self, "_stopInitiator");
  }
}

- (void)setInitiatorState:(int64_t)a3
{
  const __CFString *v4;

  if (self->_initiatorState != a3)
  {
    self->_initiatorState = a3;
    if (dword_1001312B8 <= 30
      && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
    {
      v4 = CFSTR("Stopped");
      if (a3 == 1)
        v4 = CFSTR("Started");
      if (a3 == 2)
        v4 = CFSTR("Stopping");
      LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController setInitiatorState:]", 30, "initiator state changed:%@\n", v4);
    }
  }
}

- (void)setReceiverState:(int64_t)a3
{
  const __CFString *v4;

  if (self->_receiverState != a3)
  {
    self->_receiverState = a3;
    if (dword_1001312B8 <= 30
      && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
    {
      v4 = CFSTR("Stopped");
      if (a3 == 1)
        v4 = CFSTR("Started");
      if (a3 == 2)
        v4 = CFSTR("Stopping");
      LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController setReceiverState:]", 30, "receiver state changed:%@\n", v4);
    }
  }
}

- (void)start
{
  if (!-[RPNFCTransactionController isRunning](self, "isRunning"))
  {
    -[RPNFCTransactionController setIsRunning:](self, "setIsRunning:", 1);
    if (dword_1001312B8 <= 30
      && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
    {
      LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController start]", 30, "start\n");
    }
    -[RPNFCTransactionController _updatePolling](self, "_updatePolling");
  }
}

- (void)stop
{
  if (-[RPNFCTransactionController isRunning](self, "isRunning"))
  {
    -[RPNFCTransactionController setIsRunning:](self, "setIsRunning:", 0);
    if (dword_1001312B8 <= 30
      && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
    {
      LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController stop]", 30, "stop\n");
    }
    -[RPNFCTransactionController _stopInitiator](self, "_stopInitiator");
    -[RPNFCTransactionController _stopReceiver](self, "_stopReceiver");
    -[RPNFCTransactionController _stopTimers](self, "_stopTimers");
    -[RPNFCTransactionController _finishCurrentTransactionWithError:](self, "_finishCurrentTransactionWithError:", 0);
  }
}

- (void)invalidateTransaction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (dword_1001312B8 <= 30 && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
    LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController invalidateTransaction:]", 30, "invalidate transaction:%@\n", v4);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController currentTransaction](self, "currentTransaction"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController currentTransaction](self, "currentTransaction"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if ((v9 & 1) != 0)
    {
      -[RPNFCTransactionController _finishCurrentTransactionWithError:](self, "_finishCurrentTransactionWithError:", 0);
    }
    else if (dword_1001312B8 <= 90
           && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 90)))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController currentTransaction](self, "currentTransaction"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
      LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController invalidateTransaction:]", 90, "failed to invalidate current transaction:%@ - mismatching\n", v11);

    }
  }

}

- (void)_startInitiator
{
  NFConnectionHandoverInitiator *initiator;
  id v4;
  NFConnectionHandoverInitiator *v5;
  NFConnectionHandoverInitiator *v6;

  if (dword_1001312B8 <= 30 && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
    LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController _startInitiator]", 30, "request to start initiator\n");
  if ((id)-[RPNFCTransactionController initiatorState](self, "initiatorState") == (id)1)
  {
    if (dword_1001312B8 <= 30
      && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
    {
      LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController _startInitiator]", 30, "initiator already started.\n");
    }
  }
  else if ((id)-[RPNFCTransactionController initiatorState](self, "initiatorState") == (id)2)
  {
    if (dword_1001312B8 <= 30
      && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
    {
      LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController _startInitiator]", 30, "waiting for previous initiator to complete stopping before re-starting it.\n");
    }
    -[RPNFCTransactionController setPendingInitiator:](self, "setPendingInitiator:", 1);
  }
  else
  {
    -[RPNFCTransactionController setInitiatorState:](self, "setInitiatorState:", 1);
    -[RPNFCTransactionController setPendingInitiator:](self, "setPendingInitiator:", 0);
    initiator = self->_initiator;
    if (!initiator)
    {
      v4 = -[objc_class initiatorWithDelegate:callbackQueue:](off_100131328(), "initiatorWithDelegate:callbackQueue:", self, self->_dispatchQueue);
      v5 = (NFConnectionHandoverInitiator *)objc_claimAutoreleasedReturnValue(v4);
      v6 = self->_initiator;
      self->_initiator = v5;

      initiator = self->_initiator;
    }
    -[NFConnectionHandoverInitiator setDelegate:](initiator, "setDelegate:", self);
    -[NFConnectionHandoverInitiator start](self->_initiator, "start");
    -[RPNFCTransactionController _startInitiatorLimitTimer](self, "_startInitiatorLimitTimer");
    if (!-[RPNFCTransactionController preferredPollingType](self, "preferredPollingType"))
      -[RPNFCTransactionController _startConnectToReceiverTimer](self, "_startConnectToReceiverTimer");
  }
}

- (void)_stopInitiator
{
  if ((id)-[RPNFCTransactionController initiatorState](self, "initiatorState") == (id)1)
  {
    if (dword_1001312B8 <= 30
      && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
    {
      LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController _stopInitiator]", 30, "stop initiator\n");
    }
    -[NFConnectionHandoverInitiator stop](self->_initiator, "stop");
    -[RPNFCTransactionController setInitiatorState:](self, "setInitiatorState:", 2);
    -[RPNFCTransactionController _stopInitiatorLimitTimer](self, "_stopInitiatorLimitTimer");
  }
  -[RPNFCTransactionController setPendingInitiator:](self, "setPendingInitiator:", 0);
}

- (void)_startReceiver
{
  NFConnectionHandoverReceiver *receiver;
  id v4;
  NFConnectionHandoverReceiver *v5;
  NFConnectionHandoverReceiver *v6;

  if (dword_1001312B8 <= 30 && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
    LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController _startReceiver]", 30, "start receiver\n");
  if ((id)-[RPNFCTransactionController receiverState](self, "receiverState") == (id)1)
  {
    if (dword_1001312B8 <= 30
      && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
    {
      LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController _startReceiver]", 30, "receiver already started.\n");
    }
  }
  else if ((id)-[RPNFCTransactionController receiverState](self, "receiverState") == (id)2)
  {
    if (dword_1001312B8 <= 30
      && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
    {
      LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController _startReceiver]", 30, "waiting for previous receiver to complete stopping before re-starting it.\n");
    }
    -[RPNFCTransactionController setPendingReceiver:](self, "setPendingReceiver:", 1);
  }
  else
  {
    -[RPNFCTransactionController setReceiverState:](self, "setReceiverState:", 1);
    -[RPNFCTransactionController setPendingReceiver:](self, "setPendingReceiver:", 0);
    receiver = self->_receiver;
    if (!receiver)
    {
      v4 = -[objc_class receiverWithDelegate:callbackQueue:](off_100131330(), "receiverWithDelegate:callbackQueue:", self, self->_dispatchQueue);
      v5 = (NFConnectionHandoverReceiver *)objc_claimAutoreleasedReturnValue(v4);
      v6 = self->_receiver;
      self->_receiver = v5;

      receiver = self->_receiver;
    }
    -[NFConnectionHandoverReceiver setDelegate:](receiver, "setDelegate:", self);
    -[NFConnectionHandoverReceiver start](self->_receiver, "start");
  }
}

- (void)_stopReceiver
{
  if ((id)-[RPNFCTransactionController receiverState](self, "receiverState") == (id)1)
  {
    if (dword_1001312B8 <= 30
      && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
    {
      LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController _stopReceiver]", 30, "stop receiver\n");
    }
    -[NFConnectionHandoverReceiver stop](self->_receiver, "stop");
    -[RPNFCTransactionController setReceiverState:](self, "setReceiverState:", 2);
  }
  -[RPNFCTransactionController setPendingReceiver:](self, "setPendingReceiver:", 0);
}

- (void)_stopTimers
{
  -[RPNFCTransactionController _stopPollingCoolDownTimer](self, "_stopPollingCoolDownTimer");
  -[RPNFCTransactionController _stopInitiatorLimitTimer](self, "_stopInitiatorLimitTimer");
  -[RPNFCTransactionController _stopConnectToReceiverTimer](self, "_stopConnectToReceiverTimer");
  -[RPNFCTransactionController _stopBecomeInitiatorTimer](self, "_stopBecomeInitiatorTimer");
}

- (id)_createOneShotTimerWithInterval:(double)a3 completionHandler:(id)a4
{
  NSObject *dispatchQueue;
  id v7;
  NSObject *v8;

  dispatchQueue = self->_dispatchQueue;
  v7 = a4;
  dispatch_assert_queue_V2(dispatchQueue);
  v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  dispatch_source_set_event_handler(v8, v7);

  CUDispatchTimerSet(v8, a3, -1.0, 0.0);
  return v8;
}

- (void)_startPollingCoolDownTimer
{
  NSObject *v3;
  _QWORD v4[5];

  -[RPNFCTransactionController _stopPollingCoolDownTimer](self, "_stopPollingCoolDownTimer");
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100072374;
  v4[3] = &unk_1001110F8;
  v4[4] = self;
  v3 = objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController _createOneShotTimerWithInterval:completionHandler:](self, "_createOneShotTimerWithInterval:completionHandler:", v4, 10.0));
  -[RPNFCTransactionController setPollingCoolDownTimer:](self, "setPollingCoolDownTimer:", v3);
  dispatch_activate(v3);

}

- (void)_stopPollingCoolDownTimer
{
  void *v3;
  OS_dispatch_source *pollingCoolDownTimer;
  NSObject *v5;
  OS_dispatch_source *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController pollingCoolDownTimer](self, "pollingCoolDownTimer"));

  if (v3)
  {
    if (dword_1001312B8 <= 30
      && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
    {
      LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController _stopPollingCoolDownTimer]", 30, "stop timer for polling cool down\n");
    }
    pollingCoolDownTimer = self->_pollingCoolDownTimer;
    if (pollingCoolDownTimer)
    {
      v5 = pollingCoolDownTimer;
      dispatch_source_cancel(v5);
      v6 = self->_pollingCoolDownTimer;
      self->_pollingCoolDownTimer = 0;

    }
    -[RPNFCTransactionController setPollingCoolDownTimer:](self, "setPollingCoolDownTimer:", 0);
  }
}

- (void)_startConnectToReceiverTimer
{
  double v3;
  NSObject *v4;
  _QWORD v5[5];

  -[RPNFCTransactionController _stopConnectToReceiverTimer](self, "_stopConnectToReceiverTimer");
  v3 = (double)(arc4random_uniform(3u) + 3);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000725A8;
  v5[3] = &unk_1001110F8;
  v5[4] = self;
  v4 = objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController _createOneShotTimerWithInterval:completionHandler:](self, "_createOneShotTimerWithInterval:completionHandler:", v5, v3));
  -[RPNFCTransactionController setConnectToReceiverTimer:](self, "setConnectToReceiverTimer:", v4);
  dispatch_activate(v4);
  if (dword_1001312B8 <= 30 && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
    LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController _startConnectToReceiverTimer]", 30, "start timer to connect with the receiver:%f\n", v3);

}

- (void)_stopConnectToReceiverTimer
{
  void *v3;
  OS_dispatch_source *connectToReceiverTimer;
  NSObject *v5;
  OS_dispatch_source *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController connectToReceiverTimer](self, "connectToReceiverTimer"));

  if (v3)
  {
    if (dword_1001312B8 <= 30
      && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
    {
      LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController _stopConnectToReceiverTimer]", 30, "stop timer to connect with the receiver\n");
    }
    connectToReceiverTimer = self->_connectToReceiverTimer;
    if (connectToReceiverTimer)
    {
      v5 = connectToReceiverTimer;
      dispatch_source_cancel(v5);
      v6 = self->_connectToReceiverTimer;
      self->_connectToReceiverTimer = 0;

    }
    -[RPNFCTransactionController setConnectToReceiverTimer:](self, "setConnectToReceiverTimer:", 0);
  }
}

- (void)_startInitiatorLimitTimer
{
  NSObject *v3;
  _QWORD v4[5];

  -[RPNFCTransactionController _stopInitiatorLimitTimer](self, "_stopInitiatorLimitTimer");
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000727A0;
  v4[3] = &unk_1001110F8;
  v4[4] = self;
  v3 = objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController _createOneShotTimerWithInterval:completionHandler:](self, "_createOneShotTimerWithInterval:completionHandler:", v4, 60.0));
  -[RPNFCTransactionController setInitiatorLimitTimer:](self, "setInitiatorLimitTimer:", v3);
  dispatch_activate(v3);

}

- (void)_stopInitiatorLimitTimer
{
  void *v3;
  OS_dispatch_source *initiatorLimitTimer;
  NSObject *v5;
  OS_dispatch_source *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController initiatorLimitTimer](self, "initiatorLimitTimer"));

  if (v3)
  {
    initiatorLimitTimer = self->_initiatorLimitTimer;
    if (initiatorLimitTimer)
    {
      v5 = initiatorLimitTimer;
      dispatch_source_cancel(v5);
      v6 = self->_initiatorLimitTimer;
      self->_initiatorLimitTimer = 0;

    }
    -[RPNFCTransactionController setInitiatorLimitTimer:](self, "setInitiatorLimitTimer:", 0);
  }
}

- (void)_startBecomeInitiatorTimer
{
  NSObject *v3;
  _QWORD v4[5];

  -[RPNFCTransactionController _stopBecomeInitiatorTimer](self, "_stopBecomeInitiatorTimer");
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007291C;
  v4[3] = &unk_1001110F8;
  v4[4] = self;
  v3 = objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController _createOneShotTimerWithInterval:completionHandler:](self, "_createOneShotTimerWithInterval:completionHandler:", v4, 0.7));
  -[RPNFCTransactionController setBecomeInitiatorTimer:](self, "setBecomeInitiatorTimer:", v3);
  dispatch_activate(v3);

}

- (void)_stopBecomeInitiatorTimer
{
  void *v3;
  OS_dispatch_source *becomeInitiatorTimer;
  NSObject *v5;
  OS_dispatch_source *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController becomeInitiatorTimer](self, "becomeInitiatorTimer"));

  if (v3)
  {
    becomeInitiatorTimer = self->_becomeInitiatorTimer;
    if (becomeInitiatorTimer)
    {
      v5 = becomeInitiatorTimer;
      dispatch_source_cancel(v5);
      v6 = self->_becomeInitiatorTimer;
      self->_becomeInitiatorTimer = 0;

    }
    -[RPNFCTransactionController setBecomeInitiatorTimer:](self, "setBecomeInitiatorTimer:", 0);
  }
}

- (void)_beginTransactionForRole:(int64_t)a3
{
  void *v5;
  RPNFCTransaction *v6;
  void *v7;
  id v8;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1001312B8 <= 30 && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
    LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController _beginTransactionForRole:]", 30, "begin new transaction for role:%lld\n", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController currentTransaction](self, "currentTransaction"));

  if (v5)
  {
    if (dword_1001312B8 <= 90
      && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 90)))
    {
      LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController _beginTransactionForRole:]", 90, "begin new transaction while we already have an existing transaction.\n", a3);
    }
    -[RPNFCTransactionController _finishCurrentTransactionWithError:](self, "_finishCurrentTransactionWithError:", 0);
  }
  v6 = -[RPNFCTransaction initWithRole:]([RPNFCTransaction alloc], "initWithRole:", a3);
  -[RPNFCTransactionController setCurrentTransaction:](self, "setCurrentTransaction:", v6);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController delegate](self, "delegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController currentTransaction](self, "currentTransaction"));
  objc_msgSend(v8, "transactionController:didBeginTransaction:", self, v7);

}

- (void)_finishCurrentTransactionWithError:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController currentTransaction](self, "currentTransaction"));

  if (v4)
  {
    -[RPNFCTransactionController _stopInitiator](self, "_stopInitiator");
    if (dword_1001312B8 <= 30
      && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController currentTransaction](self, "currentTransaction"));
      LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController _finishCurrentTransactionWithError:]", 30, "finish current transaction:%@ error:%@\n", v5, v8);

    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController currentTransaction](self, "currentTransaction"));
    objc_msgSend(v6, "setError:", v8);
    -[RPNFCTransactionController setCurrentTransaction:](self, "setCurrentTransaction:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController delegate](self, "delegate"));
    objc_msgSend(v7, "transactionController:didFinishTransaction:error:", self, v6, v8);

    -[RPNFCTransactionController _updatePolling](self, "_updatePolling");
  }

}

- (BOOL)_didReceiveAuthenticationResponseWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v19;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1001312B8 <= 30 && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
    LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController _didReceiveAuthenticationResponseWithResult:error:]", 30, "did receive authentication response with result:%@ error:%@\n", v6, v7);
  if (v7)
  {
    -[RPNFCTransactionController _finishCurrentTransactionWithError:](self, "_finishCurrentTransactionWithError:", v7);
    v8 = 0;
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[RPTransportServiceHandoverMessage messageWithConnectionHandoverSelect:](RPTransportServiceHandoverMessage, "messageWithConnectionHandoverSelect:", v6));
    v8 = v15 != 0;
    if (v15)
    {
      -[RPNFCTransactionController _didReceiveAuthenticationMessage:](self, "_didReceiveAuthenticationMessage:", v15);
    }
    else
    {
      if (dword_1001312B8 <= 90
        && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 90)))
      {
        LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController _didReceiveAuthenticationResponseWithResult:error:]", 90, "failed decoding incoming handover select\n");
      }
      v16 = RPErrorF(4294960579, (uint64_t)"Unexpected Connection handover select message", v9, v10, v11, v12, v13, v14, v19);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      -[RPNFCTransactionController _finishCurrentTransactionWithError:](self, "_finishCurrentTransactionWithError:", v17);

    }
  }

  return v8;
}

- (void)_didReceiveAuthenticationMessage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "payload"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resolveIdentityForNearFieldMessagePayload:", v5));

  if (dword_1001312B8 <= 30 && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
    LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController _didReceiveAuthenticationMessage:]", 30, "did receive authentication message:%@ with resolved identity:%@\n", v9, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController currentTransaction](self, "currentTransaction"));
  objc_msgSend(v7, "setRemoteIdentity:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController currentTransaction](self, "currentTransaction"));
  objc_msgSend(v8, "setRemoteAuthenticationMessage:", v9);

}

- (BOOL)_didReceiveValidationResponseWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v18;
  void *v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1001312B8 <= 30 && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
    LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController _didReceiveValidationResponseWithResult:error:]", 30, "did receive validation response with result:%@ error:%@\n", v6, v7);
  v8 = v7 == 0;
  if (v7)
    goto LABEL_8;
  v9 = objc_claimAutoreleasedReturnValue(+[RPTransportServiceHandoverMessage messageWithConnectionHandoverSelect:](RPTransportServiceHandoverMessage, "messageWithConnectionHandoverSelect:", v6));
  if (v9)
  {
    v16 = (void *)v9;
    -[RPNFCTransactionController _didReceiveValidationMessage:](self, "_didReceiveValidationMessage:", v9);

LABEL_8:
    -[RPNFCTransactionController _finishCurrentTransactionWithError:](self, "_finishCurrentTransactionWithError:", v7);
    goto LABEL_9;
  }
  if (dword_1001312B8 <= 90 && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 90)))
    LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController _didReceiveValidationResponseWithResult:error:]", 90, "failed decoding incoming handover select\n");
  v18 = RPErrorF(4294960579, (uint64_t)"Unexpected Connection handover select message", v10, v11, v12, v13, v14, v15, v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  -[RPNFCTransactionController _finishCurrentTransactionWithError:](self, "_finishCurrentTransactionWithError:", v19);

  v8 = 0;
LABEL_9:

  return v8;
}

- (void)_didReceiveValidationMessage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (dword_1001312B8 <= 30 && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
    LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController _didReceiveValidationMessage:]", 30, "did receive validation message:%@\n", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController currentTransaction](self, "currentTransaction"));
  objc_msgSend(v4, "setRemoteValidationMessage:", v8);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "applicationLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController _createTapEventForApplicationLabel:](self, "_createTapEventForApplicationLabel:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController currentTransaction](self, "currentTransaction"));
  objc_msgSend(v7, "setTapEvent:", v6);

}

- (id)_createTapEventForApplicationLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController currentTransaction](self, "currentTransaction"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteAuthenticationMessage"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "payload"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController currentTransaction](self, "currentTransaction"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "remoteValidationMessage"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "payload"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transportServicesMetadata"));
  v12 = sub_1000507D4(v11);

  if (v10 && !objc_msgSend(v10, "isKnownIdentity"))
  {
    v14 = 0;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController currentTransaction](self, "currentTransaction"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "remoteIdentity"));

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController dataSource](self, "dataSource"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pkData"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bonjourListenerUUID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "transactionController:tapEventForApplicationLabel:singleBandAWDLModeRequested:pkData:bonjourListenerUUID:identity:", self, v4, v12, v16, v17, v14));

  return v18;
}

- (void)controller:(id)a3 didReceiveField:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _BOOL8 v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  unsigned int v16;
  id v17;

  v17 = a3;
  v6 = a4;
  if (dword_1001312B8 <= 30 && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
    LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController controller:didReceiveField:]", 30, "did receive field notification:%@\n", v6);
  if (objc_msgSend(v17, "initiator"))
  {
    if (objc_msgSend(v6, "chFieldType") == (id)4)
    {
      if (dword_1001312B8 <= 30
        && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
      {
        LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController controller:didReceiveField:]", 30, "field info: initiator detected an other initiator in the field");
      }
      -[RPNFCTransactionController _stopInitiator](self, "_stopInitiator");
    }
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController currentTransaction](self, "currentTransaction"));

    if (!v7)
    {
      v8 = objc_msgSend(v6, "chFieldType");
      v9 = v8;
      v11 = v8 == (id)2 || v8 == (id)4;
      if ((id)-[RPNFCTransactionController preferredPollingType](self, "preferredPollingType") == (id)1)
      {
LABEL_18:
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController delegate](self, "delegate"));
        objc_msgSend(v12, "transactionController:didDetectDeviceNearbyWithInitiatorRole:", self, v11);

      }
      else
      {
        switch((unint64_t)v9)
        {
          case 1uLL:
            if (dword_1001312B8 <= 60
              && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 60)))
            {
              LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController controller:didReceiveField:]", 60, "unknown CH field type. Ignoring it");
            }
            break;
          case 2uLL:
            if (dword_1001312B8 <= 30
              && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
            {
              LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController controller:didReceiveField:]", 30, "field info: auto-negotiation initiator detected");
            }
            -[RPNFCTransactionController _stopInitiator](self, "_stopInitiator");
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController receiver](self, "receiver"));
            v14 = objc_msgSend(v13, "roleBroadcastInBackground");

            if (!v14)
              break;
            -[RPNFCTransactionController _startBecomeInitiatorTimer](self, "_startBecomeInitiatorTimer");
            goto LABEL_18;
          case 3uLL:
            if (dword_1001312B8 <= 30
              && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
            {
              LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController controller:didReceiveField:]", 30, "field info: auto-negotiation receiver detected");
            }
            goto LABEL_48;
          case 4uLL:
            if (dword_1001312B8 <= 30
              && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
            {
              LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController controller:didReceiveField:]", 30, "field info: initiator polling detected");
            }
            -[RPNFCTransactionController _stopInitiator](self, "_stopInitiator");
            goto LABEL_18;
          case 5uLL:
            if (dword_1001312B8 <= 30
              && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
            {
              LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController controller:didReceiveField:]", 30, "field info: request to start initiator");
            }
LABEL_48:
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController receiver](self, "receiver"));
            v16 = objc_msgSend(v15, "roleBroadcastInBackground");

            if (v16)
            {
              -[RPNFCTransactionController _startInitiator](self, "_startInitiator");
              goto LABEL_18;
            }
            if (dword_1001312B8 <= 90
              && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 90)))
            {
              LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController controller:didReceiveField:]", 90, "skipping field notification: this device can't start initiator");
            }
            break;
          default:
            goto LABEL_18;
        }
      }
    }
  }

}

- (void)controller:(id)a3 didInvalidate:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  v7 = objc_msgSend(v16, "initiator");
  if (dword_1001312B8 <= 30 && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
  {
    v8 = NSStringFromBOOL(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController controller:didInvalidate:]", 30, "did invalidate controller:%@ isInitiator:%@ error:%@\n", v16, v9, v6);

  }
  if ((_DWORD)v7)
  {
    -[RPNFCTransactionController setInitiatorState:](self, "setInitiatorState:", 0);
    -[RPNFCTransactionController _stopConnectToReceiverTimer](self, "_stopConnectToReceiverTimer");
    -[RPNFCTransactionController _stopInitiatorLimitTimer](self, "_stopInitiatorLimitTimer");
    if (v6)
      goto LABEL_7;
LABEL_22:
    if (dword_1001312B8 <= 30
      && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
    {
      v12 = NSStringFromBOOL(-[RPNFCTransactionController pendingReceiver](self, "pendingReceiver"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14 = NSStringFromBOOL(-[RPNFCTransactionController pendingInitiator](self, "pendingInitiator"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController controller:didInvalidate:]", 30, "pendingReceiver:%@ pendingInitiator:%@\n", v13, v15);

    }
    if (-[RPNFCTransactionController pendingReceiver](self, "pendingReceiver")
      || -[RPNFCTransactionController pendingInitiator](self, "pendingInitiator"))
    {
      -[RPNFCTransactionController _updatePolling](self, "_updatePolling");
    }
    goto LABEL_33;
  }
  v10 = (id)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController receiver](self, "receiver"));

  if (v10 != v16)
  {
    if (dword_1001312B8 <= 90
      && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 90)))
    {
      LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController controller:didInvalidate:]", 90, "### Received invalidation from unexpected controller:%@", v16);
    }
    goto LABEL_33;
  }
  -[RPNFCTransactionController setReceiverState:](self, "setReceiverState:", 0);
  -[RPNFCTransactionController _stopBecomeInitiatorTimer](self, "_stopBecomeInitiatorTimer");
  if (!v6)
    goto LABEL_22;
LABEL_7:
  if (objc_msgSend(v6, "code") == (id)57)
  {
    if (dword_1001312B8 <= 90
      && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 90)))
    {
      LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController controller:didInvalidate:]", 90, "### Failing to start controller:%@ error:%@", v16, v6);
    }
LABEL_32:
    -[RPNFCTransactionController stop](self, "stop");
    goto LABEL_33;
  }
  if (objc_msgSend(v6, "code") != (id)67 && objc_msgSend(v6, "code") != (id)68)
  {
    -[RPNFCTransactionController _finishCurrentTransactionWithError:](self, "_finishCurrentTransactionWithError:", v6);
    if (objc_msgSend(v6, "code") != (id)50 && objc_msgSend(v6, "code") != (id)47)
    {
      v11 = objc_msgSend(v6, "code");
      if (v11 != (id)44)
      {
        if (dword_1001312B8 <= 90)
        {
          if (dword_1001312B8 != -1 || (v11 = (id)_LogCategory_Initialize(&dword_1001312B8, 90), (_DWORD)v11))
            v11 = (id)LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController controller:didInvalidate:]", 90, "### Failing to start controller:%@ error:%@", v16, v6);
        }
        if (IsAppleInternalBuild(v11))
          -[RPNFCTransactionController _fileTTRForError:](self, "_fileTTRForError:", v6);
        goto LABEL_32;
      }
    }
    -[RPNFCTransactionController _startPollingCoolDownTimer](self, "_startPollingCoolDownTimer");
  }
LABEL_33:

}

- (void)controllerDidDetectUnsupportedReceiverVersion:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  if (dword_1001312B8 <= 30 && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
    LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController controllerDidDetectUnsupportedReceiverVersion:]", 30, "did detect unsupported receiver");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController currentTransaction](self, "currentTransaction"));
  v5 = objc_msgSend(v4, "role");

  if (v5 == (id)1)
  {
    -[RPNFCTransactionController _stopInitiator](self, "_stopInitiator");
    -[RPNFCTransactionController _finishCurrentTransactionWithError:](self, "_finishCurrentTransactionWithError:", 0);
  }

}

- (void)controllerDidConnectToReceiver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  if ((id)-[RPNFCTransactionController initiatorState](self, "initiatorState") == (id)1)
  {
    -[RPNFCTransactionController _stopConnectToReceiverTimer](self, "_stopConnectToReceiverTimer");
    if (dword_1001312B8 <= 30
      && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
    {
      LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController controllerDidConnectToReceiver:]", 30, "did connect to receiver\n");
    }
    -[RPNFCTransactionController _beginTransactionForRole:](self, "_beginTransactionForRole:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController dataSource](self, "dataSource"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transactionController:requestMessageForType:", self, 1));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController currentTransaction](self, "currentTransaction"));
      objc_msgSend(v7, "setLocalAuthenticationMessage:", v6);

      if (dword_1001312B8 <= 30
        && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
      {
        LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController controllerDidConnectToReceiver:]", 30, "send authentication request to receiver::%@\n", v6);
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "connectionHandoverRequest"));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100073D34;
      v10[3] = &unk_100113828;
      v10[4] = self;
      v11 = v4;
      objc_msgSend(v11, "sendHandoverRequest:responseHandler:", v8, v10);

    }
    else
    {
      if (dword_1001312B8 <= 90
        && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 90)))
      {
        LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController controllerDidConnectToReceiver:]", 90, "error: authentication request message is nil.");
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("RPNFCTransactionControllerErrorDomain"), 2, 0));
      -[RPNFCTransactionController _finishCurrentTransactionWithError:](self, "_finishCurrentTransactionWithError:", v9);

    }
  }

}

- (void)controllerDidDetectUnsupportedInitiatorVersion:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (dword_1001312B8 <= 30
    && ((v6 = v3, dword_1001312B8 != -1) || (v5 = _LogCategory_Initialize(&dword_1001312B8, 30), v4 = v6, v5)))
  {
    LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController controllerDidDetectUnsupportedInitiatorVersion:]", 30, "did detect unsupported initiator.");

  }
  else
  {

  }
}

- (void)didConnectedToInitiator:(id)a3
{
  if ((id)-[RPNFCTransactionController receiverState](self, "receiverState", a3) == (id)1)
  {
    if (dword_1001312B8 <= 30
      && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
    {
      LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController didConnectedToInitiator:]", 30, "did connect to initiator\n");
    }
    -[RPNFCTransactionController _stopBecomeInitiatorTimer](self, "_stopBecomeInitiatorTimer");
    -[RPNFCTransactionController _stopInitiator](self, "_stopInitiator");
    -[RPNFCTransactionController _beginTransactionForRole:](self, "_beginTransactionForRole:", 2);
  }
}

- (void)didDisconnectedFromInitiator:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  if (dword_1001312B8 <= 30 && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
    LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController didDisconnectedFromInitiator:]", 30, "did disconnect from initiator\n");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController currentTransaction](self, "currentTransaction"));
  v5 = objc_msgSend(v4, "role");

  if (v5 == (id)2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController currentTransaction](self, "currentTransaction"));
    v7 = objc_msgSend(v6, "state");

    if (v7 == (id)2)
      v8 = 0;
    else
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("RPNFCTransactionControllerErrorDomain"), 0, 0));
    -[RPNFCTransactionController _finishCurrentTransactionWithError:](self, "_finishCurrentTransactionWithError:", v8);

  }
}

- (void)controller:(id)a3 didReceiveRequest:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  BOOL v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  BOOL v43;
  _QWORD v44[5];
  id v45;
  BOOL v46;
  id v47;

  v6 = a3;
  v7 = a4;
  if (dword_1001312B8 <= 30 && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
    LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController controller:didReceiveRequest:]", 30, "did receive request from initiator:%@", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[RPTransportServiceHandoverMessage messageWithConnectionHandoverRequest:](RPTransportServiceHandoverMessage, "messageWithConnectionHandoverRequest:", v7));
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController dataSource](self, "dataSource"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "transactionController:responseMessageForRequestMessage:", self, v14));

    if (!v16)
    {
      if (dword_1001312B8 <= 90
        && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 90)))
      {
        LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController controller:didReceiveRequest:]", 90, "error: response for request message is nil: %@", v14);
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("RPNFCTransactionControllerErrorDomain"), 2, 0));
      -[RPNFCTransactionController _finishCurrentTransactionWithError:](self, "_finishCurrentTransactionWithError:", v17);
      goto LABEL_64;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "connectionHandoverSelect"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "payload"));
    v19 = objc_msgSend(v18, "type");

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "payload"));
      v21 = objc_msgSend(v20, "type");

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController currentTransaction](self, "currentTransaction"));
      v23 = v22;
      v24 = v21 == (id)1;
      if (v21 == (id)1)
      {
        objc_msgSend(v22, "setLocalAuthenticationMessage:", v16);
        v25 = 0.0;
        goto LABEL_59;
      }
      objc_msgSend(v22, "setLocalValidationMessage:", v16);

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController currentTransaction](self, "currentTransaction"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "remoteAuthenticationMessage"));

      if (v27)
      {
        v43 = v24;
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "payload"));
        if (objc_msgSend(v23, "isKnownIdentity")
          && (v28 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController currentTransaction](self, "currentTransaction")),
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "remoteIdentity")),
              v28,
              v29))
        {
          v25 = 0.0;
        }
        else
        {
          v42 = v6;
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController currentTransaction](self, "currentTransaction"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "connectionDate"));
          objc_msgSend(v31, "timeIntervalSinceDate:", v33);
          v35 = v34;

          if (dword_1001312B8 < 31)
          {
            if (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30))
              LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController controller:didReceiveRequest:]", 30, "time interval since NFC connection: %fs", v35);
            v25 = fmax(0.8 - v35, 0.0);
            v6 = v42;
            v24 = v43;
            if (dword_1001312B8 <= 30
              && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
            {
              LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController controller:didReceiveRequest:]", 30, "use delay before sending validation response: %fs", v25);
            }
            v29 = 0;
            goto LABEL_58;
          }
          v29 = 0;
          v25 = fmax(0.8 - v35, 0.0);
          v6 = v42;
        }
        v24 = v43;
LABEL_58:

LABEL_59:
        if (dword_1001312B8 <= 30
          && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
        {
          LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController controller:didReceiveRequest:]", 30, "send handover select to initiator with delay: %fs response: %@", *(_QWORD *)&v25, v16);
        }
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472;
        v44[2] = sub_10007493C;
        v44[3] = &unk_100113850;
        v44[4] = self;
        v46 = v24;
        v45 = v14;
        objc_msgSend(v6, "sendHandoverSelect:delay:completionHandler:", v17, v44, v25);

        goto LABEL_64;
      }
      if (dword_1001312B8 <= 115
        && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 115)))
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController currentTransaction](self, "currentTransaction"));
        LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController controller:didReceiveRequest:]", 115, "validation request received but transaction is missing the authentication request message :%@", v36);

      }
      v37 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("RPNFCTransactionControllerErrorDomain"), 1, 0));
    }
    else
    {
      if (dword_1001312B8 <= 30
        && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
      {
        LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController controller:didReceiveRequest:]", 30, "payload type is unknown. Assuming authentication exchange only and skipping validation payload.");
      }
      -[RPNFCTransactionController _didReceiveAuthenticationMessage:](self, "_didReceiveAuthenticationMessage:", v14);
      if (dword_1001312B8 <= 30
        && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
      {
        LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController controller:didReceiveRequest:]", 30, "send handover select to initiator:%@", v16);
      }
      v47 = 0;
      objc_msgSend(v6, "sendHandoverSelect:error:", v17, &v47);
      v37 = v47;
      if (!v37)
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "applicationLabel"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController _createTapEventForApplicationLabel:](self, "_createTapEventForApplicationLabel:", v38));

        v40 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController currentTransaction](self, "currentTransaction"));
        objc_msgSend(v40, "setTapEvent:", v39);

LABEL_55:
LABEL_64:

        goto LABEL_65;
      }
      if (dword_1001312B8 <= 90
        && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 90)))
      {
        LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController controller:didReceiveRequest:]", 90, "failed to send handover select to initiator:%@", v37);
      }
    }
    -[RPNFCTransactionController _finishCurrentTransactionWithError:](self, "_finishCurrentTransactionWithError:", v37);
    goto LABEL_55;
  }
  if (dword_1001312B8 <= 90 && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 90)))
    LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController controller:didReceiveRequest:]", 90, "failed decoding incoming handover request");
  v30 = RPErrorF(4294960579, (uint64_t)"Unexpected Connection handover select message", v8, v9, v10, v11, v12, v13, v41);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v30);
  -[RPNFCTransactionController _finishCurrentTransactionWithError:](self, "_finishCurrentTransactionWithError:", v16);
LABEL_65:

}

- (void)_requestPowerAssertion
{
  unsigned int v3;
  IOPMAssertionID v4;

  v4 = 0;
  v3 = sub_100050914(&v4);
  -[RPNFCTransactionController _releasePowerAssertion](self, "_releasePowerAssertion");
  -[RPNFCTransactionController setPowerAssertionID:](self, "setPowerAssertionID:", v4);
  if (v3
    && dword_1001312B8 <= 30
    && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
  {
    LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController _requestPowerAssertion]", 30, "Acquired power assertion %d", -[RPNFCTransactionController powerAssertionID](self, "powerAssertionID"));
  }
}

- (void)_releasePowerAssertion
{
  unsigned int v3;

  v3 = -[RPNFCTransactionController powerAssertionID](self, "powerAssertionID");
  if (sub_100050A30((uint64_t)&v3))
  {
    if (dword_1001312B8 <= 30
      && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
    {
      LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController _releasePowerAssertion]", 30, "Released power assertion %d", -[RPNFCTransactionController powerAssertionID](self, "powerAssertionID"));
    }
    -[RPNFCTransactionController setPowerAssertionID:](self, "setPowerAssertionID:", v3);
  }
}

- (void)_fileTTRForError:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[8];

  v3 = a3;
  v4 = objc_alloc_init((Class)NSURLComponents);
  objc_msgSend(v4, "setScheme:", CFSTR("tap-to-radar"));
  objc_msgSend(v4, "setHost:", CFSTR("new"));
  v5 = objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("ComponentID"), CFSTR("800892")));
  v6 = objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("ComponentName"), CFSTR("Rapport")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("ComponentVersion"), CFSTR("All")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("DeviceClasses"), CFSTR("iPhone,Watch")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("Classification"), CFSTR("Serious Bug")));
  v10 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v11 = objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend(v11, "setDateFormat:", CFSTR("yyyy.MM.dd_HH-mm-ss"));
  v22 = v11;
  v24 = (void *)v10;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringFromDate:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("TimeOfIssue")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failing to start NFC controller with error:%@"), v3));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("Title"), CFSTR("Unexpected error when starting NFC controller")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("Description"), v13));
  v25 = (void *)v6;
  v26 = (void *)v5;
  v29[0] = v5;
  v29[1] = v6;
  v29[2] = v7;
  v29[3] = v8;
  v29[4] = v9;
  v29[5] = v12;
  v29[6] = v14;
  v29[7] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 8));
  objc_msgSend(v4, "setQueryItems:", v16);

  if (dword_1001312B8 <= 90 && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 90)))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));
    LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController _fileTTRForError:]", 90, "### Filing tap to radar url: %@", v17);

  }
  v18 = -[objc_class defaultWorkspace](off_100131338(), "defaultWorkspace");
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100074ED0;
  v27[3] = &unk_100111148;
  v28 = v4;
  v21 = v4;
  objc_msgSend(v19, "openURL:configuration:completionHandler:", v20, 0, v27);

}

- (int64_t)preferredPollingType
{
  return self->_preferredPollingType;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (RPNFCTransactionControllerDataSource)dataSource
{
  return (RPNFCTransactionControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (RPNFCTransactionControllerDelegate)delegate
{
  return (RPNFCTransactionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (NFConnectionHandoverInitiator)initiator
{
  return self->_initiator;
}

- (void)setInitiator:(id)a3
{
  objc_storeStrong((id *)&self->_initiator, a3);
}

- (NFConnectionHandoverReceiver)receiver
{
  return self->_receiver;
}

- (void)setReceiver:(id)a3
{
  objc_storeStrong((id *)&self->_receiver, a3);
}

- (unsigned)powerAssertionID
{
  return self->_powerAssertionID;
}

- (void)setPowerAssertionID:(unsigned int)a3
{
  self->_powerAssertionID = a3;
}

- (RPNFCTransaction)currentTransaction
{
  return self->_currentTransaction;
}

- (void)setCurrentTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_currentTransaction, a3);
}

- (OS_dispatch_source)pollingCoolDownTimer
{
  return self->_pollingCoolDownTimer;
}

- (void)setPollingCoolDownTimer:(id)a3
{
  objc_storeStrong((id *)&self->_pollingCoolDownTimer, a3);
}

- (OS_dispatch_source)initiatorLimitTimer
{
  return self->_initiatorLimitTimer;
}

- (void)setInitiatorLimitTimer:(id)a3
{
  objc_storeStrong((id *)&self->_initiatorLimitTimer, a3);
}

- (OS_dispatch_source)connectToReceiverTimer
{
  return self->_connectToReceiverTimer;
}

- (void)setConnectToReceiverTimer:(id)a3
{
  objc_storeStrong((id *)&self->_connectToReceiverTimer, a3);
}

- (OS_dispatch_source)becomeInitiatorTimer
{
  return self->_becomeInitiatorTimer;
}

- (void)setBecomeInitiatorTimer:(id)a3
{
  objc_storeStrong((id *)&self->_becomeInitiatorTimer, a3);
}

- (int64_t)receiverState
{
  return self->_receiverState;
}

- (int64_t)initiatorState
{
  return self->_initiatorState;
}

- (BOOL)pendingReceiver
{
  return self->_pendingReceiver;
}

- (void)setPendingReceiver:(BOOL)a3
{
  self->_pendingReceiver = a3;
}

- (BOOL)pendingInitiator
{
  return self->_pendingInitiator;
}

- (void)setPendingInitiator:(BOOL)a3
{
  self->_pendingInitiator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_becomeInitiatorTimer, 0);
  objc_storeStrong((id *)&self->_connectToReceiverTimer, 0);
  objc_storeStrong((id *)&self->_initiatorLimitTimer, 0);
  objc_storeStrong((id *)&self->_pollingCoolDownTimer, 0);
  objc_storeStrong((id *)&self->_currentTransaction, 0);
  objc_storeStrong((id *)&self->_receiver, 0);
  objc_storeStrong((id *)&self->_initiator, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end

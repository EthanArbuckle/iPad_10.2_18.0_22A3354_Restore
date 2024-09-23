@implementation PLThrottleTimer

uint64_t __50__PLThrottleTimer__inqScheduleTimeout_maxTimeout___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_inqFireWithTimeout:timeoutId:maxTimeout:maxTimeoutId:", 0, *(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 48));
}

- (void)setPaused:(BOOL)a3
{
  pl_dispatch_sync();
}

uint64_t __29__PLThrottleTimer_setPaused___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 49) != v2)
  {
    *(_BYTE *)(v1 + 49) = v2;
    result = *(_QWORD *)(result + 32);
    if (!*(_BYTE *)(result + 49) && !*(_BYTE *)(result + 50))
    {
      if (*(_BYTE *)(result + 48))
        return objc_msgSend((id)result, "_inqScheduleTimeout:maxTimeout:", 1, 1);
    }
  }
  return result;
}

- (void)_inqFireWithTimeout:(BOOL)a3 timeoutId:(unint64_t)a4 maxTimeout:(BOOL)a5 maxTimeoutId:(unint64_t)a6
{
  _BOOL4 isPingedSinceLastFire;
  _BOOL4 v7;

  if (!self->_isPaused && !self->_isInvalid)
  {
    if (a3 && self->_timeoutId == a4)
    {
      isPingedSinceLastFire = self->_isPingedSinceLastFire;
      if (!a5)
        goto LABEL_10;
    }
    else
    {
      isPingedSinceLastFire = 0;
      if (!a5)
        goto LABEL_10;
    }
    if (self->_maxTimeoutId == a6)
    {
      v7 = self->_isPingedSinceLastFire;
      goto LABEL_11;
    }
LABEL_10:
    v7 = 0;
LABEL_11:
    if (isPingedSinceLastFire || v7)
    {
      self->_isPingedSinceLastFire = 0;
      pl_dispatch_async();
    }
  }
}

- (PLThrottleTimer)initWithTarget:(id)a3 action:(SEL)a4 invocationQueue:(id)a5 timeout:(double)a6 maxTimeout:(double)a7
{
  id v12;
  id v13;
  PLThrottleTimer *v14;
  PLThrottleTimer *v15;
  double v16;
  double v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *queue;
  objc_super v21;

  v12 = a3;
  v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PLThrottleTimer;
  v14 = -[PLThrottleTimer init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak(&v14->_target, v12);
    v15->_action = a4;
    v16 = fmax(a6, 0.01);
    if (v16 >= a7)
      v17 = v16;
    else
      v17 = a7;
    v15->_timeout = v16;
    v15->_maxTimeout = v17;
    v18 = dispatch_queue_create("com.apple.photos.throttle_timer", 0);
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v18;

    objc_storeStrong((id *)&v15->_invocationQueue, a5);
  }

  return v15;
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (void)_inqScheduleTimeout:(BOOL)a3 maxTimeout:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  if (a3)
  {
    ++self->_timeoutId;
    dispatch_time(0, (uint64_t)(self->_timeout * 1000000000.0));
    pl_dispatch_after();
  }
  if (v4)
  {
    ++self->_maxTimeoutId;
    dispatch_time(0, (uint64_t)(self->_maxTimeout * 1000000000.0));
    pl_dispatch_after();
  }
}

- (void)ping
{
  pl_dispatch_sync();
}

- (void)invalidate
{
  pl_dispatch_sync();
}

- (SEL)action
{
  return self->_action;
}

- (double)timeout
{
  return self->_timeout;
}

- (double)maxTimeout
{
  return self->_maxTimeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invocationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak(&self->_target);
}

uint64_t __29__PLThrottleTimer_invalidate__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 50) = 1;
  return result;
}

_BYTE *__23__PLThrottleTimer_ping__block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  _BYTE *result;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(v1 + 48);
  *(_BYTE *)(v1 + 48) = 1;
  result = *(_BYTE **)(a1 + 32);
  if (!result[49] && !result[50])
    return (_BYTE *)objc_msgSend(result, "_inqScheduleTimeout:maxTimeout:", 1, v2 == 0);
  return result;
}

uint64_t __50__PLThrottleTimer__inqScheduleTimeout_maxTimeout___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_inqFireWithTimeout:timeoutId:maxTimeout:maxTimeoutId:", 1, *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
}

void __73__PLThrottleTimer__inqFireWithTimeout_timeoutId_maxTimeout_maxTimeoutId___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void (*v3)(id, _QWORD);
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = (void (*)(id, _QWORD))objc_msgSend(WeakRetained, "methodForSelector:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
    WeakRetained = v4;
    if (v3)
    {
      v3(v4, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
      WeakRetained = v4;
    }
  }

}

@end

@implementation RBAnimationThread

- (_QWORD)initWithScreen:(void *)a1
{
  _QWORD *v3;
  void *v4;
  id v5;
  id v6;
  objc_super v8;

  if (!a1)
    return 0;
  v8.receiver = a1;
  v8.super_class = (Class)RBAnimationThread;
  v3 = objc_msgSendSuper2(&v8, sel_init);
  if (v3)
  {
    if (a2)
      v4 = a2;
    else
      v4 = (void *)MEMORY[0x24BDE5670];
    v5 = (id)objc_msgSend(v4, "displayLinkWithTarget:selector:", v3, sel_dispatchHandlers_);
    v6 = (id)v3[2];
    if (v6 != v5)
    {

      v5 = v5;
      v3[2] = v5;
    }
    if (v5)
    {
      *(_QWORD *)((char *)v3 + 28) = 60;
      return v3;
    }

    return 0;
  }
  return v3;
}

- (uint64_t)startThread
{
  uint64_t v1;
  void *v2;

  if (result)
  {
    v1 = result;
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17F0]), "initWithTarget:selector:object:", result, sel_thread_, 0);

    *(_QWORD *)(v1 + 8) = v2;
    objc_msgSend(v2, "setQualityOfService:", 33);
    objc_msgSend(*(id *)(v1 + 8), "setName:", CFSTR("com.apple.renderbox.animation-thread"));
    return objc_msgSend(*(id *)(v1 + 8), "start");
  }
  return result;
}

- (void)thread:(id)a3
{
  void *v4;
  os_unfair_lock_s *v5;

  -[RBAnimationThread initThread]((uint64_t)self);
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
  -[CADisplayLink addToRunLoop:forMode:](self->_link._p, "addToRunLoop:forMode:", v4, *MEMORY[0x24BDBCB80]);
  self->_empty_ttl = 10;
  os_unfair_lock_lock(v5);
  os_unfair_lock_unlock(v5);
  -[CADisplayLink invalidate](self->_link._p, "invalidate");

  self->_link._p = 0;
  self->_thread._p = 0;
}

- (uint64_t)initThread
{
  _opaque_pthread_t *v1;
  thread_act_t v2;
  pid_t v3;
  integer_t v4;
  integer_t policy_info;
  _BYTE buffer[228];
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v1 = pthread_self();
    result = pthread_mach_thread_np(v1);
    if ((_DWORD)result)
    {
      v2 = result;
      policy_info = 0;
      thread_policy_set(result, 1u, &policy_info, 1u);
      v3 = getpid();
      result = proc_pidinfo(v3, 2, 0, buffer, 232);
      if ((int)result >= 1)
      {
        v4 = 54 - v7;
        return thread_policy_set(v2, 3u, &v4, 1u);
      }
    }
  }
  return result;
}

- (void)dispatchHandlers:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  float *v8;
  int v9;
  float v10;
  int frame_rate;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int pending_frame_rate;
  float v18;
  float v19;
  unsigned int v20;
  void *v21;
  os_unfair_lock_t lock;
  char v23;

  lock = (os_unfair_lock_t)v4;
  v23 = 1;
  os_unfair_lock_lock((os_unfair_lock_t)v4);
  self->_pending_frame_rate = 48;
  v5 = v4 + 8;
  v6 = *(_QWORD *)(v4 + 272);
  if (*(_QWORD *)(v4 + 264))
    v5 = *(_QWORD *)(v4 + 264);
  if (v6)
  {
    v7 = 32 * v6;
    v8 = (float *)(v5 + 24);
    v9 = 48;
    while (1)
    {
      v10 = *v8;
      if (*v8 >= 320.0)
        break;
      if (v10 >= 160.0)
      {
        if (v9 <= 80)
          v9 = 80;
        goto LABEL_13;
      }
      if (v10 >= 100.0)
      {
        if (v9 <= 60)
          v9 = 60;
        goto LABEL_13;
      }
LABEL_14:
      v8 += 8;
      v7 -= 32;
      if (!v7)
        goto LABEL_15;
    }
    v9 = 120;
LABEL_13:
    self->_pending_frame_rate = v9;
    goto LABEL_14;
  }
LABEL_15:
  frame_rate = self->_frame_rate;
  -[CADisplayLink targetTimestamp](self->_link._p, "targetTimestamp", lock);
  if (*(_QWORD *)(v4 + 272))
  {
    self->_empty_ttl = 10;
    pending_frame_rate = self->_pending_frame_rate;
    if (pending_frame_rate != self->_frame_rate)
    {
      self->_frame_rate = pending_frame_rate;
      LODWORD(v13) = 1117782016;
      LODWORD(v14) = 1123024896;
      v18 = 80.0;
      LODWORD(v16) = 1111490560;
      if (pending_frame_rate > 54)
        *(float *)&v16 = 60.0;
      if (pending_frame_rate <= 74)
        v18 = 60.0;
      else
        *(float *)&v16 = 80.0;
      if (pending_frame_rate <= 114)
        v19 = *(float *)&v16;
      else
        v19 = 120.0;
      if (pending_frame_rate <= 114)
      {
        *(float *)&v14 = v18;
        *(float *)&v13 = *(float *)&v16;
      }
      *(float *)&v15 = v19;
      -[CADisplayLink setPreferredFrameRateRange:](self->_link._p, "setPreferredFrameRateRange:", v13, v14, v15, v16);
      if (v19 > 60.0)
        -[CADisplayLink setHighFrameRateReason:](self->_link._p, "setHighFrameRateReason:", 2555992);
    }
  }
  else
  {
    v20 = self->_empty_ttl - 1;
    self->_empty_ttl = v20;
    if (!v20)
    {
      v21 = (void *)objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
      -[CADisplayLink removeFromRunLoop:forMode:](self->_link._p, "removeFromRunLoop:forMode:", v21, *MEMORY[0x24BDBCB80]);
      CFRunLoopStop((CFRunLoopRef)objc_msgSend(v21, "getCFRunLoop"));
    }
  }
  if (v23)
    os_unfair_lock_unlock(lock);
}

- (void).cxx_destruct
{

}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end

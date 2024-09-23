@implementation UIAccelerometer

+ (UIAccelerometer)sharedAccelerometer
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)sharedAccelerometer_sharedAccelerometer;
  if (!sharedAccelerometer_sharedAccelerometer)
  {
    v4 = objc_alloc_init((Class)a1);
    v5 = (void *)sharedAccelerometer_sharedAccelerometer;
    sharedAccelerometer_sharedAccelerometer = (uint64_t)v4;

    v3 = (void *)sharedAccelerometer_sharedAccelerometer;
  }
  return (UIAccelerometer *)v3;
}

- (UIAccelerometer)init
{
  UIAccelerometer *v2;
  void *v3;
  UIAccelerometer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIAccelerometer;
  v2 = -[UIAccelerometer init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__willResume_, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__didSuspend_, CFSTR("UIApplicationDidEnterBackgroundNotification"), 0);
    -[UIAccelerometer setUpdateInterval:](v2, "setUpdateInterval:", 0.1);
    v4 = v2;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[CMMotionManager stopAccelerometerUpdates](self->_motionManager, "stopAccelerometerUpdates");
  v3.receiver = self;
  v3.super_class = (Class)UIAccelerometer;
  -[UIAccelerometer dealloc](&v3, sel_dealloc);
}

- (void)setUpdateInterval:(NSTimeInterval)updateInterval
{
  void *v4;
  void *v5;
  double v6;

  self->_updateInterval = updateInterval;
  if ((*(_BYTE *)&self->_accelerometerFlags & 1) != 0)
  {
    -[UIAccelerometer _motionManager](self, "_motionManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = self->_updateInterval;
    if (v6 <= 0.0)
      v6 = 0.1;
    objc_msgSend(v4, "setAccelerometerUpdateInterval:", v6);

    -[UIAccelerometer _startAccelerometerIfNecessary](self, "_startAccelerometerIfNecessary");
  }
}

- (void)setDelegate:(id)delegate
{
  id WeakRetained;
  void *v5;
  char v6;
  id obj;

  obj = delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (!obj || WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    if (obj)
    {
      v6 = objc_opt_respondsToSelector();
      self->_accelerometerFlags = ($9F6B055BE7F852DF8026941A3CCB1866)(*(_DWORD *)&self->_accelerometerFlags & 0xFFFFFFFE | v6 & 1);
      if ((v6 & 1) != 0)
      {
        -[UIAccelerometer _startAccelerometerIfNecessary](self, "_startAccelerometerIfNecessary");
LABEL_8:
        v5 = obj;
        goto LABEL_9;
      }
    }
    else
    {
      *(_DWORD *)&self->_accelerometerFlags &= ~1u;
    }
    -[UIAccelerometer _stopAccelerometer](self, "_stopAccelerometer");
    goto LABEL_8;
  }
LABEL_9:

}

- (void)_acceleratedInX:(double)a3 y:(double)a4 z:(double)a5 timestamp:(double)a6
{
  id WeakRetained;
  id v12;

  if ((*(_BYTE *)&self->_accelerometerFlags & 1) != 0)
  {
    v12 = (id)objc_opt_new();
    objc_msgSend(v12, "setTimestamp:", a6);
    objc_msgSend(v12, "setX:", a3);
    objc_msgSend(v12, "setY:", a4);
    objc_msgSend(v12, "setZ:", a5);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "accelerometer:didAccelerate:", self, v12);

  }
}

- (id)_motionManager
{
  CMMotionManager *motionManager;
  void *v4;
  objc_class *v5;
  CMMotionManager *v6;
  CMMotionManager *v7;
  BOOL v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  motionManager = self->_motionManager;
  if (!motionManager)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2050000000;
    v4 = (void *)_MergedGlobals_1091;
    v14 = _MergedGlobals_1091;
    if (!_MergedGlobals_1091)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __getCMMotionManagerClass_block_invoke;
      v10[3] = &unk_1E16B14C0;
      v10[4] = &v11;
      __getCMMotionManagerClass_block_invoke((uint64_t)v10);
      v4 = (void *)v12[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v11, 8);
    v6 = (CMMotionManager *)objc_alloc_init(v5);
    v7 = self->_motionManager;
    self->_motionManager = v6;

    v8 = -[CMMotionManager isAccelerometerAvailable](self->_motionManager, "isAccelerometerAvailable");
    motionManager = self->_motionManager;
    if (!v8)
    {
      self->_motionManager = 0;

      motionManager = self->_motionManager;
    }
  }
  return motionManager;
}

- (void)_startAccelerometerIfNecessary
{
  $9F6B055BE7F852DF8026941A3CCB1866 accelerometerFlags;
  id v4;

  -[UIAccelerometer _motionManager](self, "_motionManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isAccelerometerActive") & 1) == 0)
  {
    accelerometerFlags = self->_accelerometerFlags;

    if ((*(_BYTE *)&accelerometerFlags & 1) == 0)
      return;
    -[UIAccelerometer _motionManager](self, "_motionManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccelerometerDataCallback:info:interval:", accelCallback, self, self->_updateInterval);
  }

}

- (void)_stopAccelerometer
{
  void *v3;
  int v4;
  id v5;

  -[UIAccelerometer _motionManager](self, "_motionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAccelerometerActive");

  if (v4)
  {
    -[UIAccelerometer _motionManager](self, "_motionManager");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopAccelerometerUpdates");

  }
}

- (NSTimeInterval)updateInterval
{
  return self->_updateInterval;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

@implementation WKBokehMotionManager

- (WKBokehMotionManager)init
{
  WKBokehMotionManager *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WKBokehMotionManager;
  result = -[WKBokehMotionManager init](&v3, sel_init);
  if (result)
  {
    result->_referenceFrame = 1;
    result->_attitude.x = 0.0;
    result->_attitude.y = 0.0;
    result->_attitude.z = 0.0;
    result->_attitude.w = 1.0;
    result->_coefficient = 0.02;
  }
  return result;
}

- (id)initWithCoefficient:(id)result
{
  objc_super v3;

  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)WKBokehMotionManager;
    result = objc_msgSendSuper2(&v3, sel_init);
    if (result)
    {
      *((_QWORD *)result + 13) = 1;
      *((_QWORD *)result + 4) = 0;
      *((_QWORD *)result + 5) = 0;
      *((_QWORD *)result + 6) = 0;
      *((_QWORD *)result + 7) = 0x3FF0000000000000;
      *((double *)result + 11) = a2;
    }
  }
  return result;
}

- (id)initWithCoefficient:(double)a3 threshold:
{
  objc_super v5;

  if (result)
  {
    v5.receiver = result;
    v5.super_class = (Class)WKBokehMotionManager;
    result = objc_msgSendSuper2(&v5, sel_init);
    if (result)
    {
      *((_QWORD *)result + 13) = 1;
      *((_QWORD *)result + 4) = 0;
      *((_QWORD *)result + 5) = 0;
      *((_QWORD *)result + 6) = 0;
      *((_QWORD *)result + 7) = 0x3FF0000000000000;
      *((double *)result + 11) = a2;
      *((double *)result + 12) = a3;
    }
  }
  return result;
}

- (double)accelerometerUpdateInterval
{
  double result;

  if (!a1)
    return 0.0;
  -[WKBokehMotionManager createMotionManager](a1);
  objc_msgSend(*(id *)(a1 + 112), "accelerometerUpdateInterval");
  return result;
}

- (void)createMotionManager
{
  id v2;
  void *v3;

  if (a1)
  {
    if (!*(_QWORD *)(a1 + 112))
    {
      v2 = objc_alloc_init(MEMORY[0x1E0CA5670]);
      v3 = *(void **)(a1 + 112);
      *(_QWORD *)(a1 + 112) = v2;

    }
  }
}

- (uint64_t)setAccelerometerUpdateInterval:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    -[WKBokehMotionManager createMotionManager](result);
    return objc_msgSend(*(id *)(v3 + 112), "setAccelerometerUpdateInterval:", a2);
  }
  return result;
}

- (double)deviceMotionUpdateInterval
{
  double result;

  if (!a1)
    return 0.0;
  -[WKBokehMotionManager createMotionManager](a1);
  objc_msgSend(*(id *)(a1 + 112), "deviceMotionUpdateInterval");
  return result;
}

- (uint64_t)setDeviceMotionUpdateInterval:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    -[WKBokehMotionManager createMotionManager](result);
    return objc_msgSend(*(id *)(v3 + 112), "setDeviceMotionUpdateInterval:", a2);
  }
  return result;
}

- (double)x
{
  if (a1)
    return *(double *)(a1 + 8);
  else
    return 0.0;
}

- (double)z
{
  if (a1)
    return *(double *)(a1 + 24);
  else
    return 0.0;
}

- (id)motionFilterX
{
  if (a1)
    a1 = (id *)a1[16];
  return a1;
}

- (id)motionFilterY
{
  if (a1)
    a1 = (id *)a1[17];
  return a1;
}

- (id)motionFilterZ
{
  if (a1)
    a1 = (id *)a1[18];
  return a1;
}

- (double)attitude
{
  if (a1)
    return *(double *)(a1 + 32);
  else
    return 0.0;
}

- (double)roll
{
  if (a1)
    return *(double *)(a1 + 64);
  else
    return 0.0;
}

- (double)pitch
{
  if (a1)
    return *(double *)(a1 + 72);
  else
    return 0.0;
}

- (double)yaw
{
  if (a1)
    return *(double *)(a1 + 80);
  else
    return 0.0;
}

- (uint64_t)isDeviceMotionAvailable
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    -[WKBokehMotionManager createMotionManager](result);
    return objc_msgSend(*(id *)(v1 + 112), "isDeviceMotionAvailable");
  }
  return result;
}

- (BOOL)zeroMovementSinceLastFrame
{
  return a1
      && -[WKBokehInfiniteImpulseResponseFilter zeroGradient](a1[16])
      && -[WKBokehInfiniteImpulseResponseFilter zeroGradient](a1[17])
      && -[WKBokehInfiniteImpulseResponseFilter zeroGradient](a1[18]);
}

- (void)_createFilters
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  double v23;

  if (a1 && !*(_QWORD *)(a1 + 128))
  {
    +[WKBokehInfiniteImpulseResponseFilter lowpassInertiaFilterWithCoefficient:](*(double *)(a1 + 88));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(void **)(a1 + 128);
    *(_QWORD *)(a1 + 128) = v2;

    +[WKBokehInfiniteImpulseResponseFilter lowpassInertiaFilterWithCoefficient:](*(double *)(a1 + 88));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 136);
    *(_QWORD *)(a1 + 136) = v4;

    +[WKBokehInfiniteImpulseResponseFilter lowpassInertiaFilterWithCoefficient:](*(double *)(a1 + 88));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 144);
    *(_QWORD *)(a1 + 144) = v6;

    +[WKBokehInfiniteImpulseResponseFilter lowpassInertiaFilterWithCoefficient:](*(double *)(a1 + 88));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 152);
    *(_QWORD *)(a1 + 152) = v8;

    +[WKBokehInfiniteImpulseResponseFilter lowpassInertiaFilterWithCoefficient:](*(double *)(a1 + 88));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(a1 + 160);
    *(_QWORD *)(a1 + 160) = v10;

    +[WKBokehInfiniteImpulseResponseFilter lowpassInertiaFilterWithCoefficient:](*(double *)(a1 + 88));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(a1 + 168);
    *(_QWORD *)(a1 + 168) = v12;

    +[WKBokehInfiniteImpulseResponseFilter lowpassInertiaFilterWithCoefficient:](*(double *)(a1 + 88));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(void **)(a1 + 176);
    *(_QWORD *)(a1 + 176) = v14;

    +[WKBokehInfiniteImpulseResponseFilter lowpassInertiaFilterWithCoefficient:](*(double *)(a1 + 88));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(void **)(a1 + 184);
    *(_QWORD *)(a1 + 184) = v16;

    +[WKBokehInfiniteImpulseResponseFilter lowpassInertiaFilterWithCoefficient:](*(double *)(a1 + 88));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(void **)(a1 + 192);
    *(_QWORD *)(a1 + 192) = v18;

    +[WKBokehInfiniteImpulseResponseFilter lowpassInertiaFilterWithCoefficient:](*(double *)(a1 + 88));
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(void **)(a1 + 200);
    *(_QWORD *)(a1 + 200) = v20;

    v22 = 3;
    do
    {
      -[WKBokehInfiniteImpulseResponseFilter filterWithInput:](*(_QWORD **)(a1 + 176), 1.0);
      --v22;
    }
    while (v22);
    v23 = *(double *)(a1 + 96);
    if (v23 > 0.0)
    {
      -[WKBokehInfiniteImpulseResponseFilter setZeroGradientThreshold:](*(_QWORD *)(a1 + 128), v23);
      -[WKBokehInfiniteImpulseResponseFilter setZeroGradientThreshold:](*(_QWORD *)(a1 + 136), *(double *)(a1 + 96));
      -[WKBokehInfiniteImpulseResponseFilter setZeroGradientThreshold:](*(_QWORD *)(a1 + 144), *(double *)(a1 + 96));
      -[WKBokehInfiniteImpulseResponseFilter setZeroGradientThreshold:](*(_QWORD *)(a1 + 152), *(double *)(a1 + 96));
      -[WKBokehInfiniteImpulseResponseFilter setZeroGradientThreshold:](*(_QWORD *)(a1 + 160), *(double *)(a1 + 96));
      -[WKBokehInfiniteImpulseResponseFilter setZeroGradientThreshold:](*(_QWORD *)(a1 + 168), *(double *)(a1 + 96));
      -[WKBokehInfiniteImpulseResponseFilter setZeroGradientThreshold:](*(_QWORD *)(a1 + 176), *(double *)(a1 + 96));
      -[WKBokehInfiniteImpulseResponseFilter setZeroGradientThreshold:](*(_QWORD *)(a1 + 184), *(double *)(a1 + 96));
      -[WKBokehInfiniteImpulseResponseFilter setZeroGradientThreshold:](*(_QWORD *)(a1 + 192), *(double *)(a1 + 96));
      -[WKBokehInfiniteImpulseResponseFilter setZeroGradientThreshold:](*(_QWORD *)(a1 + 200), *(double *)(a1 + 96));
    }
  }
}

- (void)startDeviceMotionUpdates
{
  id v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id location;

  if (a1)
  {
    -[WKBokehMotionManager _createFilters](a1);
    -[WKBokehMotionManager createMotionManager](a1);
    objc_msgSend(*(id *)(a1 + 112), "setDeviceMotionUpdateInterval:", 0.0166666667);
    if (*(_BYTE *)(a1 + 120))
    {
      *(_BYTE *)(a1 + 120) = 0;
    }
    else
    {
      v2 = objc_alloc_init(MEMORY[0x1E0CB3828]);
      objc_msgSend(v2, "setMaxConcurrentOperationCount:", 1);
      objc_initWeak(&location, (id)a1);
      v4 = *(_QWORD *)(a1 + 104);
      v3 = *(void **)(a1 + 112);
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __48__WKBokehMotionManager_startDeviceMotionUpdates__block_invoke;
      v5[3] = &unk_1E6EF9EC8;
      objc_copyWeak(&v6, &location);
      objc_msgSend(v3, "startDeviceMotionUpdatesUsingReferenceFrame:toQueue:withHandler:", v4, v2, v5);
      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);

    }
  }
}

void __48__WKBokehMotionManager_startDeviceMotionUpdates__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double *WeakRetained;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double *v34;

  v3 = a2;
  objc_msgSend(v3, "gravity");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(v3, "attitude");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "quaternion");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v33 = v17;

  objc_msgSend(v3, "attitude");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "roll");
  v32 = v19;

  objc_msgSend(v3, "attitude");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "pitch");
  v22 = v21;

  objc_msgSend(v3, "attitude");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "yaw");
  v25 = v24;

  WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v34 = WeakRetained;
    WeakRetained[1] = -[WKBokehInfiniteImpulseResponseFilter filterWithInput:](*((_QWORD **)WeakRetained + 16), v5);
    v34[2] = -[WKBokehInfiniteImpulseResponseFilter filterWithInput:](*((_QWORD **)v34 + 17), v7);
    v34[3] = -[WKBokehInfiniteImpulseResponseFilter filterWithInput:](*((_QWORD **)v34 + 18), v9);
    v27 = -[WKBokehInfiniteImpulseResponseFilter filterWithInput:](*((_QWORD **)v34 + 19), v12);
    v28 = -[WKBokehInfiniteImpulseResponseFilter filterWithInput:](*((_QWORD **)v34 + 20), v14);
    v29 = -[WKBokehInfiniteImpulseResponseFilter filterWithInput:](*((_QWORD **)v34 + 21), v16);
    v30 = -[WKBokehInfiniteImpulseResponseFilter filterWithInput:](*((_QWORD **)v34 + 22), v33);
    v34[4] = v27;
    v34[5] = v28;
    v34[6] = v29;
    v34[7] = v30;
    v34[8] = -[WKBokehInfiniteImpulseResponseFilter filterWithInput:](*((_QWORD **)v34 + 23), v32);
    v34[9] = -[WKBokehInfiniteImpulseResponseFilter filterWithInput:](*((_QWORD **)v34 + 24), v22);
    v31 = -[WKBokehInfiniteImpulseResponseFilter filterWithInput:](*((_QWORD **)v34 + 25), v25);
    WeakRetained = v34;
    v34[10] = v31;
  }

}

- (void)startDeviceAccelerometerUpdates
{
  id v2;
  id v3;
  _QWORD v4[4];
  id v5;
  id location;

  if (a1)
  {
    -[WKBokehMotionManager _createFilters]((uint64_t)a1);
    -[WKBokehMotionManager createMotionManager]((uint64_t)a1);
    objc_msgSend(a1[14], "setAccelerometerUpdateInterval:", 0.0166666667);
    v2 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    objc_msgSend(v2, "setMaxConcurrentOperationCount:", 1);
    objc_initWeak(&location, a1);
    v3 = a1[14];
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __55__WKBokehMotionManager_startDeviceAccelerometerUpdates__block_invoke;
    v4[3] = &unk_1E6EF9EF0;
    objc_copyWeak(&v5, &location);
    objc_msgSend(v3, "startAccelerometerUpdatesToQueue:withHandler:", v2, v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);

  }
}

void __55__WKBokehMotionManager_startDeviceAccelerometerUpdates__block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double *WeakRetained;
  double v10;
  double *v11;

  objc_msgSend(a2, "acceleration");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v11 = WeakRetained;
    WeakRetained[1] = -[WKBokehInfiniteImpulseResponseFilter filterWithInput:](*((_QWORD **)WeakRetained + 16), v4);
    v11[2] = -[WKBokehInfiniteImpulseResponseFilter filterWithInput:](*((_QWORD **)v11 + 17), v6);
    v10 = -[WKBokehInfiniteImpulseResponseFilter filterWithInput:](*((_QWORD **)v11 + 18), v8);
    WeakRetained = v11;
    v11[3] = v10;
  }

}

- (_QWORD)stopDeviceMotionUpdates
{
  if (result)
  {
    result = (_QWORD *)result[14];
    if (result)
      return (_QWORD *)objc_msgSend(result, "stopDeviceMotionUpdates");
  }
  return result;
}

- (_QWORD)pauseDeviceMotionUpdates
{
  _QWORD *v1;

  if (result)
  {
    v1 = result;
    result = (_QWORD *)result[14];
    if (result)
    {
      result = (_QWORD *)objc_msgSend(result, "setDeviceMotionUpdateInterval:", 10.0);
      *((_BYTE *)v1 + 120) = 1;
    }
  }
  return result;
}

- (_QWORD)stopDeviceAccelerometerUpdates
{
  if (result)
  {
    result = (_QWORD *)result[14];
    if (result)
      return (_QWORD *)objc_msgSend(result, "stopAccelerometerUpdates");
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionFilterYaw, 0);
  objc_storeStrong((id *)&self->_motionFilterPitch, 0);
  objc_storeStrong((id *)&self->_motionFilterRoll, 0);
  objc_storeStrong((id *)&self->_motionFilterAW, 0);
  objc_storeStrong((id *)&self->_motionFilterAZ, 0);
  objc_storeStrong((id *)&self->_motionFilterAY, 0);
  objc_storeStrong((id *)&self->_motionFilterAX, 0);
  objc_storeStrong((id *)&self->_motionFilterZ, 0);
  objc_storeStrong((id *)&self->_motionFilterY, 0);
  objc_storeStrong((id *)&self->_motionFilterX, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);
}

@end

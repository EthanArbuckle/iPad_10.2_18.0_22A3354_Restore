@implementation RCPScreenRecorder

+ (id)takeScreenshot
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  +[RCPScreenRecorder takeScreenshot:](RCPScreenRecorder, "takeScreenshot:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)takeScreenshot:(double)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  RCPScreenSnapshot *v17;
  void *v18;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[6];
  _QWORD v26[7];

  v26[6] = *MEMORY[0x1E0C80C00];
  v25[0] = *MEMORY[0x1E0CEC3E8];
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0CEC3C0];
  v26[0] = v4;
  v26[1] = &unk_1E4FCC7C8;
  v6 = *MEMORY[0x1E0CEC3C8];
  v25[1] = v5;
  v25[2] = v6;
  v7 = MEMORY[0x1E0C9AAB0];
  v26[2] = MEMORY[0x1E0C9AAB0];
  v25[3] = *MEMORY[0x1E0CEC3D0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v8;
  v9 = *MEMORY[0x1E0CEC3D8];
  v25[4] = *MEMORY[0x1E0CEC3E0];
  v25[5] = v9;
  v26[4] = &unk_1E4FCC7E0;
  v26[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)_UIRenderDisplay();
  v21 = 0;
  v22 = &v21;
  v23 = 0x2050000000;
  v12 = (void *)getFBSOrientationObserverClass_softClass_0;
  v24 = getFBSOrientationObserverClass_softClass_0;
  if (!getFBSOrientationObserverClass_softClass_0)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __getFBSOrientationObserverClass_block_invoke_0;
    v20[3] = &unk_1E4FC2000;
    v20[4] = &v21;
    __getFBSOrientationObserverClass_block_invoke_0((uint64_t)v20);
    v12 = (void *)v22[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v21, 8);
  v14 = objc_alloc_init(v13);
  v15 = objc_msgSend(v14, "activeInterfaceOrientation");
  if ((unint64_t)(v15 - 2) >= 3)
    v16 = 0;
  else
    v16 = v15 - 1;
  objc_msgSend(v14, "invalidate");
  v17 = objc_alloc_init(RCPScreenSnapshot);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "_initWithIOSurface:scale:orientation:", v11, v16, 1.0);
  -[RCPScreenSnapshot setSnapshotImage:](v17, "setSnapshotImage:", v18);

  objc_msgSend(v14, "invalidate");
  return v17;
}

uint64_t __36__RCPScreenRecorder_takeScreenshot___block_invoke()
{
  return _UIRenderingBufferCreate();
}

- (void)startRecording
{
  NSMutableArray *v3;
  NSMutableArray *snapshots;
  NSObject *v5;
  NSObject *v6;
  OS_dispatch_queue *v7;
  OS_dispatch_queue *snapshotQueue;
  dispatch_time_t v9;
  NSObject *v10;
  _QWORD block[5];

  self->_recording = 1;
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  snapshots = self->_snapshots;
  self->_snapshots = v3;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_UTILITY, 0);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = (OS_dispatch_queue *)dispatch_queue_create("RCPScreenRecorder", v6);
  snapshotQueue = self->_snapshotQueue;
  self->_snapshotQueue = v7;

  v9 = dispatch_time(0, 100000000);
  v10 = self->_snapshotQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__RCPScreenRecorder_startRecording__block_invoke;
  block[3] = &unk_1E4FC1FB8;
  block[4] = self;
  dispatch_after(v9, v10, block);

}

uint64_t __35__RCPScreenRecorder_startRecording__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "snapshot");
}

- (BOOL)isRecording
{
  NSObject *snapshotQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  snapshotQueue = self->_snapshotQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__RCPScreenRecorder_isRecording__block_invoke;
  v5[3] = &unk_1E4FC21D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(snapshotQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __32__RCPScreenRecorder_isRecording__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

- (void)stopRecording
{
  NSObject *snapshotQueue;
  _QWORD block[5];

  snapshotQueue = self->_snapshotQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__RCPScreenRecorder_stopRecording__block_invoke;
  block[3] = &unk_1E4FC1FB8;
  block[4] = self;
  dispatch_sync(snapshotQueue, block);
}

uint64_t __34__RCPScreenRecorder_stopRecording__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 16) = 0;
  return result;
}

- (NSArray)snapshots
{
  NSObject *snapshotQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  snapshotQueue = self->_snapshotQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__RCPScreenRecorder_snapshots__block_invoke;
  v5[3] = &unk_1E4FC21D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(snapshotQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __30__RCPScreenRecorder_snapshots__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)snapshot
{
  void *v3;
  double v4;
  uint64_t v5;
  double v6;
  unint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  dispatch_time_t v19;
  NSObject *snapshotQueue;
  _QWORD block[5];

  +[RCPScreenRecorder takeScreenshot:](RCPScreenRecorder, "takeScreenshot:", 0.25);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NSMutableArray addObject:](self->_snapshots, "addObject:", v3);
    -[RCPScreenRecorder maxDuration](self, "maxDuration");
    if (v4 <= 0.0)
    {
      v7 = 0;
    }
    else
    {
      v5 = objc_msgSend(v3, "timestamp");
      -[RCPScreenRecorder maxDuration](self, "maxDuration");
      v7 = v5 - RCPMachTimestampFromTimeInterval(v6);
    }
    v8 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    -[NSMutableArray lastObject](self->_snapshots, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "index");

    if (-[NSMutableArray count](self->_snapshots, "count"))
    {
      v11 = 0;
      do
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_snapshots, "objectAtIndexedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "index");

        if (!v7
          || (-[NSMutableArray objectAtIndexedSubscript:](self->_snapshots, "objectAtIndexedSubscript:", v11),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              v15 = objc_msgSend(v14, "timestamp"),
              v14,
              v15 >= v7))
        {
          v16 = 0;
          v17 = 1;
          while (1)
          {
            v18 = v17;
            if (v10 - v13 > RCPScreenRecorderSnapshotDiscardRates[v16])
            {
              if (v13 % *(_QWORD *)((char *)RCPScreenRecorderSnapshotDiscardRates + ((8 * v16) | 8)))
                break;
            }
            v17 = 0;
            v16 = 2;
            if ((v18 & 1) == 0)
              goto LABEL_14;
          }
        }
        objc_msgSend(v8, "addIndex:", v11);
LABEL_14:
        ++v11;
      }
      while (v11 < -[NSMutableArray count](self->_snapshots, "count"));
    }
    -[NSMutableArray removeObjectsAtIndexes:](self->_snapshots, "removeObjectsAtIndexes:", v8);
    if (self->_recording)
    {
      v19 = dispatch_time(0, 100000000);
      snapshotQueue = self->_snapshotQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __29__RCPScreenRecorder_snapshot__block_invoke;
      block[3] = &unk_1E4FC1FB8;
      block[4] = self;
      dispatch_after(v19, snapshotQueue, block);
    }

  }
}

uint64_t __29__RCPScreenRecorder_snapshot__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "snapshot");
}

- (double)maxDuration
{
  return self->_maxDuration;
}

- (void)setMaxDuration:(double)a3
{
  self->_maxDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotQueue, 0);
  objc_storeStrong((id *)&self->_snapshots, 0);
}

@end

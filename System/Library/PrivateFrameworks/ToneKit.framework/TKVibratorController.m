@implementation TKVibratorController

- (TKVibratorController)init
{
  TKVibratorController *v2;
  uint64_t v3;
  TLAccessQueue *accessQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TKVibratorController;
  v2 = -[TKVibratorController init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BEB8C98]), "initWithLabel:appendUUIDToLabel:", CFSTR("TKVibratorController"), 1);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (TLAccessQueue *)v3;

  }
  return v2;
}

- (void)dealloc
{
  TLAccessQueue *accessQueue;
  TLAccessQueue *v4;
  objc_super v5;
  _QWORD v6[5];

  accessQueue = self->_accessQueue;
  self->_accessQueue = 0;
  v4 = accessQueue;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __31__TKVibratorController_dealloc__block_invoke;
  v6[3] = &unk_24D37FE38;
  v6[4] = self;
  -[TLAccessQueue performSynchronousBlock:](v4, "performSynchronousBlock:", v6);

  v5.receiver = self;
  v5.super_class = (Class)TKVibratorController;
  -[TKVibratorController dealloc](&v5, sel_dealloc);
}

void __31__TKVibratorController_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_turnOffIfAppropriate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = 0;

}

- (unint64_t)vibratorState
{
  TLAccessQueue *accessQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __37__TKVibratorController_vibratorState__block_invoke;
  v5[3] = &unk_24D3803F8;
  v5[4] = self;
  v5[5] = &v6;
  -[TLAccessQueue performSynchronousBlock:](accessQueue, "performSynchronousBlock:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__TKVibratorController_vibratorState__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = result;
  v2 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v2 + 16) || (result = objc_msgSend(*(id *)(v2 + 24), "count")) != 0)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = 1;
  return result;
}

- (unsigned)_previewVibrationSystemSoundID
{
  return 1352;
}

- (void)turnOnWithVibrationPattern:(id)a3
{
  id v4;
  TLAccessQueue *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__TKVibratorController_turnOnWithVibrationPattern___block_invoke;
  v7[3] = &unk_24D37FF00;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[TLAccessQueue performSynchronousBlock:](accessQueue, "performSynchronousBlock:", v7);

}

void __51__TKVibratorController_turnOnWithVibrationPattern___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "_turnOffIfAppropriate");
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), v2);
  objc_msgSend(*(id *)(a1 + 32), "_previewVibrationSystemSoundID");
  v3 = objc_alloc(MEMORY[0x24BDBCE70]);
  v4 = (void *)objc_msgSend(v3, "initWithObjectsAndKeys:", &unk_24D389888, *MEMORY[0x24BDB6D30], *(_QWORD *)(a1 + 40), *MEMORY[0x24BDB6D50], 0);
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_copyWeak(&v6, &location);
  v5 = v2;
  AudioServicesPlaySystemSoundWithOptions();

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __51__TKVibratorController_turnOnWithVibrationPattern___block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_vibrationDidCompleteWithPlayRequestIdentifier:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)turnOff
{
  TLAccessQueue *accessQueue;
  _QWORD v3[5];

  accessQueue = self->_accessQueue;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __31__TKVibratorController_turnOff__block_invoke;
  v3[3] = &unk_24D37FE38;
  v3[4] = self;
  -[TLAccessQueue performSynchronousBlock:](accessQueue, "performSynchronousBlock:", v3);
}

uint64_t __31__TKVibratorController_turnOff__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_turnOffIfAppropriate");
}

- (void)_turnOffIfAppropriate
{
  NSUUID *v3;
  NSUUID *activePlayRequestIdentifier;
  NSMutableSet *pendingStopRequestIdentifiers;
  NSMutableSet *v6;
  NSMutableSet *v7;
  NSUUID *v8;

  v3 = self->_activePlayRequestIdentifier;
  if (v3)
  {
    v8 = v3;
    activePlayRequestIdentifier = self->_activePlayRequestIdentifier;
    self->_activePlayRequestIdentifier = 0;

    pendingStopRequestIdentifiers = self->_pendingStopRequestIdentifiers;
    if (!pendingStopRequestIdentifiers)
    {
      v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
      v7 = self->_pendingStopRequestIdentifiers;
      self->_pendingStopRequestIdentifiers = v6;

      pendingStopRequestIdentifiers = self->_pendingStopRequestIdentifiers;
    }
    -[NSMutableSet addObject:](pendingStopRequestIdentifiers, "addObject:", v8);
    -[TKVibratorController _previewVibrationSystemSoundID](self, "_previewVibrationSystemSoundID");
    AudioServicesStopSystemSound();
    v3 = v8;
  }

}

- (void)_vibrationDidCompleteWithPlayRequestIdentifier:(id)a3
{
  id v4;
  TLAccessQueue *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__TKVibratorController__vibrationDidCompleteWithPlayRequestIdentifier___block_invoke;
  v7[3] = &unk_24D37FF00;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[TLAccessQueue performSynchronousBlock:](accessQueue, "performSynchronousBlock:", v7);

}

void __71__TKVibratorController__vibrationDidCompleteWithPlayRequestIdentifier___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "isEqual:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v4 = *(void **)(v3 + 16);
    *(_QWORD *)(v3 + 16) = 0;

  }
  else
  {
    objc_msgSend(*(id *)(v3 + 24), "removeObject:", *(_QWORD *)(a1 + 40));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingStopRequestIdentifiers, 0);
  objc_storeStrong((id *)&self->_activePlayRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end

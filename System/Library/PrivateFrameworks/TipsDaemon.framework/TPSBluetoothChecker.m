@implementation TPSBluetoothChecker

void __36__TPSBluetoothChecker_pairedDevices__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "bluetoothManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pairedDevices");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSArray)pairedDevices
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  -[TPSBluetoothChecker devicesAccessQueue](self, "devicesAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__TPSBluetoothChecker_pairedDevices__block_invoke;
  v6[3] = &unk_1EA1DFEF0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (id)devicesAccessQueue
{
  if (devicesAccessQueue_onceToken != -1)
    dispatch_once(&devicesAccessQueue_onceToken, &__block_literal_global_3);
  return (id)devicesAccessQueue_accessQueue;
}

- (BluetoothManager)bluetoothManager
{
  return self->_bluetoothManager;
}

+ (id)sharedInstance
{
  if (sharedInstance_predicate != -1)
    dispatch_once(&sharedInstance_predicate, &__block_literal_global_3);
  return (id)sharedInstance_sharedInstance;
}

+ (id)bluetoothPairedForProductIDs:(id)a3 withPairedDevices:(id)a4
{
  return (id)objc_msgSend(a1, "bluetoothPairedForProductIDs:minimumVersion:withPairedDevices:", a3, 0, a4);
}

+ (id)bluetoothPairedForProductIDs:(id)a3 minimumVersion:(id)a4 withPairedDevices:(id)a5
{
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v7 = a3;
  v8 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__3;
  v27 = __Block_byref_object_dispose__3;
  v28 = 0;
  v9 = a5;
  v10 = objc_msgSend(v7, "count");
  v11 = MEMORY[0x1E0C809B0];
  v12 = v9;
  if (v10 >= 2)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __85__TPSBluetoothChecker_bluetoothPairedForProductIDs_minimumVersion_withPairedDevices___block_invoke;
    v21[3] = &unk_1EA1E0640;
    v22 = v7;
    objc_msgSend(v9, "sortedArrayUsingComparator:", v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __85__TPSBluetoothChecker_bluetoothPairedForProductIDs_minimumVersion_withPairedDevices___block_invoke_2;
  v17[3] = &unk_1EA1E0668;
  v13 = v7;
  v18 = v13;
  v14 = v8;
  v19 = v14;
  v20 = &v23;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v17);
  v15 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v15;
}

void __37__TPSBluetoothChecker_sharedInstance__block_invoke()
{
  TPSBluetoothChecker *v0;
  void *v1;

  v0 = objc_alloc_init(TPSBluetoothChecker);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (TPSBluetoothChecker)init
{
  TPSBluetoothChecker *v2;
  uint64_t v3;
  CBCentralManager *centralManager;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *peersAccessQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TPSBluetoothChecker;
  v2 = -[TPSBluetoothChecker init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C97728]), "initWithDelegate:queue:", 0, 0);
    centralManager = v2->_centralManager;
    v2->_centralManager = (CBCentralManager *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create(0, v5);
    peersAccessQueue = v2->_peersAccessQueue;
    v2->_peersAccessQueue = (OS_dispatch_queue *)v6;

    -[TPSBluetoothChecker initializeBTManager](v2, "initializeBTManager");
  }
  return v2;
}

- (void)initializeBTManager
{
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];

  v3 = (void *)MEMORY[0x1E0D03410];
  -[TPSBluetoothChecker devicesAccessQueue](self, "devicesAccessQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSharedInstanceQueue:", v4);

  -[TPSBluetoothChecker devicesAccessQueue](self, "devicesAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__TPSBluetoothChecker_initializeBTManager__block_invoke;
  block[3] = &unk_1EA1DF818;
  block[4] = self;
  dispatch_async(v5, block);

}

void __42__TPSBluetoothChecker_initializeBTManager__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setBluetoothManager:", v2);

}

void __41__TPSBluetoothChecker_devicesAccessQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create(0, v2);
  v1 = (void *)devicesAccessQueue_accessQueue;
  devicesAccessQueue_accessQueue = (uint64_t)v0;

}

- (NSArray)pairedPeers
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  -[TPSBluetoothChecker peersAccessQueue](self, "peersAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__TPSBluetoothChecker_pairedPeers__block_invoke;
  v6[3] = &unk_1EA1DFEF0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __34__TPSBluetoothChecker_pairedPeers__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "centralManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sharedPairingAgent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "retrievePairedPeers");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (BOOL)bluetoothPairedWithTag:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[TPSBluetoothChecker pairedPeers](self, "pairedPeers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend((id)objc_opt_class(), "bluetoothPairedWithTag:withPairedPeers:", v4, v5);

  return (char)self;
}

- (BOOL)bluetoothPairedForProductID:(unsigned int)a3
{
  return -[TPSBluetoothChecker bluetoothPairedForProductID:minimumVersion:](self, "bluetoothPairedForProductID:minimumVersion:", *(_QWORD *)&a3, 0);
}

- (BOOL)bluetoothPairedForProductID:(unsigned int)a3 minimumVersion:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  -[TPSBluetoothChecker pairedDevices](self, "pairedDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend((id)objc_opt_class(), "bluetoothPairedForProductID:minimumVersion:withPairedDevices:", v4, v6, v7);

  return v4;
}

+ (BOOL)bluetoothPairedWithTag:(id)a3 withPairedPeers:(id)a4
{
  id v5;
  id v6;
  id v7;
  char v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v5 = a3;
  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__TPSBluetoothChecker_bluetoothPairedWithTag_withPairedPeers___block_invoke;
  v10[3] = &unk_1EA1E0618;
  v12 = &v13;
  v7 = v5;
  v11 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);
  v8 = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __62__TPSBluetoothChecker_bluetoothPairedWithTag_withPairedPeers___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v6, "hasTag:", *(_QWORD *)(a1 + 32));
    *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }

}

+ (BOOL)bluetoothPairedForProductID:(unsigned int)a3 withPairedDevices:(id)a4
{
  return objc_msgSend(a1, "bluetoothPairedForProductID:minimumVersion:withPairedDevices:", *(_QWORD *)&a3, 0, a4);
}

+ (BOOL)bluetoothPairedForProductID:(unsigned int)a3 minimumVersion:(id)a4 withPairedDevices:(id)a5
{
  uint64_t v6;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v6 = *(_QWORD *)&a3;
  v15[1] = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "numberWithUnsignedInt:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bluetoothPairedForProductIDs:minimumVersion:withPairedDevices:", v12, v10, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13 != 0;
}

uint64_t __85__TPSBluetoothChecker_bluetoothPairedForProductIDs_minimumVersion_withPairedDevices___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  BOOL v15;

  v5 = *(void **)(a1 + 32);
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithUnsignedInt:", objc_msgSend(a2, "productId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "indexOfObject:", v8);

  v10 = *(void **)(a1 + 32);
  v11 = (void *)MEMORY[0x1E0CB37E8];
  v12 = objc_msgSend(v7, "productId");

  objc_msgSend(v11, "numberWithUnsignedInt:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v10, "indexOfObject:", v13);

  if (v9 != 0x7FFFFFFFFFFFFFFFLL && (v14 != 0x7FFFFFFFFFFFFFFFLL ? (v15 = v9 < v14) : (v15 = 1), v15))
    return -1;
  else
    return 1;
}

void __85__TPSBluetoothChecker_bluetoothPairedForProductIDs_minimumVersion_withPairedDevices___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v6;
  __int16 v7;
  unsigned __int16 v8;
  unsigned __int16 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  _DWORD v23[2];
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = objc_msgSend(v6, "vendorId");
  v8 = objc_msgSend(v6, "productId");
  if (v7 == 76)
  {
    v9 = v8;
    v10 = (void *)a1[4];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v10, "containsObject:", v11);

    if ((_DWORD)v10)
    {
      if (a1[5])
      {
        objc_msgSend(v6, "accessoryInfo");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AACPVersionInfo"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)objc_msgSend(v13, "count") >= 0xB)
        {
          objc_msgSend(v13, "objectAtIndexedSubscript:", 10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)objc_msgSend(v14, "length") >= 2)
          {
            if (objc_msgSend(v14, "tps_compareBuildVersionWithString:", a1[5]) != -1)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v9);
              v15 = objc_claimAutoreleasedReturnValue();
              v16 = *(_QWORD *)(a1[6] + 8);
              v17 = *(void **)(v16 + 40);
              *(_QWORD *)(v16 + 40) = v15;

            }
            objc_msgSend(MEMORY[0x1E0DBF3D0], "default");
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              v22 = a1[5];
              v23[0] = 67109634;
              v23[1] = v9;
              v24 = 2112;
              v25 = v14;
              v26 = 2112;
              v27 = v22;
              _os_log_debug_impl(&dword_1DAC2F000, v18, OS_LOG_TYPE_DEBUG, "ProductID: %d, Found version: %@. Required Version: %@", (uint8_t *)v23, 0x1Cu);
            }

          }
        }

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v9);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = *(_QWORD *)(a1[6] + 8);
        v21 = *(void **)(v20 + 40);
        *(_QWORD *)(v20 + 40) = v19;

      }
      *a4 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) != 0;
    }
  }

}

- (void)setBluetoothManager:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothManager, a3);
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
  objc_storeStrong((id *)&self->_centralManager, a3);
}

- (OS_dispatch_queue)peersAccessQueue
{
  return self->_peersAccessQueue;
}

- (void)setPeersAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_peersAccessQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peersAccessQueue, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_bluetoothManager, 0);
}

@end

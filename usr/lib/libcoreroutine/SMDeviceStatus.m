@implementation SMDeviceStatus

void __66__SMDeviceStatus_RTCoreDataTransformable__createWithDeviceStatus___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = objc_alloc(MEMORY[0x1E0D8B930]);
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (int)objc_msgSend(*(id *)(a1 + 32), "batteryRemaining");
  v4 = (int)objc_msgSend(*(id *)(a1 + 32), "cellularStrength");
  objc_msgSend(*(id *)(a1 + 32), "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "initWithIdentifier:batteryRemaining:cellularStrength:date:wifiStrength:", v9, v3, v4, v5, (int)objc_msgSend(*(id *)(a1 + 32), "wifiStrength"));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

@end

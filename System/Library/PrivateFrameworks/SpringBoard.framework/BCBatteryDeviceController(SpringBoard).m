@implementation BCBatteryDeviceController(SpringBoard)

- (id)sb_deviceInternalBattery
{
  id v1;
  id v2;
  uint64_t v3;
  void *i;
  void *v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "connectedDevices");
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(_QWORD *)v8 != v3)
          objc_enumerationMutation(v1);
        v5 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v5, "isInternal", (_QWORD)v7) & 1) != 0)
        {
          v2 = v5;
          goto LABEL_11;
        }
      }
      v2 = (id)objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_11:

  return v2;
}

@end

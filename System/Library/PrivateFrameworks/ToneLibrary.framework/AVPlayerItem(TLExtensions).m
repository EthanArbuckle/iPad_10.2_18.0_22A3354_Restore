@implementation AVPlayerItem(TLExtensions)

- (TLAlertQueuePlayerItemHapticTracks)tl_hapticTracks
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  TLAlertQueuePlayerItemHapticTracks *v18;
  NSObject *v19;
  uint64_t v20;
  void *v22;
  uint64_t v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v1 = a1;
  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "tracks");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  if (!v3)
  {

    v5 = 0;
    goto LABEL_22;
  }
  v4 = v3;
  v22 = v1;
  v5 = 0;
  v6 = 0;
  v7 = *(_QWORD *)v26;
  v8 = *MEMORY[0x1E0C8A7C8];
  v23 = *MEMORY[0x1E0C8A778];
  obj = v2;
  while (2)
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v26 != v7)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
      objc_msgSend(v10, "assetTrack");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "mediaType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", v8);

      if (!v13)
        goto LABEL_16;
      if (objc_msgSend(v11, "hasMediaCharacteristic:", v23))
      {
        v14 = v10;
        v15 = v6;
        v16 = v5;
        if (!v5)
          goto LABEL_14;
      }
      else
      {
        v16 = v5;
        v14 = v5;
        v15 = v10;
        if (!v6)
        {
LABEL_14:
          v17 = v10;
          v16 = v14;
          v6 = v15;
          if (!v15)
          {
LABEL_15:
            v5 = v16;
            goto LABEL_16;
          }
          goto LABEL_12;
        }
      }
      if (!v6)
        goto LABEL_15;
LABEL_12:
      v5 = v16;
      if (v16)
      {

        v2 = obj;
        v1 = v22;
LABEL_19:
        v18 = -[TLAlertQueuePlayerItemHapticTracks initWithHapticPlayerItemTrack:attenuatedHapticPlayerItemTrack:]([TLAlertQueuePlayerItemHapticTracks alloc], "initWithHapticPlayerItemTrack:attenuatedHapticPlayerItemTrack:", v6, v5);
        TLLogPlayback();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v30 = v1;
          v31 = 2114;
          v32 = (uint64_t)v6;
          v33 = 2114;
          v34 = v5;
          _os_log_impl(&dword_1D33D5000, v19, OS_LOG_TYPE_DEFAULT, "Found haptic tracks for %{public}@. hapticPlayerItemTrack = %{public}@, attenuatedHapticPlayerItemTrack = %{public}@.", buf, 0x20u);
        }
        goto LABEL_25;
      }
LABEL_16:

    }
    v2 = obj;
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
    if (v4)
      continue;
    break;
  }

  v1 = v22;
  if (v6)
    goto LABEL_19;
LABEL_22:
  TLLogPlayback();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = objc_msgSend(v2, "count");
    *(_DWORD *)buf = 138543874;
    v30 = v1;
    v31 = 2048;
    v32 = v20;
    v33 = 2114;
    v34 = v2;
    _os_log_impl(&dword_1D33D5000, v19, OS_LOG_TYPE_DEFAULT, "Cannot find any haptic tracks for %{public}@. Available tracks (%lu): %{public}@", buf, 0x20u);
  }
  v6 = 0;
  v18 = 0;
LABEL_25:

  return v18;
}

@end

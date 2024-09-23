@implementation TPAudioRouting

+ (BOOL)deviceSupportsContinuityCamera
{
  return AVGestaltGetBoolAnswer();
}

+ (id)eligibleLagunaDevices:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _QWORD v39[3];

  v39[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0DBD2F0]);
  if (objc_msgSend(v4, "lagunaEnabled")
    && +[TPAudioRouting deviceSupportsContinuityCamera](TPAudioRouting, "deviceSupportsContinuityCamera"))
  {
    objc_msgSend(v3, "frontmostAudioOrVideoCall");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "activeConversationForCall:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "service");
      v8 = objc_msgSend(v4, "lagunaAudioCallsEnabled");
      if (v7 == 3)
        v9 = 1;
      else
        v9 = v8;
      if (v8 && v7 != 3)
        v9 = objc_msgSend(v5, "service") == 2;
      v10 = 0;
      if (v6 && v9)
      {
        objc_msgSend(v3, "neighborhoodActivityConduit");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "activeSplitSessionTV");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v10 = 0;
        }
        else
        {
          v31 = v6;
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:comparator:", 0, 1, &__block_literal_global_8);
          v13 = objc_claimAutoreleasedReturnValue();
          v33 = v3;
          objc_msgSend(v3, "neighborhoodActivityConduit");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "nearbyTVDeviceHandles");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (void *)v13;
          v39[0] = v13;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "sortedArrayUsingDescriptors:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v32 = v5;
          v18 = objc_msgSend(v5, "service");
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v19 = v17;
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v35;
            do
            {
              for (i = 0; i != v21; ++i)
              {
                if (*(_QWORD *)v35 != v22)
                  objc_enumerationMutation(v19);
                v24 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
                objc_msgSend(v24, "capabilities");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = objc_msgSend(v25, "isLagunaCapable");

                if (v26)
                {
                  if (v18 != 2
                    || (objc_msgSend(v24, "capabilities"),
                        v27 = (void *)objc_claimAutoreleasedReturnValue(),
                        v28 = objc_msgSend(v27, "isAudioCallCapable"),
                        v27,
                        v28))
                  {
                    objc_msgSend(v10, "addObject:", v24);
                  }
                }
              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
            }
            while (v21);
          }

          v5 = v32;
          v3 = v33;
          v6 = v31;
        }
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __40__TPAudioRouting_eligibleLagunaDevices___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:options:", v6, 1);
  return v7;
}

@end

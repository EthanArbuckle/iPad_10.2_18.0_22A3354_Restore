@implementation UIStatusBar_Base(Snapshots)

- (void)sb_setEnabledStatusBarPartIdentifiersForStatusBarParts:()Snapshots
{
  char v4;
  id v5;

  if (a3 == 0xFFFF)
  {
    objc_msgSend(a1, "setEnabledPartIdentifiers:", 0);
  }
  else
  {
    v4 = a3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if ((v4 & 1) != 0)
      objc_msgSend(v5, "addObject:", *MEMORY[0x1E0CEC200]);
    if ((v4 & 2) != 0)
      objc_msgSend(v5, "addObject:", *MEMORY[0x1E0CEC210]);
    objc_msgSend(a1, "setEnabledPartIdentifiers:", v5);

  }
}

- (void)sb_setSnapshotOverridesWithTimeEnabled:()Snapshots overriddenDate:
{
  id v6;
  __int128 v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  _OWORD v16[4];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  int v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (sb_setSnapshotOverridesWithTimeEnabled_overriddenDate__onceToken != -1)
    dispatch_once(&sb_setSnapshotOverridesWithTimeEnabled_overriddenDate__onceToken, &__block_literal_global_306);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  memset(v16, 0, sizeof(v16));
  if ((objc_msgSend(a1, "sb_getLocalDataOverrides:", v16) & 1) == 0)
    bzero((char *)&v16[2] + 8, 0xF40uLL);
  *(_QWORD *)&v7 = 0x101010101010101;
  *((_QWORD *)&v7 + 1) = 0x101010101010101;
  *(_OWORD *)((char *)&v16[1] + 14) = v7;
  v16[0] = v7;
  v16[1] = v7;
  BYTE9(v16[0]) = 0;
  if (a3)
  {
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 190057260.0, v16[0], v16[1], v16[2]);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;
    objc_msgSend((id)sb_setSnapshotOverridesWithTimeEnabled_overriddenDate__timeDateFormatter, "stringFromDate:", v8, *(_QWORD *)&v16[0]);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "cStringUsingEncoding:", 4);
    __strlcpy_chk();
    *(_DWORD *)((char *)&v16[2] + 14) |= 1u;
    LOBYTE(v17) = 1;

  }
  BYTE4(v16[0]) = 0;
  *(_DWORD *)((char *)&v16[2] + 14) |= 0x10u;
  objc_msgSend((id)SBApp, "telephonyStateProvider", *(_QWORD *)&v16[0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "subscriptionInfoForSlot:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isProvidingDataConnection") & 1) == 0)
  {
    objc_msgSend(v11, "subscriptionInfoForSlot:", 1);
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v13;
  }
  DWORD2(v44) = objc_msgSend(v12, "maxSignalStrengthBars");
  *(_DWORD *)((char *)&v16[2] + 14) |= 0x4000u;
  v45 = 3;
  v14 = objc_msgSend(v11, "isCellularRadioCapabilityActive");
  v15 = 6;
  if (v14)
    v15 = 70;
  *((_BYTE *)v16 + v15) = 0;
  v46 = 100;
  BYTE12(v17) = 1;
  *(_DWORD *)((char *)&v16[2] + 14) |= 0xC0000u;
  objc_msgSend(a1, "sb_setLocalDataOverrides:", v16);

}

- (uint64_t)sb_setLocalDataOverrides:()Snapshots
{
  BOOL v5;
  _SBStatusBarLocalDataOverridesWrapper *v6;
  uint64_t result;
  _OWORD v8[246];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  memset(v8, 0, 512);
  if (objc_msgSend(a1, "sb_getLocalDataOverrides:", v8))
  {
    if (!a3)
    {
      objc_setAssociatedObject(a1, (const void *)_SBStatusBarAssociatedValueKeyLocalDataOverrides, 0, (void *)1);
      objc_msgSend(a1, "setLocalDataOverrides:", 0);
      return objc_msgSend(a1, "forceUpdateData:", 0);
    }
    v5 = memcmp(a3, v8, 0xF68uLL) != 0;
  }
  else
  {
    v5 = a3 != 0;
    if (!a3)
    {
      objc_setAssociatedObject(a1, (const void *)_SBStatusBarAssociatedValueKeyLocalDataOverrides, 0, (void *)1);
      return objc_msgSend(a1, "setLocalDataOverrides:", 0);
    }
  }
  objc_getAssociatedObject(a1, (const void *)_SBStatusBarAssociatedValueKeyLocalDataOverrides);
  v6 = (_SBStatusBarLocalDataOverridesWrapper *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = objc_alloc_init(_SBStatusBarLocalDataOverridesWrapper);
    objc_setAssociatedObject(a1, (const void *)_SBStatusBarAssociatedValueKeyLocalDataOverrides, v6, (void *)1);
  }
  -[_SBStatusBarLocalDataOverridesWrapper setOverrides:](v6, "setOverrides:", a3);

  result = objc_msgSend(a1, "setLocalDataOverrides:", a3);
  if (v5)
    return objc_msgSend(a1, "forceUpdateData:", 0);
  return result;
}

- (BOOL)sb_getLocalDataOverrides:()Snapshots
{
  void *v4;
  const void *v5;

  objc_getAssociatedObject(a1, (const void *)_SBStatusBarAssociatedValueKeyLocalDataOverrides);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (const void *)objc_msgSend(v4, "overrides");
  if (a3)
  {
    if (v5)
      memcpy(a3, v5, 0xF68uLL);
    else
      bzero(a3, 0xF68uLL);
  }

  return v5 != 0;
}

@end

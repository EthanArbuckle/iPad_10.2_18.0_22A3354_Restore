@implementation DADiagnosticResponder

- (void)enableVolumeHUD:(BOOL)a3
{
  _QWORD block[4];
  BOOL v4;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__DADiagnosticResponder_enableVolumeHUD___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  v4 = a3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __41__DADiagnosticResponder_enableVolumeHUD___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connectedScenes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v9, "_setSystemVolumeHUDEnabled:", *(unsigned __int8 *)(a1 + 32), (_QWORD)v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)setScreenToBrightness:(float)a3 animate:(BOOL)a4
{
  NSObject *v6;
  _QWORD block[4];
  float v8;
  BOOL v9;

  v6 = dispatch_queue_create("com.apple.Diagnostics.brightnessQueue", 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__DADiagnosticResponder_setScreenToBrightness_animate___block_invoke;
  block[3] = &__block_descriptor_37_e5_v8__0l;
  v9 = a4;
  v8 = a3;
  dispatch_async(v6, block);

}

void __55__DADiagnosticResponder_setScreenToBrightness_animate___block_invoke(uint64_t a1)
{
  float v2;
  float v3;
  float v4;
  uint64_t v5;
  float v6;
  dispatch_time_t v7;
  NSObject *v8;
  uint64_t v9;
  float v10;
  dispatch_time_t v11;
  NSObject *v12;
  _QWORD v13[4];
  int v14;
  _QWORD v15[4];
  float v16;
  _QWORD block[4];
  float v18;

  if (*(_BYTE *)(a1 + 36))
  {
    BKSDisplayBrightnessGetCurrent();
    v3 = v2;
    v4 = *(float *)(a1 + 32);
    if (v3 >= v4)
    {
      if (v3 > v4)
      {
        v9 = MEMORY[0x24BDAC760];
        v10 = 0.0002;
        do
        {
          v11 = dispatch_time(0, (uint64_t)(float)(v10 * 1000000000.0));
          dispatch_get_global_queue(-2, 0);
          v12 = objc_claimAutoreleasedReturnValue();
          v15[0] = v9;
          v15[1] = 3221225472;
          v15[2] = __55__DADiagnosticResponder_setScreenToBrightness_animate___block_invoke_4;
          v15[3] = &__block_descriptor_36_e5_v8__0l;
          v16 = v3;
          dispatch_after(v11, v12, v15);

          v10 = v10 + 0.0002;
          v3 = v3 + -0.01;
        }
        while (v3 > *(float *)(a1 + 32));
      }
    }
    else
    {
      v5 = MEMORY[0x24BDAC760];
      v6 = 0.0002;
      do
      {
        v7 = dispatch_time(0, (uint64_t)(float)(v6 * 1000000000.0));
        dispatch_get_global_queue(-2, 0);
        v8 = objc_claimAutoreleasedReturnValue();
        block[0] = v5;
        block[1] = 3221225472;
        block[2] = __55__DADiagnosticResponder_setScreenToBrightness_animate___block_invoke_2;
        block[3] = &__block_descriptor_36_e5_v8__0l;
        v18 = v3;
        dispatch_after(v7, v8, block);

        v6 = v6 + 0.0002;
        v3 = v3 + 0.01;
      }
      while (v3 < *(float *)(a1 + 32));
    }
  }
  else
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __55__DADiagnosticResponder_setScreenToBrightness_animate___block_invoke_6;
    v13[3] = &__block_descriptor_36_e5_v8__0l;
    v14 = *(_DWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], v13);
  }
}

void __55__DADiagnosticResponder_setScreenToBrightness_animate___block_invoke_2(uint64_t a1)
{
  _QWORD block[4];
  int v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__DADiagnosticResponder_setScreenToBrightness_animate___block_invoke_3;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  v2 = *(_DWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __55__DADiagnosticResponder_setScreenToBrightness_animate___block_invoke_3()
{
  return BKSDisplayBrightnessSet();
}

void __55__DADiagnosticResponder_setScreenToBrightness_animate___block_invoke_4(uint64_t a1)
{
  _QWORD block[4];
  int v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__DADiagnosticResponder_setScreenToBrightness_animate___block_invoke_5;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  v2 = *(_DWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __55__DADiagnosticResponder_setScreenToBrightness_animate___block_invoke_5()
{
  return BKSDisplayBrightnessSet();
}

uint64_t __55__DADiagnosticResponder_setScreenToBrightness_animate___block_invoke_6()
{
  return BKSDisplayBrightnessSet();
}

@end

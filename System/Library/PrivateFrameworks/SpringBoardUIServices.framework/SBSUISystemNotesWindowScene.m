@implementation SBSUISystemNotesWindowScene

- (void)takeScreenshotOfDisplays:(id)a3 handler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E0D016A0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __64__SBSUISystemNotesWindowScene_takeScreenshotOfDisplays_handler___block_invoke;
    v14[3] = &unk_1E4C3ED20;
    v15 = v6;
    v9 = a3;
    objc_msgSend(v8, "responderWithHandler:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAB038]), "initWithDisplaysToScreenshot:responder:", v9, v10);

    -[SBSUISystemNotesWindowScene _FBSScene](self, "_FBSScene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sendActions:", v13);

  }
}

void __64__SBSUISystemNotesWindowScene_takeScreenshotOfDisplays_handler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "error");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v2;
  objc_msgSend(v2, "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForSetting:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    v10 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v12, "machPortSendRight");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = v10;
        v17[1] = 3221225472;
        v17[2] = __64__SBSUISystemNotesWindowScene_takeScreenshotOfDisplays_handler___block_invoke_2;
        v17[3] = &unk_1E4C3ECF8;
        v17[4] = v12;
        v18 = v5;
        objc_msgSend(v13, "accessPort:", v17);
        objc_msgSend(v13, "invalidate");

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__SBSUISystemNotesWindowScene_takeScreenshotOfDisplays_handler___block_invoke_2(uint64_t a1, mach_port_t port)
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  IOSurfaceRef v7;

  v7 = IOSurfaceLookupFromMachPort(port);
  objc_msgSend(*(id *)(a1 + 32), "scale");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "_initWithIOSurface:scale:orientation:", v7, 0, v3);
  v5 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "displayIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, v6);

}

@end

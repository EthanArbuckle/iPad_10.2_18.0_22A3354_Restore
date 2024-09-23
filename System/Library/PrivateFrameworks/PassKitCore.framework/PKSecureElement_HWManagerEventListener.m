@implementation PKSecureElement_HWManagerEventListener

- (void)secureElement:(id)a3 didChangeRestrictedMode:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__469;
  v19 = __Block_byref_object_dispose__470;
  v20 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __SharedHardwareManagerEventListenerCopy_block_invoke;
  v14[3] = &unk_1E2ACA470;
  v14[4] = &v15;
  _SharedHardwareManagerEventListenerAccess(0, v14);
  v6 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v21, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "secureElement:didChangeRestrictedMode:", v5, v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v21, 16);
    }
    while (v7);
  }

}

@end

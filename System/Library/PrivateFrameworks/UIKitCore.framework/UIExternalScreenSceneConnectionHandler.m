@implementation UIExternalScreenSceneConnectionHandler

void _UIExternalScreenSceneConnectionHandler_block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (objc_msgSend(v2, "_hostsWindows"))
  {
    v3 = v2;
    if (objc_msgSend((id)UIApp, "isFrontBoard"))
      v4 = objc_msgSend((id)UIApp, "disablesFrontBoardImplicitWindowScenes");
    else
      v4 = 0;
    objc_msgSend(v3, "_screen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIWindowScene _placeholderWindowSceneForScreen:create:](UIWindowScene, "_placeholderWindowSceneForScreen:create:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 && (objc_msgSend((id)UIApp, "isFrontBoard") ^ 1 | v4) == 1)
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      objc_msgSend(v6, "_allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 0, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v13;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v13 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "_setWindowHostingScene:", v3);
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v9);
      }

    }
  }

}

@end

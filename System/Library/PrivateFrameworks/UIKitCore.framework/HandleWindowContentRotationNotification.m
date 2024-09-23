@implementation HandleWindowContentRotationNotification

void __HandleWindowContentRotationNotification_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  char v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", 0x1E1764C60);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (v6)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    objc_opt_class();
    v8 = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0 || (v8 & 1) != 0)
    {
      if ((isKindOfClass & 1) == 0
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        && (objc_msgSend(v3, "isHidden") & 1) == 0
        && objc_msgSend(v3, "_shouldControlAutorotation"))
      {
        objc_msgSend(v4, "objectForKey:", 0x1E1764C80);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "doubleValue");
        v11 = v10;

        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        GetRotationFollowingWindows();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "allObjects", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v19;
          do
          {
            v17 = 0;
            do
            {
              if (*(_QWORD *)v19 != v16)
                objc_enumerationMutation(v13);
              objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v17++), "applicationWindow:didRotateWithOrientation:duration:", v3, v6, v11);
            }
            while (v15 != v17);
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          }
          while (v15);
        }

      }
    }
  }

}

@end

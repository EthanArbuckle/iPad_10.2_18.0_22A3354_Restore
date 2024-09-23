@implementation RUISetupAssistantModalStyle

- (void)applyToObjectModel:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)RUISetupAssistantModalStyle;
  -[RUISetupAssistantStyle applyToObjectModel:](&v24, sel_applyToObjectModel_, v4);
  objc_msgSend(v4, "allPages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v10, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "superview");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v10, "view");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "traitCollection");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "horizontalSizeClass");

          if (v15 == 1)
            v16 = 0.0;
          else
            v16 = 6.0;
          objc_msgSend(v10, "setCustomMargin:", v16);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }
  objc_msgSend(v4, "defaultPages");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "navigationController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIStyle applyToNavigationController:](self, "applyToNavigationController:", v19);

}

@end

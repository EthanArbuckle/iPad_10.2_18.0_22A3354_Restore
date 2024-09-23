@implementation UIView(PGVibrancyEffects)

- (void)PG_updateVibrancyEffectForTintColor
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char v7;
  void *v8;

  objc_msgSend(a1, "tintColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "PG_wantsVibrancyEffect");

  if (v3)
  {
    objc_msgSend(a1, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "compositingFilter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0CD2EA0];
    v7 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CD2EA0]);

    if ((v7 & 1) == 0)
    {
      objc_msgSend(a1, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setCompositingFilter:", v6);

      objc_msgSend(a1, "PG_recursivelyDisallowGroupBlending");
    }
  }
  else
  {
    objc_msgSend(a1, "PG_removeVibrancyEffect");
  }
}

- (void)PG_removeVibrancyEffect
{
  void *v2;
  void *v3;
  int v4;
  id v5;

  objc_msgSend(a1, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "compositingFilter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CD2EA0]);

  if (v4)
  {
    objc_msgSend(a1, "layer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCompositingFilter:", 0);

  }
}

- (void)PG_recursivelyDisallowGroupBlending
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAllowsGroupBlending:", 0);

  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(a1, "subviews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "PG_recursivelyDisallowGroupBlending");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

@end

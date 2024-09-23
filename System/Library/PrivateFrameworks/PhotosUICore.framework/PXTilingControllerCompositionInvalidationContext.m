@implementation PXTilingControllerCompositionInvalidationContext

+ (id)defaultAnimationOptionsForTilingController:(id)a3 withInvalidationContexts:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "originatingTilingController", (_QWORD)v16);
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 != v5)
        {
          objc_msgSend(v11, "animationOptions");
          v13 = objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v14 = (void *)v13;
            goto LABEL_12;
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_12:

  return v14;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p, animationOptions=%@"), objc_opt_class(), self, self->_animationOptions);
}

- (NSObject)animationOptions
{
  return self->_animationOptions;
}

- (void)setAnimationOptions:(id)a3
{
  objc_storeStrong((id *)&self->_animationOptions, a3);
}

- (PXTilingController)originatingTilingController
{
  return self->_originatingTilingController;
}

- (void)setOriginatingTilingController:(id)a3
{
  objc_storeStrong((id *)&self->_originatingTilingController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingTilingController, 0);
  objc_storeStrong((id *)&self->_animationOptions, 0);
}

@end

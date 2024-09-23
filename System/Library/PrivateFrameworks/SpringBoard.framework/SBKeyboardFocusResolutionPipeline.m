@implementation SBKeyboardFocusResolutionPipeline

- (SBKeyboardFocusResolutionPipeline)initWithResolutionStages:(id)a3
{
  id v4;
  SBKeyboardFocusResolutionPipeline *v5;
  uint64_t v6;
  NSArray *stages;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBKeyboardFocusResolutionPipeline;
  v5 = -[SBKeyboardFocusResolutionPipeline init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    stages = v5->_stages;
    v5->_stages = (NSArray *)v6;

  }
  return v5;
}

- (void)generateKeyboardFocusPolicy:(id)a3 resolutionContext:(id)a4
{
  id v6;
  id v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17 = 0;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_stages;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v11)
        objc_enumerationMutation(v8);
      objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12), "resolveKeyboardFocusPolicy:context:stop:", v6, v7, &v17, (_QWORD)v13);
      if (v17)
        break;
      if (v10 == ++v12)
      {
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stages, 0);
}

@end

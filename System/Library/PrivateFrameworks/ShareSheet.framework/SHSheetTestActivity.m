@implementation SHSheetTestActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (id)activityType
{
  return CFSTR("com.apple.SharingDemoAppWatch.DemoAppWatch.log");
}

- (id)activityTitle
{
  return CFSTR("Log");
}

- (id)activityImage
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemImageNamed:withConfiguration:", CFSTR("pencil"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = self->_activityItems;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v6);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v8 = v7;
LABEL_8:
          v9 = v8;
          objc_msgSend(v8, "registeredTypeIdentifiers");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "firstObject");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v15[0] = MEMORY[0x1E0C809B0];
          v15[1] = 3221225472;
          v15[2] = __38__SHSheetTestActivity_performActivity__block_invoke;
          v15[3] = &unk_1E4002E30;
          v15[4] = v7;
          objc_msgSend(v9, "loadItemForTypeIdentifier:options:completionHandler:", v11, 0, v15);

          goto LABEL_13;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v7, "item");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v7, "item");
            v8 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_8;
          }
        }
        NSLog(CFSTR("%@"), v7);
LABEL_13:
        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }

  -[UIActivity activityDidFinish:](self, "activityDidFinish:", 1);
}

void __38__SHSheetTestActivity_performActivity__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    a2 = *(_QWORD *)(a1 + 32);
  NSLog(CFSTR("%@"), a2);
}

- (NSArray)activityItems
{
  return self->_activityItems;
}

- (void)setActivityItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityItems, 0);
}

@end

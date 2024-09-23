@implementation STBackgroundActivitiesStatusDomainVisualDescriptorTransformer

- (STBackgroundActivitiesStatusDomainVisualDescriptorTransformer)init
{
  void *v3;
  STBackgroundActivitiesStatusDomainVisualDescriptorTransformer *v4;

  objc_msgSend(MEMORY[0x1E0DB0890], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[STBackgroundActivitiesStatusDomainVisualDescriptorTransformer initWithBackgroundActivityManager:](self, "initWithBackgroundActivityManager:", v3);

  return v4;
}

- (STBackgroundActivitiesStatusDomainVisualDescriptorTransformer)initWithBackgroundActivityManager:(id)a3
{
  id v5;
  STBackgroundActivitiesStatusDomainVisualDescriptorTransformer *v6;
  STBackgroundActivitiesStatusDomainVisualDescriptorTransformer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STBackgroundActivitiesStatusDomainVisualDescriptorTransformer;
  v6 = -[STBackgroundActivitiesStatusDomainVisualDescriptorTransformer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_backgroundActivityManager, a3);

  return v7;
}

- (id)transformedDataForData:(id)a3
{
  id v4;
  char isKindOfClass;
  id v6;
  void *v7;
  void *v8;
  STBackgroundActivityManager *backgroundActivityManager;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  STBackgroundActivitiesStatusDomainVisualDescriptorTransformer *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = v4;
  v7 = v6;
  v8 = v6;
  if ((isKindOfClass & 1) != 0)
  {
    v8 = (void *)objc_msgSend(v6, "mutableCopy");
    v36 = self;
    backgroundActivityManager = self->_backgroundActivityManager;
    objc_msgSend(v7, "activeBackgroundActivities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[STBackgroundActivityManager validBackgroundActivitiesForBackgroundActivities:](backgroundActivityManager, "validBackgroundActivitiesForBackgroundActivities:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    objc_msgSend(v7, "attributions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v46 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_msgSend(v17, "backgroundActivityIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v11, "containsObject:", v18);

          if ((v19 & 1) == 0)
            objc_msgSend(v8, "removeAttribution:", v17);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      }
      while (v14);
    }

    objc_msgSend(v8, "activeBackgroundActivities");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v42 != v23)
            objc_enumerationMutation(v20);
          v25 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j);
          objc_msgSend(v7, "visualDescriptorForBackgroundActivityWithIdentifier:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v26)
          {
            -[STBackgroundActivityManager visualDescriptorForBackgroundActivityWithIdentifier:](v36->_backgroundActivityManager, "visualDescriptorForBackgroundActivityWithIdentifier:", v25);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setVisualDescriptor:forBackgroundActivityWithIdentifier:", v27, v25);

          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
      }
      while (v22);
    }
    objc_msgSend(v7, "backgroundActivitiesWithVisualDescriptors");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "mutableCopy");

    objc_msgSend(v29, "minusSet:", v20);
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v30 = v29;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v38;
      do
      {
        for (k = 0; k != v32; ++k)
        {
          if (*(_QWORD *)v38 != v33)
            objc_enumerationMutation(v30);
          objc_msgSend(v8, "setVisualDescriptor:forBackgroundActivityWithIdentifier:", 0, *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * k));
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
      }
      while (v32);
    }

  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundActivityManager, 0);
}

@end

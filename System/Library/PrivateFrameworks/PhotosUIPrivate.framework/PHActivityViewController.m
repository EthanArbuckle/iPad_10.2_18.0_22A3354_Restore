@implementation PHActivityViewController

- (PHActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4
{
  id v6;
  id v7;
  PHActivityViewController *v8;
  PHActivityViewController *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PHActivityViewController;
  v8 = -[PHActivityViewController initWithActivityItems:applicationActivities:](&v21, sel_initWithActivityItems_applicationActivities_, v6, v7);
  v9 = v8;
  if (v8)
  {
    -[PHActivityViewController _setPHActivityItems:](v8, "_setPHActivityItems:", v6);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v14);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v15, "setDataSource:", v9, (_QWORD)v17);
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v12);
    }

  }
  return v9;
}

- (void)_updateActivityItems:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[PHActivityViewController _setPHActivityItems:](self, "_setPHActivityItems:", v4);
  v5.receiver = self;
  v5.super_class = (Class)PHActivityViewController;
  -[PHActivityViewController _updateActivityItems:](&v5, sel__updateActivityItems_, v4);

}

- (NSArray)_PHActivityItems
{
  return self->__PHActivityItems;
}

- (void)_setPHActivityItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1328);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__PHActivityItems, 0);
}

@end

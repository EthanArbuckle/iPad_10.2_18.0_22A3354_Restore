@implementation RAPTransitDirectionsListViewController

+ (Class)dataSourceClass
{
  return (Class)objc_opt_class(RAPTransitDirectionsStepsListDataSource, a2);
}

- (RAPTransitDirectionsListViewController)init
{
  RAPTransitDirectionsListViewController *v2;
  RAPTransitDirectionsListViewController *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RAPTransitDirectionsListViewController;
  v2 = -[TransitDirectionsListViewController init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController dataSource](v2, "dataSource"));
    objc_msgSend(v4, "setOptions:", 0);
    objc_msgSend(v4, "setRapDelegate:", v3);

  }
  return v3;
}

- (void)_prepareForUpdatedRoute
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  _BYTE v31[128];

  v29.receiver = self;
  v29.super_class = (Class)RAPTransitDirectionsListViewController;
  -[TransitDirectionsListViewController _prepareForUpdatedRoute](&v29, "_prepareForUpdatedRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController dataSource](self, "dataSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_transitDirectionsListItems"));

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "footerItems"));
        v11 = objc_msgSend(v10, "count");

        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "footerItems"));
          v13 = objc_msgSend(v12, "mutableCopy");

          v23 = 0u;
          v24 = 0u;
          v21 = 0u;
          v22 = 0u;
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "footerItems"));
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v22;
            do
            {
              for (j = 0; j != v16; j = (char *)j + 1)
              {
                if (*(_QWORD *)v22 != v17)
                  objc_enumerationMutation(v14);
                v19 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)j);
                if (objc_msgSend(v19, "type") == (id)13 || objc_msgSend(v19, "type") == (id)7)
                  objc_msgSend(v13, "removeObject:", v19);
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
            }
            while (v16);
          }

          objc_msgSend(v9, "setFooterItems:", v13);
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v6);
  }

}

- (BOOL)_shouldReloadForReferenceDateUpdates
{
  return 0;
}

- (BOOL)RAPTransitDirectionsStepsList:(id)a3 shouldShowFlagForStep:(id)a4 listItem:(id)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTransitDirectionsListViewController instructionDelegate](self, "instructionDelegate"));
  LOBYTE(self) = objc_msgSend(v9, "viewController:shouldShowFlagForStep:listItem:", self, v8, v7);

  return (char)self;
}

- (RAPDirectionsStepsTableViewControllerDelegate)instructionDelegate
{
  return (RAPDirectionsStepsTableViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_instructionDelegate);
}

- (void)setInstructionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_instructionDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_instructionDelegate);
}

@end

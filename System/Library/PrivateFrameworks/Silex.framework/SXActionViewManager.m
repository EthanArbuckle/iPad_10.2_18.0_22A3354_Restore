@implementation SXActionViewManager

- (SXActionViewManager)initWithViewControllerPresenting:(id)a3
{
  id v5;
  SXActionViewManager *v6;
  SXActionViewManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXActionViewManager;
  v6 = -[SXActionViewManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_viewControllerPresenter, a3);

  return v7;
}

- (void)presentActivityGroup:(id)a3 action:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 completion:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  SXActionViewManager *v40;
  id v41;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[5];
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v53 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v43 = a7;
  if (v15)
  {
    objc_msgSend(v15, "activities");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)v18;
      objc_msgSend(v15, "activities");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

      if (v16)
      {
        if (v21)
        {
          v40 = self;
          v41 = v16;
          v22 = (void *)MEMORY[0x24BDF67F0];
          objc_msgSend(v15, "title");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "alertControllerWithTitle:message:preferredStyle:", v23, 0, 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v50 = 0u;
          v51 = 0u;
          v48 = 0u;
          v49 = 0u;
          v42 = v15;
          objc_msgSend(v15, "activities");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
          if (v26)
          {
            v27 = v26;
            v28 = *(_QWORD *)v49;
            do
            {
              for (i = 0; i != v27; ++i)
              {
                if (*(_QWORD *)v49 != v28)
                  objc_enumerationMutation(v25);
                v30 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
                v31 = (void *)MEMORY[0x24BDF67E8];
                objc_msgSend(v30, "label");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v46[0] = MEMORY[0x24BDAC760];
                v46[1] = 3221225472;
                v46[2] = __84__SXActionViewManager_presentActivityGroup_action_sourceView_sourceRect_completion___block_invoke;
                v46[3] = &unk_24D688FA8;
                v33 = v43;
                v46[4] = v30;
                v47 = v33;
                objc_msgSend(v31, "actionWithTitle:style:handler:", v32, 0, v46);
                v34 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v24, "addAction:", v34);
              }
              v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
            }
            while (v27);
          }

          v35 = (void *)MEMORY[0x24BDF67E8];
          SXBundle();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_24D68E0F8, 0);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v44[0] = MEMORY[0x24BDAC760];
          v44[1] = 3221225472;
          v44[2] = __84__SXActionViewManager_presentActivityGroup_action_sourceView_sourceRect_completion___block_invoke_2;
          v44[3] = &unk_24D688FD0;
          v45 = v43;
          objc_msgSend(v35, "actionWithTitle:style:handler:", v37, 1, v44);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "addAction:", v38);
          -[SXActionViewManager viewControllerPresenter](v40, "viewControllerPresenter");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "presentViewController:animated:sourceView:sourceRect:", v24, 1, v17, x, y, width, height);

          v16 = v41;
          v15 = v42;
        }
      }
    }
  }

}

uint64_t __84__SXActionViewManager_presentActivityGroup_action_sourceView_sourceRect_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __84__SXActionViewManager_presentActivityGroup_action_sourceView_sourceRect_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

- (SXViewControllerPresenting)viewControllerPresenter
{
  return self->_viewControllerPresenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllerPresenter, 0);
}

@end

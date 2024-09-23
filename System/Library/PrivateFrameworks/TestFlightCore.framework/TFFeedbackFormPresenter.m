@implementation TFFeedbackFormPresenter

- (TFFeedbackFormPresenter)initWithForm:(id)a3 dataContainer:(id)a4 session:(id)a5
{
  id v9;
  id v10;
  id v11;
  TFFeedbackFormPresenter *v12;
  TFFeedbackFormPresenter *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TFFeedbackFormPresenter;
  v12 = -[TFFeedbackFormPresenter init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_form, a3);
    objc_storeStrong((id *)&v13->_dataContainer, a4);
    -[TFFeedbackDataContainer setObserver:](v13->_dataContainer, "setObserver:", v13);
    objc_storeStrong((id *)&v13->_session, a5);
  }

  return v13;
}

- (void)prepareViewForForm
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  uint64_t v28;
  void *v29;
  TFFeedbackFormPresenter *v30;
  id obj;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  -[TFFeedbackFormPresenter presenterView](self, "presenterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFFeedbackFormPresenter form](self, "form");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNavigationItemTitle:", v5);

  v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v30 = self;
  -[TFFeedbackFormPresenter form](self, "form");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "entryGroups");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v8;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v9)
  {
    v10 = v9;
    v32 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v42 != v32)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        objc_msgSend(v12, "entries");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v38;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v38 != v16)
                objc_enumerationMutation(v13);
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * j), "type"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "addObject:", v18);

            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
          }
          while (v15);
        }

        if (objc_msgSend(v12, "isToggleable"))
        {
          objc_msgSend(v12, "groupToggleEntry");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            v20 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v12, "groupToggleEntry");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "type"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v22);

          }
        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v10);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v23 = v6;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v34;
    do
    {
      for (k = 0; k != v25; ++k)
      {
        if (*(_QWORD *)v34 != v26)
          objc_enumerationMutation(v23);
        v28 = objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * k), "unsignedIntegerValue");
        -[TFFeedbackFormPresenter presenterView](v30, "presenterView");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "prepareForEntryType:", v28);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    }
    while (v25);
  }

}

- (unint64_t)numberOfEntryGroupsInForm
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[TFFeedbackFormPresenter form](self, "form");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entryGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (unint64_t)numberOfVisibleItemsInGroupAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;

  -[TFFeedbackFormPresenter form](self, "form");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entryGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[TFFeedbackFormPresenter dataContainer](self, "dataContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isGroupWithIdentifierIncluded:", v9);

  v11 = objc_msgSend(v7, "numberOfVisibleItemsForIncludeState:", v10);
  return v11;
}

- (id)visibleEntryAtGroupIndex:(int64_t)a3 entryIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[TFFeedbackFormPresenter form](self, "form");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entryGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "visibleEntryForIndex:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)headerTextForGroupAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[TFFeedbackFormPresenter form](self, "form");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entryGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "headerText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)headerTextLinkMapForGroupAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[TFFeedbackFormPresenter form](self, "form");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entryGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "headerTextLinkMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)footerTextForGroupAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[TFFeedbackFormPresenter form](self, "form");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entryGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "footerText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)footerTextLinkMapForGroupAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[TFFeedbackFormPresenter form](self, "form");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entryGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "footerTextLinkMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_indicesOfGroupsWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[TFFeedbackFormPresenter form](self, "form");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entryGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__TFFeedbackFormPresenter__indicesOfGroupsWithIdentifiers___block_invoke;
  v10[3] = &unk_24D7948E8;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "indexesOfObjectsPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __59__TFFeedbackFormPresenter__indicesOfGroupsWithIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (id)_indexPathsOfVisibleEntriesWithIdentifiers:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[TFFeedbackFormPresenter form](self, "form");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entryGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __70__TFFeedbackFormPresenter__indexPathsOfVisibleEntriesWithIdentifiers___block_invoke;
  v13[3] = &unk_24D794910;
  v13[4] = self;
  v14 = v4;
  v8 = v5;
  v15 = v8;
  v9 = v4;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v13);

  v10 = v15;
  v11 = v8;

  return v11;
}

void __70__TFFeedbackFormPresenter__indexPathsOfVisibleEntriesWithIdentifiers___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = objc_msgSend(*(id *)(a1 + 32), "numberOfVisibleItemsInGroupAtIndex:", a3);
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
    {
      objc_msgSend(v5, "visibleEntryForIndex:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(void **)(a1 + 40);
      objc_msgSend(v9, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v10) = objc_msgSend(v10, "containsObject:", v11);

      if ((_DWORD)v10)
      {
        v14[0] = a3;
        v14[1] = i;
        v12 = *(void **)(a1 + 48);
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathWithIndexes:length:", v14, 2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v13);

      }
    }
  }

}

- (void)feedbackDataContainer:(id)a3 didUpdateValuesForGroupIdentifiers:(id)a4 entryIdentifiers:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a4;
  -[TFFeedbackFormPresenter _indexPathsOfVisibleEntriesWithIdentifiers:](self, "_indexPathsOfVisibleEntriesWithIdentifiers:", a5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[TFFeedbackFormPresenter presenterView](self, "presenterView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadEntriesAtIndexPaths:", v11);

  -[TFFeedbackFormPresenter _indicesOfGroupsWithIdentifiers:](self, "_indicesOfGroupsWithIdentifiers:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[TFFeedbackFormPresenter presenterView](self, "presenterView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reloadEntryGroupsAtIndices:", v9);

}

- (void)didUpdateEntry:(id)a3 toGroupInclusionBool:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  BOOL v11;

  v6 = a3;
  -[TFFeedbackFormPresenter dataContainer](self, "dataContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __63__TFFeedbackFormPresenter_didUpdateEntry_toGroupInclusionBool___block_invoke;
  v9[3] = &unk_24D794938;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  objc_msgSend(v7, "performBatchUpdates:", v9);

}

void __63__TFFeedbackFormPresenter_didUpdateEntry_toGroupInclusionBool___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGroupInclusionForIdentifier:toValue:", v5, *(unsigned __int8 *)(a1 + 40));

}

- (void)didUpdateEntry:(id)a3 toString:(id)a4 editInProgress:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[TFFeedbackFormPresenter dataContainer](self, "dataContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __66__TFFeedbackFormPresenter_didUpdateEntry_toString_editInProgress___block_invoke;
  v13[3] = &unk_24D794718;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "performBatchUpdates:suppressingNotifications:", v13, v5);

}

void __66__TFFeedbackFormPresenter_didUpdateEntry_toString_editInProgress___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStringForIdentifier:toValue:", v5, *(_QWORD *)(a1 + 40));

}

- (void)presenterViewDidInitiateFeedbackSubmission:(id)a3
{
  void *v4;
  id v5;

  -[TFFeedbackFormPresenter presenterView](self, "presenterView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showSubmitButtonForSubmissionPendingState:", 1);

  -[TFFeedbackFormPresenter session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "submitFeedbackForActiveFormViewController");

}

- (void)presenterViewDidCancelFeedbackSubmission:(id)a3
{
  id v3;

  -[TFFeedbackFormPresenter session](self, "session", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelFeedbackForActiveFormViewController");

}

- (void)showSubmissionFailureWithMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[TFFeedbackFormPresenter presenterView](self, "presenterView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "showSubmitButtonForSubmissionPendingState:", 0);

  -[TFFeedbackFormPresenter presenterView](self, "presenterView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  TFLocalizedString(CFSTR("ALERT_SUBMIT_FAILURE_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "showErrorAlertWithTitle:message:", v6, v4);

}

- (TFFeedbackFormPresenterView)presenterView
{
  return (TFFeedbackFormPresenterView *)objc_loadWeakRetained((id *)&self->_presenterView);
}

- (void)setPresenterView:(id)a3
{
  objc_storeWeak((id *)&self->_presenterView, a3);
}

- (TFFeedbackSession)session
{
  return self->_session;
}

- (TFFeedbackForm)form
{
  return self->_form;
}

- (TFFeedbackDataContainer)dataContainer
{
  return self->_dataContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataContainer, 0);
  objc_storeStrong((id *)&self->_form, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_destroyWeak((id *)&self->_presenterView);
}

@end

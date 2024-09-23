@implementation SPUIContactViewController

- (SPUIContactViewController)init
{
  SPUIContactViewController *v2;
  SPUIContactViewController *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SPUIContactViewController;
  v2 = -[SPUIViewController init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SPUIViewController searchResultViewController](v2, "searchResultViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShouldAnimateUpdates:", 1);

  }
  return v3;
}

- (void)updateWithContactIdentifier:(id)a3 preferredBundleIdentifiers:(id)a4
{
  id v7;
  id v8;
  NSArray *v9;
  NSArray *preferredBundleIdentifiers;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_storeStrong((id *)&self->_contactIdentifier, a3);
  v8 = a4;
  v9 = (NSArray *)objc_msgSend(v8, "copy");

  preferredBundleIdentifiers = self->_preferredBundleIdentifiers;
  self->_preferredBundleIdentifiers = v9;

  -[SPUIViewController activateViewController:animate:](self, "activateViewController:animate:", 0, 0);
  +[SPUISearchModel sharedGeneralInstance](SPUISearchModel, "sharedGeneralInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activate");
  objc_msgSend(v11, "updateWithQueryContext:", 0);
  -[SPUIViewController searchResultViewController](self, "searchResultViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "searchAgentClearedResults:", v11);

  -[SPUIContactViewController backgroundColorView](self, "backgroundColorView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setColor:", 0);

  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x24BEB0270], "searchEntityWithContactIdentifier:fromSuggestion:", v7, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPreferredBundleIDs:", self->_preferredBundleIdentifiers);
    v15 = objc_alloc(MEMORY[0x24BEB0280]);
    objc_msgSend(v14, "tokenText");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v16)
      v18 = (const __CFString *)v16;
    else
      v18 = &stru_24F9D6A70;
    v19 = (void *)objc_msgSend(v15, "initWithSearchString:", v18);

    v29[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setSearchEntities:", v20);

    objc_msgSend(v11, "updateWithQueryContext:", v19);
    objc_msgSend(v14, "tokenText");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUIViewController searchResultViewController](self, "searchResultViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setQueryString:", v21);

    if (!-[SPUIContactViewController isBackgroundColorViewHidden](self, "isBackgroundColorViewHidden"))
    {
      v23 = (void *)objc_opt_new();
      v28 = v7;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v28, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setContactIdentifiers:", v24);

      v25 = (void *)objc_opt_new();
      objc_msgSend(v25, "setImage:", v23);
      -[SPUIContactViewController backgroundColorView](self, "backgroundColorView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v26)
      {
        v26 = (void *)objc_opt_new();
        objc_msgSend(v26, "setShowsPlaceholderPlatterView:", 0);
        objc_msgSend(v26, "setDelegate:", self);
        -[SPUIContactViewController view](self, "view");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "insertSubview:atIndex:", v26, 0);

        objc_msgSend(MEMORY[0x24BE85220], "fillContainerWithView:", v26);
        -[SPUIContactViewController setBackgroundColorView:](self, "setBackgroundColorView:", v26);
      }
      objc_msgSend(v26, "setColor:", v25);
      objc_msgSend(v14, "setEntityBackgroundColor:", v25);

    }
  }

}

- (void)setContactIdentifier:(id)a3
{
  -[SPUIContactViewController updateWithContactIdentifier:preferredBundleIdentifiers:](self, "updateWithContactIdentifier:preferredBundleIdentifiers:", a3, 0);
}

- (void)willUpdateFromResultsWithHighlightedResult:(id)a3 viewController:(id)a4
{
  id v5;

  -[SPUIViewController searchResultViewController](self, "searchResultViewController", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SPUIViewController activateViewController:animate:](self, "activateViewController:animate:", v5, 1);

}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (BOOL)isBackgroundColorViewHidden
{
  return self->_isBackgroundColorViewHidden;
}

- (void)setIsBackgroundColorViewHidden:(BOOL)a3
{
  self->_isBackgroundColorViewHidden = a3;
}

- (NSArray)preferredBundleIdentifiers
{
  return self->_preferredBundleIdentifiers;
}

- (SearchUIBackgroundColorView)backgroundColorView
{
  return (SearchUIBackgroundColorView *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setBackgroundColorView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1016);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColorView, 0);
  objc_storeStrong((id *)&self->_preferredBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

@end

@implementation SUStorePageProtocol

- (id)_initCommon
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUStorePageProtocol;
  return -[SUStorePageProtocol init](&v3, sel_init);
}

- (SUStorePageProtocol)init
{
  SUStorePageProtocol *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  NSArray *allowedOrientations;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = -[SUStorePageProtocol _initCommon](self, "_initCommon");
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceIdiom");

    v5 = objc_alloc(MEMORY[0x24BDBCE30]);
    if (v4 == 1)
      v6 = objc_msgSend(v5, "initWithObjects:", CFSTR("portrait"), CFSTR("portrait-upside-down"), CFSTR("landscape-left"), CFSTR("landscape-right"), 0);
    else
      v6 = objc_msgSend(v5, "initWithObjects:", CFSTR("portrait"), 0, v9, v10, v11);
    allowedOrientations = v2->_allowedOrientations;
    v2->_allowedOrientations = (NSArray *)v6;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "_initCommon");
  v6 = -[NSArray copyWithZone:](self->_allowedOrientations, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[NSString copyWithZone:](self->_copyright, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  v10 = -[NSArray copyWithZone:](self->_expectedClientIdentifiers, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  v12 = -[NSNumber copyWithZone:](self->_focusedItemIdentifier, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  v14 = -[NSArray copyWithZone:](self->_navigationButtons, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v14;

  v16 = -[NSArray copyWithZone:](self->_navigationMenus, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v16;

  v18 = -[SSURLRequestProperties copyWithZone:](self->_overlayBackgroundURLRequestProperties, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v18;

  v20 = -[NSArray copyWithZone:](self->_navigationHistoryItems, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v20;

  v22 = -[NSString copyWithZone:](self->_rootSectionIdentifier, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v22;

  *(_BYTE *)(v5 + 80) = self->_shouldDisplayInOverlay;
  *(_BYTE *)(v5 + 81) = self->_shouldExcludeFromNavigationHistory;
  *(_BYTE *)(v5 + 82) = self->_shouldReplaceRootViewController;
  return (id)v5;
}

- (id)navigationButtonForLocation:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_navigationButtons;
  v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "buttonLocation", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)navigationMenuForLocation:(int64_t)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_navigationMenus;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "location", (_QWORD)v12) == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)overlayBackgroundURLRequest
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BEC8C68]), "initWithRequestProperties:", self->_overlayBackgroundURLRequestProperties);
}

- (void)setOverlayBackgroundURLRequest:(id)a3
{
  SSURLRequestProperties *v4;
  SSURLRequestProperties *overlayBackgroundURLRequestProperties;

  objc_msgSend(a3, "requestProperties");
  v4 = (SSURLRequestProperties *)objc_claimAutoreleasedReturnValue();
  overlayBackgroundURLRequestProperties = self->_overlayBackgroundURLRequestProperties;
  self->_overlayBackgroundURLRequestProperties = v4;

}

- (void)setValuesFromStorePageDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  NSArray *navigationButtons;
  void *v13;
  NSArray *v14;
  NSArray *navigationHistoryItems;
  void *v16;
  NSArray *v17;
  NSArray *navigationMenus;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;

  v30 = a3;
  objc_msgSend(v30, "objectForKey:", CFSTR("protocol"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
    v4 = v30;
  objc_msgSend(v4, "objectForKey:", CFSTR("allowed-orientations"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SUStorePageProtocol setAllowedOrientations:](self, "setAllowedOrientations:", v5);
  objc_msgSend(v4, "objectForKey:", CFSTR("copyright"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SUStorePageProtocol setCopyright:](self, "setCopyright:", v6);
  objc_msgSend(v4, "objectForKey:", CFSTR("store-client-applications"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SUStorePageProtocol setExpectedClientIdentifiers:](self, "setExpectedClientIdentifiers:", v7);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v7, 0);
      -[SUStorePageProtocol setExpectedClientIdentifiers:](self, "setExpectedClientIdentifiers:", v8);

    }
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("selected-track-item-id"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SUStorePageProtocol setFocusedItemIdentifier:](self, "setFocusedItemIdentifier:", v9);
  objc_msgSend(v4, "objectForKey:", CFSTR("navigation-buttons"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = -[SUStorePageProtocol _newNavigationButtonsFromArray:](self, "_newNavigationButtonsFromArray:", v10);
    navigationButtons = self->_navigationButtons;
    self->_navigationButtons = v11;

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("navigation-stack"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = -[SUStorePageProtocol _newNavigationHistoryItemsFromArray:](self, "_newNavigationHistoryItemsFromArray:", v13);
    navigationHistoryItems = self->_navigationHistoryItems;
    self->_navigationHistoryItems = v14;

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("popovers"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = -[SUStorePageProtocol _newNavigationMenusFromArray:](self, "_newNavigationMenusFromArray:", v16);
    navigationMenus = self->_navigationMenus;
    self->_navigationMenus = v17;

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("selected-footer-section"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SUStorePageProtocol setRootSectionIdentifier:](self, "setRootSectionIdentifier:", v19);
  objc_msgSend(v4, "objectForKey:", CFSTR("replace-footer-section"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v21 = objc_msgSend(v20, "BOOLValue");
  else
    v21 = 0;
  -[SUStorePageProtocol setShouldReplaceRootViewController:](self, "setShouldReplaceRootViewController:", v21);
  objc_msgSend(v4, "objectForKey:", CFSTR("overlay-parent-url"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v22);
    if (v23)
    {
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2008]), "initWithURL:", v23);
      -[SUStorePageProtocol setOverlayBackgroundURLRequestProperties:](self, "setOverlayBackgroundURLRequestProperties:", v24);

    }
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("show-in-overlay"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v26 = objc_msgSend(v25, "BOOLValue");
    else
      v26 = 0;
    -[SUStorePageProtocol setShouldDisplayInOverlay:](self, "setShouldDisplayInOverlay:", v26);
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("exclude-from-navigation-history"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(v30, "objectForKey:", CFSTR("exclude-from-navigation-history"));
    v28 = objc_claimAutoreleasedReturnValue();

    v27 = (void *)v28;
  }
  if (v27)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v29 = objc_msgSend(v27, "BOOLValue");
    else
      v29 = 0;
    -[SUStorePageProtocol setShouldExcludeFromNavigationHistory:](self, "setShouldExcludeFromNavigationHistory:", v29);
  }

}

- (id)_newNavigationButtonsFromArray:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SUProtocolButton *v11;
  SUProtocolButton *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = [SUProtocolButton alloc];
          v12 = -[SUProtocolButton initWithButtonDictionary:](v11, "initWithButtonDictionary:", v10, (_QWORD)v14);
          if (v12)
            objc_msgSend(v4, "addObject:", v12);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_newNavigationHistoryItemsFromArray:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SUNavigationHistoryItem *v11;
  SUNavigationHistoryItem *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = [SUNavigationHistoryItem alloc];
          v12 = -[SUNavigationHistoryItem initWithDictionary:](v11, "initWithDictionary:", v10, (_QWORD)v14);
          if (v12)
            objc_msgSend(v4, "addObject:", v12);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_newNavigationMenusFromArray:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SUNavigationMenu *v11;
  SUNavigationMenu *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = [SUNavigationMenu alloc];
        v12 = -[SUNavigationMenu initWithDictionary:](v11, "initWithDictionary:", v10, (_QWORD)v14);
        if (v12)
          objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  if (!objc_msgSend(v4, "count"))
  {

    v4 = 0;
  }

  return v4;
}

- (NSArray)allowedOrientations
{
  return self->_allowedOrientations;
}

- (void)setAllowedOrientations:(id)a3
{
  objc_storeStrong((id *)&self->_allowedOrientations, a3);
}

- (NSString)copyright
{
  return self->_copyright;
}

- (void)setCopyright:(id)a3
{
  objc_storeStrong((id *)&self->_copyright, a3);
}

- (NSArray)expectedClientIdentifiers
{
  return self->_expectedClientIdentifiers;
}

- (void)setExpectedClientIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)focusedItemIdentifier
{
  return self->_focusedItemIdentifier;
}

- (void)setFocusedItemIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_focusedItemIdentifier, a3);
}

- (NSArray)navigationButtons
{
  return self->_navigationButtons;
}

- (void)setNavigationButtons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)navigationHistoryItems
{
  return self->_navigationHistoryItems;
}

- (void)setNavigationHistoryItems:(id)a3
{
  objc_storeStrong((id *)&self->_navigationHistoryItems, a3);
}

- (NSArray)navigationMenus
{
  return self->_navigationMenus;
}

- (void)setNavigationMenus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (SSURLRequestProperties)overlayBackgroundURLRequestProperties
{
  return self->_overlayBackgroundURLRequestProperties;
}

- (void)setOverlayBackgroundURLRequestProperties:(id)a3
{
  objc_storeStrong((id *)&self->_overlayBackgroundURLRequestProperties, a3);
}

- (NSString)rootSectionIdentifier
{
  return self->_rootSectionIdentifier;
}

- (void)setRootSectionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_rootSectionIdentifier, a3);
}

- (BOOL)shouldDisplayInOverlay
{
  return self->_shouldDisplayInOverlay;
}

- (void)setShouldDisplayInOverlay:(BOOL)a3
{
  self->_shouldDisplayInOverlay = a3;
}

- (BOOL)shouldExcludeFromNavigationHistory
{
  return self->_shouldExcludeFromNavigationHistory;
}

- (void)setShouldExcludeFromNavigationHistory:(BOOL)a3
{
  self->_shouldExcludeFromNavigationHistory = a3;
}

- (BOOL)shouldReplaceRootViewController
{
  return self->_shouldReplaceRootViewController;
}

- (void)setShouldReplaceRootViewController:(BOOL)a3
{
  self->_shouldReplaceRootViewController = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_overlayBackgroundURLRequestProperties, 0);
  objc_storeStrong((id *)&self->_navigationMenus, 0);
  objc_storeStrong((id *)&self->_navigationHistoryItems, 0);
  objc_storeStrong((id *)&self->_navigationButtons, 0);
  objc_storeStrong((id *)&self->_focusedItemIdentifier, 0);
  objc_storeStrong((id *)&self->_expectedClientIdentifiers, 0);
  objc_storeStrong((id *)&self->_copyright, 0);
  objc_storeStrong((id *)&self->_allowedOrientations, 0);
}

@end

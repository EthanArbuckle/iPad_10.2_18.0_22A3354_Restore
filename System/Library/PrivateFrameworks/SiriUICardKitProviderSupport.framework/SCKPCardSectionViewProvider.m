@implementation SCKPCardSectionViewProvider

- (SCKPCardSectionViewProvider)initWithCard:(id)a3
{
  id v5;
  SCKPCardSectionViewProvider *v6;
  SCKPCardSectionViewProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCKPCardSectionViewProvider;
  v6 = -[SCKPCardSectionViewProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_card, a3);

  return v7;
}

- (NSArray)viewConfigurations
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  SCKPMessageCardSectionViewController *v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  SCKPMessageCardSectionViewController *v17;
  SCKPCardSectionViewProvider *v18;
  void *v19;
  id v20;
  void *v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[CRCard cardSections](self->_card, "cardSections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v27)
  {
    v5 = *(_QWORD *)v29;
    v6 = 0x24E048000uLL;
    v26 = *(_QWORD *)v29;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v29 != v5)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v7);
        objc_msgSend(v8, "backingCardSection", v26);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        objc_msgSend(v8, "backingCardSection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((isKindOfClass & 1) != 0)
        {
          v12 = (SCKPMessageCardSectionViewController *)objc_msgSend(objc_alloc(*(Class *)(v6 + 3016)), "initWithMediaRemoteControlCardSection:", v11);
          goto LABEL_8;
        }
        objc_opt_class();
        v15 = objc_opt_isKindOfClass();

        if ((v15 & 1) == 0 || -[SCKPCardSectionViewProvider isShortcutCard:](self, "isShortcutCard:", self->_card))
          goto LABEL_12;
        objc_msgSend(v8, "backingCardSection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "messageStatus") != 1)
        {
          objc_msgSend(v11, "audioMessageURL");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {

          }
          else
          {
            objc_msgSend(v11, "messageAttachment");
            v12 = (SCKPMessageCardSectionViewController *)objc_claimAutoreleasedReturnValue();

            if (!v12)
              goto LABEL_8;
          }
        }
        v17 = [SCKPMessageCardSectionViewController alloc];
        -[CRCard interactions](self->_card, "interactions");
        v18 = self;
        v19 = v4;
        v20 = v3;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "anyObject");
        v22 = v6;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[SCKPMessageCardSectionViewController initWithMessageCardSection:interaction:](v17, "initWithMessageCardSection:interaction:", v11, v23);

        v6 = v22;
        v3 = v20;
        v4 = v19;
        self = v18;
        v5 = v26;
LABEL_8:

        if (v12)
        {
          v13 = objc_alloc_init(MEMORY[0x24BE15458]);
          objc_msgSend(v13, "setCardSection:", v8);
          objc_msgSend(v13, "setCardSectionViewController:", v12);
          -[SCKPMessageCardSectionViewController view](v12, "view");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setCardSectionView:", v14);

          objc_msgSend(v3, "addObject:", v13);
        }
LABEL_12:
        ++v7;
      }
      while (v27 != v7);
      v24 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      v27 = v24;
    }
    while (v24);
  }

  return (NSArray *)v3;
}

- (unint64_t)displayPriorityForCardSection:(id)a3
{
  return 2;
}

- (NSString)providerIdentifier
{
  return (NSString *)CFSTR("com.apple.cards.SiriUICardKitProvider");
}

- (BOOL)isShortcutCard:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  objc_msgSend(a3, "interactions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "intent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v7 = (objc_opt_isKindOfClass() & 1) != 0
    || objc_msgSend(v6, "executionContext") == 2
    || objc_msgSend(v6, "executionContext") == 9;

  return v7;
}

- (CRCard)card
{
  return self->_card;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewConfigurations, 0);
  objc_storeStrong((id *)&self->_card, 0);
}

@end

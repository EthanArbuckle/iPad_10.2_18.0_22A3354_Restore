@implementation _SFPBButtonItem

- (_SFPBButtonItem)initWithFacade:(id)a3
{
  id v4;
  _SFPBButtonItem *v5;
  void *v6;
  _SFPBButtonItemAppearance *v7;
  void *v8;
  _SFPBButtonItemAppearance *v9;
  _SFPBCommandButtonItem *v10;
  _SFPBContactButtonItem *v11;
  _SFPBCoreSpotlightButtonItem *v12;
  _SFPBWatchListButtonItem *v13;
  _SFPBAppAutoShortcutsButtonItem *v14;
  _SFPBSportsFollowButtonItem *v15;
  _SFPBPlayWatchListItemButtonItem *v16;
  _SFPBPlayAudioButtonItem *v17;
  _SFPBStoreButtonItem *v18;
  _SFPBButtonItem *v19;

  v4 = a3;
  v5 = -[_SFPBButtonItem init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "buttonAppearance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_SFPBButtonItemAppearance alloc];
      objc_msgSend(v4, "buttonAppearance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_SFPBButtonItemAppearance initWithFacade:](v7, "initWithFacade:", v8);
      -[_SFPBButtonItem setButtonAppearance:](v5, "setButtonAppearance:", v9);

    }
    if (objc_msgSend(v4, "hasUniqueId"))
      -[_SFPBButtonItem setUniqueId:](v5, "setUniqueId:", objc_msgSend(v4, "uniqueId"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[_SFPBCommandButtonItem initWithFacade:]([_SFPBCommandButtonItem alloc], "initWithFacade:", v4);
      -[_SFPBButtonItem setCommandButtonItem:](v5, "setCommandButtonItem:", v10);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[_SFPBContactButtonItem initWithFacade:]([_SFPBContactButtonItem alloc], "initWithFacade:", v4);
      -[_SFPBButtonItem setContactButtonItem:](v5, "setContactButtonItem:", v11);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[_SFPBCoreSpotlightButtonItem initWithFacade:]([_SFPBCoreSpotlightButtonItem alloc], "initWithFacade:", v4);
      -[_SFPBButtonItem setCoreSpotlightButtonItem:](v5, "setCoreSpotlightButtonItem:", v12);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[_SFPBWatchListButtonItem initWithFacade:]([_SFPBWatchListButtonItem alloc], "initWithFacade:", v4);
      -[_SFPBButtonItem setWatchListButtonItem:](v5, "setWatchListButtonItem:", v13);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = -[_SFPBAppAutoShortcutsButtonItem initWithFacade:]([_SFPBAppAutoShortcutsButtonItem alloc], "initWithFacade:", v4);
      -[_SFPBButtonItem setAppActionsButtonItem:](v5, "setAppActionsButtonItem:", v14);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[_SFPBSportsFollowButtonItem initWithFacade:]([_SFPBSportsFollowButtonItem alloc], "initWithFacade:", v4);
      -[_SFPBButtonItem setSportsFollowButtonItem:](v5, "setSportsFollowButtonItem:", v15);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = -[_SFPBPlayWatchListItemButtonItem initWithFacade:]([_SFPBPlayWatchListItemButtonItem alloc], "initWithFacade:", v4);
      -[_SFPBButtonItem setPlayWatchListItemButtonItem:](v5, "setPlayWatchListItemButtonItem:", v16);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[_SFPBPlayAudioButtonItem initWithFacade:]([_SFPBPlayAudioButtonItem alloc], "initWithFacade:", v4);
      -[_SFPBButtonItem setPlayAudioButtonItem:](v5, "setPlayAudioButtonItem:", v17);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = -[_SFPBStoreButtonItem initWithFacade:]([_SFPBStoreButtonItem alloc], "initWithFacade:", v4);
      -[_SFPBButtonItem setStoreButtonItem:](v5, "setStoreButtonItem:", v18);

    }
    v19 = v5;
  }

  return v5;
}

- (void)setCommandButtonItem:(id)a3
{
  _SFPBCommandButtonItem *v4;
  _SFPBContactButtonItem *contactButtonItem;
  _SFPBCoreSpotlightButtonItem *coreSpotlightButtonItem;
  _SFPBWatchListButtonItem *watchListButtonItem;
  _SFPBAppAutoShortcutsButtonItem *appActionsButtonItem;
  _SFPBSportsFollowButtonItem *sportsFollowButtonItem;
  _SFPBPlayWatchListItemButtonItem *playWatchListItemButtonItem;
  _SFPBPlayAudioButtonItem *playAudioButtonItem;
  _SFPBStoreButtonItem *storeButtonItem;
  _SFPBCommandButtonItem *commandButtonItem;

  v4 = (_SFPBCommandButtonItem *)a3;
  contactButtonItem = self->_contactButtonItem;
  self->_contactButtonItem = 0;

  coreSpotlightButtonItem = self->_coreSpotlightButtonItem;
  self->_coreSpotlightButtonItem = 0;

  watchListButtonItem = self->_watchListButtonItem;
  self->_watchListButtonItem = 0;

  appActionsButtonItem = self->_appActionsButtonItem;
  self->_appActionsButtonItem = 0;

  sportsFollowButtonItem = self->_sportsFollowButtonItem;
  self->_sportsFollowButtonItem = 0;

  playWatchListItemButtonItem = self->_playWatchListItemButtonItem;
  self->_playWatchListItemButtonItem = 0;

  playAudioButtonItem = self->_playAudioButtonItem;
  self->_playAudioButtonItem = 0;

  storeButtonItem = self->_storeButtonItem;
  self->_storeButtonItem = 0;

  self->_whichValue = v4 != 0;
  commandButtonItem = self->_commandButtonItem;
  self->_commandButtonItem = v4;

}

- (_SFPBCommandButtonItem)commandButtonItem
{
  if (self->_whichValue == 1)
    return self->_commandButtonItem;
  else
    return (_SFPBCommandButtonItem *)0;
}

- (void)setContactButtonItem:(id)a3
{
  _SFPBContactButtonItem *v4;
  _SFPBCommandButtonItem *commandButtonItem;
  _SFPBCoreSpotlightButtonItem *coreSpotlightButtonItem;
  _SFPBWatchListButtonItem *watchListButtonItem;
  _SFPBAppAutoShortcutsButtonItem *appActionsButtonItem;
  _SFPBSportsFollowButtonItem *sportsFollowButtonItem;
  _SFPBPlayWatchListItemButtonItem *playWatchListItemButtonItem;
  _SFPBPlayAudioButtonItem *playAudioButtonItem;
  _SFPBStoreButtonItem *storeButtonItem;
  _SFPBContactButtonItem *contactButtonItem;

  v4 = (_SFPBContactButtonItem *)a3;
  commandButtonItem = self->_commandButtonItem;
  self->_commandButtonItem = 0;

  coreSpotlightButtonItem = self->_coreSpotlightButtonItem;
  self->_coreSpotlightButtonItem = 0;

  watchListButtonItem = self->_watchListButtonItem;
  self->_watchListButtonItem = 0;

  appActionsButtonItem = self->_appActionsButtonItem;
  self->_appActionsButtonItem = 0;

  sportsFollowButtonItem = self->_sportsFollowButtonItem;
  self->_sportsFollowButtonItem = 0;

  playWatchListItemButtonItem = self->_playWatchListItemButtonItem;
  self->_playWatchListItemButtonItem = 0;

  playAudioButtonItem = self->_playAudioButtonItem;
  self->_playAudioButtonItem = 0;

  storeButtonItem = self->_storeButtonItem;
  self->_storeButtonItem = 0;

  self->_whichValue = 2 * (v4 != 0);
  contactButtonItem = self->_contactButtonItem;
  self->_contactButtonItem = v4;

}

- (_SFPBContactButtonItem)contactButtonItem
{
  if (self->_whichValue == 2)
    return self->_contactButtonItem;
  else
    return (_SFPBContactButtonItem *)0;
}

- (void)setCoreSpotlightButtonItem:(id)a3
{
  _SFPBCoreSpotlightButtonItem *v4;
  _SFPBCommandButtonItem *commandButtonItem;
  _SFPBContactButtonItem *contactButtonItem;
  _SFPBWatchListButtonItem *watchListButtonItem;
  _SFPBAppAutoShortcutsButtonItem *appActionsButtonItem;
  _SFPBSportsFollowButtonItem *sportsFollowButtonItem;
  _SFPBPlayWatchListItemButtonItem *playWatchListItemButtonItem;
  _SFPBPlayAudioButtonItem *playAudioButtonItem;
  _SFPBStoreButtonItem *storeButtonItem;
  unint64_t v13;
  _SFPBCoreSpotlightButtonItem *coreSpotlightButtonItem;

  v4 = (_SFPBCoreSpotlightButtonItem *)a3;
  commandButtonItem = self->_commandButtonItem;
  self->_commandButtonItem = 0;

  contactButtonItem = self->_contactButtonItem;
  self->_contactButtonItem = 0;

  watchListButtonItem = self->_watchListButtonItem;
  self->_watchListButtonItem = 0;

  appActionsButtonItem = self->_appActionsButtonItem;
  self->_appActionsButtonItem = 0;

  sportsFollowButtonItem = self->_sportsFollowButtonItem;
  self->_sportsFollowButtonItem = 0;

  playWatchListItemButtonItem = self->_playWatchListItemButtonItem;
  self->_playWatchListItemButtonItem = 0;

  playAudioButtonItem = self->_playAudioButtonItem;
  self->_playAudioButtonItem = 0;

  storeButtonItem = self->_storeButtonItem;
  self->_storeButtonItem = 0;

  v13 = 3;
  if (!v4)
    v13 = 0;
  self->_whichValue = v13;
  coreSpotlightButtonItem = self->_coreSpotlightButtonItem;
  self->_coreSpotlightButtonItem = v4;

}

- (_SFPBCoreSpotlightButtonItem)coreSpotlightButtonItem
{
  if (self->_whichValue == 3)
    return self->_coreSpotlightButtonItem;
  else
    return (_SFPBCoreSpotlightButtonItem *)0;
}

- (void)setWatchListButtonItem:(id)a3
{
  _SFPBWatchListButtonItem *v4;
  _SFPBCommandButtonItem *commandButtonItem;
  _SFPBContactButtonItem *contactButtonItem;
  _SFPBCoreSpotlightButtonItem *coreSpotlightButtonItem;
  _SFPBAppAutoShortcutsButtonItem *appActionsButtonItem;
  _SFPBSportsFollowButtonItem *sportsFollowButtonItem;
  _SFPBPlayWatchListItemButtonItem *playWatchListItemButtonItem;
  _SFPBPlayAudioButtonItem *playAudioButtonItem;
  _SFPBStoreButtonItem *storeButtonItem;
  _SFPBWatchListButtonItem *watchListButtonItem;

  v4 = (_SFPBWatchListButtonItem *)a3;
  commandButtonItem = self->_commandButtonItem;
  self->_commandButtonItem = 0;

  contactButtonItem = self->_contactButtonItem;
  self->_contactButtonItem = 0;

  coreSpotlightButtonItem = self->_coreSpotlightButtonItem;
  self->_coreSpotlightButtonItem = 0;

  appActionsButtonItem = self->_appActionsButtonItem;
  self->_appActionsButtonItem = 0;

  sportsFollowButtonItem = self->_sportsFollowButtonItem;
  self->_sportsFollowButtonItem = 0;

  playWatchListItemButtonItem = self->_playWatchListItemButtonItem;
  self->_playWatchListItemButtonItem = 0;

  playAudioButtonItem = self->_playAudioButtonItem;
  self->_playAudioButtonItem = 0;

  storeButtonItem = self->_storeButtonItem;
  self->_storeButtonItem = 0;

  self->_whichValue = 4 * (v4 != 0);
  watchListButtonItem = self->_watchListButtonItem;
  self->_watchListButtonItem = v4;

}

- (_SFPBWatchListButtonItem)watchListButtonItem
{
  if (self->_whichValue == 4)
    return self->_watchListButtonItem;
  else
    return (_SFPBWatchListButtonItem *)0;
}

- (void)setAppActionsButtonItem:(id)a3
{
  _SFPBAppAutoShortcutsButtonItem *v4;
  _SFPBCommandButtonItem *commandButtonItem;
  _SFPBContactButtonItem *contactButtonItem;
  _SFPBCoreSpotlightButtonItem *coreSpotlightButtonItem;
  _SFPBWatchListButtonItem *watchListButtonItem;
  _SFPBSportsFollowButtonItem *sportsFollowButtonItem;
  _SFPBPlayWatchListItemButtonItem *playWatchListItemButtonItem;
  _SFPBPlayAudioButtonItem *playAudioButtonItem;
  _SFPBStoreButtonItem *storeButtonItem;
  unint64_t v13;
  _SFPBAppAutoShortcutsButtonItem *appActionsButtonItem;

  v4 = (_SFPBAppAutoShortcutsButtonItem *)a3;
  commandButtonItem = self->_commandButtonItem;
  self->_commandButtonItem = 0;

  contactButtonItem = self->_contactButtonItem;
  self->_contactButtonItem = 0;

  coreSpotlightButtonItem = self->_coreSpotlightButtonItem;
  self->_coreSpotlightButtonItem = 0;

  watchListButtonItem = self->_watchListButtonItem;
  self->_watchListButtonItem = 0;

  sportsFollowButtonItem = self->_sportsFollowButtonItem;
  self->_sportsFollowButtonItem = 0;

  playWatchListItemButtonItem = self->_playWatchListItemButtonItem;
  self->_playWatchListItemButtonItem = 0;

  playAudioButtonItem = self->_playAudioButtonItem;
  self->_playAudioButtonItem = 0;

  storeButtonItem = self->_storeButtonItem;
  self->_storeButtonItem = 0;

  v13 = 5;
  if (!v4)
    v13 = 0;
  self->_whichValue = v13;
  appActionsButtonItem = self->_appActionsButtonItem;
  self->_appActionsButtonItem = v4;

}

- (_SFPBAppAutoShortcutsButtonItem)appActionsButtonItem
{
  if (self->_whichValue == 5)
    return self->_appActionsButtonItem;
  else
    return (_SFPBAppAutoShortcutsButtonItem *)0;
}

- (void)setSportsFollowButtonItem:(id)a3
{
  _SFPBSportsFollowButtonItem *v4;
  _SFPBCommandButtonItem *commandButtonItem;
  _SFPBContactButtonItem *contactButtonItem;
  _SFPBCoreSpotlightButtonItem *coreSpotlightButtonItem;
  _SFPBWatchListButtonItem *watchListButtonItem;
  _SFPBAppAutoShortcutsButtonItem *appActionsButtonItem;
  _SFPBPlayWatchListItemButtonItem *playWatchListItemButtonItem;
  _SFPBPlayAudioButtonItem *playAudioButtonItem;
  _SFPBStoreButtonItem *storeButtonItem;
  unint64_t v13;
  _SFPBSportsFollowButtonItem *sportsFollowButtonItem;

  v4 = (_SFPBSportsFollowButtonItem *)a3;
  commandButtonItem = self->_commandButtonItem;
  self->_commandButtonItem = 0;

  contactButtonItem = self->_contactButtonItem;
  self->_contactButtonItem = 0;

  coreSpotlightButtonItem = self->_coreSpotlightButtonItem;
  self->_coreSpotlightButtonItem = 0;

  watchListButtonItem = self->_watchListButtonItem;
  self->_watchListButtonItem = 0;

  appActionsButtonItem = self->_appActionsButtonItem;
  self->_appActionsButtonItem = 0;

  playWatchListItemButtonItem = self->_playWatchListItemButtonItem;
  self->_playWatchListItemButtonItem = 0;

  playAudioButtonItem = self->_playAudioButtonItem;
  self->_playAudioButtonItem = 0;

  storeButtonItem = self->_storeButtonItem;
  self->_storeButtonItem = 0;

  v13 = 6;
  if (!v4)
    v13 = 0;
  self->_whichValue = v13;
  sportsFollowButtonItem = self->_sportsFollowButtonItem;
  self->_sportsFollowButtonItem = v4;

}

- (_SFPBSportsFollowButtonItem)sportsFollowButtonItem
{
  if (self->_whichValue == 6)
    return self->_sportsFollowButtonItem;
  else
    return (_SFPBSportsFollowButtonItem *)0;
}

- (void)setPlayWatchListItemButtonItem:(id)a3
{
  _SFPBPlayWatchListItemButtonItem *v4;
  _SFPBCommandButtonItem *commandButtonItem;
  _SFPBContactButtonItem *contactButtonItem;
  _SFPBCoreSpotlightButtonItem *coreSpotlightButtonItem;
  _SFPBWatchListButtonItem *watchListButtonItem;
  _SFPBAppAutoShortcutsButtonItem *appActionsButtonItem;
  _SFPBSportsFollowButtonItem *sportsFollowButtonItem;
  _SFPBPlayAudioButtonItem *playAudioButtonItem;
  _SFPBStoreButtonItem *storeButtonItem;
  unint64_t v13;
  _SFPBPlayWatchListItemButtonItem *playWatchListItemButtonItem;

  v4 = (_SFPBPlayWatchListItemButtonItem *)a3;
  commandButtonItem = self->_commandButtonItem;
  self->_commandButtonItem = 0;

  contactButtonItem = self->_contactButtonItem;
  self->_contactButtonItem = 0;

  coreSpotlightButtonItem = self->_coreSpotlightButtonItem;
  self->_coreSpotlightButtonItem = 0;

  watchListButtonItem = self->_watchListButtonItem;
  self->_watchListButtonItem = 0;

  appActionsButtonItem = self->_appActionsButtonItem;
  self->_appActionsButtonItem = 0;

  sportsFollowButtonItem = self->_sportsFollowButtonItem;
  self->_sportsFollowButtonItem = 0;

  playAudioButtonItem = self->_playAudioButtonItem;
  self->_playAudioButtonItem = 0;

  storeButtonItem = self->_storeButtonItem;
  self->_storeButtonItem = 0;

  v13 = 7;
  if (!v4)
    v13 = 0;
  self->_whichValue = v13;
  playWatchListItemButtonItem = self->_playWatchListItemButtonItem;
  self->_playWatchListItemButtonItem = v4;

}

- (_SFPBPlayWatchListItemButtonItem)playWatchListItemButtonItem
{
  if (self->_whichValue == 7)
    return self->_playWatchListItemButtonItem;
  else
    return (_SFPBPlayWatchListItemButtonItem *)0;
}

- (void)setPlayAudioButtonItem:(id)a3
{
  _SFPBPlayAudioButtonItem *v4;
  _SFPBCommandButtonItem *commandButtonItem;
  _SFPBContactButtonItem *contactButtonItem;
  _SFPBCoreSpotlightButtonItem *coreSpotlightButtonItem;
  _SFPBWatchListButtonItem *watchListButtonItem;
  _SFPBAppAutoShortcutsButtonItem *appActionsButtonItem;
  _SFPBSportsFollowButtonItem *sportsFollowButtonItem;
  _SFPBPlayWatchListItemButtonItem *playWatchListItemButtonItem;
  _SFPBStoreButtonItem *storeButtonItem;
  _SFPBPlayAudioButtonItem *playAudioButtonItem;

  v4 = (_SFPBPlayAudioButtonItem *)a3;
  commandButtonItem = self->_commandButtonItem;
  self->_commandButtonItem = 0;

  contactButtonItem = self->_contactButtonItem;
  self->_contactButtonItem = 0;

  coreSpotlightButtonItem = self->_coreSpotlightButtonItem;
  self->_coreSpotlightButtonItem = 0;

  watchListButtonItem = self->_watchListButtonItem;
  self->_watchListButtonItem = 0;

  appActionsButtonItem = self->_appActionsButtonItem;
  self->_appActionsButtonItem = 0;

  sportsFollowButtonItem = self->_sportsFollowButtonItem;
  self->_sportsFollowButtonItem = 0;

  playWatchListItemButtonItem = self->_playWatchListItemButtonItem;
  self->_playWatchListItemButtonItem = 0;

  storeButtonItem = self->_storeButtonItem;
  self->_storeButtonItem = 0;

  self->_whichValue = 8 * (v4 != 0);
  playAudioButtonItem = self->_playAudioButtonItem;
  self->_playAudioButtonItem = v4;

}

- (_SFPBPlayAudioButtonItem)playAudioButtonItem
{
  if (self->_whichValue == 8)
    return self->_playAudioButtonItem;
  else
    return (_SFPBPlayAudioButtonItem *)0;
}

- (void)setStoreButtonItem:(id)a3
{
  _SFPBStoreButtonItem *v4;
  _SFPBCommandButtonItem *commandButtonItem;
  _SFPBContactButtonItem *contactButtonItem;
  _SFPBCoreSpotlightButtonItem *coreSpotlightButtonItem;
  _SFPBWatchListButtonItem *watchListButtonItem;
  _SFPBAppAutoShortcutsButtonItem *appActionsButtonItem;
  _SFPBSportsFollowButtonItem *sportsFollowButtonItem;
  _SFPBPlayWatchListItemButtonItem *playWatchListItemButtonItem;
  _SFPBPlayAudioButtonItem *playAudioButtonItem;
  unint64_t v13;
  _SFPBStoreButtonItem *storeButtonItem;

  v4 = (_SFPBStoreButtonItem *)a3;
  commandButtonItem = self->_commandButtonItem;
  self->_commandButtonItem = 0;

  contactButtonItem = self->_contactButtonItem;
  self->_contactButtonItem = 0;

  coreSpotlightButtonItem = self->_coreSpotlightButtonItem;
  self->_coreSpotlightButtonItem = 0;

  watchListButtonItem = self->_watchListButtonItem;
  self->_watchListButtonItem = 0;

  appActionsButtonItem = self->_appActionsButtonItem;
  self->_appActionsButtonItem = 0;

  sportsFollowButtonItem = self->_sportsFollowButtonItem;
  self->_sportsFollowButtonItem = 0;

  playWatchListItemButtonItem = self->_playWatchListItemButtonItem;
  self->_playWatchListItemButtonItem = 0;

  playAudioButtonItem = self->_playAudioButtonItem;
  self->_playAudioButtonItem = 0;

  v13 = 9;
  if (!v4)
    v13 = 0;
  self->_whichValue = v13;
  storeButtonItem = self->_storeButtonItem;
  self->_storeButtonItem = v4;

}

- (_SFPBStoreButtonItem)storeButtonItem
{
  if (self->_whichValue == 9)
    return self->_storeButtonItem;
  else
    return (_SFPBStoreButtonItem *)0;
}

- (void)setButtonAppearance:(id)a3
{
  objc_storeStrong((id *)&self->_buttonAppearance, a3);
}

- (void)setUniqueId:(unint64_t)a3
{
  self->_uniqueId = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBButtonItemReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  id v16;

  v16 = a3;
  -[_SFPBButtonItem commandButtonItem](self, "commandButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  -[_SFPBButtonItem contactButtonItem](self, "contactButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  -[_SFPBButtonItem coreSpotlightButtonItem](self, "coreSpotlightButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

  -[_SFPBButtonItem watchListButtonItem](self, "watchListButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    PBDataWriterWriteSubmessage();

  -[_SFPBButtonItem appActionsButtonItem](self, "appActionsButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    PBDataWriterWriteSubmessage();

  -[_SFPBButtonItem sportsFollowButtonItem](self, "sportsFollowButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    PBDataWriterWriteSubmessage();

  -[_SFPBButtonItem playWatchListItemButtonItem](self, "playWatchListItemButtonItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    PBDataWriterWriteSubmessage();

  -[_SFPBButtonItem playAudioButtonItem](self, "playAudioButtonItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    PBDataWriterWriteSubmessage();

  -[_SFPBButtonItem storeButtonItem](self, "storeButtonItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    PBDataWriterWriteSubmessage();

  -[_SFPBButtonItem buttonAppearance](self, "buttonAppearance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    PBDataWriterWriteSubmessage();

  v14 = -[_SFPBButtonItem uniqueId](self, "uniqueId");
  v15 = v16;
  if (v14)
  {
    PBDataWriterWriteUint64Field();
    v15 = v16;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  BOOL v57;
  unint64_t uniqueId;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_52;
  -[_SFPBButtonItem commandButtonItem](self, "commandButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commandButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBButtonItem commandButtonItem](self, "commandButtonItem");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBButtonItem commandButtonItem](self, "commandButtonItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "commandButtonItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_52;
  }
  else
  {

  }
  -[_SFPBButtonItem contactButtonItem](self, "contactButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBButtonItem contactButtonItem](self, "contactButtonItem");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBButtonItem contactButtonItem](self, "contactButtonItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contactButtonItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_52;
  }
  else
  {

  }
  -[_SFPBButtonItem coreSpotlightButtonItem](self, "coreSpotlightButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coreSpotlightButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBButtonItem coreSpotlightButtonItem](self, "coreSpotlightButtonItem");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBButtonItem coreSpotlightButtonItem](self, "coreSpotlightButtonItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coreSpotlightButtonItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_52;
  }
  else
  {

  }
  -[_SFPBButtonItem watchListButtonItem](self, "watchListButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "watchListButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBButtonItem watchListButtonItem](self, "watchListButtonItem");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_SFPBButtonItem watchListButtonItem](self, "watchListButtonItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "watchListButtonItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_52;
  }
  else
  {

  }
  -[_SFPBButtonItem appActionsButtonItem](self, "appActionsButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appActionsButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBButtonItem appActionsButtonItem](self, "appActionsButtonItem");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_SFPBButtonItem appActionsButtonItem](self, "appActionsButtonItem");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appActionsButtonItem");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_52;
  }
  else
  {

  }
  -[_SFPBButtonItem sportsFollowButtonItem](self, "sportsFollowButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sportsFollowButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBButtonItem sportsFollowButtonItem](self, "sportsFollowButtonItem");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_SFPBButtonItem sportsFollowButtonItem](self, "sportsFollowButtonItem");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sportsFollowButtonItem");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_52;
  }
  else
  {

  }
  -[_SFPBButtonItem playWatchListItemButtonItem](self, "playWatchListItemButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playWatchListItemButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBButtonItem playWatchListItemButtonItem](self, "playWatchListItemButtonItem");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[_SFPBButtonItem playWatchListItemButtonItem](self, "playWatchListItemButtonItem");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playWatchListItemButtonItem");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_52;
  }
  else
  {

  }
  -[_SFPBButtonItem playAudioButtonItem](self, "playAudioButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playAudioButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBButtonItem playAudioButtonItem](self, "playAudioButtonItem");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    -[_SFPBButtonItem playAudioButtonItem](self, "playAudioButtonItem");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playAudioButtonItem");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_52;
  }
  else
  {

  }
  -[_SFPBButtonItem storeButtonItem](self, "storeButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storeButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBButtonItem storeButtonItem](self, "storeButtonItem");
  v47 = objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = (void *)v47;
    -[_SFPBButtonItem storeButtonItem](self, "storeButtonItem");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "storeButtonItem");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v49, "isEqual:", v50);

    if (!v51)
      goto LABEL_52;
  }
  else
  {

  }
  -[_SFPBButtonItem buttonAppearance](self, "buttonAppearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buttonAppearance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBButtonItem buttonAppearance](self, "buttonAppearance");
    v52 = objc_claimAutoreleasedReturnValue();
    if (!v52)
    {

LABEL_55:
      uniqueId = self->_uniqueId;
      v57 = uniqueId == objc_msgSend(v4, "uniqueId");
      goto LABEL_53;
    }
    v53 = (void *)v52;
    -[_SFPBButtonItem buttonAppearance](self, "buttonAppearance");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "buttonAppearance");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v54, "isEqual:", v55);

    if (v56)
      goto LABEL_55;
  }
  else
  {
LABEL_51:

  }
LABEL_52:
  v57 = 0;
LABEL_53:

  return v57;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v3 = -[_SFPBCommandButtonItem hash](self->_commandButtonItem, "hash");
  v4 = -[_SFPBContactButtonItem hash](self->_contactButtonItem, "hash");
  v5 = -[_SFPBCoreSpotlightButtonItem hash](self->_coreSpotlightButtonItem, "hash");
  v6 = -[_SFPBWatchListButtonItem hash](self->_watchListButtonItem, "hash");
  v7 = -[_SFPBAppAutoShortcutsButtonItem hash](self->_appActionsButtonItem, "hash");
  v8 = -[_SFPBSportsFollowButtonItem hash](self->_sportsFollowButtonItem, "hash");
  v9 = -[_SFPBPlayWatchListItemButtonItem hash](self->_playWatchListItemButtonItem, "hash");
  v10 = -[_SFPBPlayAudioButtonItem hash](self->_playAudioButtonItem, "hash");
  v11 = -[_SFPBStoreButtonItem hash](self->_storeButtonItem, "hash");
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[_SFPBButtonItemAppearance hash](self->_buttonAppearance, "hash") ^ (2654435761u * self->_uniqueId);
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_appActionsButtonItem)
  {
    -[_SFPBButtonItem appActionsButtonItem](self, "appActionsButtonItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("appActionsButtonItem"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("appActionsButtonItem"));

    }
  }
  if (self->_buttonAppearance)
  {
    -[_SFPBButtonItem buttonAppearance](self, "buttonAppearance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("buttonAppearance"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("buttonAppearance"));

    }
  }
  if (self->_commandButtonItem)
  {
    -[_SFPBButtonItem commandButtonItem](self, "commandButtonItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("commandButtonItem"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("commandButtonItem"));

    }
  }
  if (self->_contactButtonItem)
  {
    -[_SFPBButtonItem contactButtonItem](self, "contactButtonItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("contactButtonItem"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("contactButtonItem"));

    }
  }
  if (self->_coreSpotlightButtonItem)
  {
    -[_SFPBButtonItem coreSpotlightButtonItem](self, "coreSpotlightButtonItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("coreSpotlightButtonItem"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("coreSpotlightButtonItem"));

    }
  }
  if (self->_playAudioButtonItem)
  {
    -[_SFPBButtonItem playAudioButtonItem](self, "playAudioButtonItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("playAudioButtonItem"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("playAudioButtonItem"));

    }
  }
  if (self->_playWatchListItemButtonItem)
  {
    -[_SFPBButtonItem playWatchListItemButtonItem](self, "playWatchListItemButtonItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("playWatchListItemButtonItem"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("playWatchListItemButtonItem"));

    }
  }
  if (self->_sportsFollowButtonItem)
  {
    -[_SFPBButtonItem sportsFollowButtonItem](self, "sportsFollowButtonItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("sportsFollowButtonItem"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("sportsFollowButtonItem"));

    }
  }
  if (self->_storeButtonItem)
  {
    -[_SFPBButtonItem storeButtonItem](self, "storeButtonItem");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("storeButtonItem"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("storeButtonItem"));

    }
  }
  if (self->_uniqueId)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[_SFPBButtonItem uniqueId](self, "uniqueId"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("uniqueId"));

  }
  if (self->_watchListButtonItem)
  {
    -[_SFPBButtonItem watchListButtonItem](self, "watchListButtonItem");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "dictionaryRepresentation");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("watchListButtonItem"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("watchListButtonItem"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBButtonItem dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (_SFPBButtonItem)initWithJSON:(id)a3
{
  void *v4;
  _SFPBButtonItem *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[_SFPBButtonItem initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBButtonItem)initWithDictionary:(id)a3
{
  id v4;
  _SFPBButtonItem *v5;
  uint64_t v6;
  _SFPBCommandButtonItem *v7;
  uint64_t v8;
  _SFPBContactButtonItem *v9;
  uint64_t v10;
  _SFPBCoreSpotlightButtonItem *v11;
  void *v12;
  _SFPBWatchListButtonItem *v13;
  void *v14;
  _SFPBAppAutoShortcutsButtonItem *v15;
  void *v16;
  _SFPBSportsFollowButtonItem *v17;
  void *v18;
  _SFPBPlayWatchListItemButtonItem *v19;
  void *v20;
  _SFPBPlayAudioButtonItem *v21;
  void *v22;
  _SFPBStoreButtonItem *v23;
  void *v24;
  _SFPBButtonItemAppearance *v25;
  void *v26;
  _SFPBButtonItem *v27;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)_SFPBButtonItem;
  v5 = -[_SFPBButtonItem init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commandButtonItem"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBCommandButtonItem initWithDictionary:]([_SFPBCommandButtonItem alloc], "initWithDictionary:", v6);
      -[_SFPBButtonItem setCommandButtonItem:](v5, "setCommandButtonItem:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactButtonItem"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBContactButtonItem initWithDictionary:]([_SFPBContactButtonItem alloc], "initWithDictionary:", v8);
      -[_SFPBButtonItem setContactButtonItem:](v5, "setContactButtonItem:", v9);

    }
    v30 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("coreSpotlightButtonItem"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[_SFPBCoreSpotlightButtonItem initWithDictionary:]([_SFPBCoreSpotlightButtonItem alloc], "initWithDictionary:", v10);
      -[_SFPBButtonItem setCoreSpotlightButtonItem:](v5, "setCoreSpotlightButtonItem:", v11);

    }
    v29 = (void *)v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("watchListButtonItem"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[_SFPBWatchListButtonItem initWithDictionary:]([_SFPBWatchListButtonItem alloc], "initWithDictionary:", v12);
      -[_SFPBButtonItem setWatchListButtonItem:](v5, "setWatchListButtonItem:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appActionsButtonItem"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[_SFPBAppAutoShortcutsButtonItem initWithDictionary:]([_SFPBAppAutoShortcutsButtonItem alloc], "initWithDictionary:", v14);
      -[_SFPBButtonItem setAppActionsButtonItem:](v5, "setAppActionsButtonItem:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sportsFollowButtonItem"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[_SFPBSportsFollowButtonItem initWithDictionary:]([_SFPBSportsFollowButtonItem alloc], "initWithDictionary:", v16);
      -[_SFPBButtonItem setSportsFollowButtonItem:](v5, "setSportsFollowButtonItem:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("playWatchListItemButtonItem"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[_SFPBPlayWatchListItemButtonItem initWithDictionary:]([_SFPBPlayWatchListItemButtonItem alloc], "initWithDictionary:", v18);
      -[_SFPBButtonItem setPlayWatchListItemButtonItem:](v5, "setPlayWatchListItemButtonItem:", v19);

    }
    v31 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("playAudioButtonItem"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[_SFPBPlayAudioButtonItem initWithDictionary:]([_SFPBPlayAudioButtonItem alloc], "initWithDictionary:", v20);
      -[_SFPBButtonItem setPlayAudioButtonItem:](v5, "setPlayAudioButtonItem:", v21);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("storeButtonItem"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = -[_SFPBStoreButtonItem initWithDictionary:]([_SFPBStoreButtonItem alloc], "initWithDictionary:", v22);
      -[_SFPBButtonItem setStoreButtonItem:](v5, "setStoreButtonItem:", v23);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("buttonAppearance"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[_SFPBButtonItemAppearance initWithDictionary:]([_SFPBButtonItemAppearance alloc], "initWithDictionary:", v24);
      -[_SFPBButtonItem setButtonAppearance:](v5, "setButtonAppearance:", v25);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uniqueId"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBButtonItem setUniqueId:](v5, "setUniqueId:", objc_msgSend(v26, "unsignedLongLongValue"));
    v27 = v5;

  }
  return v5;
}

- (_SFPBButtonItemAppearance)buttonAppearance
{
  return self->_buttonAppearance;
}

- (unint64_t)uniqueId
{
  return self->_uniqueId;
}

- (unint64_t)whichValue
{
  return self->_whichValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonAppearance, 0);
  objc_storeStrong((id *)&self->_storeButtonItem, 0);
  objc_storeStrong((id *)&self->_playAudioButtonItem, 0);
  objc_storeStrong((id *)&self->_playWatchListItemButtonItem, 0);
  objc_storeStrong((id *)&self->_sportsFollowButtonItem, 0);
  objc_storeStrong((id *)&self->_appActionsButtonItem, 0);
  objc_storeStrong((id *)&self->_watchListButtonItem, 0);
  objc_storeStrong((id *)&self->_coreSpotlightButtonItem, 0);
  objc_storeStrong((id *)&self->_contactButtonItem, 0);
  objc_storeStrong((id *)&self->_commandButtonItem, 0);
}

@end

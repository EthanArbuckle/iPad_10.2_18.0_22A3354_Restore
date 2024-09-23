@implementation STContentPrivacyMediaRestrictionsDetailController

- (STContentPrivacyMediaRestrictionsDetailController)initWithRegionRatings:(id)a3
{
  id v5;
  STContentPrivacyMediaRestrictionsDetailController *v6;
  STContentPrivacyMediaRestrictionsDetailController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STContentPrivacyMediaRestrictionsDetailController;
  v6 = -[STPINListViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_regionRatings, a3);

  return v7;
}

- (id)specifiers
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  objc_class *v67;
  uint64_t v68;
  void *v69;
  id v70;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  _QWORD v86[3];
  _QWORD v87[3];
  _QWORD v88[3];
  _QWORD v89[3];
  _QWORD v90[2];
  _QWORD v91[2];
  _QWORD v92[2];
  _QWORD v93[2];
  _QWORD v94[2];
  _QWORD v95[4];

  v95[2] = *MEMORY[0x24BDAC8D0];
  -[STPINListViewController coordinator](self, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentPrivacyCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isLoaded");

  if (!v6)
    return MEMORY[0x24BDBD1A8];
  v7 = (void *)objc_opt_new();
  -[STContentPrivacyMediaRestrictionsDetailController regionRatings](self, "regionRatings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle restrictionsStringsTable](STScreenTimeSettingsUIBundle, "restrictionsStringsTable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("AllowedContentLabel"), &stru_24DB8A1D0, v9);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[STContentPrivacyMediaRestrictionsDetailController radioGroupSpecifierWithName:footerText:item:](self, "radioGroupSpecifierWithName:footerText:item:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v11);

  objc_msgSend(v8, "preferredRegion");
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedMovieRatingsForRegion:", v12);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedTVRatingsForRegion:", v12);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = v8;
  v78 = (void *)v12;
  objc_msgSend(v8, "localizedAppRatingsForRegion:", v12);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v94[0] = MEMORY[0x24BDBD1C0];
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CleanLabel"), &stru_24DB8A1D0, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v95[0] = v13;
  v14 = MEMORY[0x24BDBD1C8];
  v94[1] = MEMORY[0x24BDBD1C8];
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ExplicitLabel"), &stru_24DB8A1D0, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v95[1] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v95, v94, 2);
  v16 = objc_claimAutoreleasedReturnValue();

  v17 = MEMORY[0x24BDBD1C0];
  v92[0] = MEMORY[0x24BDBD1C0];
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CleanLabelBooks"), &stru_24DB8A1D0, v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v92[1] = v14;
  v93[0] = v18;
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ExplicitLabel"), &stru_24DB8A1D0, v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v93[1] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v93, v92, 2);
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  v90[0] = v17;
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("OffLabel"), &stru_24DB8A1D0, v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v91[0] = v20;
  v90[1] = MEMORY[0x24BDBD1C8];
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("OnLabel"), &stru_24DB8A1D0, v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v91[1] = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v91, v90, 2);
  v22 = objc_claimAutoreleasedReturnValue();

  v77 = (void *)v16;
  -[STContentPrivacyMediaRestrictionsDetailController defaultLinkListSpecifierWithConfiguration:key:titlesByValue:sortByTitle:](self, "defaultLinkListSpecifierWithConfiguration:key:titlesByValue:sortByTitle:", CFSTR("system.ratings"), CFSTR("allowExplicitContent"), v16, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v23);

  -[STContentPrivacyMediaRestrictionsDetailController defaultLinkListSpecifierWithConfiguration:key:titlesByValue:sortByTitle:](self, "defaultLinkListSpecifierWithConfiguration:key:titlesByValue:sortByTitle:", CFSTR("system.music"), CFSTR("allowMusicVideos"), v22, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v24);

  v76 = (void *)v22;
  -[STContentPrivacyMediaRestrictionsDetailController defaultLinkListSpecifierWithConfiguration:key:titlesByValue:sortByTitle:](self, "defaultLinkListSpecifierWithConfiguration:key:titlesByValue:sortByTitle:", CFSTR("system.music"), CFSTR("allowMusicArtistActivity"), v22, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v25);

  -[STPINListViewController coordinator](self, "coordinator");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "viewModel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "me");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "type");

  if (v29 == 7)
  {
    objc_msgSend(v7, "lastObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setObject:forKeyedSubscript:", CFSTR("1"), 0x24DB8F4D0);

  }
  -[STContentPrivacyMediaRestrictionsDetailController linkListSpecifierForTVAndMoviesWithConfiguration:key:footerKey:titlesByValue:](self, "linkListSpecifierForTVAndMoviesWithConfiguration:key:footerKey:titlesByValue:", CFSTR("system.ratings"), CFSTR("ratingMovies"), CFSTR("allowShowingUndownloadedMovies"), v84);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v31);

  -[STContentPrivacyMediaRestrictionsDetailController linkListSpecifierForTVAndMoviesWithConfiguration:key:footerKey:titlesByValue:](self, "linkListSpecifierForTVAndMoviesWithConfiguration:key:footerKey:titlesByValue:", CFSTR("system.ratings"), CFSTR("ratingTVShows"), CFSTR("allowShowingUndownloadedTV"), v83);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v32);

  -[STContentPrivacyMediaRestrictionsDetailController defaultLinkListSpecifierWithConfiguration:key:titlesByValue:sortByTitle:](self, "defaultLinkListSpecifierWithConfiguration:key:titlesByValue:sortByTitle:", CFSTR("media.settings"), CFSTR("allowBookstoreErotica"), v81, 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v33);

  -[STContentPrivacyMediaRestrictionsDetailController defaultLinkListSpecifierWithConfiguration:key:titlesByValue:sortByTitle:](self, "defaultLinkListSpecifierWithConfiguration:key:titlesByValue:sortByTitle:", CFSTR("system.ratings"), CFSTR("ratingApps"), v82, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "titleDictionary");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "allKeys");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "containsObject:", &unk_24DBBE7F0);

  if (v37)
  {
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("UnratedExplanationFooter"), &stru_24DB8A1D0, v9);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setObject:forKeyedSubscript:", v38, 0x24DB8F530);

  }
  objc_msgSend(v7, "addObject:", v34);
  -[STContentPrivacyMediaRestrictionsDetailController defaultLinkListSpecifierWithConfiguration:key:](self, "defaultLinkListSpecifierWithConfiguration:key:", CFSTR("application.store"), CFSTR("allowAppClips"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v39);

  v88[0] = &unk_24DBBE808;
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("UnrestrictedAccessSpecifierName"), &stru_24DB8A1D0, v9);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v89[0] = v40;
  v88[1] = &unk_24DBBE820;
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("LimitAdultWebsitesSpecifierName"), &stru_24DB8A1D0, v9);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v89[1] = v41;
  v88[2] = &unk_24DBBE838;
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("AADC_AllowedWebsitesSpecifierName"), &stru_24DB8A1D0, v9);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v89[2] = v42;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v89, v88, 3);
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("WebContentSpecifierName"), &stru_24DB8A1D0, v9);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[STContentPrivacyMediaRestrictionsDetailController radioGroupSpecifierWithName:footerText:item:](self, "radioGroupSpecifierWithName:footerText:item:", v75, 0, 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v43);

  -[STContentPrivacyMediaRestrictionsDetailController defaultLinkListSpecifierWithConfiguration:key:titlesByValue:sortByTitle:](self, "defaultLinkListSpecifierWithConfiguration:key:titlesByValue:sortByTitle:", 0x24DB8DC50, 0x24DB8DD50, v74, 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v44);

  objc_msgSend(v7, "lastObject");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setControllerLoadAction:", sel_showWebFilterRestrictions_);

  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SiriLabel"), &stru_24DB8A1D0, v9);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[STContentPrivacyMediaRestrictionsDetailController radioGroupSpecifierWithName:footerText:item:](self, "radioGroupSpecifierWithName:footerText:item:", v73, 0, 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v46);

  -[STContentPrivacyMediaRestrictionsDetailController defaultLinkListSpecifierWithConfiguration:key:](self, "defaultLinkListSpecifierWithConfiguration:key:", CFSTR("system.siri"), CFSTR("allowAssistantUserGeneratedContent"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v47);

  -[STContentPrivacyMediaRestrictionsDetailController defaultLinkListSpecifierWithConfiguration:key:](self, "defaultLinkListSpecifierWithConfiguration:key:", CFSTR("system.siri"), CFSTR("forceAssistantProfanityFilter"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v48);

  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("GameCenterLabel"), &stru_24DB8A1D0, v9);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[STContentPrivacyMediaRestrictionsDetailController radioGroupSpecifierWithName:footerText:item:](self, "radioGroupSpecifierWithName:footerText:item:", v72, 0, 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v49);

  v86[0] = &unk_24DBBE850;
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DontAllowLabel"), &stru_24DB8A1D0, v9);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = v50;
  v86[1] = &unk_24DBBE868;
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("AllowWithFriendsOnlySpecifierName"), &stru_24DB8A1D0, v9);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v87[1] = v51;
  v86[2] = &unk_24DBBE880;
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("AllowWithEveryoneSpecifierName"), &stru_24DB8A1D0, v9);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v87[2] = v52;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v87, v86, 3);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  -[STContentPrivacyMediaRestrictionsDetailController defaultLinkListSpecifierWithConfiguration:key:titlesByValue:sortByTitle:](self, "defaultLinkListSpecifierWithConfiguration:key:titlesByValue:sortByTitle:", CFSTR("system.gamecenter"), 0x24DB8DD10, v53, 0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v54);

  -[STContentPrivacyMediaRestrictionsDetailController defaultLinkListSpecifierWithConfiguration:key:](self, "defaultLinkListSpecifierWithConfiguration:key:", CFSTR("system.gamecenter"), CFSTR("allowAddingGameCenterFriends"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v55);

  -[STContentPrivacyMediaRestrictionsDetailController defaultLinkListSpecifierWithConfiguration:key:](self, "defaultLinkListSpecifierWithConfiguration:key:", CFSTR("system.gamecenter"), CFSTR("allowGameCenterFriendsSharingModification"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ConnectWithFriendsExplanatoryFooterText"), &stru_24DB8A1D0, v9);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setObject:forKeyedSubscript:", v57, 0x24DB8F530);

  objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ConnectWithFriendsContinuedExplanatoryText"), &stru_24DB8A1D0, v9);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setObject:forKeyedSubscript:", v59, *MEMORY[0x24BE75A68]);

  v85 = v58;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v85, 1);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setObject:forKeyedSubscript:", v60, 0x24DB8F4F0);

  objc_msgSend(v7, "addObject:", v56);
  -[STContentPrivacyMediaRestrictionsDetailController defaultLinkListSpecifierWithConfiguration:key:](self, "defaultLinkListSpecifierWithConfiguration:key:", CFSTR("system.camera"), CFSTR("allowScreenRecording"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v61);

  -[STContentPrivacyMediaRestrictionsDetailController defaultLinkListSpecifierWithConfiguration:key:](self, "defaultLinkListSpecifierWithConfiguration:key:", CFSTR("system.gamecenter"), 0x24DB8DCF0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v62);

  -[STContentPrivacyMediaRestrictionsDetailController defaultLinkListSpecifierWithConfiguration:key:](self, "defaultLinkListSpecifierWithConfiguration:key:", CFSTR("system.gamecenter"), CFSTR("allowGameCenterPrivateMessaging"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("PrivateMessagingFooter"), &stru_24DB8A1D0, v9);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setObject:forKeyedSubscript:", v64, *MEMORY[0x24BE75CD0]);

  objc_msgSend(v7, "addObject:", v63);
  -[STContentPrivacyMediaRestrictionsDetailController defaultLinkListSpecifierWithConfiguration:key:](self, "defaultLinkListSpecifierWithConfiguration:key:", CFSTR("system.gamecenter"), CFSTR("allowGameCenterProfilePrivacyModification"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v65);

  -[STContentPrivacyMediaRestrictionsDetailController defaultLinkListSpecifierWithConfiguration:key:](self, "defaultLinkListSpecifierWithConfiguration:key:", CFSTR("system.gamecenter"), CFSTR("allowGameCenterProfileModification"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v66);

  v67 = (objc_class *)objc_msgSend(v7, "copy");
  v68 = (int)*MEMORY[0x24BE756E0];
  v69 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v68);
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v68) = v67;

  v70 = *(id *)((char *)&self->super.super.super.super.super.super.super.isa + v68);
  return v70;
}

- (void)showWebFilterRestrictions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_opt_new();
  -[STPINListViewController coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCoordinator:", v5);

  objc_msgSend(v7, "setParentController:", self);
  -[STContentPrivacyMediaRestrictionsDetailController rootController](self, "rootController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRootController:", v6);

  objc_msgSend(v7, "setSpecifier:", v4);
  -[STContentPrivacyMediaRestrictionsDetailController showController:animate:](self, "showController:animate:", v7, 1);

}

- (id)getItemSpecifierValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", 0x24DB8DCB0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STPINListViewController coordinator](self, "coordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentPrivacyCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "values");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[STContentPrivacyMediaRestrictionsDetailController _getSpecifierValueForItem:viewModel:restrictionValues:](self, "_getSpecifierValueForItem:viewModel:restrictionValues:", v5, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_getSpecifierValueForItem:(id)a3 viewModel:(id)a4 restrictionValues:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "valuesByRestriction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(v9, "defaultValueForRestriction:", v8);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  if (objc_msgSend(v8, "restrictionType")
    && (objc_msgSend(v8, "rmConfiguration"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("system.ratings")),
        v16,
        v17))
  {
    -[STContentPrivacyMediaRestrictionsDetailController regionRatings](self, "regionRatings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "payloadKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "getClosestRestrictionMatch:within:forPayloadKey:", v15, v10, v19);
    v20 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = v15;
  }

  return v20;
}

- (void)setItemSpecifierValue:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  id v18;
  _QWORD v19[5];
  id v20;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", 0x24DB8DCB0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STPINListViewController coordinator](self, "coordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentPrivacyCoordinator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __85__STContentPrivacyMediaRestrictionsDetailController_setItemSpecifierValue_specifier___block_invoke;
  v19[3] = &unk_24DB86690;
  v19[4] = self;
  v11 = v6;
  v20 = v11;
  objc_msgSend(v10, "saveRestrictionValue:forItem:completionHandler:", v7, v8, v19);

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x24BE84498], "sharedController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE84498], "sharedController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "viewContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v15 = objc_msgSend(v12, "saveContext:error:", v14, &v18);
    v16 = v18;

    if ((v15 & 1) == 0)
    {
      +[STUILog communicationSafety](STUILog, "communicationSafety");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        -[STContentPrivacyMediaRestrictionsDetailController setItemSpecifierValue:specifier:].cold.1((uint64_t)v16, v17);

    }
  }

}

uint64_t __85__STContentPrivacyMediaRestrictionsDetailController_setItemSpecifierValue_specifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performSelectorOnMainThread:withObject:waitUntilDone:", sel_reloadSpecifiers, *(_QWORD *)(a1 + 40), 0);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[STPINListViewController coordinator](self, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentPrivacyCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("viewModel.isLoaded"), CFSTR("MediaRestrictionsViewModelLoadedContext"));

  v5.receiver = self;
  v5.super_class = (Class)STContentPrivacyMediaRestrictionsDetailController;
  -[STListViewController dealloc](&v5, sel_dealloc);
}

- (void)setCoordinator:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  -[STPINListViewController coordinator](self, "coordinator");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    -[STPINListViewController coordinator](self, "coordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentPrivacyCoordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:forKeyPath:context:", self, CFSTR("viewModel.isLoaded"), CFSTR("MediaRestrictionsViewModelLoadedContext"));

    v10.receiver = self;
    v10.super_class = (Class)STContentPrivacyMediaRestrictionsDetailController;
    -[STPINListViewController setCoordinator:](&v10, sel_setCoordinator_, v4);
    -[STPINListViewController coordinator](self, "coordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentPrivacyCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:forKeyPath:options:context:", self, CFSTR("viewModel.isLoaded"), 0, CFSTR("MediaRestrictionsViewModelLoadedContext"));

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  void *v8;
  void *v9;
  int v10;
  objc_super v11;

  if (a6 == CFSTR("MediaRestrictionsViewModelLoadedContext"))
  {
    -[STPINListViewController coordinator](self, "coordinator", a3, a4, a5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentPrivacyCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isLoaded");

    if (v10)
      -[STContentPrivacyMediaRestrictionsDetailController reloadSpecifiers](self, "reloadSpecifiers");
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)STContentPrivacyMediaRestrictionsDetailController;
    -[STListViewController observeValueForKeyPath:ofObject:change:context:](&v11, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (id)defaultLinkListSpecifierWithItem:(id)a3 titlesByValue:(id)a4 sortByTitle:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[2];
  _QWORD v38[3];

  v5 = a5;
  v38[2] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  +[STScreenTimeSettingsUIBundle restrictionsStringsTable](STScreenTimeSettingsUIBundle, "restrictionsStringsTable");
  v11 = objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uiLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v12;
  objc_msgSend(v12, "localizedStringForKey:value:table:", v13, &stru_24DB8A1D0, v11);
  v14 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, self, sel_setItemSpecifierValue_specifier_, sel_getItemSpecifierValue_, objc_opt_class(), 2, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[STPINListViewController coordinator](self, "coordinator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, 0x24DB91230);

  v17 = objc_msgSend(v9, "restrictionType");
  v35 = (void *)v14;
  v36 = (void *)v11;
  if (v10)
  {
    if (v5)
    {
      objc_msgSend(v10, "keysSortedByValueUsingSelector:", sel_localizedCaseInsensitiveCompare_);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v10, "allKeys");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "sortedArrayUsingSelector:", sel_compare_);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v10, "objectsForKeys:notFoundMarker:", v18, &stru_24DB8A1D0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v19 = v17;
  if (v17 == 1)
  {
    v20 = v34;
    objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("AllowLabel"), &stru_24DB8A1D0, v11);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("DontAllowLabel"), &stru_24DB8A1D0, v11);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v31;
    v37[1] = v32;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = &unk_24DBBF088;
    goto LABEL_10;
  }
  if (v17)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STContentPrivacyMediaRestrictionsDetailController.m"), 258, CFSTR("Unimplemented type %d"), v19);

    v23 = 0;
    v18 = 0;
LABEL_9:
    v20 = v34;
    goto LABEL_10;
  }
  v20 = v34;
  objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("AllowLabel"), &stru_24DB8A1D0, v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("DontAllowLabel"), &stru_24DB8A1D0, v11);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v21;
  v38[1] = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = &unk_24DBBF070;
LABEL_10:
  v25 = (void *)MEMORY[0x24BDD16E0];
  -[STPINListViewController coordinator](self, "coordinator");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "contentPrivacyCoordinator");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "viewModel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "numberWithBool:", objc_msgSend(v28, "shouldEnableRestriction:", v9));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v29, *MEMORY[0x24BE75A18]);

  objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("STMediaRestrictionRanksSpecifierKey"));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v9, 0x24DB8DCB0);
  objc_msgSend(v15, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
  objc_msgSend(v15, "setValues:titles:", v18, v23);

  return v15;
}

- (id)defaultLinkListSpecifierWithConfiguration:(id)a3 key:(id)a4 titlesByValue:(id)a5 sortByTitle:(BOOL)a6
{
  _BOOL8 v6;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;

  v6 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[STPINListViewController coordinator](self, "coordinator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contentPrivacyCoordinator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "viewModel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "visibleRestrictionWithConfiguration:key:", v13, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STContentPrivacyMediaRestrictionsDetailController.m"), 274, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item"));

  }
  -[STContentPrivacyMediaRestrictionsDetailController defaultLinkListSpecifierWithItem:titlesByValue:sortByTitle:](self, "defaultLinkListSpecifierWithItem:titlesByValue:sortByTitle:", v17, v11, v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)defaultLinkListSpecifierWithConfiguration:(id)a3 key:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v7 = a4;
  v8 = a3;
  -[STPINListViewController coordinator](self, "coordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentPrivacyCoordinator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "visibleRestrictionWithConfiguration:key:", v8, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STContentPrivacyMediaRestrictionsDetailController.m"), 282, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item"));

  }
  -[STContentPrivacyMediaRestrictionsDetailController defaultLinkListSpecifierWithItem:titlesByValue:sortByTitle:](self, "defaultLinkListSpecifierWithItem:titlesByValue:sortByTitle:", v12, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)radioGroupSpecifierWithName:(id)a3 footerText:(id)a4 item:(id)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithName:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75B28]);
  if (v7)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE75A68]);
  if (v8)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, 0x24DB8DCB0);

  return v9;
}

- (id)defaultSwitchSpecifierWithConfiguration:(id)a3 key:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (id)objc_opt_new();
}

- (id)linkListSpecifierForTVAndMoviesWithConfiguration:(id)a3 key:(id)a4 footerKey:(id)a5 titlesByValue:(id)a6
{
  id v11;
  id v12;
  id v13;
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
  STContentPrivacyMediaRestrictionsDetailController *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;

  v11 = a4;
  v12 = a6;
  v37 = a5;
  v13 = a3;
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("ratingMovies")) & 1) == 0
    && (objc_msgSend(v11, "isEqualToString:", CFSTR("ratingTVShows")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STContentPrivacyMediaRestrictionsDetailController.m"), 307, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[key isEqualToString:@\"ratingMovies\"] || [key isEqualToString:@\"ratingTVShows\"]"));

  }
  -[STPINListViewController coordinator](self, "coordinator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contentPrivacyCoordinator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "viewModel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "visibleRestrictionWithConfiguration:key:", v13, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = v11;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STContentPrivacyMediaRestrictionsDetailController.m"), 311, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item"));

  }
  objc_msgSend(v12, "allKeys");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sortedArrayUsingSelector:", sel_compare_);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectsForKeys:notFoundMarker:", v19, &stru_24DB8A1D0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  +[STScreenTimeSettingsUIBundle restrictionsStringsTable](STScreenTimeSettingsUIBundle, "restrictionsStringsTable");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "uiLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", v21, &stru_24DB8A1D0, v34);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v22, self, sel_setItemSpecifierValue_specifier_, sel_getItemSpecifierValue_, objc_opt_class(), 2, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x24BDD16E0];
  -[STPINListViewController coordinator](self, "coordinator");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "contentPrivacyCoordinator");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "viewModel");
  v27 = self;
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "numberWithBool:", objc_msgSend(v28, "shouldEnableRestriction:", v17));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v29, *MEMORY[0x24BE75A18]);

  objc_msgSend(v23, "setObject:forKeyedSubscript:", v19, CFSTR("STMediaRestrictionRanksSpecifierKey"));
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v17, 0x24DB8DCB0);
  objc_msgSend(v23, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v37, 0x24DB8F510);

  -[STPINListViewController coordinator](v27, "coordinator");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v30, 0x24DB91230);

  objc_msgSend(v23, "setValues:titles:", v19, v35);
  return v23;
}

- (STRegionRatings)regionRatings
{
  return (STRegionRatings *)objc_getProperty(self, a2, 1408, 1);
}

- (void)setRegionRatings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1408);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionRatings, 0);
}

- (void)setItemSpecifierValue:(uint64_t)a1 specifier:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_219AB4000, a2, OS_LOG_TYPE_FAULT, "Failed to save ContentPrivacyMediaRestriction settings: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end

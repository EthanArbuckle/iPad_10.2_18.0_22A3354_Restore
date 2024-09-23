@implementation SBAppSwitcherDefaults

- (void)_bindAndRegisterDefaults
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
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
  int v22;
  char v23;
  _BOOL8 v24;
  void *v25;
  id v26;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "bottomEdgeGestureSwipeCount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("SBSwitcherBottomEdgeGestureSwipeCount"), &unk_1E203AA68, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "springBoardKillable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C9AAA0];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v4, CFSTR("SBKillableInAppSwitcher"), MEMORY[0x1E0C9AAA0], 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "trackpadSwitcherGesturesEnabled");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C9AAB0];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v6, CFSTR("SBTrackpadSwitcherGesturesEnabled"), MEMORY[0x1E0C9AAB0], 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "recentsPlistRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v8, CFSTR("SBRecentAppLayoutsPlistRepresentation"), 0, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "chamoisWindowingEnabled");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v9, CFSTR("SBChamoisWindowingEnabled"), v5, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "chamoisEverEnabled");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v10, CFSTR("SBChamoisWindowingEverEnabled"), v5, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "chamoisHideStrips");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v11, CFSTR("SBChamoisHideStrips"), v5, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "chamoisHideDock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v12, CFSTR("SBChamoisHideDock"), v5, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "chamoisHideStripsExternal");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v13, CFSTR("SBChamoisHideStripsExternal"), v5, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "chamoisHideDockExternal");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v14, CFSTR("SBChamoisHideDockExternal"), v5, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "legacyRecentApplications");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v15, CFSTR("SBRecentDisplays"), 0, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "legacyRecentDisplayItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v16, CFSTR("SBRecentDisplayItems"), 0, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "legacyRecentDisplayItemRoles");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v17, CFSTR("SBRecentDisplayItemRoles"), 0, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "shouldShowSplitPeekEducation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v18, CFSTR("SBShouldShowSplitPeekEducation"), v7, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "shouldShowSlideOverPeekEducation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v19, CFSTR("SBShouldShowSlideOverPeekEducation"), v7, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "medusaMultitaskingEnabled");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0CB37E8];
  v22 = __sb__runningInSpringBoard();
  v23 = v22;
  if (v22)
  {
    v24 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v14, "userInterfaceIdiom") == 1;
  }
  objc_msgSend(v21, "numberWithInt:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v20, CFSTR("SBMedusaMultitaskingEnabled"), v25, 1);

  if ((v23 & 1) == 0)
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "shouldUpdateExternalDisplayMirroringWhenWindowManagementStyleUpdates");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v26, CFSTR("SBShouldToggleExternalDisplayMirroringWhenWindowManagementStyleUpdates"), MEMORY[0x1E0C9AAB0], 1);

}

- (void)clearLegacyDefaults
{
  void *v3;
  void *v4;
  id v5;

  -[BSAbstractDefaultDomain _store](self, "_store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("SBRecentDisplays"));

  -[BSAbstractDefaultDomain _store](self, "_store");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("SBRecentDisplayItems"));

  -[BSAbstractDefaultDomain _store](self, "_store");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("SBRecentDisplayItemRoles"));

}

@end

@implementation SBExternalDisplayDefaults

- (void)_bindAndRegisterDefaults
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "arrangementEdge");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("SBExternalDisplayArrangementEdge"), &unk_1E203A9C0, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "arrangementOffset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v4, CFSTR("SBExternalDisplayArrangementOffset"), &unk_1E203B7A8, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "mirroringEnabled");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C9AAA0];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v5, CFSTR("SBExternalDisplayMirroringEnabled"), MEMORY[0x1E0C9AAA0], 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "externalDisplayEducationReasons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v7, CFSTR("SBExternalDisplayEducationReasons"), &unk_1E203A9D8, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "allowWirelessDisplaysForExtendedDisplayMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v8, CFSTR("SBExtendedDisplayOverrideSupportForAirPlayAndDontFileRadars"), v6, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "contentsScale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v9, CFSTR("SBExtendedDisplayContentsScaleAndDontFileRadars"), &unk_1E203B7B8, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "displayModeSettingsMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v10, CFSTR("SBDisplayModeSettings"), MEMORY[0x1E0C9AA70], 2);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "chamois_97748869");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v12, CFSTR("CHAMOIS_97748869"), v11, 1);

}

- (void)resetPrototypeSettingAdjustableDefaults
{
  id v3;

  -[BSAbstractDefaultDomain _store](self, "_store");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("SBExtendedDisplayOverrideSupportForAirPlayAndDontFileRadars"));
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("SBExtendedDisplayContentsScaleAndDontFileRadars"));
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("CHAMOIS_97748869"));
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("SBDisplayModeSettings"));
  -[BSAbstractDefaultDomain synchronizeDefaults](self, "synchronizeDefaults");

}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBExternalDisplayDefaults allowWirelessDisplaysForExtendedDisplayMode](self, "allowWirelessDisplaysForExtendedDisplayMode"), CFSTR("allowWirelessDisplays"));
  -[SBExternalDisplayDefaults contentsScale](self, "contentsScale");
  v5 = (id)objc_msgSend(v3, "appendFloat:withName:decimalPrecision:", CFSTR("contentsScale"), 2);
  v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBExternalDisplayDefaults isMirroringEnabled](self, "isMirroringEnabled"), CFSTR("mirroringEnabled"));
  v7 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBExternalDisplayDefaults chamois](self, "chamois"), CFSTR("chamois_97748869"));
  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (BOOL)displaySupportsExtendedDisplayMode:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;

  v4 = a3;
  v5 = -[SBExternalDisplayDefaults allowWirelessDisplaysForExtendedDisplayMode](self, "allowWirelessDisplaysForExtendedDisplayMode");
  objc_msgSend(v4, "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rootIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isExternal")
    && objc_msgSend(v7, "isAirPlayDisplay")
    && (objc_msgSend(v7, "isCarDisplay") & 1) == 0
    && (objc_msgSend(v7, "isCarInstrumentsDisplay") & 1) == 0
    && (objc_msgSend(v7, "connectionType") == 1 ? (v8 = 1) : (v8 = v5),
        v8 == 1
     && objc_msgSend(v7, "isRootIdentity")
     && (objc_msgSend(v4, "hardwareIdentifier"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, v9)))
  {
    +[SBDisplayScaleMapping withDisplay:useNativeSize:](SBDisplayScaleMapping, "withDisplay:useNativeSize:", v4, -[SBExternalDisplayDefaults chamois](self, "chamois"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "supportedScales");

    v12 = v11 != 0;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)displayModeSettingsForDisplay:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v17;
  void *v18;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBExternalDisplayDefaults.m"), 142, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayConfiguration != nil"));

  }
  if (!-[SBExternalDisplayDefaults displaySupportsExtendedDisplayMode:](self, "displaySupportsExtendedDisplayMode:", v5))
  {
    v9 = 0;
    goto LABEL_18;
  }
  -[SBExternalDisplayDefaults _constructDisplaySettingsMap](self, "_constructDisplaySettingsMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBDisplayModePredicate forDisplay:](SBDisplayModePredicate, "forDisplay:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (!v8)
  {
    +[SBDisplayModePredicate forDisplaysSimilarToDisplay:useNativeSize:](SBDisplayModePredicate, "forDisplaysSimilarToDisplay:useNativeSize:", v5, -[SBExternalDisplayDefaults chamois](self, "chamois"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      +[SBDisplayModePredicate allDisplays](SBDisplayModePredicate, "allDisplays");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  +[SBDisplayScaleMapping withDisplay:useNativeSize:](SBDisplayScaleMapping, "withDisplay:useNativeSize:", v5, -[SBExternalDisplayDefaults chamois](self, "chamois"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v9)
  {
    objc_msgSend(v12, "createDefaultSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = objc_msgSend(v13, "supportedScales");
  objc_msgSend(v9, "scale");
  if ((SBSDisplayScaleMaskFromScale() & ~v14) != 0)
  {
    v15 = (void *)objc_msgSend(v9, "mutableCopy");
    objc_msgSend(v15, "setScale:", 1);

    v9 = v15;
LABEL_14:
    objc_msgSend(v6, "setObject:forKey:", v9, v7);
    -[SBExternalDisplayDefaults _saveDisplaySettingsMapToStore:](self, "_saveDisplaySettingsMapToStore:", v6);
    goto LABEL_15;
  }
  if (!v8)
    goto LABEL_14;
LABEL_15:
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBExternalDisplayDefaults.m"), 191, CFSTR("as long as the display is supported, we should have settings"));

  }
LABEL_18:

  return v9;
}

- (void)setDisplayModeSettings:(id)a3 forDisplaysMatchingPredicates:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBExternalDisplayDefaults.m"), 197, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("settings != nil"));

  }
  if (!objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBExternalDisplayDefaults.m"), 198, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[predicates count] > 0"));

  }
  -[SBExternalDisplayDefaults _constructDisplaySettingsMap](self, "_constructDisplaySettingsMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v10);
        v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v17, "isEqual:", v7) & 1) == 0)
        {
          objc_msgSend(v9, "setObject:forKey:", v7, v16);
          v13 = 1;
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);

    if ((v13 & 1) != 0)
      -[SBExternalDisplayDefaults _saveDisplaySettingsMapToStore:](self, "_saveDisplaySettingsMapToStore:", v9);
  }
  else
  {

  }
}

- (id)observeDisplayModeSettingsOnQueue:(id)a3 withBlock:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBExternalDisplayDefaults.m"), 215, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBExternalDisplayDefaults.m"), 216, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observerBlock"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "displayModeSettingsMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain observeDefault:onQueue:withBlock:](self, "observeDefault:onQueue:withBlock:", v10, v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_saveDisplaySettingsMapToStore:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKey:", v11, (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "defaultsKeyRepresentation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "defaultsRepresentation");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v14, v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  -[SBExternalDisplayDefaults displayModeSettingsMap](self, "displayModeSettingsMap");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v5, "isEqual:", v15);

  if ((v16 & 1) == 0)
    -[SBExternalDisplayDefaults setDisplayModeSettingsMap:](self, "setDisplayModeSettingsMap:", v5);

}

- (id)_constructDisplaySettingsMap
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[SBExternalDisplayDefaults displayModeSettingsMap](self, "displayModeSettingsMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AA70];
  v17 = v2;
  v3 = (void *)objc_msgSend(v2, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        +[SBDisplayModePredicate fromDefaultsKey:](SBDisplayModePredicate, "fromDefaultsKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)MEMORY[0x1E0DAAE38];
        objc_msgSend(v4, "objectForKey:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "fromDefaultsRepresentation:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
          v14 = v13 == 0;
        else
          v14 = 1;
        if (v14)
          objc_msgSend(v18, "addObject:", v9);
        else
          objc_msgSend(v19, "setObject:forKey:", v13, v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v18, "count"))
  {
    objc_msgSend(v4, "removeObjectsForKeys:", v18);
    -[SBExternalDisplayDefaults setDisplayModeSettingsMap:](self, "setDisplayModeSettingsMap:", v4);
  }

  return v19;
}

@end

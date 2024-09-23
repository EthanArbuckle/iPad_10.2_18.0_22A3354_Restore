@implementation SBIconDefaults

- (void)_bindAndRegisterDefaults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "maxIconListCount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("SBMaxIconListCount"), &unk_1E203A8A0, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "didShowIconReorderAlert");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v4, CFSTR("SBDidShowReorderText"), v5, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "shouldDisableLiveIcons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C9AAA0];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v6, CFSTR("SBDisableLiveIcons"), MEMORY[0x1E0C9AAA0], 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "suppressAppShortcutTruncation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v8, CFSTR("SBSuppressAppShortcutTruncation"), CFSTR("NO"), 4);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "suppressSetCurrentPage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v9, CFSTR("SBFolderViewSuppressSetCurrentPage"), v7, 4);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "legacyIconState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v10, CFSTR("iconState"), 0, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "legacyIconState2");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v11, CFSTR("iconState2"), 0, 1);

}

- (void)clearLegacyDefaults
{
  void *v3;
  void *v4;
  id v5;

  -[BSAbstractDefaultDomain _store](self, "_store");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("iconState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

LABEL_4:
    objc_msgSend(v5, "removeObjectForKey:", CFSTR("iconState"));
    objc_msgSend(v5, "removeObjectForKey:", CFSTR("iconState2"));
    -[BSAbstractDefaultDomain synchronizeDefaults](self, "synchronizeDefaults");
    goto LABEL_5;
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("iconState2"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    goto LABEL_4;
LABEL_5:

}

@end

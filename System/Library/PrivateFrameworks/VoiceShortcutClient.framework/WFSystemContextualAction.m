@implementation WFSystemContextualAction

- (WFSystemContextualAction)initWithType:(unint64_t)a3 identifier:(id)a4 displayString:(id)a5 inputTypes:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v21;
  WFSystemContextualAction *v22;
  uint64_t v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v10;
  if (a3 - 1 > 8)
  {
    v17 = 0;
  }
  else
  {
    v14 = off_1E5FC7BC8[a3 - 1];
    v25[0] = CFSTR("com.apple.shortcuts.systemContextualAction");
    v25[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    if (v13)
      objc_msgSend(v16, "addObject:", v13);
    objc_msgSend(v16, "componentsJoinedByString:", CFSTR("."));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFContextualActionFilteringBehavior filteringWithMatchingTypes:predicate:](WFContextualActionFilteringBehavior, "filteringWithMatchingTypes:predicate:", v18, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[WFContextualActionFilteringBehavior matchAllFiles](WFContextualActionFilteringBehavior, "matchAllFiles");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21 = a3 > 9 || (a3 & 0x3FF) == 2;
  LOBYTE(v24) = v21;
  v22 = -[WFContextualAction initWithIdentifier:wfActionIdentifier:type:correspondingSystemActionType:associatedAppBundleIdentifier:resultFileOperation:alternate:filteringBehavior:parameters:displayFormatString:title:subtitleFormatString:icon:](self, "initWithIdentifier:wfActionIdentifier:type:correspondingSystemActionType:associatedAppBundleIdentifier:resultFileOperation:alternate:filteringBehavior:parameters:displayFormatString:title:subtitleFormatString:icon:", v17, 0, 0, a3, 0, 1, v24, v19, 0, v11, v11, 0, 0);

  return v22;
}

@end

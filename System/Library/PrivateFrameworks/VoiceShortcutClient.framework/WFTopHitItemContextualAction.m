@implementation WFTopHitItemContextualAction

- (WFTopHitItemContextualAction)initWithItem:(id)a3 identifier:(id)a4 wfActionIdentifier:(id)a5 associatedAppBundleIdentifier:(id)a6 parameters:(id)a7 displayFormatString:(id)a8 title:(id)a9 subtitleFormatString:(id)a10 primaryColor:(unint64_t)a11 icon:(id)a12 accessoryIcon:(id)a13 namedQueryInfo:(id)a14
{
  WFTopHitItemContextualAction *v19;
  WFTopHitItemContextualAction *v20;
  WFTopHitItemContextualAction *v21;
  int v23;
  id v26;
  id v27;
  objc_super v28;

  v27 = a3;
  v26 = a14;
  v28.receiver = self;
  v28.super_class = (Class)WFTopHitItemContextualAction;
  BYTE2(v23) = 0;
  LOWORD(v23) = 0;
  v19 = -[WFContextualAction initWithIdentifier:wfActionIdentifier:associatedAppBundleIdentifier:parameters:displayFormatString:title:subtitleFormatString:icon:accessoryIcon:actionShowsUserInterface:actionHasResult:isReversible:](&v28, sel_initWithIdentifier_wfActionIdentifier_associatedAppBundleIdentifier_parameters_displayFormatString_title_subtitleFormatString_icon_accessoryIcon_actionShowsUserInterface_actionHasResult_isReversible_, a4, a5, a6, a7, a8, a9, a10, a12, a13, v23);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_item, a3);
    v20->_primaryColor = a11;
    objc_storeStrong((id *)&v20->_namedQueryInfo, a14);
    v21 = v20;
  }

  return v20;
}

- (unint64_t)hash
{
  void *v3;
  objc_class *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  unint64_t v9;

  v3 = (void *)objc_opt_new();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v5);

  -[WFContextualAction uniqueIdentifier](self, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v7);

  v9 = objc_msgSend(v3, "finalize");
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  WFTopHitItemContextualAction *v4;
  WFTopHitItemContextualAction *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  char v11;

  v4 = (WFTopHitItemContextualAction *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (v5)
      {
        -[WFContextualAction uniqueIdentifier](self, "uniqueIdentifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFContextualAction uniqueIdentifier](v5, "uniqueIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v6;
        v9 = v7;
        v10 = v9;
        if (v8 == v9)
        {
          v11 = 1;
        }
        else
        {
          v11 = 0;
          if (v8 && v9)
            v11 = objc_msgSend(v8, "isEqualToString:", v9);
        }

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (NSSecureCoding)item
{
  return self->_item;
}

- (unint64_t)primaryColor
{
  return self->_primaryColor;
}

- (WFAppShortcutNamedQueryInfo)namedQueryInfo
{
  return self->_namedQueryInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namedQueryInfo, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

+ (void)getTopHitContextualActionsForType:(unint64_t)a3 limit:(int64_t)a4 completion:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  int64_t v27;
  _QWORD v28[4];
  id v29;
  _QWORD aBlock[4];
  id v31;

  v8 = a5;
  +[VCVoiceShortcutClient standardClient](VCVoiceShortcutClient, "standardClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke;
  aBlock[3] = &unk_1E5FC8248;
  v11 = v8;
  v31 = v11;
  v12 = _Block_copy(aBlock);
  v13 = (void (**)(_QWORD, _QWORD, _QWORD))v12;
  switch(a3)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TopHitItemContextualActionError"), 0, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v13)[2](v13, 0, v14);
      goto LABEL_9;
    case 1uLL:
      v28[0] = v10;
      v28[1] = 3221225472;
      v28[2] = __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_2;
      v28[3] = &unk_1E5FC8248;
      v29 = v12;
      objc_msgSend(v9, "getSuggestedShortcutsWithLimit:completion:", a4, v28);
      v14 = v29;
      goto LABEL_9;
    case 2uLL:
      v23[0] = v10;
      v23[1] = 3221225472;
      v23[2] = __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_4;
      v23[3] = &unk_1E5FC79B0;
      v26 = a1;
      v27 = a4;
      v25 = v12;
      v24 = v9;
      objc_msgSend(v24, "getFavoriteContactsWithLimit:completion:", a4, v23);

      v14 = v25;
      goto LABEL_9;
    case 3uLL:
      v21[0] = v10;
      v21[1] = 3221225472;
      v21[2] = __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_8;
      v21[3] = &unk_1E5FC8248;
      v22 = v12;
      objc_msgSend(v9, "getRecentsCallWithTelephony:limit:completion:", 0, a4, v21);
      v14 = v22;
      goto LABEL_9;
    case 4uLL:
      v19[0] = v10;
      v19[1] = 3221225472;
      v19[2] = __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_10;
      v19[3] = &unk_1E5FC8248;
      v20 = v12;
      +[WFPlayMusicContextualAction disambiguationEntriesForCollection:limit:completionHandler:](WFPlayMusicContextualAction, "disambiguationEntriesForCollection:limit:completionHandler:", CFSTR("Suggested"), a4, v19);
      v14 = v20;
      goto LABEL_9;
    case 5uLL:
      v17[0] = v10;
      v17[1] = 3221225472;
      v17[2] = __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_11;
      v17[3] = &unk_1E5FC8248;
      v18 = v12;
      +[WFPlayPodcastEpisodeContextualAction disambiguationEntriesForCollection:limit:completionHandler:](WFPlayPodcastEpisodeContextualAction, "disambiguationEntriesForCollection:limit:completionHandler:", CFSTR("Suggested"), a4, v17);
      v14 = v18;
      goto LABEL_9;
    case 6uLL:
      v15[0] = v10;
      v15[1] = 3221225472;
      v15[2] = __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_12;
      v15[3] = &unk_1E5FC7A50;
      v16 = v12;
      objc_msgSend(v9, "getLinkActionWithAppBundleIdentifier:appIntentIdentifier:expandingParameterName:limit:completion:", CFSTR("com.apple.springboard"), CFSTR("OpenCamera"), CFSTR("cameraMode"), a4, v15);
      v14 = v16;
LABEL_9:

      break;
    default:
      break;
  }

}

+ (id)actionForCallDescriptor:(id)a3 namedQueryInfo:(id)a4
{
  id v5;
  id v6;
  WFStartPhoneCallContextualAction *v7;
  void *v8;
  void *v9;
  WFStartPhoneCallContextualAction *v10;
  _BOOL8 v11;
  WFFaceTimeContextualAction *v12;
  void *v13;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "callType"))
  {
    if (objc_msgSend(v5, "callType") == 1)
    {
      v7 = [WFStartPhoneCallContextualAction alloc];
      objc_msgSend(v5, "person");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "personSerializedRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[WFStartPhoneCallContextualAction initWithPerson:serializedRepresentation:namedQueryInfo:](v7, "initWithPerson:serializedRepresentation:namedQueryInfo:", v8, v9, v6);
    }
    else
    {
      v11 = (objc_msgSend(v5, "callType") & 0xFFFFFFFFFFFFFFFDLL) != 0;
      v12 = [WFFaceTimeContextualAction alloc];
      objc_msgSend(v5, "person");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "callTypeSerializedRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "personSerializedRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[WFFaceTimeContextualAction initWithPerson:type:callTypeSerializedRepresentation:personSerializedRepresentation:namedQueryInfo:](v12, "initWithPerson:type:callTypeSerializedRepresentation:personSerializedRepresentation:namedQueryInfo:", v8, v11, v9, v13, v6);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)supportedBundleIdentifiers
{
  void *v2;
  void *v3;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("com.apple.shortcuts");
  v5[1] = CFSTR("com.apple.mobilephone");
  v5[2] = CFSTR("com.apple.facetime");
  v5[3] = CFSTR("com.apple.Music");
  v5[4] = CFSTR("com.apple.podcasts");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_objectsPassingTest:", &__block_literal_global_82_13733);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (WFTopHitItemContextualAction)disambiguationAction
{
  return 0;
}

+ (WFContextualActionParameter)disambiguationParameter
{
  return 0;
}

+ (id)availableCollectionIdentifiers
{
  return (id)objc_opt_new();
}

+ (void)disambiguationEntriesForCollection:(id)a3 limit:(int64_t)a4 completionHandler:(id)a5
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB35C8];
  v7 = a5;
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("TopHitItemContextualActionError"), 0, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a5 + 2))(v7, 0, v8);

}

+ (id)disambiguationEntriesForCollection:(id)a3 limit:(int64_t)a4 error:(id *)a5
{
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TopHitItemContextualActionError"), 0, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

+ (id)disambiguationSummaryStringForCollection:(id)a3
{
  return 0;
}

+ (id)disambiguationSummaryStringWithParameterDefined:(BOOL)a3
{
  return 0;
}

BOOL __58__WFTopHitItemContextualAction_supportedBundleIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CA5870];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithBundleIdentifier:allowPlaceholder:error:", v3, 0, 0);

  return v4 != 0;
}

void __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void (*v9)(uint64_t, _QWORD);
  id v10;

  if (a2)
  {
    v5 = (void *)MEMORY[0x1E0C99E40];
    v6 = a3;
    objc_msgSend(v5, "orderedSetWithArray:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "array");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void (**)(uint64_t, _QWORD))(v8 + 16);
    v10 = a3;
    v9(v8, 0);
  }

}

void __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  WFAppShortcutNamedQueryInfo *v4;
  void *v5;
  WFAppShortcutNamedQueryInfo *v6;
  WFAppShortcutNamedQueryInfo *v7;
  void *v8;
  _QWORD v9[4];
  WFAppShortcutNamedQueryInfo *v10;

  v3 = a2;
  if (v3)
  {
    v4 = [WFAppShortcutNamedQueryInfo alloc];
    WFLocalizedString(CFSTR("My Shortcuts"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[WFAppShortcutNamedQueryInfo initWithName:symbolName:](v4, "initWithName:symbolName:", v5, CFSTR("app.2.stack.3d"));

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_3;
    v9[3] = &unk_1E5FC7938;
    v10 = v6;
    v7 = v6;
    objc_msgSend(v3, "if_map:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  WFAppShortcutNamedQueryInfo *v7;
  void *v8;
  WFAppShortcutNamedQueryInfo *v9;
  void *v10;
  uint64_t v11;
  WFAppShortcutNamedQueryInfo *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  _QWORD v26[4];
  WFAppShortcutNamedQueryInfo *v27;
  uint64_t v28;

  v5 = a3;
  v6 = a2;
  v7 = [WFAppShortcutNamedQueryInfo alloc];
  WFLocalizedString(CFSTR("Favorites"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WFAppShortcutNamedQueryInfo initWithName:symbolName:](v7, "initWithName:symbolName:", v8, CFSTR("star.fill"));

  v10 = (void *)MEMORY[0x1E0C99E40];
  v11 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_5;
  v26[3] = &unk_1E5FC7960;
  v28 = *(_QWORD *)(a1 + 48);
  v12 = v9;
  v27 = v12;
  objc_msgSend(v6, "if_compactMap:", v26);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "orderedSetWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = *(_QWORD *)(a1 + 56);
  v17 = v16 - objc_msgSend(v15, "count");
  if (v17)
  {
    v21[0] = v11;
    v21[1] = 3221225472;
    v21[2] = __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_6;
    v21[3] = &unk_1E5FC7988;
    v18 = *(void **)(a1 + 32);
    v24 = *(id *)(a1 + 40);
    v19 = v5;
    v20 = *(_QWORD *)(a1 + 48);
    v22 = v19;
    v25 = v20;
    v23 = v15;
    objc_msgSend(v18, "getRecentsCallWithTelephony:limit:completion:", 1, v17, v21);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(a2, "if_map:", &__block_literal_global_13775);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

uint64_t __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_12(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  WFContextualActionIcon *v11;
  WFAppIntentBasedTopHitContextualAction *v12;
  void *v13;
  void *v14;
  WFAppIntentBasedTopHitContextualAction *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7)
  {
    if (objc_msgSend(v8, "count"))
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_13;
      v18[3] = &unk_1E5FC7A28;
      v19 = v7;
      objc_msgSend(v8, "if_map:", v18);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    }
    else
    {
      v11 = -[WFContextualActionIcon initWithSystemName:]([WFContextualActionIcon alloc], "initWithSystemName:", CFSTR("camera"));
      v12 = [WFAppIntentBasedTopHitContextualAction alloc];
      WFLocalizedString(CFSTR("Open Camera"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      WFLocalizedString(CFSTR("Open Camera"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[WFAppIntentBasedTopHitContextualAction initWithAction:appBundleIdentifier:extensionBundleIdentifier:authenticationPolicy:associatedAppBundleIdentifier:parameterValue:displayFormatString:title:subtitleFormatString:primaryColor:icon:accessoryIcon:namedQueryInfo:](v12, "initWithAction:appBundleIdentifier:extensionBundleIdentifier:authenticationPolicy:associatedAppBundleIdentifier:parameterValue:displayFormatString:title:subtitleFormatString:primaryColor:icon:accessoryIcon:namedQueryInfo:", v7, CFSTR("com.apple.springboard"), 0, 0, CFSTR("com.apple.camera"), 0, CFSTR("%@"), v13, v14, 12, v11, 0, 0);

      v16 = *(_QWORD *)(a1 + 32);
      v20[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v16 + 16))(v16, v17, 0);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

WFAppIntentBasedTopHitContextualAction *__83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
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
  id v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  WFContextualActionIcon *v19;
  WFAppIntentBasedTopHitContextualAction *v20;
  WFAppIntentBasedTopHitContextualAction *v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v24[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionWithParameters:", v5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = [WFAppIntentBasedTopHitContextualAction alloc];
  WFLocalizedString(CFSTR("Open Camera"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringWithPluralizationNumber:forLocaleIdentifier:", &unk_1E60028E0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "image");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LOBYTE(v4) = objc_opt_isKindOfClass();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(v11, "displayRepresentation");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "image");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "systemName");
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v11, "value");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v17;
      else
        v18 = 0;
    }
    else
    {
      v18 = 0;
    }
    v14 = v18;

    v16 = CFSTR("camera");
    if ((objc_msgSend(v14, "isEqualToString:", CFSTR("rearPhoto")) & 1) == 0)
    {
      if ((objc_msgSend(v14, "isEqualToString:", CFSTR("frontPhoto")) & 1) != 0)
      {
        v16 = CFSTR("iphone");
      }
      else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("rearVideo")) & 1) != 0)
      {
        v16 = CFSTR("video");
      }
      else if (objc_msgSend(v14, "isEqualToString:", CFSTR("rearPortrait")))
      {
        v16 = CFSTR("f.cursive");
      }
    }
  }

  v19 = -[WFContextualActionIcon initWithSystemName:]([WFContextualActionIcon alloc], "initWithSystemName:", v16);
  v20 = -[WFAppIntentBasedTopHitContextualAction initWithAction:appBundleIdentifier:extensionBundleIdentifier:authenticationPolicy:associatedAppBundleIdentifier:parameterValue:displayFormatString:title:subtitleFormatString:primaryColor:icon:accessoryIcon:namedQueryInfo:](v22, "initWithAction:appBundleIdentifier:extensionBundleIdentifier:authenticationPolicy:associatedAppBundleIdentifier:parameterValue:displayFormatString:title:subtitleFormatString:primaryColor:icon:accessoryIcon:namedQueryInfo:", v23, CFSTR("com.apple.springboard"), 0, 0, CFSTR("com.apple.camera"), v3, CFSTR("%@"), v6, v10, 12, v19, 0, 0);

  return v20;
}

WFFaceTimeContextualAction *__83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_9(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  WFAppShortcutNamedQueryInfo *v4;
  void *v5;
  WFAppShortcutNamedQueryInfo *v6;
  WFFaceTimeContextualAction *v7;
  void *v8;
  void *v9;
  void *v10;
  WFFaceTimeContextualAction *v11;

  v2 = a2;
  v3 = (objc_msgSend(v2, "callType") & 0xFFFFFFFFFFFFFFFDLL) != 0;
  v4 = [WFAppShortcutNamedQueryInfo alloc];
  WFLocalizedString(CFSTR("Recents"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFAppShortcutNamedQueryInfo initWithName:symbolName:](v4, "initWithName:symbolName:", v5, CFSTR("clock.fill"));

  v7 = [WFFaceTimeContextualAction alloc];
  objc_msgSend(v2, "person");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callTypeSerializedRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "personSerializedRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[WFFaceTimeContextualAction initWithPerson:type:callTypeSerializedRepresentation:personSerializedRepresentation:namedQueryInfo:](v7, "initWithPerson:type:callTypeSerializedRepresentation:personSerializedRepresentation:namedQueryInfo:", v8, v3, v9, v10, v6);
  return v11;
}

uint64_t __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "actionForCallDescriptor:namedQueryInfo:", a2, *(_QWORD *)(a1 + 32));
}

void __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_6(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  WFAppShortcutNamedQueryInfo *v6;
  void *v7;
  WFAppShortcutNamedQueryInfo *v8;
  uint64_t v9;
  WFAppShortcutNamedQueryInfo *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void *v19;
  WFAppShortcutNamedQueryInfo *v20;
  uint64_t v21;

  v5 = a2;
  if (v5)
  {
    v6 = [WFAppShortcutNamedQueryInfo alloc];
    WFLocalizedString(CFSTR("Recents"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[WFAppShortcutNamedQueryInfo initWithName:symbolName:](v6, "initWithName:symbolName:", v7, CFSTR("clock.fill"));

    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_7;
    v19 = &unk_1E5FC7960;
    v9 = a1[7];
    v20 = v8;
    v21 = v9;
    v10 = v8;
    objc_msgSend(v5, "if_map:", &v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", a1[5], v16, v17, v18, v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "if_orderedSetByAddingObjectsFromArray:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    if (a1[4])
      v15 = a1[4];
    else
      v15 = a3;
    (*(void (**)(_QWORD, _QWORD, uint64_t))(a1[6] + 16))(a1[6], 0, v15);
  }

}

uint64_t __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "actionForCallDescriptor:namedQueryInfo:", a2, *(_QWORD *)(a1 + 32));
}

WFRunShortcutContextualAction *__83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  WFRunShortcutContextualAction *v4;
  void *v5;
  void *v6;
  WFRunShortcutContextualAction *v7;

  v3 = a2;
  v4 = [WFRunShortcutContextualAction alloc];
  objc_msgSend(v3, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serializedRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[WFRunShortcutContextualAction initWithDescriptor:serializedRepresentation:namedQueryInfo:](v4, "initWithDescriptor:serializedRepresentation:namedQueryInfo:", v5, v6, *(_QWORD *)(a1 + 32));
  return v7;
}

@end

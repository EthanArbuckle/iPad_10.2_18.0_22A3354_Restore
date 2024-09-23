@implementation WFPlayMusicContextualAction

- (id)uniqueIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[WFContextualAction identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPlayMusicContextualAction intent](self, "intent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(":%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)displayString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedString(CFSTR("Play %@"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPlayMusicContextualAction intent](self, "intent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
  {
    objc_msgSend(v3, "stringWithFormat:", v4, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WFPlayMusicContextualAction intent](self, "intent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "mediaItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "title");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
    {
      objc_msgSend(v3, "stringWithFormat:", v4, v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      WFLocalizedString(CFSTR("Music"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringWithFormat:", v4, v15);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v9;
}

- (WFPlayMusicContextualAction)initWithIntent:(id)a3 artwork:(id)a4 namedQueryInfo:(id)a5
{
  id v9;
  id v10;
  id v11;
  WFContextualActionIcon *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  WFPlayMusicContextualAction *v19;
  void *v21;
  void *v22;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
    {
LABEL_3:
      v12 = -[WFContextualActionIcon initWithImageData:scale:displayStyle:]([WFContextualActionIcon alloc], "initWithImageData:scale:displayStyle:", v10, 0, 2.0);
      goto LABEL_6;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFPlayMusicContextualAction.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("intent"));

    if (v10)
      goto LABEL_3;
  }
  v12 = 0;
LABEL_6:
  WFLocalizedString(CFSTR("Play %@"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("Play Music"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mediaContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "title");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
  {
    objc_msgSend(v9, "mediaItems");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "title");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23.receiver = self;
  v23.super_class = (Class)WFPlayMusicContextualAction;
  v19 = -[WFTopHitItemContextualAction initWithItem:identifier:wfActionIdentifier:associatedAppBundleIdentifier:parameters:displayFormatString:title:subtitleFormatString:primaryColor:icon:accessoryIcon:namedQueryInfo:](&v23, sel_initWithItem_identifier_wfActionIdentifier_associatedAppBundleIdentifier_parameters_displayFormatString_title_subtitleFormatString_primaryColor_icon_accessoryIcon_namedQueryInfo_, v9, CFSTR("is.workflow.actions.playmusic"), CFSTR("is.workflow.actions.playmusic"), CFSTR("com.apple.Music"), MEMORY[0x1E0C9AA60], v14, v15, v18, 0, v12, 0, v11);
  if (!v17)
  {

  }
  -[WFPlayMusicContextualAction setIntent:](v19, "setIntent:", v9);

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFPlayMusicContextualAction;
  v4 = a3;
  -[WFContextualAction encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[WFPlayMusicContextualAction intent](self, "intent", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("intent"));

}

- (WFPlayMusicContextualAction)initWithCoder:(id)a3
{
  id v4;
  WFPlayMusicContextualAction *v5;
  uint64_t v6;
  INPlayMediaIntent *intent;
  WFPlayMusicContextualAction *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFPlayMusicContextualAction;
  v5 = -[WFContextualAction initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intent"));
    v6 = objc_claimAutoreleasedReturnValue();
    intent = v5->_intent;
    v5->_intent = (INPlayMediaIntent *)v6;

    v8 = v5;
  }

  return v5;
}

- (INPlayMediaIntent)intent
{
  return self->_intent;
}

- (void)setIntent:(id)a3
{
  objc_storeStrong((id *)&self->_intent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intent, 0);
}

+ (WFTopHitItemContextualAction)disambiguationAction
{
  WFPlayMusicContextualAction *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  WFContextualActionIcon *v8;
  WFPlayMusicContextualAction *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = [WFPlayMusicContextualAction alloc];
  objc_msgSend(a1, "disambiguationParameter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedStringWithKey(CFSTR("Recently Played Music (Display Format String)"), CFSTR("Play %@"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedStringWithKey(CFSTR("Recently Played (Title)"), CFSTR("Recently Played"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFContextualActionIcon initWithSystemName:]([WFContextualActionIcon alloc], "initWithSystemName:", CFSTR("music.quarternote.3"));
  v9 = -[WFTopHitItemContextualAction initWithItem:identifier:wfActionIdentifier:associatedAppBundleIdentifier:parameters:displayFormatString:title:subtitleFormatString:primaryColor:icon:accessoryIcon:namedQueryInfo:](v3, "initWithItem:identifier:wfActionIdentifier:associatedAppBundleIdentifier:parameters:displayFormatString:title:subtitleFormatString:primaryColor:icon:accessoryIcon:namedQueryInfo:", 0, CFSTR("is.workflow.actions.playmusic"), CFSTR("is.workflow.actions.playmusic"), CFSTR("com.apple.Music"), v5, v6, v7, 0, 0, v8, 0, 0);

  return (WFTopHitItemContextualAction *)v9;
}

+ (WFContextualActionParameter)disambiguationParameter
{
  return -[WFContextualActionParameter initWithType:displayString:wfParameterKey:askEachTime:]([WFContextualActionParameter alloc], "initWithType:displayString:wfParameterKey:askEachTime:", CFSTR("WFMPMediaContentItem"), &stru_1E5FC92C0, CFSTR("WFMediaItems"), 1);
}

+ (id)availableCollectionIdentifiers
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("Suggested"), 0);
}

+ (void)disambiguationEntriesForCollection:(id)a3 limit:(int64_t)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  char v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v7 = a3;
  v8 = a5;
  +[VCVoiceShortcutClient standardClient](VCVoiceShortcutClient, "standardClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (__CFString *)v7;
  v11 = v10;
  if (v10 == CFSTR("Suggested")
    || v10
    && (v12 = -[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("Suggested")),
        v11,
        (v12 & 1) != 0))
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __90__WFPlayMusicContextualAction_disambiguationEntriesForCollection_limit_completionHandler___block_invoke;
    v14[3] = &unk_1E5FC8248;
    v15 = v8;
    objc_msgSend(v9, "getUpcomingMediaForBundleIdentifier:limit:completion:", CFSTR("com.apple.Music"), a4, v14);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TopHitItemContextualActionError"), 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v13);

  }
}

+ (id)disambiguationSummaryStringForCollection:(id)a3
{
  void *v3;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("Suggested")))
  {
    WFLocalizedStringWithKey(CFSTR("Recently Played (Disambiguation Action Title)"), CFSTR("Recently Played"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (id)disambiguationSummaryStringWithParameterDefined:(BOOL)a3
{
  __CFString *v3;
  __CFString *v4;

  if (a3)
  {
    v3 = CFSTR("Populated Play Specific Music (Title)");
    v4 = CFSTR("Play ${WFMediaItems}");
  }
  else
  {
    v3 = CFSTR("Unpopulated Play Specific Music (Title)");
    v4 = CFSTR("Play Music…");
  }
  WFLocalizedStringWithKey(v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __90__WFPlayMusicContextualAction_disambiguationEntriesForCollection_limit_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(a2, "if_compactMap:", &__block_literal_global_17485);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

WFPlayMusicContextualAction *__90__WFPlayMusicContextualAction_disambiguationEntriesForCollection_limit_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  WFAppShortcutNamedQueryInfo *v3;
  void *v4;
  WFAppShortcutNamedQueryInfo *v5;
  WFPlayMusicContextualAction *v6;
  void *v7;
  void *v8;
  WFPlayMusicContextualAction *v9;

  v2 = a2;
  v3 = [WFAppShortcutNamedQueryInfo alloc];
  WFLocalizedString(CFSTR("Suggested"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WFAppShortcutNamedQueryInfo initWithName:symbolName:](v3, "initWithName:symbolName:", v4, CFSTR("music.and.sparkles"));

  v6 = [WFPlayMusicContextualAction alloc];
  objc_msgSend(v2, "intent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "artwork");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[WFPlayMusicContextualAction initWithIntent:artwork:namedQueryInfo:](v6, "initWithIntent:artwork:namedQueryInfo:", v7, v8, v5);
  return v9;
}

@end

@implementation VCVoiceShortcutSuggestionListManagedObject

- (id)descriptor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  WFShortcutSuggestionsDescriptor *v9;
  void *v10;
  void *v11;
  WFShortcutSuggestionsDescriptor *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3710];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCVoiceShortcutSuggestionListManagedObject serializedSuggestions](self, "serializedSuggestions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unarchivedObjectOfClasses:fromData:error:", v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [WFShortcutSuggestionsDescriptor alloc];
  -[VCVoiceShortcutSuggestionListManagedObject associatedAppBundleIdentifier](self, "associatedAppBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v11 = v8;
  else
    v11 = (void *)MEMORY[0x1E0C9AA60];
  v12 = -[WFShortcutSuggestionsDescriptor initWithIdentifier:suggestions:availability:](v9, "initWithIdentifier:suggestions:availability:", v10, v11, (int)-[VCVoiceShortcutSuggestionListManagedObject shortcutAvailabilityOptions](self, "shortcutAvailabilityOptions"));

  return v12;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("VCVoiceShortcutSuggestionListManagedObject"));
}

@end

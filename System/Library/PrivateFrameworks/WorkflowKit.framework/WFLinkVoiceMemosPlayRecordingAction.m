@implementation WFLinkVoiceMemosPlayRecordingAction

- (id)entityParameterName
{
  return CFSTR("entity");
}

- (id)verb
{
  return CFSTR("play");
}

- (id)overrideLabelsByParameter
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[WFLinkVoiceMemosPlayRecordingAction entityParameterName](self, "entityParameterName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  -[WFLinkEntityAction capitalizedEntityName](self, "capitalizedEntityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)localizedCategoryWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  WFLocalizedStringResourceWithKey(CFSTR("VoiceMemosSubcategoryRecordings"), CFSTR("Recordings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localize:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)appName
{
  return CFSTR("Voice Memos");
}

@end

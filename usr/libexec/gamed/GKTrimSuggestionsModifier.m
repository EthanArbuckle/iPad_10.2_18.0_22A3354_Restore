@implementation GKTrimSuggestionsModifier

- (GKTrimSuggestionsModifier)initWithSettings:(id)a3
{
  id v5;
  GKTrimSuggestionsModifier *v6;
  GKTrimSuggestionsModifier *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKTrimSuggestionsModifier;
  v6 = -[GKTrimSuggestionsModifier init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_settings, a3);

  return v7;
}

- (id)trimSuggestions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKTrimSuggestionsModifier settings](self, "settings"));
  v6 = objc_msgSend(v5, "suggestionsLimit");

  v7 = objc_msgSend(v4, "count");
  if (v6 >= v7)
    v8 = v7;
  else
    v8 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subarrayWithRange:", 0, v8));

  if (!os_log_GKGeneral)
    v11 = (id)GKOSLoggers(v10);
  v12 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v14 = 136315394;
    v15 = "-[GKTrimSuggestionsModifier trimSuggestions:]";
    v16 = 2112;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s trimmedResults: %@", (uint8_t *)&v14, 0x16u);
  }
  return v9;
}

- (GKFriendSuggesterSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  objc_storeStrong((id *)&self->_settings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
}

@end

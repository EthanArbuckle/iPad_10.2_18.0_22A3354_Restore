@implementation _SBProactiveAppSuggestion

- (_SBProactiveAppSuggestion)initWithAppSuggestion:(id)a3
{
  id v5;
  _SBProactiveAppSuggestion *v6;
  _SBProactiveAppSuggestion *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SBProactiveAppSuggestion;
  v6 = -[_SBProactiveAppSuggestion init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_appSuggestion, a3);

  return v7;
}

- (NSUUID)resultUUID
{
  return (NSUUID *)-[ATXProactiveSuggestion uuid](self->_appSuggestion, "uuid");
}

- (id)bundleIdentifier
{
  void *v2;
  void *v3;

  -[ATXProactiveSuggestion executableSpecification](self->_appSuggestion, "executableSpecification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executableObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isLocationBasedSuggestion
{
  void *v2;
  int v3;

  -[ATXProactiveSuggestion uiSpecification](self->_appSuggestion, "uiSpecification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "predictionReasons");

  return (*(_QWORD *)&v3 & 0x11800) != 0;
}

- (BOOL)isLocallyGeneratedSuggestion
{
  return 1;
}

- (BOOL)isPrediction
{
  return 1;
}

- (BOOL)isHeadphonesPrediction
{
  void *v2;
  BOOL v3;

  -[ATXProactiveSuggestion uiSpecification](self->_appSuggestion, "uiSpecification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "predictionReasons") == 4;

  return v3;
}

- (BOOL)isBluetoothPrediction
{
  void *v2;
  BOOL v3;

  -[ATXProactiveSuggestion uiSpecification](self->_appSuggestion, "uiSpecification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "predictionReasons") == 16;

  return v3;
}

- (BOOL)isBluetoothAudioPrediction
{
  void *v2;
  BOOL v3;

  -[ATXProactiveSuggestion uiSpecification](self->_appSuggestion, "uiSpecification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (~objc_msgSend(v2, "predictionReasons") & 0x14) == 0;

  return v3;
}

- (BOOL)isCarPlayPrediction
{
  void *v2;
  unint64_t v3;

  -[ATXProactiveSuggestion uiSpecification](self->_appSuggestion, "uiSpecification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ((unint64_t)objc_msgSend(v2, "predictionReasons") >> 6) & 1;

  return v3;
}

- (BOOL)isFirstWakePrediction
{
  void *v2;
  unint64_t v3;

  -[ATXProactiveSuggestion uiSpecification](self->_appSuggestion, "uiSpecification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ((unint64_t)objc_msgSend(v2, "predictionReasons") >> 10) & 1;

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _SBProactiveAppSuggestion *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (_SBProactiveAppSuggestion *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SBProactiveAppSuggestion resultUUID](v4, "resultUUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SBProactiveAppSuggestion resultUUID](self, "resultUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[_SBProactiveAppSuggestion resultUUID](self, "resultUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (ATXProactiveSuggestion)appSuggestion
{
  return self->_appSuggestion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appSuggestion, 0);
}

@end

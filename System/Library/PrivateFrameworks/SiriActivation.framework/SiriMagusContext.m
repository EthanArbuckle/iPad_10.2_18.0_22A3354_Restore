@implementation SiriMagusContext

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SiriContext contextOverride](self, "contextOverride");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriContinuityContext speechRequestOptions](self, "speechRequestOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriContinuityContext requestInfo](self, "requestInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriContinuityContext userActivity](self, "userActivity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<SiriMagusContext contextOverride:%@, speechRequestOptions:%@, requestInfo:%@, userActivity:%@>"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end

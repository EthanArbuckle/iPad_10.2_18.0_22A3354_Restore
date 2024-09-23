@implementation SiriNLUTypesUtilities

+ (id)serverDelegatedUserDialogActFromNLUResponse:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "supplementaryOutput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rewrite");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRewrite:", v6);

  objc_msgSend(v3, "supplementaryOutput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "matchingSpans");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMatchingSpans:", v8);

  objc_msgSend(v4, "setAsrHypothesisIndex:", 0);
  objc_msgSend(v4, "setExternalParserId:", CFSTR("com.apple.siri.nlv3"));
  return v4;
}

@end

@implementation PSConfig

void __21___PSConfig__configs__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  +[_PSConfig _loadPlistNamed:abortOnFailure:](*(_QWORD *)(a1 + 32), CFSTR("com.apple.PeopleSuggester.Config.Default"), 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_configs_configs;
  _configs_configs = v2;

  +[_PSConfig _loadPlistNamed:abortOnFailure:](*(_QWORD *)(a1 + 32), CFSTR("com.apple.PeopleSuggester.MessagesPinning.Config"), 1);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ED00A3B0;
  qword_1ED00A3B0 = v4;

  +[_PSConfig _loadPlistNamed:abortOnFailure:](*(_QWORD *)(a1 + 32), CFSTR("com.apple.PeopleSuggester.ContactEmbedding.Features"), 1);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)qword_1ED00A3B8;
  qword_1ED00A3B8 = v6;

  +[_PSConfig _loadPlistNamed:abortOnFailure:](*(_QWORD *)(a1 + 32), CFSTR("vocab"), 1);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)qword_1ED00A3C0;
  qword_1ED00A3C0 = v8;

}

@end

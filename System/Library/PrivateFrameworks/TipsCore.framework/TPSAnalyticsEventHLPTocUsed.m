@implementation TPSAnalyticsEventHLPTocUsed

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)event
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithDate:", 0);
}

- (id)eventName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.tips"), CFSTR("HLPTocUsed"));
}

- (id)mutableAnalyticsEventRepresentation
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[TPSCommonDefines isSeniorUser](TPSCommonDefines, "isSeniorUser"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("u65_flag"));

  return v2;
}

@end

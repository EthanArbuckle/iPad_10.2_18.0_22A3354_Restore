@implementation TTSMatchedRuleReplacement

- (TTSRegexMatch)match
{
  return self->_match;
}

- (void)setMatch:(id)a3
{
  objc_storeStrong((id *)&self->_match, a3);
}

- (NSString)replacement
{
  return self->_replacement;
}

- (void)setReplacement:(id)a3
{
  objc_storeStrong((id *)&self->_replacement, a3);
}

- (TTSRuleReplacement)ruleReplacement
{
  return (TTSRuleReplacement *)objc_loadWeakRetained((id *)&self->_ruleReplacement);
}

- (void)setRuleReplacement:(id)a3
{
  objc_storeWeak((id *)&self->_ruleReplacement, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ruleReplacement);
  objc_storeStrong((id *)&self->_replacement, 0);
  objc_storeStrong((id *)&self->_match, 0);
}

@end

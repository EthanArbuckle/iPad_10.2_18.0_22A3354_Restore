@implementation TTSRuleReplacement

- (unint64_t)effectiveIndex
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;

  objc_msgSend_group(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    return MEMORY[0x1E0DE7D20](self, sel_index, v8, v9, v10);
  objc_msgSend_group(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_endIndex(v11, v12, v13, v14, v15);

  return v16;
}

- (NSString)identifier
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_ruleset(self, a2, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB37E8];
  v18 = objc_msgSend_originalRulesetIndex(self, v14, v15, v16, v17);
  objc_msgSend_numberWithUnsignedInt_(v13, v19, v18, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v6, v23, (uint64_t)CFSTR("%@_%@"), v24, v25, v12, v22);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v26;
}

- (TTSRegex)regex
{
  return self->_regex;
}

- (void)setRegex:(id)a3
{
  objc_storeStrong((id *)&self->_regex, a3);
}

- (NSString)replacement
{
  return self->_replacement;
}

- (void)setReplacement:(id)a3
{
  objc_storeStrong((id *)&self->_replacement, a3);
}

- (id)postMatch
{
  return self->_postMatch;
}

- (void)setPostMatch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isTerminalRule
{
  return self->_isTerminalRule;
}

- (void)setIsTerminalRule:(BOOL)a3
{
  self->_isTerminalRule = a3;
}

- (TTSRuleset)ruleset
{
  return (TTSRuleset *)objc_loadWeakRetained((id *)&self->_ruleset);
}

- (void)setRuleset:(id)a3
{
  objc_storeWeak((id *)&self->_ruleset, a3);
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (unsigned)originalRulesetIndex
{
  return self->_originalRulesetIndex;
}

- (void)setOriginalRulesetIndex:(unsigned int)a3
{
  self->_originalRulesetIndex = a3;
}

- (TTSRuleGroup)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
  objc_storeStrong((id *)&self->_group, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_destroyWeak((id *)&self->_ruleset);
  objc_storeStrong(&self->_postMatch, 0);
  objc_storeStrong((id *)&self->_replacement, 0);
  objc_storeStrong((id *)&self->_regex, 0);
}

@end

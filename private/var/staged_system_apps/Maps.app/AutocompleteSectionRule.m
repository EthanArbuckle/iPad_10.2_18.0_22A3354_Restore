@implementation AutocompleteSectionRule

+ (id)ruleMatchingAnySourceType
{
  uint64_t v3;
  uint64_t v4;

  LOBYTE(v4) = 0;
  LOBYTE(v3) = 0;
  return objc_msgSend(objc_alloc((Class)a1), "initMatchingAnySourceType:sourceType:matchesAnySourceSubtype:sourceSubtype:matchesAnyIndexInCompletionSections:indexInCompletionSections:excludesAnySourceType:excludedSourceType:excludesAnySourceSubtype:excludedSourceSubtype:", 1, 0, 1, 0, 1, 0, v3, 0, v4, 0);
}

+ (id)ruleMatchingAnySourceTypeWithIndexInCompletionSections:(id)a3
{
  id v4;
  id v5;
  uint64_t v7;
  uint64_t v8;

  v4 = a3;
  LOBYTE(v8) = 0;
  LOBYTE(v7) = 0;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initMatchingAnySourceType:sourceType:matchesAnySourceSubtype:sourceSubtype:matchesAnyIndexInCompletionSections:indexInCompletionSections:excludesAnySourceType:excludedSourceType:excludesAnySourceSubtype:excludedSourceSubtype:", 1, 0, 1, 0, 0, v4, v7, 0, v8, 0);

  return v5;
}

+ (id)ruleWithSourceType:(int64_t)a3
{
  return _objc_msgSend(a1, "ruleWithSourceType:matchesAnySourceSubtype:sourceSubtype:indexInCompletionSections:", a3, 1, 0, 0);
}

+ (id)ruleWithSourceType:(int64_t)a3 sourceSubtype:(int64_t)a4
{
  return _objc_msgSend(a1, "ruleWithSourceType:matchesAnySourceSubtype:sourceSubtype:indexInCompletionSections:", a3, 0, a4, 0);
}

+ (id)ruleWithSourceType:(int64_t)a3 sourceSubtype:(int64_t)a4 indexInCompletionSections:(id)a5
{
  return _objc_msgSend(a1, "ruleWithSourceType:matchesAnySourceSubtype:sourceSubtype:indexInCompletionSections:", a3, 0, a4, a5);
}

+ (id)ruleWithSourceType:(int64_t)a3 indexInCompletionSections:(id)a4
{
  return _objc_msgSend(a1, "ruleWithSourceType:matchesAnySourceSubtype:sourceSubtype:indexInCompletionSections:", a3, 1, 0, a4);
}

+ (id)ruleWithSourceType:(int64_t)a3 matchesAnySourceSubtype:(BOOL)a4 sourceSubtype:(int64_t)a5 indexInCompletionSections:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  uint64_t v12;
  uint64_t v13;

  v7 = a4;
  v9 = a6;
  LOBYTE(v13) = 0;
  LOBYTE(v12) = 0;
  v10 = -[AutocompleteSectionRule initMatchingAnySourceType:sourceType:matchesAnySourceSubtype:sourceSubtype:matchesAnyIndexInCompletionSections:indexInCompletionSections:excludesAnySourceType:excludedSourceType:excludesAnySourceSubtype:excludedSourceSubtype:]([AutocompleteSectionRule alloc], "initMatchingAnySourceType:sourceType:matchesAnySourceSubtype:sourceSubtype:matchesAnyIndexInCompletionSections:indexInCompletionSections:excludesAnySourceType:excludedSourceType:excludesAnySourceSubtype:excludedSourceSubtype:", 0, a3, v7, a5, 0, v9, v12, 0, v13, 0);

  return v10;
}

+ (id)ruleExcludingSourceType:(int64_t)a3
{
  return objc_msgSend(a1, "ruleExcludingSourceType:sourceSubtype:", a3, 0);
}

+ (id)ruleExcludingSourceType:(int64_t)a3 sourceSubtype:(int64_t)a4
{
  uint64_t v5;
  uint64_t v6;

  LOBYTE(v6) = a4 != 0;
  LOBYTE(v5) = 1;
  return -[AutocompleteSectionRule initMatchingAnySourceType:sourceType:matchesAnySourceSubtype:sourceSubtype:matchesAnyIndexInCompletionSections:indexInCompletionSections:excludesAnySourceType:excludedSourceType:excludesAnySourceSubtype:excludedSourceSubtype:]([AutocompleteSectionRule alloc], "initMatchingAnySourceType:sourceType:matchesAnySourceSubtype:sourceSubtype:matchesAnyIndexInCompletionSections:indexInCompletionSections:excludesAnySourceType:excludedSourceType:excludesAnySourceSubtype:excludedSourceSubtype:", 0, 0, 0, 0, 0, 0, v5, a3, v6, a4);
}

- (id)initMatchingAnySourceType:(BOOL)a3 sourceType:(int64_t)a4 matchesAnySourceSubtype:(BOOL)a5 sourceSubtype:(int64_t)a6 matchesAnyIndexInCompletionSections:(BOOL)a7 indexInCompletionSections:(id)a8 excludesAnySourceType:(BOOL)a9 excludedSourceType:(int64_t)a10 excludesAnySourceSubtype:(BOOL)a11 excludedSourceSubtype:(int64_t)a12
{
  id v19;
  AutocompleteSectionRule *v20;
  AutocompleteSectionRule *v21;
  objc_super v23;

  v19 = a8;
  v23.receiver = self;
  v23.super_class = (Class)AutocompleteSectionRule;
  v20 = -[AutocompleteSectionRule init](&v23, "init");
  v21 = v20;
  if (v20)
  {
    v20->_matchesAnySourceType = a3;
    v20->_matchesAnySourceSubtype = a5;
    v20->_sourceType = a4;
    v20->_sourceSubtype = a6;
    v20->_matchesAnyIndexInCompletionSections = a7;
    objc_storeStrong((id *)&v20->_indexInCompletionSections, a8);
    v21->_excludesAnySourceType = a9;
    v21->_excludesAnySourceSubtype = a11;
    v21->_excludedSourceType = a10;
    v21->_excludedSourceSubtype = a12;
  }

  return v21;
}

- (BOOL)matchesItemWithSourceType:(int64_t)a3 sourceSubtype:(int64_t)a4 indexInCompletionSections:(id)a5
{
  id v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a5;
  if (-[AutocompleteSectionRule excludesAnySourceType](self, "excludesAnySourceType"))
  {
    if (!-[AutocompleteSectionRule excludesAnySourceSubtype](self, "excludesAnySourceSubtype")
      || -[AutocompleteSectionRule excludedSourceType](self, "excludedSourceType") != a3
      || -[AutocompleteSectionRule excludedSourceSubtype](self, "excludedSourceSubtype") != a4)
    {
      v9 = -[AutocompleteSectionRule excludedSourceType](self, "excludedSourceType") != a3;
      goto LABEL_22;
    }
LABEL_21:
    v9 = 0;
    goto LABEL_22;
  }
  if (!-[AutocompleteSectionRule matchesAnySourceType](self, "matchesAnySourceType")
    && -[AutocompleteSectionRule sourceType](self, "sourceType") != a3
    || !-[AutocompleteSectionRule matchesAnySourceSubtype](self, "matchesAnySourceSubtype")
    && -[AutocompleteSectionRule sourceSubtype](self, "sourceSubtype") != a4)
  {
    goto LABEL_21;
  }
  if (!-[AutocompleteSectionRule matchesAnyIndexInCompletionSections](self, "matchesAnyIndexInCompletionSections"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteSectionRule indexInCompletionSections](self, "indexInCompletionSections"));
    v11 = v10;
    if (!v8 && v10)
    {

      goto LABEL_21;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteSectionRule indexInCompletionSections](self, "indexInCompletionSections"));

    if (v8 && !v14)
      goto LABEL_21;
  }
  if (-[AutocompleteSectionRule matchesAnyIndexInCompletionSections](self, "matchesAnyIndexInCompletionSections"))
  {
    v9 = 1;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteSectionRule indexInCompletionSections](self, "indexInCompletionSections"));

    v9 = 1;
    if (v8 && v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteSectionRule indexInCompletionSections](self, "indexInCompletionSections"));
      v9 = objc_msgSend(v13, "isEqualToNumber:", v8);

    }
  }
LABEL_22:

  return v9;
}

- (id)debugDescription
{
  int64_t v3;
  int64_t v4;
  void *v5;
  void *v6;

  v3 = -[AutocompleteSectionRule sourceType](self, "sourceType");
  v4 = -[AutocompleteSectionRule sourceSubtype](self, "sourceSubtype");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteSectionRule indexInCompletionSections](self, "indexInCompletionSections"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Allow type:%ld; subtype:%ld, indexInResponse:%@"),
                   v3,
                   v4,
                   v5));

  return v6;
}

- (BOOL)matchesAnySourceType
{
  return self->_matchesAnySourceType;
}

- (void)setMatchesAnySourceType:(BOOL)a3
{
  self->_matchesAnySourceType = a3;
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (void)setSourceType:(int64_t)a3
{
  self->_sourceType = a3;
}

- (BOOL)matchesAnySourceSubtype
{
  return self->_matchesAnySourceSubtype;
}

- (void)setMatchesAnySourceSubtype:(BOOL)a3
{
  self->_matchesAnySourceSubtype = a3;
}

- (int64_t)sourceSubtype
{
  return self->_sourceSubtype;
}

- (void)setSourceSubtype:(int64_t)a3
{
  self->_sourceSubtype = a3;
}

- (BOOL)matchesAnyIndexInCompletionSections
{
  return self->_matchesAnyIndexInCompletionSections;
}

- (void)setMatchesAnyIndexInCompletionSections:(BOOL)a3
{
  self->_matchesAnyIndexInCompletionSections = a3;
}

- (NSNumber)indexInCompletionSections
{
  return self->_indexInCompletionSections;
}

- (void)setIndexInCompletionSections:(id)a3
{
  objc_storeStrong((id *)&self->_indexInCompletionSections, a3);
}

- (BOOL)excludesAnySourceType
{
  return self->_excludesAnySourceType;
}

- (void)setExcludesAnySourceType:(BOOL)a3
{
  self->_excludesAnySourceType = a3;
}

- (int64_t)excludedSourceType
{
  return self->_excludedSourceType;
}

- (void)setExcludedSourceType:(int64_t)a3
{
  self->_excludedSourceType = a3;
}

- (BOOL)excludesAnySourceSubtype
{
  return self->_excludesAnySourceSubtype;
}

- (void)setExcludesAnySourceSubtype:(BOOL)a3
{
  self->_excludesAnySourceSubtype = a3;
}

- (int64_t)excludedSourceSubtype
{
  return self->_excludedSourceSubtype;
}

- (void)setExcludedSourceSubtype:(int64_t)a3
{
  self->_excludedSourceSubtype = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexInCompletionSections, 0);
}

@end

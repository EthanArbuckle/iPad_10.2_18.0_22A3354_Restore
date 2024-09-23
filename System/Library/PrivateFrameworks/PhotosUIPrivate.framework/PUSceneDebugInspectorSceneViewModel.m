@implementation PUSceneDebugInspectorSceneViewModel

- (PUSceneDebugInspectorSceneViewModel)initWithKeyword:(id)a3 synonyms:(id)a4 sceneIdentifier:(unint64_t)a5 indexed:(BOOL)a6 threshold:(double)a7
{
  id v12;
  id v13;
  PUSceneDebugInspectorSceneViewModel *v14;
  uint64_t v15;
  NSString *keyword;
  uint64_t v17;
  NSArray *synonyms;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PUSceneDebugInspectorSceneViewModel;
  v14 = -[PUSceneDebugInspectorSceneViewModel init](&v20, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v12, "copy");
    keyword = v14->_keyword;
    v14->_keyword = (NSString *)v15;

    v17 = objc_msgSend(v13, "copy");
    synonyms = v14->_synonyms;
    v14->_synonyms = (NSArray *)v17;

    v14->_sceneIdentifier = a5;
    v14->_isIndexed = a6;
    v14->_threshold = a7;
  }

  return v14;
}

- (id)concatenatedSynonyms
{
  void *v2;
  __CFString *v3;

  -[PUSceneDebugInspectorSceneViewModel synonyms](self, "synonyms");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "componentsJoinedByString:", CFSTR(" | "));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1E58AD278;
  }

  return v3;
}

- (id)description
{
  void *v3;
  const __CFString *v4;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "appendFormat:", CFSTR("keyword: %@\n"), self->_keyword);
  objc_msgSend(v3, "appendFormat:", CFSTR("sceneIdentifier: %llu\n"), self->_sceneIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("count: %lu\n"), self->_count);
  objc_msgSend(v3, "appendFormat:", CFSTR("libraryCoverage: %f\n"), *(_QWORD *)&self->_libraryCoverage);
  if (self->_isIndexed)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("isIndexed: %@\n"), v4);
  objc_msgSend(v3, "appendFormat:", CFSTR("threshold: %f\n"), *(_QWORD *)&self->_threshold);
  objc_msgSend(v3, "appendFormat:", CFSTR("synonyms: %@\n"), self->_synonyms);
  return v3;
}

- (NSString)keyword
{
  return self->_keyword;
}

- (unint64_t)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (BOOL)isIndexed
{
  return self->_isIndexed;
}

- (double)threshold
{
  return self->_threshold;
}

- (NSArray)synonyms
{
  return self->_synonyms;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (unint64_t)highConfidenceCount
{
  return self->_highConfidenceCount;
}

- (void)setHighConfidenceCount:(unint64_t)a3
{
  self->_highConfidenceCount = a3;
}

- (double)libraryCoverage
{
  return self->_libraryCoverage;
}

- (void)setLibraryCoverage:(double)a3
{
  self->_libraryCoverage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synonyms, 0);
  objc_storeStrong((id *)&self->_keyword, 0);
}

@end

@implementation VIService

- (VIService)init
{
  VIService *v2;
  uint64_t v3;
  _TtC18VisualIntelligence35VisualIntelligenceServiceCompatible *compatService;
  uint64_t v5;
  _TtC18VisualIntelligence26VITextLookupFlowCompatible *textLookupFlow;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VIService;
  v2 = -[VIService init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    compatService = v2->_compatService;
    v2->_compatService = (_TtC18VisualIntelligence35VisualIntelligenceServiceCompatible *)v3;

    v5 = objc_opt_new();
    textLookupFlow = v2->_textLookupFlow;
    v2->_textLookupFlow = (_TtC18VisualIntelligence26VITextLookupFlowCompatible *)v5;

  }
  return v2;
}

- (VIService)initWithNetworkTimeoutInterval:(int64_t)a3
{
  VIService *v4;
  _TtC18VisualIntelligence35VisualIntelligenceServiceCompatible *v5;
  _TtC18VisualIntelligence35VisualIntelligenceServiceCompatible *compatService;
  uint64_t v7;
  _TtC18VisualIntelligence26VITextLookupFlowCompatible *textLookupFlow;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VIService;
  v4 = -[VIService init](&v10, sel_init);
  if (v4)
  {
    v5 = -[VisualIntelligenceServiceCompatible initWithTimeoutInterval:]([_TtC18VisualIntelligence35VisualIntelligenceServiceCompatible alloc], "initWithTimeoutInterval:", a3);
    compatService = v4->_compatService;
    v4->_compatService = v5;

    v7 = objc_opt_new();
    textLookupFlow = v4->_textLookupFlow;
    v4->_textLookupFlow = (_TtC18VisualIntelligence26VITextLookupFlowCompatible *)v7;

  }
  return v4;
}

- (CGSize)targetImageSizeForInputImageSize:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[VisualIntelligenceServiceCompatible targetImageSizeWithInputImageSize:](self->_compatService, "targetImageSizeWithInputImageSize:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)parseWithVisualQuery:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  _TtC18VisualIntelligence35VisualIntelligenceServiceCompatible *compatService;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (v6)
  {
    compatService = self->_compatService;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __45__VIService_parseWithVisualQuery_completion___block_invoke;
    v13[3] = &unk_1E9807840;
    v14 = v7;
    -[VisualIntelligenceServiceCompatible parseWithVisualQuery:completion:](compatService, "parseWithVisualQuery:completion:", v6, v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v7)
    {
      _VIServiceNilInputError();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v11);

    }
    v10 = 0;
  }

  return v10;
}

uint64_t __45__VIService_parseWithVisualQuery_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)parseWithVisualQuery:(id)a3 cachedResults:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD);
  _TtC18VisualIntelligence35VisualIntelligenceServiceCompatible *compatService;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v10;
  if (v8)
  {
    compatService = self->_compatService;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __59__VIService_parseWithVisualQuery_cachedResults_completion___block_invoke;
    v16[3] = &unk_1E9807868;
    v17 = v10;
    -[VisualIntelligenceServiceCompatible parseCachedWithVisualQuery:cachedResults:completion:](compatService, "parseCachedWithVisualQuery:cachedResults:completion:", v8, v9, v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v10)
    {
      _VIServiceNilInputError();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, _QWORD, void *))v11)[2](v11, 0, 0, v14);

    }
    v13 = 0;
  }

  return v13;
}

uint64_t __59__VIService_parseWithVisualQuery_cachedResults_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)parseWithVisualQuery:(id)a3 cachedResult:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD);
  _TtC18VisualIntelligence35VisualIntelligenceServiceCompatible *compatService;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v10;
  if (v8)
  {
    compatService = self->_compatService;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __58__VIService_parseWithVisualQuery_cachedResult_completion___block_invoke;
    v16[3] = &unk_1E9807868;
    v17 = v10;
    -[VisualIntelligenceServiceCompatible parseCachedWithVisualQuery:cachedResults:completion:](compatService, "parseCachedWithVisualQuery:cachedResults:completion:", v8, v9, v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v10)
    {
      _VIServiceNilInputError();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, _QWORD, void *))v11)[2](v11, 0, 0, v14);

    }
    v13 = 0;
  }

  return v13;
}

uint64_t __58__VIService_parseWithVisualQuery_cachedResult_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)searchWithParsedVisualQuery:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  _TtC18VisualIntelligence35VisualIntelligenceServiceCompatible *compatService;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (v6)
  {
    compatService = self->_compatService;
    objc_msgSend(v6, "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "visualUnderstanding");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "queryContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VisualIntelligenceServiceCompatible searchWithImage:visualUnderstanding:queryContext:completion:](compatService, "searchWithImage:visualUnderstanding:queryContext:completion:", v10, v11, v12, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (!v7)
    {
      v13 = 0;
      goto LABEL_6;
    }
    +[VISearchResult empty](VISearchResult, "empty");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _VIServiceNilInputError();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v8)[2](v8, v10, v11);
    v13 = 0;
  }

LABEL_6:
  return v13;
}

- (id)experimentalSearchWithParsedVisualQuery:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  _TtC18VisualIntelligence35VisualIntelligenceServiceCompatible *compatService;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (v6)
  {
    compatService = self->_compatService;
    objc_msgSend(v6, "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "visualUnderstanding");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "queryContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VisualIntelligenceServiceCompatible experimentalSearchWithImage:visualUnderstanding:queryContext:completion:](compatService, "experimentalSearchWithImage:visualUnderstanding:queryContext:completion:", v10, v11, v12, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (!v7)
    {
      v13 = 0;
      goto LABEL_6;
    }
    +[VISearchResult empty](VISearchResult, "empty");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _VIServiceNilInputError();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v8)[2](v8, v10, v11);
    v13 = 0;
  }

LABEL_6:
  return v13;
}

- (id)encryptedSearchWithParsedVisualQuery:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  _TtC18VisualIntelligence35VisualIntelligenceServiceCompatible *compatService;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (v6)
  {
    compatService = self->_compatService;
    objc_msgSend(v6, "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "visualUnderstanding");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "queryContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VisualIntelligenceServiceCompatible encryptedSearchWithImage:visualUnderstanding:queryContext:completion:](compatService, "encryptedSearchWithImage:visualUnderstanding:queryContext:completion:", v10, v11, v12, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (!v7)
    {
      v13 = 0;
      goto LABEL_6;
    }
    +[VISearchResult empty](VISearchResult, "empty");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _VIServiceNilInputError();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v8)[2](v8, v10, v11);
    v13 = 0;
  }

LABEL_6:
  return v13;
}

- (id)encryptedSearchWithParsedVisualQuery:(id)a3 domain:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  _TtC18VisualIntelligence35VisualIntelligenceServiceCompatible *compatService;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))v10;
  if (v8)
  {
    compatService = self->_compatService;
    objc_msgSend(v8, "image");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "visualUnderstanding");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "queryContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VisualIntelligenceServiceCompatible encryptedSearchWithImage:visualUnderstanding:queryContext:domain:completion:](compatService, "encryptedSearchWithImage:visualUnderstanding:queryContext:domain:completion:", v13, v14, v15, v9, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (!v10)
    {
      v16 = 0;
      goto LABEL_6;
    }
    +[VISearchResult empty](VISearchResult, "empty");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _VIServiceNilInputError();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v11)[2](v11, v13, v14);
    v16 = 0;
  }

LABEL_6:
  return v16;
}

- (BOOL)isEligibleForEncryptedSearchWithCachedResults:(id)a3
{
  return !a3
      || -[VisualIntelligenceServiceCompatible isEligibleForEncryptedSearchWithCachedResults:](self->_compatService, "isEligibleForEncryptedSearchWithCachedResults:");
}

- (id)getEncryptedSearchDomainsWithVisualQuery:(id)a3 cachedResults:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD);
  _TtC18VisualIntelligence35VisualIntelligenceServiceCompatible *compatService;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v10;
  if (v8)
  {
    compatService = self->_compatService;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __79__VIService_getEncryptedSearchDomainsWithVisualQuery_cachedResults_completion___block_invoke;
    v16[3] = &unk_1E9807890;
    v17 = v10;
    -[VisualIntelligenceServiceCompatible getEncryptedSearchDomainsWithVisualQuery:cachedResults:completion:](compatService, "getEncryptedSearchDomainsWithVisualQuery:cachedResults:completion:", v8, v9, v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v10)
    {
      _VIServiceNilInputError();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, _QWORD, void *))v11)[2](v11, 0, 0, v14);

    }
    v13 = 0;
  }

  return v13;
}

uint64_t __79__VIService_getEncryptedSearchDomainsWithVisualQuery_cachedResults_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)searchWithVisualQuery:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (v6)
  {
    -[VisualIntelligenceServiceCompatible searchWithVisualQuery:completion:](self->_compatService, "searchWithVisualQuery:completion:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v7)
    {
      +[VISearchResult empty](VISearchResult, "empty");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _VIServiceNilInputError();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *))v8)[2](v8, v10, v11);

    }
    v9 = 0;
  }

  return v9;
}

- (id)pegasusPayloadWithParsedVisualQuery:(id)a3 error:(id *)a4
{
  return -[VIService pegasusPayloadWithParsedVisualQuery:options:error:](self, "pegasusPayloadWithParsedVisualQuery:options:error:", a3, 0, a4);
}

- (id)pegasusPayloadWithParsedVisualQuery:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  _TtC18VisualIntelligence35VisualIntelligenceServiceCompatible *compatService;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = v8;
  if (v8)
  {
    compatService = self->_compatService;
    objc_msgSend(v8, "image");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "visualUnderstanding");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "queryContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[VisualIntelligenceServiceCompatible pegasusPayloadDataWithImage:visualUnderstanding:queryContext:options:error:](compatService, "pegasusPayloadDataWithImage:visualUnderstanding:queryContext:options:error:", v11, v12, v13, a4, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (a5)
  {
    _VIServiceNilInputError();
    v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)lookupTextWithQuery:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (v6)
  {
    -[VITextLookupFlowCompatible lookupTextWithQuery:completion:](self->_textLookupFlow, "lookupTextWithQuery:completion:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v7)
    {
      _VIServiceNilInputError();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v10);

    }
    v9 = 0;
  }

  return v9;
}

- (id)submitUserFeedback:(id)a3 completion:(id)a4
{
  return -[VisualIntelligenceServiceCompatible submitUserFeedbackWithUserFeedback:completion:](self->_compatService, "submitUserFeedbackWithUserFeedback:completion:", a3, a4);
}

- (id)ontologyGraph
{
  VIOntologyGraph *v3;
  void *v4;
  VIOntologyGraph *v5;

  v3 = [VIOntologyGraph alloc];
  -[VisualIntelligenceServiceCompatible ontologyGraph](self->_compatService, "ontologyGraph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[VIOntologyGraph initWithOntologyGraph:](v3, "initWithOntologyGraph:", v4);

  return v5;
}

- (id)detectWithImage:(id)a3 regionOfInterest:(CGRect)a4 error:(id *)a5
{
  return -[VisualIntelligenceServiceCompatible detectWithImage:regionOfInterest:error:](self->_compatService, "detectWithImage:regionOfInterest:error:", a3, a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (void)clearCacheWithOption:(int64_t)a3
{
  -[VisualIntelligenceServiceCompatible clearCacheWithCacheOption:](self->_compatService, "clearCacheWithCacheOption:", a3);
}

+ (unint64_t)parseFlowCacheVersion
{
  return +[VisualIntelligenceServiceCompatible parseFlowCacheVersion](_TtC18VisualIntelligence35VisualIntelligenceServiceCompatible, "parseFlowCacheVersion");
}

- (id)newStreamingSession
{
  return -[VIStreamingSession initWithCompatService:]([VIStreamingSession alloc], "initWithCompatService:", self->_compatService);
}

- (id)refineRegionsWithRequest:(id)a3 error:(id *)a4
{
  return -[VisualIntelligenceServiceCompatible refineRegionsWithRequest:error:](self->_compatService, "refineRegionsWithRequest:error:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLookupFlow, 0);
  objc_storeStrong((id *)&self->_compatService, 0);
}

@end

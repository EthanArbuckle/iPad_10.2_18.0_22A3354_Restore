@implementation PHAHighlightCollectionEnrichmentTask

- (PHAHighlightCollectionEnrichmentTask)initWithOptions:(id)a3
{
  id v5;
  PHAHighlightCollectionEnrichmentTask *v6;
  PHAHighlightCollectionEnrichmentTask *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHAHighlightCollectionEnrichmentTask;
  v6 = -[PHAHighlightCollectionEnrichmentTask init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_options, a3);

  return v7;
}

- (BOOL)currentPlatformIsSupported
{
  return 1;
}

- (id)incrementalKey
{
  return 0;
}

- (double)period
{
  return 10800.0;
}

- (id)taskClassDependencies
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)priority
{
  return 1;
}

- (void)timeoutFatal:(BOOL)a3
{
  uint8_t v3[16];

  if (a3)
    __assert_rtn("-[PHAHighlightCollectionEnrichmentTask timeoutFatal:]", "PHAHighlightCollectionEnrichmentTask.m", 55, "NO");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PHAHighlightCollectionEnrichmentTask is stuck", v3, 2u);
  }
}

- (id)enrichmentProcessor
{
  id v2;

  if (self->_options)
    v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D75F98]), "initWithOptions:", self->_options);
  else
    v2 = objc_alloc_init(MEMORY[0x1E0D75F98]);
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
}

@end

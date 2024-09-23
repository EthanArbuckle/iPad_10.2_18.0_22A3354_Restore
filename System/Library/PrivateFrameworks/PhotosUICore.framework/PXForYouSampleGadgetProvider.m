@implementation PXForYouSampleGadgetProvider

- (PXForYouSampleGadgetProvider)initWithSampleGadgetType:(unint64_t)a3 minimumHeight:(double)a4
{
  __CFString *v6;
  PXForYouSampleGadgetProvider *result;
  void *v8;
  void *v9;
  objc_super v10;

  if (a3 >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *_SampleGadgetTypeToNSString(PXSampleGadgetType)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXSampleGadgetProvider.m"), 57, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v6 = off_1E5141460[a3];
  v10.receiver = self;
  v10.super_class = (Class)PXForYouSampleGadgetProvider;
  result = -[PXGadgetProvider initWithIdentifier:](&v10, sel_initWithIdentifier_, v6);
  if (result)
  {
    result->_sampleGadgetType = a3;
    result->_minimumHeight = a4;
  }
  return result;
}

- (PXForYouSampleGadgetProvider)initWithSampleGadgetType:(unint64_t)a3
{
  return -[PXForYouSampleGadgetProvider initWithSampleGadgetType:minimumHeight:](self, "initWithSampleGadgetType:minimumHeight:", a3, 100.0);
}

- (PXForYouSampleGadgetProvider)initWithIdentifier:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSampleGadgetProvider.m"), 139, CFSTR("%s is not available as initializer"), "-[PXForYouSampleGadgetProvider initWithIdentifier:]");

  abort();
}

- (PXForYouSampleGadgetProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSampleGadgetProvider.m"), 143, CFSTR("%s is not available as initializer"), "-[PXForYouSampleGadgetProvider init]");

  abort();
}

- (void)loadDataForGadgets
{
  -[PXForYouSampleGadgetProvider setHasLoadedData:](self, "setHasLoadedData:", 1);
}

- (unint64_t)estimatedNumberOfGadgets
{
  return 1;
}

- (void)generateGadgets
{
  double v3;
  double v4;
  unint64_t v5;
  PXSampleGadget *v6;
  PXSampleGadget *v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  PXSampleGadget *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  PXSampleGadget *v15;

  -[PXForYouSampleGadgetProvider minimumHeight](self, "minimumHeight");
  v4 = v3;
  v5 = -[PXForYouSampleGadgetProvider sampleGadgetType](self, "sampleGadgetType");
  v6 = -[PXSampleGadget initWithMininumHeight:]([PXSampleGadget alloc], "initWithMininumHeight:", v4);
  v7 = v6;
  v8 = 0;
  v9 = CFSTR("Menu Gadget");
  v10 = 3;
  switch(v5)
  {
    case 0uLL:
      goto LABEL_7;
    case 1uLL:
      v9 = CFSTR("See All Gadget");
      goto LABEL_4;
    case 2uLL:
      v9 = CFSTR("Share Gadget");
LABEL_4:
      v10 = v5;
      goto LABEL_7;
    case 3uLL:
      v9 = CFSTR("Dismiss Gadget");
      v10 = 4;
      goto LABEL_7;
    case 4uLL:
      v10 = 0;
      v9 = CFSTR("No Button Gadget");
LABEL_7:
      -[PXSampleGadget setGadgetTitle:](v6, "setGadgetTitle:", v9);
      v8 = v10;
      break;
    case 5uLL:
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", CFSTR("Menu Gadget"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *_TitleForSampleGadgetType(PXSampleGadgetType)");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PXSampleGadgetProvider.m"), 75, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }
  -[PXSampleGadget setAccessoryButtonType:](v7, "setAccessoryButtonType:", v8);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __47__PXForYouSampleGadgetProvider_generateGadgets__block_invoke;
  v14[3] = &unk_1E5145360;
  v15 = v7;
  v11 = v7;
  -[PXGadgetProvider performChanges:](self, "performChanges:", v14);

}

- (NSDate)mostRecentContentDate
{
  return 0;
}

- (int64_t)forYouContentIdentifier
{
  return 13;
}

- (unint64_t)sampleGadgetType
{
  return self->_sampleGadgetType;
}

- (void)setSampleGadgetType:(unint64_t)a3
{
  self->_sampleGadgetType = a3;
}

- (double)minimumHeight
{
  return self->_minimumHeight;
}

- (void)setMinimumHeight:(double)a3
{
  self->_minimumHeight = a3;
}

- (BOOL)hasLoadedData
{
  return self->_hasLoadedData;
}

- (void)setHasLoadedData:(BOOL)a3
{
  self->_hasLoadedData = a3;
}

void __47__PXForYouSampleGadgetProvider_generateGadgets__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0C99D20];
  v3 = a2;
  objc_msgSend(v2, "arrayWithObjects:count:", &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addGadgets:", v4, v5, v6);

}

+ (id)defaultForYouSampleGadgetProviders
{
  if (defaultForYouSampleGadgetProviders_onceToken != -1)
    dispatch_once(&defaultForYouSampleGadgetProviders_onceToken, &__block_literal_global_262616);
  return (id)defaultForYouSampleGadgetProviders_providers;
}

+ (id)defaultForYouSampleHorizontalCollectionGadgetProvider
{
  return objc_alloc_init(_PXForYouSampleHorizontalCollectionGadgetProvider);
}

void __66__PXForYouSampleGadgetProvider_defaultForYouSampleGadgetProviders__block_invoke()
{
  id v0;
  uint64_t i;
  PXForYouSampleGadgetProvider *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  for (i = 0; i != 6; ++i)
  {
    v2 = -[PXForYouSampleGadgetProvider initWithSampleGadgetType:]([PXForYouSampleGadgetProvider alloc], "initWithSampleGadgetType:", i);
    objc_msgSend(v0, "addObject:", v2);

  }
  v3 = (void *)defaultForYouSampleGadgetProviders_providers;
  defaultForYouSampleGadgetProviders_providers = (uint64_t)v0;

}

@end

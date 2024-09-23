@implementation PLInitialSuggestionDateFilter

- (PLInitialSuggestionDateFilter)initWithTemplateDateType:(unint64_t)a3 psiDateFilter:(id)a4
{
  id v7;
  PLInitialSuggestionDateFilter *v8;
  PLInitialSuggestionDateFilter *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PLInitialSuggestionDateFilter;
  v8 = -[PLInitialSuggestionDateFilter init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_templateDateType = a3;
    objc_storeStrong((id *)&v8->_psiDateFilter, a4);
  }

  return v9;
}

- (void)dealloc
{
  __CFArray *assetIds;
  objc_super v4;

  assetIds = self->_assetIds;
  if (assetIds)
    CFRelease(assetIds);
  v4.receiver = self;
  v4.super_class = (Class)PLInitialSuggestionDateFilter;
  -[PLInitialSuggestionDateFilter dealloc](&v4, sel_dealloc);
}

- (id)description
{
  CFIndex Count;
  unint64_t v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  if (-[PLInitialSuggestionDateFilter assetIds](self, "assetIds"))
    Count = CFArrayGetCount(-[PLInitialSuggestionDateFilter assetIds](self, "assetIds"));
  else
    Count = 0;
  v4 = -[PLInitialSuggestionDateFilter templateDateType](self, "templateDateType");
  if (v4 - 1 > 8)
    v5 = CFSTR("PLSearchSuggestionDateTemplateCategoryTypeNone");
  else
    v5 = off_1E36600C8[v4 - 1];
  v6 = v5;
  v7 = (void *)MEMORY[0x1E0CB3940];
  -[PLInitialSuggestionDateFilter psiDateFilter](self, "psiDateFilter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("template date type: %@, date filter: %@, assetIds: %tu"), v6, v8, Count);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (__CFArray)assetIds
{
  return self->_assetIds;
}

- (void)setAssetIds:(__CFArray *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (unint64_t)templateDateType
{
  return self->_templateDateType;
}

- (PSIDateFilter)psiDateFilter
{
  return self->_psiDateFilter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_psiDateFilter, 0);
}

@end

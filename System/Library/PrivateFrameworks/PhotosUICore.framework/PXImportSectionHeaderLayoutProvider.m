@implementation PXImportSectionHeaderLayoutProvider

- (PXImportSectionHeaderLayoutProvider)initWithViewModel:(id)a3 viewProvider:(id)a4
{
  PXImportSectionHeaderLayoutProvider *v4;
  uint64_t v5;
  PLDateRangeFormatter *dateRangeFormatter;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXImportSectionHeaderLayoutProvider;
  v4 = -[PXActionableSectionHeaderLayoutProvider initWithViewModel:viewProvider:](&v8, sel_initWithViewModel_viewProvider_, a3, a4);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D716B0]), "initWithPreset:", 3);
    dateRangeFormatter = v4->_dateRangeFormatter;
    v4->_dateRangeFormatter = (PLDateRangeFormatter *)v5;

  }
  return v4;
}

- (id)primaryTextForDataSource:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4
{
  __int128 v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  _OWORD v13[2];

  v5 = *(_OWORD *)&a4->item;
  v13[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v13[1] = v5;
  objc_msgSend(a3, "assetCollectionAtSectionIndexPath:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[PXImportSectionHeaderLayoutProvider dateRangeFormatter](self, "dateRangeFormatter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringFromDate:", v7);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = &stru_1E5149688;
  }
  PXLocalizedStringFromTable(CFSTR("IMPORT_HISTORY_IMPORTED_ON_DATE"), CFSTR("PhotosUICore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PXStringWithValidatedFormat();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)secondaryTextForDataSource:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "numberOfItemsInSection:", a4->section);
  PXLocalizedStringFromTable(CFSTR("PXImportItemsCount"), CFSTR("PhotosUICore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringWithValidatedFormat(v4, CFSTR("%ld"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PLDateRangeFormatter)dateRangeFormatter
{
  return self->_dateRangeFormatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateRangeFormatter, 0);
}

@end

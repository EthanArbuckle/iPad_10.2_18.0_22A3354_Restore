@implementation RFSimpleItemVisualElementCardSection(SearchUIGridSectionModel)

- (uint64_t)searchUIGridSectionModel_useEstimatedHeight
{
  if (objc_msgSend(MEMORY[0x1E0DBDA48], "isPhone"))
    return objc_msgSend(MEMORY[0x1E0DBDA48], "isIpad") ^ 1;
  else
    return 1;
}

- (double)searchUIGridSectionModel_interItemSpacing
{
  return 3.0;
}

- (double)searchUIGridSectionModel_customSectionInsets
{
  double v0;

  +[SearchUIUtilities standardTableCellContentInset](SearchUIUtilities, "standardTableCellContentInset");
  +[SearchUIUtilities disambiguationTableCellContentInset](SearchUIUtilities, "disambiguationTableCellContentInset");
  v0 = 0.0;
  if (objc_msgSend(MEMORY[0x1E0DBDA48], "isSiri")
    && objc_msgSend(MEMORY[0x1E0DBDA48], "isWatchOS"))
  {
    return *MEMORY[0x1E0DC3298];
  }
  return v0;
}

@end

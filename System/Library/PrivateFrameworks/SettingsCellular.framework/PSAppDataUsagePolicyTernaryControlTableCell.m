@implementation PSAppDataUsagePolicyTernaryControlTableCell

+ (int64_t)cellStyle
{
  return 3;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  objc_msgSend(v4, "dataUsageString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v5, *MEMORY[0x24BE75D28]);

  v6.receiver = self;
  v6.super_class = (Class)PSAppDataUsagePolicyTernaryControlTableCell;
  -[PSSubtitleDisclosureTableCell refreshCellContentsWithSpecifier:](&v6, sel_refreshCellContentsWithSpecifier_, v4);

}

@end

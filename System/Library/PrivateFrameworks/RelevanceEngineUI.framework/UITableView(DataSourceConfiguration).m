@implementation UITableView(DataSourceConfiguration)

- (void)setCellRegistered:()DataSourceConfiguration
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, sel_cellRegistered, v2, (void *)3);

}

- (uint64_t)cellRegistered
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, sel_cellRegistered);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

@end

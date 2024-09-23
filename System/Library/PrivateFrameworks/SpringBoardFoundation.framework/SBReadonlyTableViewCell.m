@implementation SBReadonlyTableViewCell

+ (int64_t)cellStyleForRow:(id)a3
{
  return 1;
}

- (void)updateDisplayedValue
{
  void *v3;
  void *v4;
  id v5;

  -[SBReadonlyTableViewCell detailTextLabel](self, "detailTextLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PTUIRowTableViewCell row](self, "row");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

@end

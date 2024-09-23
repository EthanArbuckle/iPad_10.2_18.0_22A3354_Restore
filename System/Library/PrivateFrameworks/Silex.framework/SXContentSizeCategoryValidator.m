@implementation SXContentSizeCategoryValidator

- (BOOL)validateCondition:(id)a3 context:(id)a4
{
  id v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  BOOL v10;

  v5 = a3;
  objc_msgSend(a4, "contentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minContentSizeCategory");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "maxContentSizeCategory");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();

  v9 = (NSString *)*MEMORY[0x24BDF76C0];
  v10 = (!v7 || v7 == v9 || UIContentSizeCategoryCompareToCategory(v6, v7) != NSOrderedAscending)
     && (!v8 || v8 == v9 || UIContentSizeCategoryCompareToCategory(v6, v8) != NSOrderedDescending);

  return v10;
}

@end

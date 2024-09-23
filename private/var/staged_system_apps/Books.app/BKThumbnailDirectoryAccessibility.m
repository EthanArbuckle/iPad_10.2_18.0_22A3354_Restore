@implementation BKThumbnailDirectoryAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("BKThumbnailDirectory");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

- (void)configureCell:(id)a3 atIndex:(unint64_t)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BKThumbnailDirectoryAccessibility;
  v5 = a3;
  -[BKThumbnailDirectoryAccessibility configureCell:atIndex:](&v11, "configureCell:atIndex:", v5, a4);
  v6 = sub_10009A13C(CFSTR("page.num %@"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4 + 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter imaxLocalizedNumber:](NSNumberFormatter, "imaxLocalizedNumber:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v9));
  objc_msgSend(v5, "setAccessibilityLabel:", v10);

}

@end

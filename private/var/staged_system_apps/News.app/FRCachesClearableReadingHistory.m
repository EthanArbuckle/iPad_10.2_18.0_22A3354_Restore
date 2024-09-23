@implementation FRCachesClearableReadingHistory

- (FRCachesClearableReadingHistory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FRCachesClearableReadingHistory;
  return -[FRCachesClearableReadingHistory init](&v3, "init");
}

- (void)clearHistory
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v2, "setBool:forKey:", 1, CFSTR("should_clear_cache_on_next_launch"));

}

@end

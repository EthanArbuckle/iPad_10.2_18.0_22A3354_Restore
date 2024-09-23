@implementation MTShowsPreferencesDataStore

- (id)sortDescriptors
{
  return +[MTPodcast sortDescriptorsForSortType:](MTPodcast, "sortDescriptorsForSortType:", -[MTShowsPreferencesDataStore sortOrder](self, "sortOrder"));
}

- (int64_t)sortOrder
{
  void *v3;
  void *v4;
  int64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSharedUserDefaults](NSUserDefaults, "_applePodcastsFoundationSharedUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringForKey:", kMTShowsSortOrderKey));

  v5 = -[MTShowsPreferencesDataStore _sortTypeForString:](self, "_sortTypeForString:", v4);
  return v5;
}

- (int64_t)_sortTypeForString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("added")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("addedAscending")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("manual")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("title")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("titleAscending")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("updated")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("updatedAscending")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("recentlyUnfollowed")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005558;
  block[3] = &unk_1004A65A0;
  block[4] = a1;
  if (qword_100567608[0] != -1)
    dispatch_once(qword_100567608, block);
  return (id)qword_100567600;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedInstance", a3));
}

- (void)setSortOrder:(int64_t)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTShowsPreferencesDataStore _stringForSortType:](self, "_stringForSortType:", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSharedUserDefaults](NSUserDefaults, "_applePodcastsFoundationSharedUserDefaults"));
  objc_msgSend(v3, "setObject:forKey:", v5, kMTShowsSortOrderKey);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSharedUserDefaults](NSUserDefaults, "_applePodcastsFoundationSharedUserDefaults"));
  objc_msgSend(v4, "synchronize");

}

- (id)_stringForSortType:(int64_t)a3
{
  if ((unint64_t)a3 > 7)
    return CFSTR("title");
  else
    return off_1004AC528[a3];
}

@end

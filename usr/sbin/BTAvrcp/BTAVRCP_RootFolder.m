@implementation BTAVRCP_RootFolder

- (BTAVRCP_RootFolder)init
{
  BTAVRCP_RootFolder *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BTAVRCP_RootFolder;
  v2 = -[BTAVRCP_VFSFolder initWithName:uid:](&v5, "initWithName:uid:", 0, 0);
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", &off_100019B20, MPMediaItemPropertyMediaType));
    -[BTAVRCP_VFSFolder storePredicate:](v2, "storePredicate:", v3);

  }
  return v2;
}

- (id)baseQuery
{
  return objc_alloc_init((Class)MPMediaQuery);
}

- (unint64_t)childrenCount
{
  return 1;
}

- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4
{
  BTAVRCP_CategoriesFolder *v5;
  void *v6;
  void *v7;

  if (a3 != 1)
    return 9;
  v5 = [BTAVRCP_CategoriesFolder alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  *a4 = -[BTAVRCP_CategoriesFolder initWithName:uid:](v5, "initWithName:uid:", v7, 1);

  return 4;
}

- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4
{
  void *v4;
  void *v6;
  void *v7;

  if (a3)
  {
    v4 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary", 0, a4));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder replyFolderWithType:uid:name:](self, "replyFolderWithType:uid:name:", 0, &off_100019B38, v7));

  }
  return v4;
}

- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4
{
  if (a3 == 1)
    return &__NSDictionary0__struct;
  else
    return 0;
}

- (unsigned)playItemWithUid:(unint64_t)a3
{
  if (a3 == 1)
    return 12;
  else
    return 9;
}

@end

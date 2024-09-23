@implementation BTAVRCP_MyMusicFolder

- (BTAVRCP_MyMusicFolder)initWithName:(id)a3 uid:(unint64_t)a4
{
  BTAVRCP_MyMusicFolder *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BTAVRCP_MyMusicFolder;
  v4 = -[BTAVRCP_VFSFolder initWithName:uid:](&v8, "initWithName:uid:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, "refreshActiveCategories", MPMediaLibraryDidChangeNotification, 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary"));
    objc_msgSend(v6, "beginGeneratingLibraryChangeNotifications");

    -[BTAVRCP_MyMusicFolder refreshActiveCategories](v4, "refreshActiveCategories");
  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary"));
  objc_msgSend(v3, "endGeneratingLibraryChangeNotifications");

  v4.receiver = self;
  v4.super_class = (Class)BTAVRCP_MyMusicFolder;
  -[BTAVRCP_MyMusicFolder dealloc](&v4, "dealloc");
}

- (void)refreshActiveCategories
{
  uint64_t v3;
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  id v12;

  v12 = objc_alloc_init((Class)NSMutableArray);
  v3 = 1;
  while (2)
  {
    switch(v3)
    {
      case 1:
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary"));
        v5 = objc_msgSend(v4, "hasArtists");

        if (v5)
          goto LABEL_12;
        goto LABEL_13;
      case 2:
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary"));
        v7 = objc_msgSend(v6, "hasAlbums");
        goto LABEL_9;
      case 3:
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary"));
        v7 = objc_msgSend(v6, "hasSongs");
        goto LABEL_9;
      case 4:
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary"));
        v7 = objc_msgSend(v6, "hasGenres");
        goto LABEL_9;
      case 5:
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary"));
        v7 = objc_msgSend(v6, "hasComposers");
LABEL_9:
        v8 = v7;

        if ((v8 & 1) == 0)
          goto LABEL_13;
        goto LABEL_12;
      case 6:
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary"));
        v10 = objc_msgSend(v9, "hasCompilations");

        if ((v10 & 1) == 0)
          goto LABEL_14;
LABEL_12:
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v3));
        objc_msgSend(v12, "addObject:", v11);

LABEL_13:
        if (++v3 != 7)
          continue;
LABEL_14:
        -[BTAVRCP_MyMusicFolder setActiveCategories:](self, "setActiveCategories:", v12);

        return;
      default:
        goto LABEL_13;
    }
  }
}

- (id)folderNameForUid:(unint64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mobileBluetoothBundle](NSBundle, "mobileBluetoothBundle"));
  v5 = v4;
  switch(a3)
  {
    case 1uLL:
      v6 = CFSTR("ARTISTS");
      v7 = CFSTR("Artists");
      goto LABEL_9;
    case 2uLL:
      v6 = CFSTR("ALBUMS");
      v7 = CFSTR("Albums");
      goto LABEL_9;
    case 3uLL:
      v6 = CFSTR("SONGS");
      v7 = CFSTR("Songs");
      goto LABEL_9;
    case 4uLL:
      v6 = CFSTR("GENRES");
      v7 = CFSTR("Genres");
      goto LABEL_9;
    case 5uLL:
      v6 = CFSTR("COMPOSERS");
      v7 = CFSTR("Composers");
      goto LABEL_9;
    case 6uLL:
      v6 = CFSTR("COMPILATIONS");
      v7 = CFSTR("Compilations");
LABEL_9:
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, v7, 0));
      break;
    default:
      v8 = 0;
      break;
  }

  return v8;
}

- (unsigned)folderTypeForUid:(unint64_t)a3
{
  unint64_t v3;

  v3 = 0x2030401020300uLL >> (8 * a3);
  if (a3 >= 7)
    LOBYTE(v3) = 0;
  return v3 & 7;
}

- (id)baseQuery
{
  return +[MPMediaQuery songsQuery](MPMediaQuery, "songsQuery");
}

- (unint64_t)childrenCount
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_MyMusicFolder activeCategories](self, "activeCategories"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4
{
  void *v7;
  void *v8;
  unsigned int v9;
  BTAVRCP_ArtistsFolder *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BTAVRCP_AlbumsFolder *v16;
  BTAVRCP_SongsFolder *v17;
  BTAVRCP_GenresFolder *v18;
  BTAVRCP_ComposersFolder *v19;
  BTAVRCP_AlbumsFolder *v20;
  void *v21;
  id v22;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_MyMusicFolder activeCategories](self, "activeCategories"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if (!v9)
    return 9;
  switch(a3)
  {
    case 1uLL:
      v10 = [BTAVRCP_ArtistsFolder alloc];
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_MyMusicFolder folderNameForUid:](self, "folderNameForUid:", 1));
      v12 = v10;
      v13 = v11;
      v14 = 1;
      goto LABEL_9;
    case 2uLL:
      v16 = [BTAVRCP_AlbumsFolder alloc];
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_MyMusicFolder folderNameForUid:](self, "folderNameForUid:", 2));
      v12 = v16;
      v13 = v11;
      v14 = 2;
      goto LABEL_9;
    case 3uLL:
      v17 = [BTAVRCP_SongsFolder alloc];
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_MyMusicFolder folderNameForUid:](self, "folderNameForUid:", 3));
      v12 = v17;
      v13 = v11;
      v14 = 3;
      goto LABEL_9;
    case 4uLL:
      v18 = [BTAVRCP_GenresFolder alloc];
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_MyMusicFolder folderNameForUid:](self, "folderNameForUid:", 4));
      v12 = v18;
      v13 = v11;
      v14 = 4;
      goto LABEL_9;
    case 5uLL:
      v19 = [BTAVRCP_ComposersFolder alloc];
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_MyMusicFolder folderNameForUid:](self, "folderNameForUid:", 5));
      v12 = v19;
      v13 = v11;
      v14 = 5;
LABEL_9:
      *a4 = objc_msgSend(v12, "initWithName:uid:", v13, v14);
      goto LABEL_10;
    case 6uLL:
      v20 = [BTAVRCP_AlbumsFolder alloc];
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_MyMusicFolder folderNameForUid:](self, "folderNameForUid:", 6));
      *a4 = -[BTAVRCP_AlbumsFolder initWithName:uid:](v20, "initWithName:uid:", v21, 6);

      v22 = *a4;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", &__kCFBooleanTrue, MPMediaItemPropertyIsCompilation));
      objc_msgSend(v22, "storePredicate:", v11);
LABEL_10:

      break;
    default:
      return 4;
  }
  return 4;
}

- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_MyMusicFolder activeCategories](self, "activeCategories", a3, a4));
  v7 = objc_msgSend(v6, "count");

  if ((unint64_t)v7 <= a3)
  {
    v14 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_MyMusicFolder activeCategories](self, "activeCategories"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", a3));
    v10 = objc_msgSend(v9, "unsignedLongLongValue");

    v11 = -[BTAVRCP_MyMusicFolder folderTypeForUid:](self, "folderTypeForUid:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v10));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_MyMusicFolder folderNameForUid:](self, "folderNameForUid:", v10));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder replyFolderWithType:uid:name:](self, "replyFolderWithType:uid:name:", v11, v12, v13));

  }
  return v14;
}

- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4
{
  void *v5;
  void *v6;
  unsigned int v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_MyMusicFolder activeCategories](self, "activeCategories", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (v7)
    return &__NSDictionary0__struct;
  else
    return 0;
}

- (unsigned)playItemWithUid:(unint64_t)a3
{
  void *v4;
  void *v5;
  unsigned int v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_MyMusicFolder activeCategories](self, "activeCategories"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  v6 = objc_msgSend(v4, "containsObject:", v5);

  if (v6)
    return 12;
  else
    return 9;
}

- (NSArray)activeCategories
{
  return self->_activeCategories;
}

- (void)setActiveCategories:(id)a3
{
  objc_storeStrong((id *)&self->_activeCategories, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeCategories, 0);
}

@end

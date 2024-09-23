@implementation MTMLPlaylist

+ (id)playlistWithMPPlaylist:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_opt_new(a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", MPMediaPlaylistPropertyName, MPMediaEntityPropertyPersistentID, MPMediaPlaylistPropertyParentPersistentID, MPMediaPlaylistPropertyIsFolder, MPMediaPlaylistPropertyPlaylistAttributes, MPMediaPlaylistPropertyIsHidden, 0));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000BAC90;
  v9[3] = &unk_1004A8030;
  v7 = v5;
  v10 = v7;
  objc_msgSend(v4, "enumerateValuesForProperties:usingBlock:", v6, v9);

  objc_msgSend(v7, "setPlaylist:", v4);
  return v7;
}

- (void)addChild:(id)a3
{
  id v4;
  NSMutableArray *children;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  children = self->_children;
  v8 = v4;
  if (!children)
  {
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v7 = self->_children;
    self->_children = v6;

    v4 = v8;
    children = self->_children;
  }
  -[NSMutableArray addObject:](children, "addObject:", v4);

}

- (id)children
{
  return self->_children;
}

- (BOOL)isEmpty
{
  _BOOL4 v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  if (!self->_cachedEmpty)
  {
    if (-[MTMLPlaylist isFolder](self, "isFolder") && !-[NSMutableArray count](self->_children, "count"))
    {
      v3 = 1;
    }
    else
    {
      if (!-[MTMLPlaylist isFolder](self, "isFolder"))
      {
        v3 = 0;
        self->_empty = 0;
LABEL_20:
        self->_cachedEmpty = 1;
        return v3;
      }
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      v4 = self->_children;
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v11;
        while (2)
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(_QWORD *)v11 != v7)
              objc_enumerationMutation(v4);
            if (!objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "isEmpty", (_QWORD)v10))
            {
              v3 = 0;
              goto LABEL_17;
            }
          }
          v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
          if (v6)
            continue;
          break;
        }
      }
      v3 = 1;
LABEL_17:

    }
    self->_empty = v3;
    goto LABEL_20;
  }
  return self->_empty;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTMLPlaylist mediaLibraryId](self, "mediaLibraryId"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTMLPlaylist name](self, "name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MTMLPlaylist isFolder](self, "isFolder")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%@] %@ %@"), v3, v4, v5));

  return v6;
}

- (MPMediaPlaylist)playlist
{
  return (MPMediaPlaylist *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPlaylist:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSNumber)mediaLibraryId
{
  return self->_mediaLibraryId;
}

- (void)setMediaLibraryId:(id)a3
{
  objc_storeStrong((id *)&self->_mediaLibraryId, a3);
}

- (NSNumber)parentMediaLibraryId
{
  return self->_parentMediaLibraryId;
}

- (void)setParentMediaLibraryId:(id)a3
{
  objc_storeStrong((id *)&self->_parentMediaLibraryId, a3);
}

- (BOOL)isFolder
{
  return self->_isFolder;
}

- (void)setIsFolder:(BOOL)a3
{
  self->_isFolder = a3;
}

- (BOOL)isGenius
{
  return self->_isGenius;
}

- (void)setIsGenius:(BOOL)a3
{
  self->_isGenius = a3;
}

- (BOOL)isOnTheGo
{
  return self->_isOnTheGo;
}

- (void)setIsOnTheGo:(BOOL)a3
{
  self->_isOnTheGo = a3;
}

- (BOOL)isSmart
{
  return self->_isSmart;
}

- (void)setIsSmart:(BOOL)a3
{
  self->_isSmart = a3;
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (void)setIsHidden:(BOOL)a3
{
  self->_isHidden = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentMediaLibraryId, 0);
  objc_storeStrong((id *)&self->_mediaLibraryId, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_playlist, 0);
  objc_storeStrong((id *)&self->_children, 0);
}

@end

@implementation MCDBrowseDataSource

- (MCDBrowseDataSource)initWithParentSection:(id)a3
{
  id v5;
  MCDBrowseDataSource *v6;
  MCDBrowseDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCDBrowseDataSource;
  v6 = -[MCDBrowseDataSource init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_section, a3);

  return v7;
}

- (id)sectionProperties
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[0] = MPModelStoreBrowseSectionPropertyTitle;
  v5[1] = MPModelStoreBrowseSectionPropertyType;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 2));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v2));

  return v3;
}

- (id)itemProperties
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  _QWORD v14[5];
  uint64_t v15;

  v3 = objc_alloc((Class)MPPropertySet);
  v15 = MPModelStoreBrowseContentItemPropertyItemType;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseDataSource albumProperties](self, "albumProperties", MPModelStoreBrowseContentItemRelationshipAlbum));
  v14[0] = v5;
  v13[1] = MPModelStoreBrowseContentItemRelationshipCurator;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseDataSource curatorProperties](self, "curatorProperties"));
  v14[1] = v6;
  v13[2] = MPModelStoreBrowseContentItemRelationshipPlaylist;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseDataSource playlistProperties](self, "playlistProperties"));
  v14[2] = v7;
  v13[3] = MPModelStoreBrowseContentItemRelationshipRadioStation;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseDataSource radioStationProperties](self, "radioStationProperties"));
  v14[3] = v8;
  v13[4] = MPModelStoreBrowseContentItemRelationshipSong;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseDataSource songProperties](self, "songProperties"));
  v14[4] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 5));
  v11 = objc_msgSend(v3, "initWithProperties:relationships:", v4, v10);

  return v11;
}

- (MPModelStoreBrowseSection)section
{
  return self->_section;
}

- (void)setSection:(id)a3
{
  objc_storeStrong((id *)&self->_section, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_section, 0);
}

@end

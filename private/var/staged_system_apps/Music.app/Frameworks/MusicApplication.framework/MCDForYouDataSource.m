@implementation MCDForYouDataSource

- (MCDForYouDataSource)initWithRecommendationGroup:(id)a3
{
  id v5;
  MCDForYouDataSource *v6;
  MCDForYouDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCDForYouDataSource;
  v6 = -[MCDForYouDataSource init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_group, a3);

  return v7;
}

- (MPPropertySet)subgroupProperties
{
  void *v2;
  void *v3;
  _QWORD v5[9];

  v5[0] = MPModelForYouRecommendationGroupPropertyGroupType;
  v5[1] = MPModelForYouRecommendationGroupPropertyLastUpdatedDate;
  v5[2] = MPModelForYouRecommendationGroupPropertyTitle;
  v5[3] = MPModelForYouRecommendationGroupPropertyLoadAdditionalContentURL;
  v5[4] = MPModelForYouRecommendationGroupPropertyHrefURL;
  v5[5] = MPModelForYouRecommendationGroupPropertyRefreshURL;
  v5[6] = MPModelForYouRecommendationGroupPropertyTraits;
  v5[7] = MPModelForYouRecommendationGroupPropertyDisplaysAsGridCellInCarPlay;
  v5[8] = MPModelForYouRecommendationGroupPropertyDisplaysAsTitledSectionWithRowsInCarPlay;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 9));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v2));

  return (MPPropertySet *)v3;
}

- (id)itemProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  _QWORD v15[4];
  _QWORD v16[5];

  v16[0] = MPModelForYouRecommendationItemPropertyItemType;
  v16[1] = MPModelForYouRecommendationItemPropertyReason;
  v16[2] = MPModelForYouRecommendationItemPropertyUtterance;
  v16[3] = MPModelForYouRecommendationGroupPropertyDisplaysAsGridCellInCarPlay;
  v16[4] = MPModelForYouRecommendationGroupPropertyDisplaysAsTitledSectionWithRowsInCarPlay;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 5));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseDataSource albumProperties](self, "albumProperties", MPModelForYouRecommendationItemRelationshipAlbum));
  v15[0] = v4;
  v14[1] = MPModelForYouRecommendationItemRelationshipPlaylist;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseDataSource playlistProperties](self, "playlistProperties"));
  v15[1] = v5;
  v14[2] = MPModelForYouRecommendationItemRelationshipSubgroup;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDForYouDataSource subgroupProperties](self, "subgroupProperties"));
  v15[2] = v6;
  v14[3] = MPModelForYouRecommendationItemRelationshipRadioStation;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseDataSource radioStationProperties](self, "radioStationProperties"));
  v15[3] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v8));

  v10 = objc_alloc((Class)MPPropertySet);
  v11 = objc_msgSend(v9, "copy");
  v12 = objc_msgSend(v10, "initWithProperties:relationships:", v3, v11);

  return v12;
}

- (MPModelForYouRecommendationGroup)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
  objc_storeStrong((id *)&self->_group, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
}

@end

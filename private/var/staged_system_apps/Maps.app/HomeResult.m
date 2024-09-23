@implementation HomeResult

- (HomeResult)initWithResponseResult:(id)a3 responseDate:(id)a4
{
  id v7;
  id v8;
  HomeResult *v9;
  HomeResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HomeResult;
  v9 = -[HomeResult init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_responseResult, a3);
    objc_storeStrong((id *)&v10->_responseDate, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[Result hash](self->_responseResult, "hash");
  return (unint64_t)-[NSDate hash](self->_responseDate, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  HomeResult *v4;
  HomeResult *v5;
  uint64_t v6;
  HomeResult *v7;
  Result *v8;
  Result *v9;
  NSDate *v10;
  NSDate *v11;
  unsigned __int8 v12;

  v4 = (HomeResult *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
    v8 = (Result *)objc_claimAutoreleasedReturnValue(-[HomeResult responseResult](v7, "responseResult"));
    v9 = v8;
    if (v8 == self->_responseResult || -[Result isEqual:](v8, "isEqual:"))
    {
      v10 = (NSDate *)objc_claimAutoreleasedReturnValue(-[HomeResult responseDate](v7, "responseDate"));
      v11 = v10;
      if (v10 == self->_responseDate)
        v12 = 1;
      else
        v12 = -[NSDate isEqual:](v10, "isEqual:");

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)isExpiredAtDate:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeResult expirationDate](self, "expirationDate"));
  objc_msgSend(v5, "timeIntervalSinceDate:", v4);
  v7 = v6;

  return v7 < 0.0;
}

- (NSDate)expirationDate
{
  unsigned int v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;

  v3 = -[Result isSuccess](self->_responseResult, "isSuccess");
  if (v3)
    v4 = &MapsConfig_MapsHomeResultSuccessExpirationTimeInterval;
  else
    v4 = &MapsConfig_MapsHomeResultFailureExpirationTimeInterval;
  v5 = &off_1014B3EA8;
  if (!v3)
    v5 = &off_1014B3EB8;
  if (GEOConfigGetDouble(*v4, *v5) <= 0.0)
    v6 = 0;
  else
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate dateByAddingTimeInterval:](self->_responseDate, "dateByAddingTimeInterval:"));
  return (NSDate *)v6;
}

- (id)_successValue
{
  Result *responseResult;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_100A27B3C;
  v10 = sub_100A27B4C;
  v11 = 0;
  responseResult = self->_responseResult;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100A27B54;
  v5[3] = &unk_1011DFF58;
  v5[4] = &v6;
  -[Result withValue:orError:](responseResult, "withValue:orError:", v5, &stru_1011DFF78);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)isCuratedCollectionSectionValid
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HomeResult curatedCollections](self, "curatedCollections"));
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HomeResult curatedCollectionSectionName](self, "curatedCollectionSectionName"));
    v5 = objc_msgSend(v4, "length") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)curatedCollectionSectionName
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HomeResult _successValue](self, "_successValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sections"));
  v4 = sub_10039E1FC(v3, &stru_1011DFFB8);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
  return (NSString *)v6;
}

- (NSArray)curatedCollections
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HomeResult _successValue](self, "_successValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sections"));
  v4 = sub_10039E1FC(v3, &stru_1011DFFD8);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionSuggestionResult"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collections"));
  v8 = sub_10039DCD4(v7, &stru_1011E0018);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return (NSArray *)v9;
}

- (GEOExploreGuides)exploreGuides
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HomeResult _successValue](self, "_successValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sections"));
  v4 = sub_10039E1FC(v3, &stru_1011E0038);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionSuggestionResult"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "exploreGuides"));

  return (GEOExploreGuides *)v7;
}

- (Result)responseResult
{
  return self->_responseResult;
}

- (NSDate)responseDate
{
  return self->_responseDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseDate, 0);
  objc_storeStrong((id *)&self->_responseResult, 0);
}

@end

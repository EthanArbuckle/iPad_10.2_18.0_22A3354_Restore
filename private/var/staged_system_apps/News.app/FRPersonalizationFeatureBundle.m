@implementation FRPersonalizationFeatureBundle

+ (id)personalizationFeatureBundleForFeaturesGenerator:(id)a3
{
  return _objc_msgSend(a1, "personalizationFeatureBundleForFeaturesGenerator:groupOrder:feedOrder:userInfo:", a3, 0, 0, 0);
}

+ (id)personalizationFeatureBundleForFeaturesGenerator:(id)a3 groupOrder:(id)a4 feedOrder:(id)a5 userInfo:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v9 = a6;
  v10 = a4;
  v11 = a3;
  v12 = objc_alloc_init((Class)a1);
  objc_msgSend(v12, "setFeaturesGenerator:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dateLastOpened"));
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dateLastOpened"));
    objc_msgSend(v14, "fc_timeIntervalUntilNow");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v12, "setSessionDuration:", v15);

  }
  else
  {
    objc_msgSend(v12, "setSessionDuration:", 0);
  }

  objc_msgSend(v12, "setGroupOrder:", v10);
  objc_msgSend(v12, "setFeedOrder:", v10);

  return v12;
}

- (NSArray)features
{
  void *v3;
  uint64_t (**v4)(void);
  uint64_t v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationFeatureBundle featuresGenerator](self, "featuresGenerator"));
  if (v3)
  {
    v4 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[FRPersonalizationFeatureBundle featuresGenerator](self, "featuresGenerator"));
    v5 = v4[2]();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  }
  else
  {
    v6 = &__NSArray0__struct;
  }

  return (NSArray *)v6;
}

- (void)appendPersonalizationFeaturesGenerator:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000206C4;
  v7[3] = &unk_1000D9A30;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[FRPersonalizationFeatureBundle featuresGenerator](self, "featuresGenerator"));
  v9 = v4;
  v5 = v4;
  v6 = v8;
  -[FRPersonalizationFeatureBundle setFeaturesGenerator:](self, "setFeaturesGenerator:", v7);

}

- (NSNumber)groupOrder
{
  return self->_groupOrder;
}

- (void)setGroupOrder:(id)a3
{
  objc_storeStrong((id *)&self->_groupOrder, a3);
}

- (NSNumber)feedOrder
{
  return self->_feedOrder;
}

- (void)setFeedOrder:(id)a3
{
  objc_storeStrong((id *)&self->_feedOrder, a3);
}

- (NSNumber)sessionDuration
{
  return self->_sessionDuration;
}

- (void)setSessionDuration:(id)a3
{
  objc_storeStrong((id *)&self->_sessionDuration, a3);
}

- (id)featuresGenerator
{
  return self->_featuresGenerator;
}

- (void)setFeaturesGenerator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_featuresGenerator, 0);
  objc_storeStrong((id *)&self->_sessionDuration, 0);
  objc_storeStrong((id *)&self->_feedOrder, 0);
  objc_storeStrong((id *)&self->_groupOrder, 0);
}

@end

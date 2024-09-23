@implementation BSUIImpression

- (BSUIImpression)initWithImpression:(id)a3
{
  id v5;
  BSUIImpression *v6;
  BSUIImpression *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BSUIImpression;
  v6 = -[BSUIImpression init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_impression, a3);

  return v7;
}

- (id)data
{
  return -[TUIImpression data](self->_impression, "data");
}

- (unint64_t)timingCount
{
  return (unint64_t)-[TUIImpression timingCount](self->_impression, "timingCount");
}

- (NSDictionary)size
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[2];

  v8[0] = CFSTR("width");
  -[TUIImpression size](self->_impression, "size");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v8[1] = CFSTR("height");
  v9[0] = v3;
  -[TUIImpression size](self->_impression, "size");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v4));
  v9[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 2));

  return (NSDictionary *)v6;
}

- (id)timingAtIndex:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];

  -[TUIImpression timingAtIndex:](self->_impression, "timingAtIndex:", a3);
  v4 = v3;
  v10[0] = CFSTR("startTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (v5 + 978307200.0) * 1000.0));
  v10[1] = CFSTR("endTime");
  v11[0] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (v4 + 978307200.0) * 1000.0));
  v11[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));

  return v8;
}

- (TUIImpression)impression
{
  return self->_impression;
}

- (void)setImpression:(id)a3
{
  objc_storeStrong((id *)&self->_impression, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impression, 0);
}

@end

@implementation ParkedCarHeaderViewModel

- (ParkedCarHeaderViewModel)initWithParkedCar:(id)a3 subtitleText:(id)a4
{
  id v7;
  id v8;
  void *v9;
  ParkedCarHeaderViewModel *v10;
  NSString *v11;
  NSString *subtitleText;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapItem"));
  v14.receiver = self;
  v14.super_class = (Class)ParkedCarHeaderViewModel;
  v10 = -[ParkedCarHeaderViewModel initWithMapItem:](&v14, "initWithMapItem:", v9);

  if (v10)
  {
    objc_storeStrong((id *)&v10->_parkedCar, a3);
    v11 = (NSString *)objc_msgSend(v8, "copy");
    subtitleText = v10->_subtitleText;
    v10->_subtitleText = v11;

  }
  return v10;
}

- (id)placeName
{
  return -[ParkedCar title](self->_parkedCar, "title");
}

- (id)placeSecondaryName
{
  if (self->_subtitleText)
    return self->_subtitleText;
  else
    return CFSTR(" ");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_parkedCar, 0);
}

@end

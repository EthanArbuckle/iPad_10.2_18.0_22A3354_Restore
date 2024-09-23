@implementation MUParkedCarHeaderViewModel

- (MUParkedCarHeaderViewModel)initWithParkedCar:(id)a3
{
  id v5;
  void *v6;
  MUParkedCarHeaderViewModel *v7;
  objc_super v9;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));
  v9.receiver = self;
  v9.super_class = (Class)MUParkedCarHeaderViewModel;
  v7 = -[MUParkedCarHeaderViewModel initWithMapItem:](&v9, "initWithMapItem:", v6);

  if (v7)
    objc_storeStrong((id *)&v7->_parkedCar, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parkedCar, 0);
}

@end

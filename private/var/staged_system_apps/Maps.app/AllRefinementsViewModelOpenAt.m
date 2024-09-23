@implementation AllRefinementsViewModelOpenAt

- (id)copyWithZone:(_NSZone *)a3
{
  AllRefinementsViewModelOpenAt *v4;
  void *v5;
  double v6;
  double v7;
  _BOOL8 v8;
  _BOOL8 v9;
  void *v10;
  AllRefinementsViewModelOpenAt *v11;

  v4 = [AllRefinementsViewModelOpenAt alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewModelOpenAt displayName](self, "displayName"));
  -[AllRefinementsViewModelOpenAt timeStamp](self, "timeStamp");
  v7 = v6;
  v8 = -[AllRefinementsViewModelOpenAt isSelected](self, "isSelected");
  v9 = -[AllRefinementsViewModelOpenAt isNextDay](self, "isNextDay");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewModelOpenAt data](self, "data"));
  v11 = -[AllRefinementsViewModelOpenAt initWithDisplayName:timeStamp:isSelected:isNextDay:data:](v4, "initWithDisplayName:timeStamp:isSelected:isNextDay:data:", v5, v8, v9, v10, v7);

  return v11;
}

- (AllRefinementsViewModelOpenAt)initWithDisplayName:(id)a3 timeStamp:(double)a4 isSelected:(BOOL)a5 isNextDay:(BOOL)a6 data:(id)a7
{
  id v13;
  id v14;
  AllRefinementsViewModelOpenAt *v15;
  AllRefinementsViewModelOpenAt *v16;
  objc_super v18;

  v13 = a3;
  v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)AllRefinementsViewModelOpenAt;
  v15 = -[AllRefinementsViewModelOpenAt init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_displayName, a3);
    v16->_isSelected = a5;
    v16->_timeStamp = a4;
    v16->_isNextDay = a6;
    objc_storeStrong(&v16->_data, a7);
  }

  return v16;
}

- (void)updateTimeStamp:(double)a3 isSelected:(BOOL)a4
{
  self->_isSelected = a4;
  self->_timeStamp = a3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (double)timeStamp
{
  return self->_timeStamp;
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (BOOL)isNextDay
{
  return self->_isNextDay;
}

- (id)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_data, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end

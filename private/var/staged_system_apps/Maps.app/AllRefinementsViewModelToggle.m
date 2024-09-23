@implementation AllRefinementsViewModelToggle

- (AllRefinementsViewModelToggle)initWithDisplayName:(id)a3 isSelected:(BOOL)a4 data:(id)a5 refinementKey:(id)a6
{
  id v10;
  id v11;
  id v12;
  AllRefinementsViewModelToggle *v13;
  NSString *v14;
  NSString *displayName;
  NSString *v16;
  NSString *refinementKey;
  objc_super v19;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)AllRefinementsViewModelToggle;
  v13 = -[AllRefinementsViewModelToggle init](&v19, "init");
  if (v13)
  {
    v14 = (NSString *)objc_msgSend(v10, "copy");
    displayName = v13->_displayName;
    v13->_displayName = v14;

    v13->_isSelected = a4;
    objc_storeStrong(&v13->_data, a5);
    v16 = (NSString *)objc_msgSend(v12, "copy");
    refinementKey = v13->_refinementKey;
    v13->_refinementKey = v16;

  }
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AllRefinementsViewModelToggle *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  AllRefinementsViewModelToggle *v9;

  v4 = [AllRefinementsViewModelToggle alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewModelToggle displayName](self, "displayName"));
  v6 = -[AllRefinementsViewModelToggle isSelected](self, "isSelected");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewModelToggle data](self, "data"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewModelToggle refinementKey](self, "refinementKey"));
  v9 = -[AllRefinementsViewModelToggle initWithDisplayName:isSelected:data:refinementKey:](v4, "initWithDisplayName:isSelected:data:refinementKey:", v5, v6, v7, v8);

  return v9;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (void)setIsSelected:(BOOL)a3
{
  self->_isSelected = a3;
}

- (NSString)refinementKey
{
  return self->_refinementKey;
}

- (id)data
{
  return self->_data;
}

- (NSNumber)selectionSequenceNumber
{
  return self->_selectionSequenceNumber;
}

- (void)setSelectionSequenceNumber:(id)a3
{
  objc_storeStrong((id *)&self->_selectionSequenceNumber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionSequenceNumber, 0);
  objc_storeStrong(&self->_data, 0);
  objc_storeStrong((id *)&self->_refinementKey, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end

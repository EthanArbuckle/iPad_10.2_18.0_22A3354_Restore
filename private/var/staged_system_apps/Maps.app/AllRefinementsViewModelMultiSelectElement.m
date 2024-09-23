@implementation AllRefinementsViewModelMultiSelectElement

- (AllRefinementsViewModelMultiSelectElement)initWithDisplayName:(id)a3 isSelected:(BOOL)a4 optionalLabelWidth:(id)a5 refinementKey:(id)a6 data:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  AllRefinementsViewModelMultiSelectElement *v16;
  NSString *v17;
  NSString *displayName;
  NSString *v19;
  NSString *refinementKey;
  objc_super v22;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)AllRefinementsViewModelMultiSelectElement;
  v16 = -[AllRefinementsViewModelMultiSelectElement init](&v22, "init");
  if (v16)
  {
    v17 = (NSString *)objc_msgSend(v12, "copy");
    displayName = v16->_displayName;
    v16->_displayName = v17;

    v16->_isSelected = a4;
    objc_storeStrong((id *)&v16->_labelWidth, a5);
    v19 = (NSString *)objc_msgSend(v14, "copy");
    refinementKey = v16->_refinementKey;
    v16->_refinementKey = v19;

    objc_storeStrong(&v16->_data, a7);
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AllRefinementsViewModelMultiSelectElement *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  AllRefinementsViewModelMultiSelectElement *v10;

  v4 = [AllRefinementsViewModelMultiSelectElement alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewModelMultiSelectElement displayName](self, "displayName"));
  v6 = -[AllRefinementsViewModelMultiSelectElement isSelected](self, "isSelected");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewModelMultiSelectElement labelWidth](self, "labelWidth"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewModelMultiSelectElement refinementKey](self, "refinementKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewModelMultiSelectElement data](self, "data"));
  v10 = -[AllRefinementsViewModelMultiSelectElement initWithDisplayName:isSelected:optionalLabelWidth:refinementKey:data:](v4, "initWithDisplayName:isSelected:optionalLabelWidth:refinementKey:data:", v5, v6, v7, v8, v9);

  return v10;
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

- (NSNumber)labelWidth
{
  return self->_labelWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelWidth, 0);
  objc_storeStrong((id *)&self->_selectionSequenceNumber, 0);
  objc_storeStrong(&self->_data, 0);
  objc_storeStrong((id *)&self->_refinementKey, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end

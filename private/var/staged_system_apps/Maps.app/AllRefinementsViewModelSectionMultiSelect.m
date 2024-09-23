@implementation AllRefinementsViewModelSectionMultiSelect

- (AllRefinementsViewModelSectionMultiSelect)initWithElements:(id)a3 displayName:(id)a4 maximumNumberOfSelectableElements:(unsigned int)a5 clauseType:(int64_t)a6 showEqualWidthButtonsOnFilterView:(BOOL)a7 displayNameForMultiSelected:(id)a8 multiSelectIdentifier:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  AllRefinementsViewModelSectionMultiSelect *v20;
  NSUUID *v21;
  NSUUID *identifier;
  NSString *v23;
  NSString *displayName;
  NSString *v25;
  NSString *displayNameForMultiSelected;
  NSString *v27;
  NSString *multiSelectIdentifier;
  objc_super v30;

  v16 = a3;
  v17 = a4;
  v18 = a8;
  v19 = a9;
  v30.receiver = self;
  v30.super_class = (Class)AllRefinementsViewModelSectionMultiSelect;
  v20 = -[AllRefinementsViewModelSectionMultiSelect init](&v30, "init");
  if (v20)
  {
    v21 = (NSUUID *)objc_alloc_init((Class)NSUUID);
    identifier = v20->_identifier;
    v20->_identifier = v21;

    v20->_type = 1;
    objc_storeStrong((id *)&v20->_elements, a3);
    v23 = (NSString *)objc_msgSend(v17, "copy");
    displayName = v20->_displayName;
    v20->_displayName = v23;

    v20->_maximumNumberOfSelectableElements = a5;
    v20->_clauseType = a6;
    v20->_showEqualWidthButtonsOnFilterView = a7;
    v25 = (NSString *)objc_msgSend(v18, "copy");
    displayNameForMultiSelected = v20->_displayNameForMultiSelected;
    v20->_displayNameForMultiSelected = v25;

    v27 = (NSString *)objc_msgSend(v19, "copy");
    multiSelectIdentifier = v20->_multiSelectIdentifier;
    v20->_multiSelectIdentifier = v27;

  }
  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  id v6;
  AllRefinementsViewModelSectionMultiSelect *v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  AllRefinementsViewModelSectionMultiSelect *v14;

  v4 = objc_alloc((Class)NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewModelSectionMultiSelect elements](self, "elements"));
  v6 = objc_msgSend(v4, "initWithArray:copyItems:", v5, 1);

  v7 = [AllRefinementsViewModelSectionMultiSelect alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewModelSectionMultiSelect displayName](self, "displayName"));
  v9 = -[AllRefinementsViewModelSectionMultiSelect maximumNumberOfSelectableElements](self, "maximumNumberOfSelectableElements");
  v10 = -[AllRefinementsViewModelSectionMultiSelect clauseType](self, "clauseType");
  v11 = -[AllRefinementsViewModelSectionMultiSelect showEqualWidthButtonsOnFilterView](self, "showEqualWidthButtonsOnFilterView");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewModelSectionMultiSelect displayNameForMultiSelected](self, "displayNameForMultiSelected"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewModelSectionMultiSelect multiSelectIdentifier](self, "multiSelectIdentifier"));
  v14 = -[AllRefinementsViewModelSectionMultiSelect initWithElements:displayName:maximumNumberOfSelectableElements:clauseType:showEqualWidthButtonsOnFilterView:displayNameForMultiSelected:multiSelectIdentifier:](v7, "initWithElements:displayName:maximumNumberOfSelectableElements:clauseType:showEqualWidthButtonsOnFilterView:displayNameForMultiSelected:multiSelectIdentifier:", v6, v8, v9, v10, v11, v12, v13);

  return v14;
}

- (void)resetToDefault
{
  -[NSArray enumerateObjectsUsingBlock:](self->_elements, "enumerateObjectsUsingBlock:", &stru_1011DED88);
}

- (BOOL)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSArray *elements;
  BOOL v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  v5 = v4;
  if (v4
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "elements")),
        v7 = objc_msgSend(v6, "count"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewModelSectionMultiSelect elements](self, "elements")),
        v9 = objc_msgSend(v8, "count"),
        v8,
        v6,
        v7 == v9))
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 1;
    elements = self->_elements;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1009E4D70;
    v13[3] = &unk_1011DEDB0;
    v14 = v5;
    v15 = &v16;
    -[NSArray enumerateObjectsUsingBlock:](elements, "enumerateObjectsUsingBlock:", v13);
    v11 = *((_BYTE *)v17 + 24) != 0;

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSArray)elements
{
  return self->_elements;
}

- (unsigned)maximumNumberOfSelectableElements
{
  return self->_maximumNumberOfSelectableElements;
}

- (int64_t)clauseType
{
  return self->_clauseType;
}

- (BOOL)showEqualWidthButtonsOnFilterView
{
  return self->_showEqualWidthButtonsOnFilterView;
}

- (NSString)displayNameForMultiSelected
{
  return self->_displayNameForMultiSelected;
}

- (NSString)multiSelectIdentifier
{
  return self->_multiSelectIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiSelectIdentifier, 0);
  objc_storeStrong((id *)&self->_displayNameForMultiSelected, 0);
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

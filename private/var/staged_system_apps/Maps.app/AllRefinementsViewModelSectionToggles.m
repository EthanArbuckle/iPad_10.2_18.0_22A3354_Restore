@implementation AllRefinementsViewModelSectionToggles

- (AllRefinementsViewModelSectionToggles)initWithToggles:(id)a3 displayName:(id)a4
{
  id v7;
  id v8;
  AllRefinementsViewModelSectionToggles *v9;
  NSUUID *v10;
  NSUUID *identifier;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AllRefinementsViewModelSectionToggles;
  v9 = -[AllRefinementsViewModelSectionToggles init](&v13, "init");
  if (v9)
  {
    v10 = (NSUUID *)objc_alloc_init((Class)NSUUID);
    identifier = v9->_identifier;
    v9->_identifier = v10;

    v9->_type = 0;
    objc_storeStrong((id *)&v9->_toggles, a3);
    objc_storeStrong((id *)&v9->_displayName, a4);
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  id v6;
  AllRefinementsViewModelSectionToggles *v7;
  void *v8;
  AllRefinementsViewModelSectionToggles *v9;

  v4 = objc_alloc((Class)NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewModelSectionToggles toggles](self, "toggles"));
  v6 = objc_msgSend(v4, "initWithArray:copyItems:", v5, 1);

  v7 = [AllRefinementsViewModelSectionToggles alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewModelSectionToggles displayName](self, "displayName"));
  v9 = -[AllRefinementsViewModelSectionToggles initWithToggles:displayName:](v7, "initWithToggles:displayName:", v6, v8);

  return v9;
}

- (BOOL)compare:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  BOOL v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "toggles"));
  v6 = objc_msgSend(v5, "count");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewModelSectionToggles toggles](self, "toggles"));
  v8 = objc_msgSend(v7, "count");

  if (v6 == v8)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 1;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewModelSectionToggles toggles](self, "toggles"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1009E48A0;
    v12[3] = &unk_1011DED08;
    v13 = v4;
    v14 = &v15;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

    v10 = *((_BYTE *)v16 + 24) != 0;
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)resetToDefault
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewModelSectionToggles toggles](self, "toggles"));
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &stru_1011DED48);

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

- (NSArray)toggles
{
  return self->_toggles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggles, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

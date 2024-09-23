@implementation AllRefinementsViewModelSectionOpenOption

- (AllRefinementsViewModelSectionOpenOption)initWithOpenNow:(id)a3 openAt:(id)a4 displayName:(id)a5
{
  id v9;
  id v10;
  id v11;
  AllRefinementsViewModelSectionOpenOption *v12;
  AllRefinementsViewModelSectionOpenOption *v13;
  NSString *v14;
  NSString *displayName;
  NSUUID *v16;
  NSUUID *identifier;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)AllRefinementsViewModelSectionOpenOption;
  v12 = -[AllRefinementsViewModelSectionOpenOption init](&v19, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_openNow, a3);
    objc_storeStrong((id *)&v13->_openAt, a4);
    v14 = (NSString *)objc_msgSend(v11, "copy");
    displayName = v13->_displayName;
    v13->_displayName = v14;

    v13->_type = 2;
    v16 = (NSUUID *)objc_alloc_init((Class)NSUUID);
    identifier = v13->_identifier;
    v13->_identifier = v16;

  }
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AllRefinementsViewModelSectionOpenOption *v4;
  id v5;
  id v6;
  id v7;
  AllRefinementsViewModelSectionOpenOption *v8;

  v4 = [AllRefinementsViewModelSectionOpenOption alloc];
  v5 = -[AllRefinementsViewModelToggle copy](self->_openNow, "copy");
  v6 = -[AllRefinementsViewModelOpenAt copy](self->_openAt, "copy");
  v7 = -[NSString copy](self->_displayName, "copy");
  v8 = -[AllRefinementsViewModelSectionOpenOption initWithOpenNow:openAt:displayName:](v4, "initWithOpenNow:openAt:displayName:", v5, v6, v7);

  return v8;
}

- (unint64_t)numberOfItems
{
  AllRefinementsViewModelOpenAt *openAt;
  BOOL v3;
  unint64_t v4;
  unint64_t v5;

  openAt = self->_openAt;
  v3 = openAt == 0;
  v4 = openAt != 0;
  v5 = 1;
  if (!v3)
    v5 = 2;
  if (self->_openNow)
    return v5;
  else
    return v4;
}

- (void)resetToDefault
{
  -[AllRefinementsViewModelToggle setIsSelected:](self->_openNow, "setIsSelected:", 0);
  -[AllRefinementsViewModelOpenAt updateTimeStamp:isSelected:](self->_openAt, "updateTimeStamp:isSelected:", 0, 0.0);
}

- (BOOL)compare:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  BOOL v7;
  void *v8;
  unsigned int v9;
  void *v10;
  double v11;
  double v12;
  double v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "openNow"));
  v6 = objc_msgSend(v5, "isSelected");
  if (v6 == -[AllRefinementsViewModelToggle isSelected](self->_openNow, "isSelected"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "openAt"));
    v9 = objc_msgSend(v8, "isSelected");
    if (v9 == -[AllRefinementsViewModelOpenAt isSelected](self->_openAt, "isSelected"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "openAt"));
      objc_msgSend(v10, "timeStamp");
      v12 = v11;
      -[AllRefinementsViewModelOpenAt timeStamp](self->_openAt, "timeStamp");
      v7 = v12 == v13;

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (AllRefinementsViewModelToggle)openNow
{
  return self->_openNow;
}

- (AllRefinementsViewModelOpenAt)openAt
{
  return self->_openAt;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_openAt, 0);
  objc_storeStrong((id *)&self->_openNow, 0);
}

@end

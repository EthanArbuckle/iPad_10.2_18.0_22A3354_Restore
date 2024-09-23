@implementation TwoLinesBasicOutlineCellModel

- (TwoLinesBasicOutlineCellModel)initWithBackgroundModel:(id)a3 contentModelBlock:(id)a4
{
  id v7;
  id v8;
  TwoLinesBasicOutlineCellModel *v9;
  id v10;
  id contentBlock;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TwoLinesBasicOutlineCellModel;
  v9 = -[TwoLinesBasicOutlineCellModel init](&v13, "init");
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    contentBlock = v9->_contentBlock;
    v9->_contentBlock = v10;

    objc_storeStrong((id *)&v9->_backgroundModel, a3);
  }

  return v9;
}

- (TwoLinesContentViewModel)contentModel
{
  TwoLinesContentViewModel *contentModel;
  uint64_t v4;
  TwoLinesContentViewModel *v5;
  TwoLinesContentViewModel *v6;

  contentModel = self->_contentModel;
  if (!contentModel)
  {
    v4 = (*((uint64_t (**)(void))self->_contentBlock + 2))();
    v5 = (TwoLinesContentViewModel *)objc_claimAutoreleasedReturnValue(v4);
    v6 = self->_contentModel;
    self->_contentModel = v5;

    contentModel = self->_contentModel;
  }
  return contentModel;
}

- (NSArray)accessoryModels
{
  return 0;
}

- (SidebarOutlineCellBackgroundModel)backgroundModel
{
  return self->_backgroundModel;
}

- (TwoLinesOutlineCellActionModel)actionModel
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  TwoLinesBasicOutlineCellModel *v4;
  TwoLinesBasicOutlineCellModel *v5;
  uint64_t v6;
  SidebarOutlineCellBackgroundModel *v7;
  SidebarOutlineCellBackgroundModel *v8;
  unsigned __int8 v9;

  v4 = (TwoLinesBasicOutlineCellModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = (SidebarOutlineCellBackgroundModel *)objc_claimAutoreleasedReturnValue(-[TwoLinesBasicOutlineCellModel backgroundModel](v5, "backgroundModel"));
    v8 = v7;
    if (v7 == self->_backgroundModel)
      v9 = 1;
    else
      v9 = -[SidebarOutlineCellBackgroundModel isEqual:](v7, "isEqual:");

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (UICollectionViewCellRegistration)cellRegistration
{
  return (UICollectionViewCellRegistration *)+[TwoLinesOutlineCellRegistration sharedRegistration](TwoLinesOutlineCellRegistration, "sharedRegistration");
}

- (BOOL)needsReloadFromPreviousViewModel:(id)a3
{
  return !-[TwoLinesBasicOutlineCellModel isEqual:](self, "isEqual:", a3);
}

- (id)contentModelBlock
{
  return self->_contentModelBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_contentModelBlock, 0);
  objc_storeStrong((id *)&self->_backgroundModel, 0);
  objc_storeStrong((id *)&self->_contentModel, 0);
  objc_storeStrong(&self->_contentBlock, 0);
}

@end

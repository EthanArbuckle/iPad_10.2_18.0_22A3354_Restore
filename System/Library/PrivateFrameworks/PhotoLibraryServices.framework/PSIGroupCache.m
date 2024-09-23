@implementation PSIGroupCache

- (PSIGroupCache)initWithDelegate:(id)a3
{
  id v4;
  PSIGroupCache *v5;
  NSMutableSet *v6;
  NSMutableSet *groups;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PSIGroupCache;
  v5 = -[PSIGroupCache init](&v9, sel_init);
  if (v5)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    groups = v5->_groups;
    v5->_groups = v6;

    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v5;
}

- (unint64_t)idOfGroupWithText:(id)a3 identifier:(id)a4 category:(unint64_t)a5 owningGroupId:(unint64_t)a6
{
  id v10;
  id v11;
  PSICachedGroup *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  id WeakRetained;

  v10 = a3;
  v11 = a4;
  v12 = -[PSICachedGroup initWithText:identifier:category:owningGroupId:]([PSICachedGroup alloc], "initWithText:identifier:category:owningGroupId:", v10, v11, a5, a6);
  -[NSMutableSet member:](self->_groups, "member:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  ++self->_numberOfGroupsChecked;
  if (v13)
  {
    v15 = objc_msgSend(v13, "groupId");
  }
  else
  {
    -[NSMutableSet addObject:](self->_groups, "addObject:", v12);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v15 = objc_msgSend(WeakRetained, "updateGroupForText:identifier:category:owningGroupId:", v10, v11, a5, a6);

    -[PSICachedGroup setGroupId:](v12, "setGroupId:", v15);
    ++self->_numberOfGroupsQueried;
  }

  return v15;
}

- (unint64_t)numberOfGroupsChecked
{
  return self->_numberOfGroupsChecked;
}

- (unint64_t)numberOfGroupsQueried
{
  return self->_numberOfGroupsQueried;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_groups, 0);
}

@end

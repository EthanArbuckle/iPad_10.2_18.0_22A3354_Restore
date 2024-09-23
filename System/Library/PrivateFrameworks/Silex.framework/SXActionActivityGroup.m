@implementation SXActionActivityGroup

- (SXActionActivityGroup)init
{
  return -[SXActionActivityGroup initWithTitle:sourceView:](self, "initWithTitle:sourceView:", 0, 0);
}

- (SXActionActivityGroup)initWithTitle:(id)a3
{
  return -[SXActionActivityGroup initWithTitle:sourceView:](self, "initWithTitle:sourceView:", a3, 0);
}

- (SXActionActivityGroup)initWithTitle:(id)a3 sourceView:(id)a4
{
  id v7;
  id v8;
  SXActionActivityGroup *v9;
  SXActionActivityGroup *v10;
  uint64_t v11;
  NSMutableArray *activities;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SXActionActivityGroup;
  v9 = -[SXActionActivityGroup init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v10->_sourceView, a4);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    activities = v10->_activities;
    v10->_activities = (NSMutableArray *)v11;

  }
  return v10;
}

- (void)addActivity:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[SXActionActivityGroup activities](self, "activities");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

  }
}

- (NSString)title
{
  return self->_title;
}

- (NSMutableArray)activities
{
  return self->_activities;
}

- (void)setActivities:(id)a3
{
  objc_storeStrong((id *)&self->_activities, a3);
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_activities, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end

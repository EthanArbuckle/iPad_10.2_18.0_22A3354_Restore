@implementation REMListAppearanceContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_list, 0);
}

- (REMListBadge)badge
{
  void *v2;
  void *v3;
  REMListBadge *v4;

  -[REMListAppearanceContext list](self, "list");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "badgeEmblem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = -[REMListBadge initWithRawValue:]([REMListBadge alloc], "initWithRawValue:", v3);
  else
    v4 = 0;

  return v4;
}

- (REMList)list
{
  return self->_list;
}

- (REMListAppearanceContext)initWithList:(id)a3
{
  id v5;
  REMListAppearanceContext *v6;
  REMListAppearanceContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMListAppearanceContext;
  v6 = -[REMListAppearanceContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_list, a3);

  return v7;
}

- (NSString)badgeEmblem
{
  void *v2;
  void *v3;

  -[REMListAppearanceContext badge](self, "badge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "emblem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)showingLargeAttachments
{
  void *v2;
  char v3;

  -[REMListAppearanceContext list](self, "list");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showingLargeAttachments");

  return v3;
}

- (void)setList:(id)a3
{
  objc_storeStrong((id *)&self->_list, a3);
}

@end

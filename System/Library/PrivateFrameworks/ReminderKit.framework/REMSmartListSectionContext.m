@implementation REMSmartListSectionContext

- (REMSmartListSectionContext)initWithSmartList:(id)a3
{
  id v5;
  REMSmartListSectionContext *v6;
  REMSmartListSectionContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMSmartListSectionContext;
  v6 = -[REMSmartListSectionContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_smartList, a3);

  return v7;
}

- (REMSmartList)smartList
{
  return self->_smartList;
}

- (void)setSmartList:(id)a3
{
  objc_storeStrong((id *)&self->_smartList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartList, 0);
}

@end

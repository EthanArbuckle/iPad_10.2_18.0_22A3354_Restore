@implementation REMListSectionContext

- (REMListSectionContext)initWithList:(id)a3
{
  id v5;
  REMListSectionContext *v6;
  REMListSectionContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMListSectionContext;
  v6 = -[REMListSectionContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_list, a3);

  return v7;
}

- (BOOL)hasSections
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[REMListSectionContext list](self, "list");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "store");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMListSectionContext list](self, "list");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remObjectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchListSectionsCountWithListObjectID:error:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = (int)objc_msgSend(v7, "intValue") > 0;
  return (char)v5;
}

- (REMList)list
{
  return self->_list;
}

- (void)setList:(id)a3
{
  objc_storeStrong((id *)&self->_list, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_list, 0);
}

@end

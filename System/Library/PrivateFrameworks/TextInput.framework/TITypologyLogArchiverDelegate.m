@implementation TITypologyLogArchiverDelegate

- (TITypologyLogArchiverDelegate)init
{
  TITypologyLogArchiverDelegate *v2;
  NSMutableSet *v3;
  NSMutableSet *objects;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TITypologyLogArchiverDelegate;
  v2 = -[TITypologyLogArchiverDelegate init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    objects = v2->_objects;
    v2->_objects = v3;

  }
  return v2;
}

- (id)archiver:(id)a3 willEncodeObject:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        -[TITypologyLogArchiverDelegate objects](self, "objects");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "count");

        -[TITypologyLogArchiverDelegate objects](self, "objects");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v5);

        -[TITypologyLogArchiverDelegate objects](self, "objects");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");

        if (v10 == v7)
        {
          -[TITypologyLogArchiverDelegate objects](self, "objects");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "member:", v5);
          v12 = objc_claimAutoreleasedReturnValue();

          v5 = (id)v12;
        }
      }
    }
  }
  v13 = v5;

  return v13;
}

- (NSMutableSet)objects
{
  return self->_objects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
}

@end

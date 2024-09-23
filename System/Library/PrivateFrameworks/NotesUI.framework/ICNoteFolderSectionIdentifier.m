@implementation ICNoteFolderSectionIdentifier

- (ICNoteFolderSectionIdentifier)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICNoteFolderSectionIdentifier;
  return -[ICNoteSectionIdentifier initWithNoteSectionType:](&v3, sel_initWithNoteSectionType_, 2);
}

- (ICNoteFolderSectionIdentifier)initWithNoteContainerObjectID:(id)a3
{
  id v5;
  ICNoteFolderSectionIdentifier *v6;
  ICNoteFolderSectionIdentifier *v7;

  v5 = a3;
  v6 = -[ICNoteFolderSectionIdentifier init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_noteContainerObjectID, a3);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  BOOL v15;
  char v16;

  v4 = a3;
  objc_opt_class();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && (v6 = -[ICNoteSectionIdentifier sectionType](self, "sectionType"), v6 == objc_msgSend(v5, "sectionType")))
  {
    -[ICNoteFolderSectionIdentifier noteContainerObjectID](self, "noteContainerObjectID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "noteContainerObjectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)*MEMORY[0x1E0C9B0D0];
    if ((void *)*MEMORY[0x1E0C9B0D0] == v7)
      v10 = 0;
    else
      v10 = v7;
    v11 = v10;
    if (v9 == v8)
      v12 = 0;
    else
      v12 = v8;
    v13 = v12;
    v14 = (void *)v13;
    if (v11 | v13)
    {
      if (v11)
        v15 = v13 == 0;
      else
        v15 = 1;
      if (v15)
        v16 = 0;
      else
        v16 = objc_msgSend((id)v11, "isEqual:", v13);
    }
    else
    {
      v16 = 1;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  unint64_t result;
  uint64_t v4;
  void *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  result = self->_hash;
  if (!result)
  {
    v4 = -[ICNoteSectionIdentifier sectionType](self, "sectionType");
    -[ICNoteFolderSectionIdentifier noteContainerObjectID](self, "noteContainerObjectID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hash");
    self->_hash = ICHashWithHashKeys(v4, v7, v8, v9, v10, v11, v12, v13, v6);

    return self->_hash;
  }
  return result;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromICNoteSectionType(-[ICNoteSectionIdentifier sectionType](self, "sectionType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteFolderSectionIdentifier noteContainerObjectID](self, "noteContainerObjectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, sectionType: %@, noteContainerObjectID: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSManagedObjectID)noteContainerObjectID
{
  return self->_noteContainerObjectID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noteContainerObjectID, 0);
}

@end

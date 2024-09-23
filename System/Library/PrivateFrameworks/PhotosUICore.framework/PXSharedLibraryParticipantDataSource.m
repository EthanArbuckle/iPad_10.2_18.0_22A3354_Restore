@implementation PXSharedLibraryParticipantDataSource

- (id)_initWithParticipants:(id)a3
{
  id v4;
  PXSharedLibraryParticipantDataSource *v5;
  uint64_t v6;
  NSArray *participants;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXSharedLibraryParticipantDataSource;
  v5 = -[PXSharedLibraryParticipantDataSource init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    participants = v5->_participants;
    v5->_participants = (NSArray *)v6;

  }
  return v5;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v4;
  int64_t v5;
  void *v8;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryParticipantDataSource.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("section == 0"));

  }
  -[PXSharedLibraryParticipantDataSource participants](self, "participants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4
{
  void *v7;

  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryParticipantDataSource.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("section == 0"));

  }
  return 0;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;

  dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != -[PXSharedLibraryParticipantDataSource identifier](self, "identifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryParticipantDataSource.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.dataSourceIdentifier == self.identifier"));

  }
  if (a3->section)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryParticipantDataSource.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.section == 0"));

  }
  if (a3->subitem)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryParticipantDataSource.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.subitem == 0"));

  }
  -[PXSharedLibraryParticipantDataSource participants](self, "participants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a3->item);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)objectsInIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier;
  void *v10;
  void *v11;

  dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != -[PXSharedLibraryParticipantDataSource identifier](self, "identifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryParticipantDataSource.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.dataSourceIdentifier == self.identifier"));

  }
  if (a3->dataSourceIdentifier == *(_QWORD *)off_1E50B7E98
    || a3->section == 0x7FFFFFFFFFFFFFFFLL
    || a3->item != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryParticipantDataSource.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXSimpleIndexPathIsSection(indexPath)"));

  }
  return -[PXSharedLibraryParticipantDataSource participants](self, "participants");
}

- (id)itemAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[PXSharedLibraryParticipantDataSource participants](self, "participants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)numberOfParticipants
{
  void *v2;
  int64_t v3;

  -[PXSharedLibraryParticipantDataSource participants](self, "participants");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (BOOL)canAddParticipants
{
  return (unint64_t)-[PXSharedLibraryParticipantDataSource numberOfParticipants](self, "numberOfParticipants") < 5;
}

- (NSArray)participantImageCombinerItems
{
  void *v2;
  void *v3;

  -[PXSharedLibraryParticipantDataSource participants](self, "participants");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (NSArray)names
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PXSharedLibraryParticipantDataSource participants](self, "participants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__PXSharedLibraryParticipantDataSource_names__block_invoke;
  v7[3] = &unk_1E5136FC8;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  return (NSArray *)v5;
}

- (NSSet)emailAddresses
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[PXSharedLibraryParticipantDataSource participants](self, "participants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__PXSharedLibraryParticipantDataSource_emailAddresses__block_invoke;
  v7[3] = &unk_1E5136FC8;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  return (NSSet *)v5;
}

- (NSSet)phoneNumbers
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[PXSharedLibraryParticipantDataSource participants](self, "participants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__PXSharedLibraryParticipantDataSource_phoneNumbers__block_invoke;
  v7[3] = &unk_1E5136FC8;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  return (NSSet *)v5;
}

- (NSSet)participantAddresses
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[PXSharedLibraryParticipantDataSource participants](self, "participants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__PXSharedLibraryParticipantDataSource_participantAddresses__block_invoke;
  v7[3] = &unk_1E5136FC8;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  return (NSSet *)v5;
}

- (NSArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_participants, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participants, 0);
}

void __60__PXSharedLibraryParticipantDataSource_participantAddresses__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "appleIDAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v7, "appleIDAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
}

void __52__PXSharedLibraryParticipantDataSource_phoneNumbers__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(v6, "addressKind") == 2;
  v4 = v6;
  if (v3)
  {
    objc_msgSend(v6, "appleIDAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

    v4 = v6;
  }

}

void __54__PXSharedLibraryParticipantDataSource_emailAddresses__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(v6, "addressKind") == 1;
  v4 = v6;
  if (v3)
  {
    objc_msgSend(v6, "appleIDAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

    v4 = v6;
  }

}

void __45__PXSharedLibraryParticipantDataSource_names__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  }
  else
  {
    objc_msgSend(v3, "appleIDAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    }
    else
    {
      PLSharedLibraryGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 138412290;
        v8 = v3;
        _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "Didn't find display name for participant %@", (uint8_t *)&v7, 0xCu);
      }

    }
  }

}

@end

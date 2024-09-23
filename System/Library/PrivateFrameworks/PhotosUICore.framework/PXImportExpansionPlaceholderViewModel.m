@implementation PXImportExpansionPlaceholderViewModel

- (PXImportExpansionPlaceholderViewModel)initWithPlaceholderDate:(id)a3
{
  id v5;
  PXImportExpansionPlaceholderViewModel *v6;
  uint64_t v7;
  id placeholderUUID;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXImportExpansionPlaceholderViewModel;
  v6 = -[PXImportItemViewModel initWithKind:selectable:](&v10, sel_initWithKind_selectable_, CFSTR("PXImportItemViewModelKindExpansionPlaceholder"), 0);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = objc_claimAutoreleasedReturnValue();
    placeholderUUID = v6->_placeholderUUID;
    v6->_placeholderUUID = (id)v7;

    objc_storeStrong((id *)&v6->_placeholderDate, a3);
  }

  return v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PXImportExpansionPlaceholderViewModel placeholderDate](self, "placeholderDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p expansion placeholder date: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqualToImportPlaceholderViewModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[PXImportItemViewModel kind](self, "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "kind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[PXImportExpansionPlaceholderViewModel placeholderDate](self, "placeholderDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "placeholderDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToDate:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  PXImportExpansionPlaceholderViewModel *v4;
  BOOL v5;

  v4 = (PXImportExpansionPlaceholderViewModel *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PXImportExpansionPlaceholderViewModel isEqualToImportPlaceholderViewModel:](self, "isEqualToImportPlaceholderViewModel:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PXImportExpansionPlaceholderViewModel placeholderDate](self, "placeholderDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)fileName
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)badgeType
{
  return 0;
}

- (NSDate)placeholderDate
{
  return self->_placeholderDate;
}

- (id)placeholderUUID
{
  return self->_placeholderUUID;
}

- (void)setPlaceholderUUID:(id)a3
{
  objc_storeStrong(&self->_placeholderUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_placeholderUUID, 0);
  objc_storeStrong((id *)&self->_placeholderDate, 0);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_73492 != -1)
    dispatch_once(&sharedInstance_onceToken_73492, &__block_literal_global_73493);
  return (id)sharedInstance_placeholderModel;
}

void __55__PXImportExpansionPlaceholderViewModel_sharedInstance__block_invoke()
{
  PXImportExpansionPlaceholderViewModel *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [PXImportExpansionPlaceholderViewModel alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[PXImportExpansionPlaceholderViewModel initWithPlaceholderDate:](v0, "initWithPlaceholderDate:", v3);
  v2 = (void *)sharedInstance_placeholderModel;
  sharedInstance_placeholderModel = v1;

}

@end

@implementation VUITitleSortDescriptor

- (int64_t)compareObject:(id)a3 toObject:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t (**v11)(_QWORD, _QWORD, _QWORD);
  int64_t v12;

  v6 = a4;
  v7 = a3;
  v8 = -[VUITitleSortDescriptor ascending](self, "ascending");
  v9 = (void *)objc_opt_class();
  -[VUITitleSortDescriptor key](self, "key");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v9, "ascendingTitleSortComparatorWithKey:", v10);
  else
    objc_msgSend(v9, "descendingTitleSortComparatorWithKey:", v10);
  v11 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  v12 = ((uint64_t (**)(_QWORD, id, id))v11)[2](v11, v7, v6);
  return v12;
}

+ (id)ascendingTitleSortComparatorWithKey:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__VUITitleSortDescriptor_ascendingTitleSortComparatorWithKey___block_invoke;
  v8[3] = &unk_1E9F2BD08;
  v9 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x1DF08E588](v8);
  v6 = (void *)MEMORY[0x1DF08E588]();

  return v6;
}

uint64_t __62__VUITitleSortDescriptor_ascendingTitleSortComparatorWithKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t (**v9)(_QWORD, _QWORD, _QWORD);
  uint64_t v10;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "valueForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUISortUtilities ascendingTitleSortComparator](VUISortUtilities, "ascendingTitleSortComparator");
  v9 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v10 = ((uint64_t (**)(_QWORD, void *, void *))v9)[2](v9, v7, v8);

  return v10;
}

+ (id)descendingTitleSortComparatorWithKey:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__VUITitleSortDescriptor_descendingTitleSortComparatorWithKey___block_invoke;
  v8[3] = &unk_1E9F2BD08;
  v9 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x1DF08E588](v8);
  v6 = (void *)MEMORY[0x1DF08E588]();

  return v6;
}

uint64_t __63__VUITitleSortDescriptor_descendingTitleSortComparatorWithKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t (**v9)(_QWORD, _QWORD, _QWORD);
  uint64_t v10;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "valueForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUISortUtilities descendingTitleSortComparator](VUISortUtilities, "descendingTitleSortComparator");
  v9 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v10 = ((uint64_t (**)(_QWORD, void *, void *))v9)[2](v9, v7, v8);

  return v10;
}

@end

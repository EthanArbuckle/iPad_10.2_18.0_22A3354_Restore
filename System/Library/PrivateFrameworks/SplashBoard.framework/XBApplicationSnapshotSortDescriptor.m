@implementation XBApplicationSnapshotSortDescriptor

- (void).cxx_destruct
{
  objc_storeStrong(&self->_comparator, 0);
}

+ (id)sortDescriptorWithKey:(unint64_t)a3 ascending:(BOOL)a4 comparator:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;

  v5 = a4;
  v8 = a5;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithKey:ascending:comparator:", a3, v5, v8);

  return v9;
}

- (XBApplicationSnapshotSortDescriptor)initWithKey:(unint64_t)a3 ascending:(BOOL)a4 comparator:(id)a5
{
  id v8;
  XBApplicationSnapshotSortDescriptor *v9;
  XBApplicationSnapshotSortDescriptor *v10;
  uint64_t v11;
  id comparator;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)XBApplicationSnapshotSortDescriptor;
  v9 = -[XBApplicationSnapshotSortDescriptor init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_key = a3;
    v9->_ascending = a4;
    v11 = objc_msgSend(v8, "copy");
    comparator = v10->_comparator;
    v10->_comparator = (id)v11;

  }
  return v10;
}

- (NSSortDescriptor)NSSortDescriptor
{
  void *v3;
  _QWORD *comparator;
  void *v5;
  void *v6;
  _QWORD v8[5];
  char v9;

  v9 = 0;
  objc_msgSend((id)objc_opt_class(), "_propertyKeyForSnapshotKey:overriddenForNil:", self->_key, &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __55__XBApplicationSnapshotSortDescriptor_NSSortDescriptor__block_invoke;
    v8[3] = &unk_24D7F5150;
    v8[4] = self;
    comparator = v8;
  }
  else
  {
    comparator = self->_comparator;
  }
  v5 = (void *)MEMORY[0x219A10DF4](comparator);
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:comparator:", v3, self->_ascending, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSortDescriptor *)v6;
}

+ (id)_propertyKeyForSnapshotKey:(unint64_t)a3 overriddenForNil:(BOOL *)a4
{
  id result;

  result = CFSTR("referenceSize");
  switch(a3)
  {
    case 1uLL:
      if (a4)
        *a4 = 1;
      result = CFSTR("_sortableName");
      break;
    case 2uLL:
      if (a4)
        *a4 = 1;
      result = CFSTR("_sortableScheme");
      break;
    case 3uLL:
      if (a4)
        *a4 = 1;
      result = CFSTR("_sortableLaunchInterfaceIdentifier");
      break;
    case 4uLL:
      if (a4)
        *a4 = 0;
      result = CFSTR("_interfaceOrientationMask");
      break;
    case 6uLL:
      result = CFSTR("imageScale");
      break;
    case 7uLL:
      if (a4)
        *a4 = 0;
      result = CFSTR("_contentTypeMask");
      break;
    case 8uLL:
      if (a4)
        *a4 = 1;
      result = CFSTR("_sortableStatusBarSettings");
      break;
    case 9uLL:
      if (a4)
        *a4 = 1;
      result = CFSTR("_sortableRequiredOSVersion");
      break;
    case 0xAuLL:
      result = CFSTR("creationDate");
      break;
    case 0xBuLL:
      result = CFSTR("hasProtectedContent");
      break;
    case 0xCuLL:
      result = CFSTR("userInterfaceStyle");
      break;
    case 0xDuLL:
      result = CFSTR("customSafeAreaInsets");
      break;
    default:
      return result;
  }
  return result;
}

uint64_t __55__XBApplicationSnapshotSortDescriptor_NSSortDescriptor__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;

  v5 = a2;
  v6 = a3;
  v7 = v5;
  FAKE_NIL_PTR();
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v9 = v7;
  if (v8 == v7)
  {

    v9 = 0;
  }
  v10 = v6;
  FAKE_NIL_PTR();
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v12 = v10;
  if (v11 == v10)
  {

    v12 = 0;
  }
  v13 = (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 16))();

  return v13;
}

- (NSString)description
{
  return (NSString *)-[XBApplicationSnapshotSortDescriptor descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[XBApplicationSnapshotSortDescriptor succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x24BE38380], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[XBApplicationSnapshotSortDescriptor descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  XBApplicationSnapshotSortDescriptor *v11;

  v4 = a3;
  -[XBApplicationSnapshotSortDescriptor succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __77__XBApplicationSnapshotSortDescriptor_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_24D7F45F0;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

id __77__XBApplicationSnapshotSortDescriptor_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_stringForKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("key"));

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("ascending"));
}

- (id)_stringForKey:(unint64_t)a3
{
  if (a3 - 2 > 0xB)
    return CFSTR("XBApplicationSnapshotNameKey");
  else
    return *(&off_24D7F5190 + a3 - 2);
}

- (unint64_t)key
{
  return self->_key;
}

- (void)setKey:(unint64_t)a3
{
  self->_key = a3;
}

- (BOOL)ascending
{
  return self->_ascending;
}

- (void)setAscending:(BOOL)a3
{
  self->_ascending = a3;
}

- (id)comparator
{
  return self->_comparator;
}

- (void)setComparator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

@end

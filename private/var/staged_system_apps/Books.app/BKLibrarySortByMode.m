@implementation BKLibrarySortByMode

- (id)predicate
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  uint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibrarySortByMode allowExplicitPredicate](self, "allowExplicitPredicate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v5 = objc_msgSend(v4, "isExplicitMaterialAllowed");

  if ((v5 & 1) == 0)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[BKLibrarySortByMode hideExplicitPredicate](self, "hideExplicitPredicate"));

    v3 = (void *)v6;
  }
  return v3;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p title=\"%@\" label=\"%@\" sortMode=%tu>"), v5, self, self->_title, self->_label, self->_sortMode));

  return v6;
}

- (unint64_t)sortMode
{
  return self->_sortMode;
}

- (void)setSortMode:(unint64_t)a3
{
  self->_sortMode = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSPredicate)allowExplicitPredicate
{
  return self->_allowExplicitPredicate;
}

- (void)setAllowExplicitPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_allowExplicitPredicate, a3);
}

- (NSPredicate)hideExplicitPredicate
{
  return self->_hideExplicitPredicate;
}

- (void)setHideExplicitPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_hideExplicitPredicate, a3);
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setSortDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_sortDescriptors, a3);
}

- (NSString)sectionKeyPath
{
  return self->_sectionKeyPath;
}

- (void)setSectionKeyPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)sectionKeyPathForDisplay
{
  return self->_sectionKeyPathForDisplay;
}

- (void)setSectionKeyPathForDisplay:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)entityName
{
  return self->_entityName;
}

- (void)setEntityName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)allowsReordering
{
  return self->_allowsReordering;
}

- (void)setAllowsReordering:(BOOL)a3
{
  self->_allowsReordering = a3;
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityName, 0);
  objc_storeStrong((id *)&self->_sectionKeyPathForDisplay, 0);
  objc_storeStrong((id *)&self->_sectionKeyPath, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_hideExplicitPredicate, 0);
  objc_storeStrong((id *)&self->_allowExplicitPredicate, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end

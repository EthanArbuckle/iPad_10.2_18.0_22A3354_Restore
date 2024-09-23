@implementation _UICollectionLayoutAuxillaryKey

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSString *elementKind;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  elementKind = self->_elementKind;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_index);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_auxillaryKind);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSupplementary);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p elementKind=%@; index=%@; auxillaryKind=%@; isSup=%@>"),
    v5,
    self,
    elementKind,
    v7,
    v8,
    v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)hash
{
  return self->_index + -[NSString hash](self->_elementKind, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  _UICollectionLayoutAuxillaryKey *v4;
  NSString *elementKind;
  int64_t index;
  int64_t auxillaryKind;
  BOOL isSupplementary;
  uint64_t v9;
  NSString *v10;
  void *v12;
  objc_super v13;

  v4 = +[_UICollectionLayoutAuxillaryKey allocWithZone:](_UICollectionLayoutAuxillaryKey, "allocWithZone:", a3);
  if (v4)
  {
    elementKind = self->_elementKind;
    index = self->_index;
    auxillaryKind = self->_auxillaryKind;
    isSupplementary = self->_isSupplementary;
    if (!-[NSString length](elementKind, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithElementKind_index_auxillaryKind_isSupplementary_, v4, CFSTR("_UICollectionLayoutHelpers.m"), 1909, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("elementKind.length"));

    }
    v13.receiver = v4;
    v13.super_class = (Class)_UICollectionLayoutAuxillaryKey;
    v4 = -[_UICollectionLayoutAuxillaryKey init](&v13, sel_init);
    if (v4)
    {
      v9 = -[NSString copy](elementKind, "copy");
      v10 = v4->_elementKind;
      v4->_elementKind = (NSString *)v9;

      v4->_index = index;
      v4->_auxillaryKind = auxillaryKind;
      v4->_isSupplementary = isSupplementary;
    }
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (!a3)
    return 0;
  if (a3 != self)
  {
    if (self->_index == *((_QWORD *)a3 + 3))
      return -[NSString isEqualToString:](self->_elementKind, "isEqualToString:", *((_QWORD *)a3 + 2));
    return 0;
  }
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementKind, 0);
}

@end

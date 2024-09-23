@implementation FRDataSourceUpdate

+ (void)performOnCollectionView:(id)a3 withUpdate:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v7 = a5;
  v9 = a3;
  v10 = a4;
  v11 = a6;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100049F70;
  v17[3] = &unk_1000DC330;
  v12 = v10;
  v19 = v12;
  v13 = v9;
  v18 = v13;
  v14 = v11;
  v20 = v14;
  v15 = objc_retainBlock(v17);
  v16 = v15;
  if (v7)
    ((void (*)(_QWORD *))v15[2])(v15);
  else
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v15);

}

- (NSIndexSet)insertedSections
{
  return self->_insertedSections;
}

- (void)setInsertedSections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)insertedIndexPaths
{
  return self->_insertedIndexPaths;
}

- (void)setInsertedIndexPaths:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSIndexSet)deletedSections
{
  return self->_deletedSections;
}

- (void)setDeletedSections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)deletedIndexPaths
{
  return self->_deletedIndexPaths;
}

- (void)setDeletedIndexPaths:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSIndexSet)updatedSections
{
  return self->_updatedSections;
}

- (void)setUpdatedSections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)updatedIndexPaths
{
  return self->_updatedIndexPaths;
}

- (void)setUpdatedIndexPaths:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDictionary)movedSections
{
  return self->_movedSections;
}

- (void)setMovedSections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDictionary)movedIndexPaths
{
  return self->_movedIndexPaths;
}

- (void)setMovedIndexPaths:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movedIndexPaths, 0);
  objc_storeStrong((id *)&self->_movedSections, 0);
  objc_storeStrong((id *)&self->_updatedIndexPaths, 0);
  objc_storeStrong((id *)&self->_updatedSections, 0);
  objc_storeStrong((id *)&self->_deletedIndexPaths, 0);
  objc_storeStrong((id *)&self->_deletedSections, 0);
  objc_storeStrong((id *)&self->_insertedIndexPaths, 0);
  objc_storeStrong((id *)&self->_insertedSections, 0);
}

@end

@implementation PXSectionedTileIdentifierConverter

- (PXSectionedTileIdentifierConverter)init
{

  return 0;
}

- (PXSectionedTileIdentifierConverter)initWithFromDataSource:(id)a3 toDataSource:(id)a4 changeDetails:(id)a5
{
  id v9;
  id v10;
  id v11;
  PXSectionedTileIdentifierConverter *v12;
  PXSectionedTileIdentifierConverter *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PXSectionedTileIdentifierConverter;
  v12 = -[PXSectionedTileIdentifierConverter init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_fromDataSource, a3);
    objc_storeStrong((id *)&v13->_toDataSource, a4);
    objc_storeStrong((id *)&v13->_changeDetails, a5);
  }

  return v13;
}

- (BOOL)transformTileIdentifier:(PXTileIdentifier *)a3 group:(unint64_t *)a4
{
  BOOL result;
  unint64_t v6;
  unint64_t length;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  __int128 v12;
  unint64_t v15;
  __int128 v16;
  void *v17;
  NSArray *changeDetails;
  void *v19;
  char v20;
  unint64_t v21;
  _QWORD v22[4];
  __int128 v23;
  __int128 v24;
  char v25;
  __int128 v26;
  __int128 v27;
  unint64_t v28;
  uint64_t v29;

  result = 0;
  v29 = *MEMORY[0x1E0C80C00];
  length = a3->length;
  v6 = a3->index[0];
  v8 = a3->index[1];
  v9 = a3->index[2];
  v11 = a3->index[3];
  v10 = a3->index[4];
  v12 = *(_OWORD *)&a3->index[7];
  v26 = *(_OWORD *)&a3->index[5];
  v27 = v12;
  v28 = a3->index[9];
  if (length - 6 >= 0xFFFFFFFFFFFFFFFDLL && v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = *a4;
    if ((-[PXSectionedDataSource isEqual:](self->_fromDataSource, "isEqual:", self->_toDataSource) & 1) != 0)
    {
LABEL_4:
      a3->length = length;
      a3->index[0] = v6;
      a3->index[1] = v8;
      a3->index[2] = v9;
      a3->index[3] = v11;
      a3->index[4] = v10;
      v16 = v27;
      *(_OWORD *)&a3->index[5] = v26;
      *(_OWORD *)&a3->index[7] = v16;
      a3->index[9] = v28;
      result = 1;
      *a4 = v15;
      return result;
    }
    v21 = v15;
    -[NSArray firstObject](self->_changeDetails, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 != objc_msgSend(v17, "fromDataSourceIdentifier"))
      goto LABEL_9;
    v25 = 0;
    v23 = 0u;
    v24 = 0u;
    changeDetails = self->_changeDetails;
    v22[0] = v8;
    v22[1] = v9;
    v22[2] = v11;
    v22[3] = v10;
    objc_msgSend(off_1E50B4A18, "indexPathAfterApplyingChanges:toIndexPath:hasIncrementalChanges:objectChanged:", changeDetails, v22, 0, &v25);
    v8 = v23;
    if ((_QWORD)v23 == *(_QWORD *)off_1E50B7E98)
      goto LABEL_9;
    if (v25)
    {
      -[PXSectionedTileIdentifierConverter reloadedTileKindsOnObjectChanged](self, "reloadedTileKindsOnObjectChanged");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "containsIndex:", v6);

      if ((v20 & 1) != 0)
      {
LABEL_9:

        return 0;
      }
      v8 = v23;
    }
    v9 = *((_QWORD *)&v23 + 1);
    v10 = *((_QWORD *)&v24 + 1);
    v11 = v24;

    v15 = v21;
    goto LABEL_4;
  }
  return result;
}

- (BOOL)reverseTransformTileIdentifier:(PXTileIdentifier *)a3
{
  unint64_t v3;
  unint64_t length;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  __int128 v9;
  __int128 v12;
  BOOL result;
  void *v14;
  NSArray *changeDetails;
  void *v16;
  char v17;
  _QWORD v18[4];
  __int128 v19;
  __int128 v20;
  char v21;
  __int128 v22;
  __int128 v23;
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  length = a3->length;
  v3 = a3->index[0];
  v5 = a3->index[1];
  v6 = a3->index[2];
  v7 = a3->index[3];
  v8 = a3->index[4];
  v9 = *(_OWORD *)&a3->index[7];
  v22 = *(_OWORD *)&a3->index[5];
  v23 = v9;
  v24 = a3->index[9];
  if (length - 3 > 1)
    return 0;
  if ((-[PXSectionedDataSource isEqual:](self->_fromDataSource, "isEqual:", self->_toDataSource) & 1) != 0)
  {
LABEL_3:
    a3->length = length;
    a3->index[0] = v3;
    a3->index[1] = v5;
    a3->index[2] = v6;
    a3->index[3] = v7;
    a3->index[4] = v8;
    v12 = v23;
    *(_OWORD *)&a3->index[5] = v22;
    *(_OWORD *)&a3->index[7] = v12;
    result = 1;
    a3->index[9] = v24;
    return result;
  }
  -[NSArray lastObject](self->_changeDetails, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == objc_msgSend(v14, "toDataSourceIdentifier"))
  {
    v21 = 0;
    v19 = 0u;
    v20 = 0u;
    changeDetails = self->_changeDetails;
    v18[0] = v5;
    v18[1] = v6;
    v18[2] = v7;
    v18[3] = v8;
    objc_msgSend(off_1E50B4A18, "indexPathAfterRevertingChanges:fromIndexPath:hasIncrementalChanges:objectChanged:", changeDetails, v18, 0, &v21);
    v5 = v19;
    if ((_QWORD)v19 != *(_QWORD *)off_1E50B7E98)
    {
      if (v21)
      {
        -[PXSectionedTileIdentifierConverter reloadedTileKindsOnObjectChanged](self, "reloadedTileKindsOnObjectChanged");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "containsIndex:", v3);

        if ((v17 & 1) != 0)
          goto LABEL_8;
        v5 = v19;
      }
      v6 = *((_QWORD *)&v19 + 1);
      v8 = *((_QWORD *)&v20 + 1);
      v7 = v20;

      goto LABEL_3;
    }
  }
LABEL_8:

  return 0;
}

- (PXSectionedDataSource)fromDataSource
{
  return self->_fromDataSource;
}

- (PXSectionedDataSource)toDataSource
{
  return self->_toDataSource;
}

- (NSArray)changeDetails
{
  return self->_changeDetails;
}

- (NSIndexSet)reloadedTileKindsOnObjectChanged
{
  return self->_reloadedTileKindsOnObjectChanged;
}

- (void)setReloadedTileKindsOnObjectChanged:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reloadedTileKindsOnObjectChanged, 0);
  objc_storeStrong((id *)&self->_changeDetails, 0);
  objc_storeStrong((id *)&self->_toDataSource, 0);
  objc_storeStrong((id *)&self->_fromDataSource, 0);
}

@end

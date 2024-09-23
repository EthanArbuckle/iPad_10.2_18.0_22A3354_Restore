@implementation PXMemoriesFeedTileIdentifierConverter

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
  void *v14;
  void *v15;
  char v16;
  __int128 v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  unint64_t v29;
  unint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  char v36;
  __int128 v37;
  __int128 v38;
  unint64_t v39;
  uint64_t v40;

  result = 0;
  v40 = *MEMORY[0x1E0C80C00];
  length = a3->length;
  v6 = a3->index[0];
  v8 = a3->index[1];
  v9 = a3->index[2];
  v11 = a3->index[3];
  v10 = a3->index[4];
  v12 = *(_OWORD *)&a3->index[7];
  v37 = *(_OWORD *)&a3->index[5];
  v38 = v12;
  v39 = a3->index[9];
  if (length - 6 >= 0xFFFFFFFFFFFFFFFDLL && v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v31 = v6;
    v29 = *a4;
    -[PXSectionedTileIdentifierConverter fromDataSource](self, "fromDataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSectionedTileIdentifierConverter toDataSource](self, "toDataSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
    {
LABEL_4:
      a3->length = length;
      a3->index[0] = v31;
      a3->index[1] = v8;
      a3->index[2] = v9;
      a3->index[3] = v11;
      a3->index[4] = v10;
      v17 = v38;
      *(_OWORD *)&a3->index[5] = v37;
      *(_OWORD *)&a3->index[7] = v17;
      a3->index[9] = v39;
      result = 1;
      *a4 = v29;
      return result;
    }
    -[PXSectionedTileIdentifierConverter changeDetails](self, "changeDetails");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 != objc_msgSend(v19, "fromDataSourceIdentifier"))
      goto LABEL_17;
    v36 = 0;
    v34 = 0u;
    v35 = 0u;
    -[PXSectionedTileIdentifierConverter changeDetails](self, "changeDetails");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v32 = v8;
    *((_QWORD *)&v32 + 1) = v9;
    *(_QWORD *)&v33 = v11;
    *((_QWORD *)&v33 + 1) = v10;
    objc_msgSend(off_1E50B4A18, "indexPathAfterApplyingChanges:toIndexPath:hasIncrementalChanges:objectChanged:", v20, &v32, 0, &v36);

    v21 = v34;
    v22 = *(_QWORD *)off_1E50B7E98;
    if ((_QWORD)v34 != *(_QWORD *)off_1E50B7E98
      && (_QWORD)v35 != 0x7FFFFFFFFFFFFFFFLL
      && *((_QWORD *)&v35 + 1) == 0x7FFFFFFFFFFFFFFFLL
      && v8 != v22
      && v11 != 0x7FFFFFFFFFFFFFFFLL
      && v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v36)
      {
        -[PXSectionedTileIdentifierConverter fromDataSource](self, "fromDataSource");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&v32 = v8;
        *((_QWORD *)&v32 + 1) = v9;
        *(_QWORD *)&v33 = v11;
        *((_QWORD *)&v33 + 1) = 0x7FFFFFFFFFFFFFFFLL;
        objc_msgSend(v23, "objectAtIndexPath:", &v32);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        -[PXSectionedTileIdentifierConverter toDataSource](self, "toDataSource");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v34;
        v33 = v35;
        objc_msgSend(v25, "objectAtIndexPath:", &v32);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v36 = !-[PXMemoriesFeedTileIdentifierConverter _shouldConvertIdentifierFromMemoryInfo:toMemoryInfo:](self, "_shouldConvertIdentifierFromMemoryInfo:toMemoryInfo:", v24, v26);
        v21 = v34;
      }
    }
    if (v21 == v22)
      goto LABEL_17;
    if (v36)
    {
      -[PXSectionedTileIdentifierConverter reloadedTileKindsOnObjectChanged](self, "reloadedTileKindsOnObjectChanged");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "containsIndex:", v31);

      if ((v28 & 1) != 0)
      {
LABEL_17:

        return 0;
      }
      v21 = v34;
    }
    v9 = *((_QWORD *)&v34 + 1);
    v10 = *((_QWORD *)&v35 + 1);
    v11 = v35;

    v8 = v21;
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
  void *v12;
  void *v13;
  char v14;
  __int128 v15;
  BOOL result;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  unint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  char v33;
  __int128 v34;
  __int128 v35;
  unint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  length = a3->length;
  v3 = a3->index[0];
  v5 = a3->index[1];
  v6 = a3->index[2];
  v7 = a3->index[3];
  v8 = a3->index[4];
  v9 = *(_OWORD *)&a3->index[7];
  v34 = *(_OWORD *)&a3->index[5];
  v35 = v9;
  v36 = a3->index[9];
  if (length - 3 > 1)
    return 0;
  v28 = v3;
  -[PXSectionedTileIdentifierConverter fromDataSource](self, "fromDataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSectionedTileIdentifierConverter toDataSource](self, "toDataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqual:", v13);

  if ((v14 & 1) != 0)
  {
LABEL_3:
    a3->length = length;
    a3->index[0] = v28;
    a3->index[1] = v5;
    a3->index[2] = v6;
    a3->index[3] = v7;
    a3->index[4] = v8;
    v15 = v35;
    *(_OWORD *)&a3->index[5] = v34;
    *(_OWORD *)&a3->index[7] = v15;
    result = 1;
    a3->index[9] = v36;
    return result;
  }
  -[PXSectionedTileIdentifierConverter changeDetails](self, "changeDetails");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "lastObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == objc_msgSend(v18, "toDataSourceIdentifier"))
  {
    v33 = 0;
    v31 = 0u;
    v32 = 0u;
    -[PXSectionedTileIdentifierConverter changeDetails](self, "changeDetails");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v29 = v5;
    *((_QWORD *)&v29 + 1) = v6;
    *(_QWORD *)&v30 = v7;
    *((_QWORD *)&v30 + 1) = v8;
    objc_msgSend(off_1E50B4A18, "indexPathAfterRevertingChanges:fromIndexPath:hasIncrementalChanges:objectChanged:", v19, &v29, 0, &v33);

    v20 = v31;
    v21 = *(_QWORD *)off_1E50B7E98;
    if ((_QWORD)v31 != *(_QWORD *)off_1E50B7E98
      && (_QWORD)v32 != 0x7FFFFFFFFFFFFFFFLL
      && *((_QWORD *)&v32 + 1) == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v33)
      {
        -[PXSectionedTileIdentifierConverter fromDataSource](self, "fromDataSource");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v31;
        v30 = v32;
        objc_msgSend(v22, "objectAtIndexPath:", &v29);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        -[PXSectionedTileIdentifierConverter toDataSource](self, "toDataSource");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&v29 = v5;
        *((_QWORD *)&v29 + 1) = v6;
        *(_QWORD *)&v30 = v7;
        *((_QWORD *)&v30 + 1) = v8;
        objc_msgSend(v23, "objectAtIndexPath:", &v29);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v33 = !-[PXMemoriesFeedTileIdentifierConverter _shouldConvertIdentifierFromMemoryInfo:toMemoryInfo:](self, "_shouldConvertIdentifierFromMemoryInfo:toMemoryInfo:", v27, v24);
        v20 = v31;
      }
    }
    if (v20 != v21)
    {
      if (v33)
      {
        -[PXSectionedTileIdentifierConverter reloadedTileKindsOnObjectChanged](self, "reloadedTileKindsOnObjectChanged");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "containsIndex:", v28);

        if ((v26 & 1) != 0)
          goto LABEL_13;
        v20 = v31;
      }
      v6 = *((_QWORD *)&v31 + 1);
      v8 = *((_QWORD *)&v32 + 1);
      v7 = v32;

      v5 = v20;
      goto LABEL_3;
    }
  }
LABEL_13:

  return 0;
}

- (BOOL)_shouldConvertIdentifierFromMemory:(id)a3 toMemory:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  char v15;
  void *v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "localizedTitle");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedTitle");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v8)
  {

  }
  else
  {
    v9 = v8;
    v10 = objc_msgSend(v7, "isEqualToString:", v8);

    if ((v10 & 1) == 0)
      goto LABEL_7;
  }
  objc_msgSend(v5, "subtitle");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subtitle");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v11 == v12)
  {

  }
  else
  {
    v13 = v12;
    v14 = objc_msgSend(v11, "isEqualToString:", v12);

    if ((v14 & 1) == 0)
    {
LABEL_7:
      v15 = 0;
      goto LABEL_13;
    }
  }
  objc_msgSend(v5, "titleFontName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleFontName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16 == v17)
    v15 = 1;
  else
    v15 = objc_msgSend(v16, "isEqualToString:", v17);

LABEL_13:
  return v15;
}

- (BOOL)_shouldConvertIdentifierFromMemoryInfo:(id)a3 toMemoryInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  BOOL v16;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "assetCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryAsset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "primaryAsset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v10;
  v13 = v11;
  if (v12 == v13)
  {

  }
  else
  {
    v14 = v13;
    if (!v12 || !v13)
    {

LABEL_11:
      v16 = 0;
      goto LABEL_12;
    }
    v15 = objc_msgSend(v12, "isContentEqualTo:", v13);
    if (!v15)
      v15 = objc_msgSend(v14, "isContentEqualTo:", v12);

    if (v15 != 2)
      goto LABEL_11;
  }
  v16 = -[PXMemoriesFeedTileIdentifierConverter _shouldConvertIdentifierFromMemory:toMemory:](self, "_shouldConvertIdentifierFromMemory:toMemory:", v8, v9);
LABEL_12:

  return v16;
}

@end

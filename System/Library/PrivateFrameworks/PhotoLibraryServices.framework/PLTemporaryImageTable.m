@implementation PLTemporaryImageTable

- (BOOL)_writeCompressedThumbnailDataForImage:(id)a3 intoTable:(id)a4 atIndex:(unint64_t)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  BOOL v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  int v19;
  id v21;
  uint8_t buf[4];
  _BYTE v23[14];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = objc_msgSend(a3, "CGImage");
  objc_msgSend(v7, "format");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  +[PLTableThumbnailEncoder encodeThumbnailImage:toFormat:withUUID:error:](PLTableThumbnailEncoder, "encodeThumbnailImage:toFormat:withUUID:error:", v8, v9, v11, &v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v21;

  if (!v12)
  {
    PLThumbnailsGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_msgSend(v7, "formatSideLen");
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v23 = v16;
      *(_WORD *)&v23[4] = 2112;
      *(_QWORD *)&v23[6] = v13;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Failed to encode temporary table image data in format with side len: %d, error: %@", buf, 0x12u);
    }
    goto LABEL_9;
  }
  objc_msgSend(v12, "entryDataForEntryLength:", objc_msgSend(v7, "entryLength"));
  v14 = objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "writeEntryData:toIndex:", v14, a5) & 1) == 0)
  {
    PLThumbnailsGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = -[NSObject length](v14, "length");
      v19 = objc_msgSend(v7, "formatSideLen");
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)v23 = v18;
      *(_WORD *)&v23[8] = 1024;
      *(_DWORD *)&v23[10] = v19;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Failed to write encoded table image data of len: %ld in format with side len: %d", buf, 0x12u);
    }

LABEL_9:
    v15 = 0;
    goto LABEL_10;
  }
  v15 = 1;
LABEL_10:

  return v15;
}

- (BOOL)_writeBGRAThumbnailDataForImage:(id)a3 intoTable:(id)a4 atIndex:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  __int128 v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  id v14;
  void *v15;
  double v16;
  unsigned int v17;
  double v18;
  unsigned int v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  NSObject *v24;
  int v25;
  id v27;
  _OWORD v28[2];
  uint8_t buf[4];
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", objc_msgSend(v8, "entryLength"));
  v10 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v28[0] = *MEMORY[0x1E0C9D648];
  v28[1] = v10;
  objc_msgSend(v8, "format");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "thumbnailSpecification");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = v9;
  v13 = +[PLThumbnailUtilities performSWDownscaleTo5551OnImage:withSpecification:destinationData:imageRect:bytesPerRow:](PLThumbnailUtilities, "performSWDownscaleTo5551OnImage:withSpecification:destinationData:imageRect:bytesPerRow:", objc_msgSend(v7, "CGImage"), v12, &v27, v28, 0);
  v14 = v27;

  if (!v13)
    goto LABEL_4;
  objc_msgSend(v8, "formatSideLen");
  v15 = (void *)MEMORY[0x1E0D73160];
  objc_msgSend(v7, "pixelSize");
  objc_msgSend(v15, "centeredRectForSourceSize:destinationSize:");
  v17 = v16;
  v19 = v18;
  v20 = objc_retainAutorelease(v14);
  v21 = objc_msgSend(v20, "mutableBytes");
  v22 = objc_msgSend(v20, "length") + v21;
  *(_QWORD *)(v22 - 20) = 0;
  *(_QWORD *)(v22 - 28) = 0;
  *(_DWORD *)(v22 - 12) = v19;
  *(_DWORD *)(v22 - 8) = v17;
  *(_DWORD *)(v22 - 4) = 0;
  if ((objc_msgSend(v8, "writeEntryData:toIndex:", v20, a5) & 1) != 0)
  {
    v23 = 1;
  }
  else
  {
LABEL_4:
    PLThumbnailsGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = objc_msgSend(v8, "formatSideLen");
      *(_DWORD *)buf = 67109120;
      v30 = v25;
      _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "Failed to write temporary table image data in format with side len: %d", buf, 8u);
    }

    v23 = 0;
  }

  return v23;
}

- (void)_positional_setThumbnailsWithIdentifier:(id)a3 thumbnailIndex:(unint64_t)a4 image:(id)a5 assetUUID:(id)a6
{
  id v8;
  PLThumbPersistenceManager *v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _DWORD v15[2];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = self->_imageTable;
  v10 = -[PLThumbPersistenceManager isReadOnly](v9, "isReadOnly");
  if (!v8 || (v10 & 1) != 0 || !objc_msgSend(v8, "CGImage"))
    goto LABEL_13;
  -[PLThumbPersistenceManager format](v9, "format");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "thumbnailKind") == 4)
  {

  }
  else
  {
    -[PLThumbPersistenceManager format](v9, "format");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "thumbnailKind");

    if (v13 != 3)
    {
      if (-[PLTemporaryImageTable _writeBGRAThumbnailDataForImage:intoTable:atIndex:](self, "_writeBGRAThumbnailDataForImage:intoTable:atIndex:", v8, v9, a4))
      {
        goto LABEL_13;
      }
      goto LABEL_10;
    }
  }
  if (-[PLTemporaryImageTable _writeCompressedThumbnailDataForImage:intoTable:atIndex:](self, "_writeCompressedThumbnailDataForImage:intoTable:atIndex:", v8, v9, a4))
  {
    goto LABEL_13;
  }
LABEL_10:
  PLThumbnailsGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v15[0] = 67109120;
    v15[1] = -[PLThumbPersistenceManager formatSideLen](v9, "formatSideLen");
    _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Failed to write temporary table image data in format with side len: %d", (uint8_t *)v15, 8u);
  }

LABEL_13:
}

- (PLTemporaryImageTable)initWithWithPath:(id)a3 imageFormat:(unsigned __int16)a4
{
  id v6;
  PLTemporaryImageTable *v7;
  PLTemporaryImageTable *v8;
  uint64_t v9;
  NSString *imageTablePath;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLTemporaryImageTable;
  v7 = -[PLTemporaryImageTable init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_imageFormatID = a4;
    v9 = objc_msgSend(v6, "copy");
    imageTablePath = v8->_imageTablePath;
    v8->_imageTablePath = (NSString *)v9;

    -[PLTemporaryImageTable reset](v8, "reset");
  }

  return v8;
}

- (void)setImage:(id)a3 forItemAtIndex:(unint64_t)a4
{
  NSMutableArray *itemIndexToThumbEntryMapping;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PLImageContainer *v12;
  id v13;

  v13 = a3;
  while (-[NSMutableArray count](self->_itemIndexToThumbEntryMapping, "count") <= a4)
  {
    itemIndexToThumbEntryMapping = self->_itemIndexToThumbEntryMapping;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](itemIndexToThumbEntryMapping, "addObject:", v7);

  }
  if (-[NSMutableArray count](self->_itemIndexToThumbEntryMapping, "count") <= a4)
  {
    v8 = 0;
LABEL_8:
    v11 = (void *)MEMORY[0x1E0CB37E8];
    ++self->_nextTableEntryIndex;
    objc_msgSend(v11, "numberWithUnsignedInteger:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  -[NSMutableArray objectAtIndex:](self->_itemIndexToThumbEntryMapping, "objectAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v8;
  if (v8 == v9)
    goto LABEL_8;
LABEL_9:
  v12 = -[PLImageContainer initWithPLImage:]([PLImageContainer alloc], "initWithPLImage:", v13);
  -[PLTemporaryImageTable _positional_setThumbnailsWithIdentifier:thumbnailIndex:image:assetUUID:](self, "_positional_setThumbnailsWithIdentifier:thumbnailIndex:image:assetUUID:", 0, objc_msgSend(v10, "unsignedIntegerValue"), v12, 0);
  -[NSMutableArray replaceObjectAtIndex:withObject:](self->_itemIndexToThumbEntryMapping, "replaceObjectAtIndex:withObject:", a4, v10);

}

- (unint64_t)_imageTableIndexForItemIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;

  if (-[NSMutableArray count](self->_itemIndexToThumbEntryMapping, "count") <= a3)
    return 0x7FFFFFFFFFFFFFFFLL;
  -[NSMutableArray objectAtIndex:](self->_itemIndexToThumbEntryMapping, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v7 = objc_msgSend(v5, "unsignedIntegerValue");

  return v7;
}

- (id)imageForItemAtIndex:(unint64_t)a3
{
  unint64_t v4;
  uint64_t v5;
  CGImage *v6;
  void *v7;

  v4 = -[PLTemporaryImageTable _imageTableIndexForItemIndex:](self, "_imageTableIndexForItemIndex:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL
    || (v5 = -[PLThumbPersistenceManager createImageWithIdentifier:orIndex:](self->_imageTable, "createImageWithIdentifier:orIndex:", 0, v4)) == 0)
  {
    v7 = 0;
  }
  else
  {
    v6 = (CGImage *)v5;
    v7 = (void *)DCIM_newPLImageWithCGImage();
    CGImageRelease(v6);
  }
  return v7;
}

- (void)insertItemAtIndex:(unint64_t)a3
{
  NSMutableArray *itemIndexToThumbEntryMapping;
  id v6;

  if (-[NSMutableArray count](self->_itemIndexToThumbEntryMapping, "count") > a3)
  {
    itemIndexToThumbEntryMapping = self->_itemIndexToThumbEntryMapping;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray insertObject:atIndex:](itemIndexToThumbEntryMapping, "insertObject:atIndex:", v6, a3);

  }
}

- (void)removeItemAtIndex:(unint64_t)a3
{
  unint64_t v5;
  NSMutableArray *itemIndexToThumbEntryMapping;
  id v7;

  if (-[NSMutableArray count](self->_itemIndexToThumbEntryMapping, "count") > a3)
  {
    v5 = -[PLTemporaryImageTable _imageTableIndexForItemIndex:](self, "_imageTableIndexForItemIndex:", a3);
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
      -[PLThumbPersistenceManager deleteEntryWithIdentifier:orIndex:uuid:](self->_imageTable, "deleteEntryWithIdentifier:orIndex:uuid:", 0, v5, 0);
    itemIndexToThumbEntryMapping = self->_itemIndexToThumbEntryMapping;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray replaceObjectAtIndex:withObject:](itemIndexToThumbEntryMapping, "replaceObjectAtIndex:withObject:", a3, v7);

  }
}

- (void)_cleanup
{
  NSMutableArray *itemIndexToThumbEntryMapping;
  PLThumbPersistenceManager *imageTable;
  void *v5;

  itemIndexToThumbEntryMapping = self->_itemIndexToThumbEntryMapping;
  self->_itemIndexToThumbEntryMapping = 0;

  imageTable = self->_imageTable;
  if (imageTable)
  {
    self->_imageTable = 0;

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeItemAtPath:error:", self->_imageTablePath, 0);

  }
  self->_nextTableEntryIndex = 0;
}

- (void)reset
{
  NSMutableArray *v3;
  NSMutableArray *itemIndexToThumbEntryMapping;
  PLThumbPersistenceManager *v5;
  PLThumbPersistenceManager *imageTable;
  id v7;

  -[PLTemporaryImageTable _cleanup](self, "_cleanup");
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  itemIndexToThumbEntryMapping = self->_itemIndexToThumbEntryMapping;
  self->_itemIndexToThumbEntryMapping = v3;

  objc_msgSend(MEMORY[0x1E0D73238], "formatWithID:", self->_imageFormatID);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "createTableWithPath:readOnly:format:", self->_imageTablePath, 0, v7);
  v5 = (PLThumbPersistenceManager *)objc_claimAutoreleasedReturnValue();
  imageTable = self->_imageTable;
  self->_imageTable = v5;

}

- (void)dealloc
{
  NSString *imageTablePath;
  objc_super v4;

  imageTablePath = self->_imageTablePath;
  self->_imageTablePath = 0;

  -[PLTemporaryImageTable _cleanup](self, "_cleanup");
  v4.receiver = self;
  v4.super_class = (Class)PLTemporaryImageTable;
  -[PLTemporaryImageTable dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageTablePath, 0);
  objc_storeStrong((id *)&self->_itemIndexToThumbEntryMapping, 0);
  objc_storeStrong((id *)&self->_imageTable, 0);
}

@end

@implementation PLPositionalImageTable

- (BOOL)usesThumbIdentifiers
{
  return 0;
}

void __115__PLPositionalImageTable_imageDataWithIdentifier_orIndex_width_height_bytesPerRow_dataWidth_dataHeight_dataOffset___block_invoke(uint64_t a1)
{
  void **v2;
  void *v3;

  PLPositionalTableMemoryPool_Free(*(OSQueueHead ***)(a1 + 32));
  v2 = *(void ***)(a1 + 40);
  v3 = *v2;
  *v2 = 0;

  free(*(void **)(a1 + 40));
}

- (PLPositionalImageTable)initWithPath:(id)a3 readOnly:(BOOL)a4 format:(id)a5
{
  _BOOL8 v6;
  id v9;
  id v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  PLPositionalImageTable *v15;
  PLPositionalImageTable *v16;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v6 = a4;
  v9 = a3;
  v10 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPositionalImageTable.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("format"));

  }
  if ((objc_msgSend(v10, "isTable") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPositionalImageTable.m"), 75, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("format.isTable"));

  }
  objc_msgSend(v10, "dimension");
  v12 = (int)v11;
  if ((int)v12 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPositionalImageTable.m"), 78, CFSTR("format must have non-zero dimension."));

  }
  v13 = objc_msgSend(v10, "tableFormatBytesPerRowForWidth:", v12);
  objc_msgSend(v10, "size");
  v21.receiver = self;
  v21.super_class = (Class)PLPositionalImageTable;
  v15 = -[PLPositionalTable initWithPath:readOnly:entryLength:](&v21, sel_initWithPath_readOnly_entryLength_, v9, v6, v13 * (unint64_t)v14 + 28);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_format, a5);
    v16->_formatIsCropped = objc_msgSend(v10, "isCropped");
    v16->_formatSideLen = v12;
    v16->_formatBytesPerPixel = objc_msgSend(v10, "tableFormatBytesPerPixel");
    v16->_formatMaxBytesPerRow = objc_msgSend(v10, "tableFormatBytesPerRowForWidth:", v12);
  }

  return v16;
}

- (id)imageDataWithIdentifier:(id)a3 orIndex:(unint64_t)a4 width:(int *)a5 height:(int *)a6 bytesPerRow:(int *)a7 dataWidth:(int *)a8 dataHeight:(int *)a9 dataOffset:(int *)a10
{
  _QWORD *v16;
  OSQueueHead **v17;
  id *v18;
  id v19;
  OSQueueHead *v20;
  _QWORD v22[6];
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;

  if (self->super._readOnly)
  {
    if (a4 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_10;
  }
  else if (self->super._entryCapacity <= a4)
  {
LABEL_10:
    v16 = 0;
    return v16;
  }
  v16 = PLPositionalTableMemoryPool_Alloc((OSQueueHead *)-[PLPositionalTable pool](self, "pool", a3), (void *)-[PLPositionalTable entryLength](self, "entryLength"));
  if (!v16)
    return v16;
  v17 = (OSQueueHead **)v16;
  v27 = 0;
  v28 = 0;
  v26 = 0;
  v25 = 0;
  v23 = 0;
  v24 = 0;
  if (!-[PLPositionalImageTable readImageDataAtIndex:intoPoolNode:bytesRead:imageWidth:imageHeight:imageDataWidth:imageDataHeight:startingOffset:bytesPerRow:uuidBytes:](self, "readImageDataAtIndex:intoPoolNode:bytesRead:imageWidth:imageHeight:imageDataWidth:imageDataHeight:startingOffset:bytesPerRow:uuidBytes:", a4, v16, &v28, &v26, &v25, (char *)&v24 + 4, &v24, &v27, &v23, 0))
  {
    PLPositionalTableMemoryPool_Free(v17);
    goto LABEL_10;
  }
  v18 = (id *)malloc_type_calloc(1uLL, 8uLL, 0x80040B8603338uLL);
  objc_storeStrong(v18, self);
  v19 = objc_alloc(MEMORY[0x1E0C99D50]);
  v20 = *v17;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __115__PLPositionalImageTable_imageDataWithIdentifier_orIndex_width_height_bytesPerRow_dataWidth_dataHeight_dataOffset___block_invoke;
  v22[3] = &__block_descriptor_48_e12_v24__0_v8Q16l;
  v22[4] = v17;
  v22[5] = v18;
  v16 = (_QWORD *)objc_msgSend(v19, "initWithBytesNoCopy:length:deallocator:", v20, v28, v22);
  if (v16)
  {
    *a5 = v26;
    *a6 = v25;
    *a8 = HIDWORD(v24);
    *a9 = v24;
    *a10 = v27;
    *a7 = v23;
  }
  return v16;
}

- (BOOL)readImageDataAtIndex:(unint64_t)a3 intoPoolNode:(tagPLPositionalTableMemoryPoolNode *)a4 bytesRead:(unint64_t *)a5 imageWidth:(int *)a6 imageHeight:(int *)a7 imageDataWidth:(int *)a8 imageDataHeight:(int *)a9 startingOffset:(int64_t *)a10 bytesPerRow:(unint64_t *)a11 uuidBytes:(id *)a12
{
  _BOOL4 v19;
  char *v20;
  char *v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  BOOL v25;
  NSObject *v26;
  int v27;
  int v28;
  int v29;
  unint64_t v30;
  unint64_t v31;
  double formatSideLen;
  double v33;
  int v34;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  _BYTE buf[18];
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v38 = 0;
  v19 = -[PLPositionalTable readDataAtIndex:intoPoolNode:bytesRead:](self, "readDataAtIndex:intoPoolNode:bytesRead:", a3, a4, &v38);
  if (v19)
  {
    v20 = (char *)a4->var0 + -[PLPositionalTable entryLength](self, "entryLength");
    v21 = v20 - 28;
    v22 = *((_DWORD *)v20 - 2);
    if (v22
      && (v23 = *((_DWORD *)v21 + 4)) != 0
      && ((v24 = self->_formatSideLen, v22 <= v24) ? (v25 = v23 > v24) : (v25 = 1), !v25))
    {
      v37 = 0;
      *(_OWORD *)buf = *MEMORY[0x1E0C9D820];
      v36 = 0;
      -[PLPositionalImageTable getImageDataOffset:size:bytesPerRow:fromEntryFooter:](self, "getImageDataOffset:size:bytesPerRow:fromEntryFooter:", &v37, buf, &v36, v21);
      if (self->_formatIsCropped)
      {
        formatSideLen = (double)self->_formatSideLen;
        v33 = formatSideLen;
      }
      else
      {
        LODWORD(v30) = *((_DWORD *)v21 + 4);
        LODWORD(v31) = *((_DWORD *)v21 + 5);
        formatSideLen = (double)v30;
        v33 = (double)v31;
      }
      *a5 = v38;
      *a6 = (int)formatSideLen;
      *a7 = (int)v33;
      v34 = (int)*(double *)&buf[8];
      *a8 = (int)*(double *)buf;
      *a9 = v34;
      *a10 = (int)v37;
      *a11 = v36;
      if (a12)
        *a12 = *($DCF20CAD073027CB89FDEFA7A9A33809 *)v21;
      LOBYTE(v19) = 1;
    }
    else
    {
      PLThumbnailsGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        v27 = self->_formatSideLen;
        v28 = *((_DWORD *)v21 + 4);
        v29 = *((_DWORD *)v21 + 5);
        *(_DWORD *)buf = 134218752;
        *(_QWORD *)&buf[4] = a3;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v28;
        v40 = 1024;
        v41 = v29;
        v42 = 1024;
        v43 = v27;
        _os_log_impl(&dword_199DF7000, v26, OS_LOG_TYPE_DEBUG, "Footer data invalid at index: %lu (imageHeight: %d, imageWidth: %d), format side len: %d", buf, 0x1Eu);
      }

      LOBYTE(v19) = 0;
    }
  }
  return v19;
}

- (int)formatSideLen
{
  return self->_formatSideLen;
}

- (unint64_t)formatMaxBytesPerRow
{
  return self->_formatMaxBytesPerRow;
}

- (BOOL)formatIsCropped
{
  return self->_formatIsCropped;
}

- (unint64_t)formatBytesPerPixel
{
  return self->_formatBytesPerPixel;
}

- (PLImageFormat)format
{
  return self->_format;
}

- (CGImage)createImageWithIdentifier:(id)a3 orIndex:(unint64_t)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPositionalImageTable.m"), 146, CFSTR("must be overriden by subclass."));

  return 0;
}

- (BOOL)validateData:(id)a3 withToken:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  unsigned __int8 uu2[8];
  uint64_t v17;

  if (!a3)
    return 0;
  v5 = objc_retainAutorelease(a3);
  v6 = a4;
  v7 = v5;
  v8 = objc_msgSend(v7, "bytes");
  v9 = objc_msgSend(v7, "length");

  v10 = v9 + v8;
  v11 = PLUUIDBytesFromString(v6);
  v13 = v12;

  *(_QWORD *)uu2 = v11;
  v17 = v13;
  v15 = *(_OWORD *)(v10 - 28);
  return uuid_compare((const unsigned __int8 *)&v15, uu2) == 0;
}

- (void)preheatDataForThumbnailIndexes:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__PLPositionalImageTable_preheatDataForThumbnailIndexes___block_invoke;
  v3[3] = &unk_1E3768CB8;
  v3[4] = self;
  objc_msgSend(a3, "enumerateRangesUsingBlock:", v3);
}

- (id)beginThumbnailSafePropertyUpdatesOnAssetThumbnailIdentifier:(id)a3
{
  return 0;
}

- (id)_debugDescription
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t i;
  void *v8;
  OSQueueHead **v9;
  OSQueueHead **v10;
  PLUUIDString *v11;
  PLUUIDString *v12;
  unint64_t v13;
  OSQueueHead *v14;
  void *context;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  context = (void *)MEMORY[0x19AEC2E4C]();
  v4 = -[PLPositionalTable entryCapacity](self, "entryCapacity");
  -[PLPositionalImageTable format](self, "format");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPositionalTable path](self, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n%p %@ %@, capacity: %ld entries\n"), self, v5, v6, v4);

  if (v4 >= 1)
  {
    for (i = 0; i != v4; ++i)
    {
      v8 = (void *)MEMORY[0x19AEC2E4C]();
      objc_msgSend(v3, "appendFormat:", CFSTR("\t [%u] "), i);
      if (-[PLPositionalTable isEmptyAtIndex:](self, "isEmptyAtIndex:", i))
      {
        objc_msgSend(v3, "appendString:", CFSTR("(Empty)\n"));
      }
      else
      {
        v9 = (OSQueueHead **)PLPositionalTableMemoryPool_Alloc((OSQueueHead *)-[PLPositionalTable pool](self, "pool"), (void *)-[PLPositionalTable entryLength](self, "entryLength"));
        if (v9)
        {
          v10 = v9;
          v22 = 0;
          v23 = 0;
          v20 = 0;
          v21 = 0;
          v18 = 0;
          v19 = 0;
          v17 = 0;
          if (-[PLPositionalImageTable readImageDataAtIndex:intoPoolNode:bytesRead:imageWidth:imageHeight:imageDataWidth:imageDataHeight:startingOffset:bytesPerRow:uuidBytes:](self, "readImageDataAtIndex:intoPoolNode:bytesRead:imageWidth:imageHeight:imageDataWidth:imageDataHeight:startingOffset:bytesPerRow:uuidBytes:", i, v9, &v22, (char *)&v21 + 4, &v21, (char *)&v20 + 4, &v20, &v23, &v19, &v17))
          {
            v11 = [PLUUIDString alloc];
            v12 = -[PLUUIDString initWithCFUUIDBytes:](v11, "initWithCFUUIDBytes:", v17, v18);
            objc_msgSend(v3, "appendFormat:", CFSTR("%@, (%u x %u) { "), v12, HIDWORD(v21), v21);
            if (v22)
            {
              v13 = 0;
              v14 = *v10;
              do
              {
                objc_msgSend(v3, "appendFormat:", CFSTR("%hhd "), *((char *)&v14->opaque1 + v13));
                if (v13 > 8)
                  break;
                ++v13;
              }
              while (v22 > v13);
            }
            objc_msgSend(v3, "appendString:", CFSTR("}\n"));

          }
          else
          {
            objc_msgSend(v3, "appendString:", CFSTR("Read failed\n"));
          }
          PLPositionalTableMemoryPool_Free(v10);
        }
      }
      objc_autoreleasePoolPop(v8);
    }
  }
  objc_autoreleasePoolPop(context);
  return v3;
}

- (Class)entriesClass
{
  return (Class)objc_opt_class();
}

- (id)debugImageDataAtIndex:(unint64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPositionalImageTable.m"), 252, CFSTR("must be overriden by subclass."));

  return 0;
}

- (void)getImageDataOffset:(int64_t *)a3 size:(CGSize *)a4 bytesPerRow:(unint64_t *)a5 fromEntryFooter:(PLImageTableEntryFooter_s *)a6
{
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPositionalImageTable.m"), 257, CFSTR("must be overriden by subclass."));

}

- (BOOL)writeDebugImageAtIndex:(unint64_t)a3 toFileURL:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  char v11;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPositionalImageTable debugImageDataAtIndex:](self, "debugImageDataAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "fileExistsAtPath:", v9);

    if (v10)
      objc_msgSend(v7, "removeItemAtURL:error:", v6, 0);
    v11 = objc_msgSend(v8, "writeToURL:atomically:", v6, 0);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (PLImageTableEntryFooter_s)tableFooterForIndex:(unint64_t)a3
{
  OSQueueHead **v5;
  OSQueueHead **v6;
  _BOOL4 v7;
  char *v8;
  OSQueueHead *v9;
  unint64_t v10;
  __int128 v11;
  uint64_t v13;

  if (self->super._readOnly)
  {
    if (a3 == 0x7FFFFFFFFFFFFFFFLL)
      return 0;
  }
  else if (self->super._entryCapacity <= a3)
  {
    return 0;
  }
  v5 = (OSQueueHead **)PLPositionalTableMemoryPool_Alloc((OSQueueHead *)-[PLPositionalTable pool](self, "pool"), (void *)-[PLPositionalTable entryLength](self, "entryLength"));
  if (!v5)
    return 0;
  v6 = v5;
  v13 = 0;
  v7 = -[PLPositionalTable readDataAtIndex:intoPoolNode:bytesRead:](self, "readDataAtIndex:intoPoolNode:bytesRead:", a3, v5, &v13);
  v8 = 0;
  if (v7)
  {
    v8 = (char *)malloc_type_calloc(1uLL, 0x1CuLL, 0x100004027586B93uLL);
    v9 = *v6;
    v10 = -[PLPositionalTable entryLength](self, "entryLength");
    v11 = *(__int128 *)((char *)&v9[-1] + v10);
    *(OSQueueHead *)v8 = *(OSQueueHead *)((char *)v9 + v10 - 28);
    *(_OWORD *)(v8 + 12) = v11;
  }
  PLPositionalTableMemoryPool_Free(v6);
  return (PLImageTableEntryFooter_s *)v8;
}

- (void)setFormatIsCropped:(BOOL)a3
{
  self->_formatIsCropped = a3;
}

- (void)setFormatSideLen:(int)a3
{
  self->_formatSideLen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_format, 0);
}

uint64_t __57__PLPositionalImageTable_preheatDataForThumbnailIndexes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "touchEntriesInRange:", a2, a3);
}

+ (unint64_t)metalPixelFormat
{
  return 0;
}

+ (__CFString)colorSpaceName
{
  return 0;
}

@end

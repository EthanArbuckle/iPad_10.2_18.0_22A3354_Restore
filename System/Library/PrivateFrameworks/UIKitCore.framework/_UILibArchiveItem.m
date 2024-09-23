@implementation _UILibArchiveItem

+ (id)itemByReadingAttributesFromUnderlyingArchiveEntry:(ui_archive_entry *)a3 archive:(ui_archive *)a4
{
  _QWORD *v6;
  void *v7;
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  NSObject *v14;
  const char *v15;
  uint8_t *v16;
  unint64_t v17;
  _QWORD *v18;
  id v19;
  uint64_t v20;
  id v21;
  __int16 v23;
  __int16 v24;

  v6 = objc_alloc_init((Class)objc_opt_class());
  ui_archive_entry_pathname((uint64_t)a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "length"))
  {
    v13 = _MergedGlobals_3_7;
    if (!_MergedGlobals_3_7)
    {
      v13 = __UILogCategoryGetNode("DocumentInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v13, (unint64_t *)&_MergedGlobals_3_7);
    }
    v14 = *(NSObject **)(v13 + 8);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    v24 = 0;
    v15 = "unable to load archive item [ui_archive_entry_pathname() not set]";
    v16 = (uint8_t *)&v24;
    goto LABEL_13;
  }
  ui_archive_entry_filetype((uint64_t)a3);
  if (!v8)
  {
    v17 = qword_1ECD7A548;
    if (!qword_1ECD7A548)
    {
      v17 = __UILogCategoryGetNode("DocumentInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v17, (unint64_t *)&qword_1ECD7A548);
    }
    v14 = *(NSObject **)(v17 + 8);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    v23 = 0;
    v15 = "unable to load archive item [ui_archive_entry_filetype() not set]";
    v16 = (uint8_t *)&v23;
LABEL_13:
    _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, v15, v16, 2u);
LABEL_14:
    v18 = 0;
    goto LABEL_20;
  }
  v9 = v8;
  ui_archive_entry_size_is_set((uint64_t)a3);
  objc_msgSend(v6, "setFileSizeIsSet:", v10 != 0);
  if (objc_msgSend(v6, "fileSizeIsSet"))
  {
    ui_archive_entry_size((uint64_t)a3);
    v12 = v11;
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v6, "setPathInArchive:", v7);
  v19 = (id)*MEMORY[0x1E0CB2B38];
  v20 = (((v9 & 0xF000u) - 4096) >> 12) - 1;
  if (v20 <= 0xA && ((0x555u >> v20) & 1) != 0)
  {
    v21 = **((id **)&unk_1E16C3768 + v20);

    v19 = v21;
  }
  objc_msgSend(v6, "setFileType:", v19);

  objc_msgSend(v6, "setFileSize:", v12);
  v6[7] = a4;
  v6[6] = a3;
  v18 = v6;
LABEL_20:

  return v18;
}

- (ui_archive_entry)underlyingArchiveEntry
{
  return self->_underlyingArchiveEntry;
}

- (ui_archive)underlyingArchive
{
  return self->_underlyingArchive;
}

@end

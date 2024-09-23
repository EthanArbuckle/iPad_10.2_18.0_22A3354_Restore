@implementation UILibArchiveStreamingExtractor

void __72___UILibArchiveStreamingExtractor_extractArchivePath_toDirectory_error___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  int v22;
  uint64_t v23;
  __CFString *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  int v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v5 = a2;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  objc_msgSend(v5, "pathInArchive");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByStandardizingPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend((id)objc_opt_class(), "shouldExtractPathInArchive:forExtractionRootedAtStandardizedSubpathInArchive:", v7, *(_QWORD *)(a1 + 40)))
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    objc_msgSend(*(id *)(a1 + 48), "stringByAppendingPathComponent:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ui_archive_entry_clone(objc_msgSend(v5, "underlyingArchiveEntry"));
    v10 = v9;
    ui_archive_entry_set_pathname(v9, v8);
    ui_archive_write_header(*(_QWORD *)(a1 + 96), v10);
    if (v11)
    {
      ui_archive_error(*(_QWORD *)(a1 + 96), CFSTR("_UIArchiveExtractorErrorDomain"), v11, CFSTR("Unable to write header"));
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

    }
    else
    {
      v32 = 0;
      v33 = 0;
      v31 = 0;
      while (1)
      {
        ui_archive_read_data_block(objc_msgSend(v5, "underlyingArchive"), (uint64_t)&v33, (uint64_t)&v32, (uint64_t)&v31);
        v16 = v15;
        if (v15)
          break;
        ui_archive_write_data_block(*(_QWORD *)(a1 + 96), v33, v32, v31);
        if (v17)
        {
          ui_archive_error(*(_QWORD *)(a1 + 96), CFSTR("_UIArchiveExtractorErrorDomain"), -25, CFSTR("Unable to write data"));
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
          v20 = *(void **)(v19 + 40);
          *(_QWORD *)(v19 + 40) = v18;

LABEL_11:
          v23 = objc_msgSend(v5, "underlyingArchive");
          v24 = CFSTR("Unable to read data");
          v22 = v16;
          goto LABEL_12;
        }
      }
      if (v15 != 1)
        goto LABEL_11;
      ui_archive_write_finish_entry(*(_QWORD *)(a1 + 96));
      if (!v21)
        goto LABEL_14;
      v22 = v21;
      v23 = *(_QWORD *)(a1 + 96);
      v24 = CFSTR("Unable to finish writing data");
LABEL_12:
      ui_archive_error(v23, CFSTR("_UIArchiveExtractorErrorDomain"), v22, v24);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v27 = *(void **)(v26 + 40);
      *(_QWORD *)(v26 + 40) = v25;

    }
    *a3 = 1;
LABEL_14:
    v28 = objc_msgSend(v5, "isAppleDoubleFile");
    v29 = 64;
    if (v28)
    {
      v29 = 56;
      v30 = v5;
    }
    else
    {
      v30 = v8;
    }
    objc_msgSend(*(id *)(a1 + v29), "addObject:", v30);
    ui_archive_entry_free(v10);

  }
}

@end

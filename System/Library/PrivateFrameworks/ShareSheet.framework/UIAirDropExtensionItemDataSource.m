@implementation UIAirDropExtensionItemDataSource

+ (id)_airdropSupplementalSecurityContextForURL:(id)a3
{
  return airdropSupplementalSecurityContextForURL(a3);
}

+ (id)preparedActivityExtensionItemDataForActivityItemValues:(id)a3 extensionItemDataRequest:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  UISUIActivityExtensionItemData *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  UISUIActivityExtensionItemData *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  UISUIActivityExtensionItemData *v24;
  __int16 v26[8];
  _QWORD v27[4];
  id v28;
  UISUIActivityExtensionItemData *v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t buf[8];
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;

  v6 = a3;
  v7 = a4;
  share_sheet_log();
  v8 = objc_claimAutoreleasedReturnValue();
  share_sheet_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_make_with_pointer(v9, a1);

  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19E419000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PreparingItemData", (const char *)&unk_19E4D535F, buf, 2u);
  }

  v11 = objc_msgSend(v7, "maxPreviews");
  *(_QWORD *)buf = 0;
  v35 = buf;
  v36 = 0x2020000000;
  v37 = 0;
  v12 = objc_alloc_init(UISUIActivityExtensionItemData);
  objc_msgSend(v7, "activityType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "thumbnailSize");
  v15 = v14;
  v17 = v16;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __116__UIAirDropExtensionItemDataSource_preparedActivityExtensionItemDataForActivityItemValues_extensionItemDataRequest___block_invoke;
  v27[3] = &unk_1E4003E48;
  v18 = v13;
  v28 = v18;
  v19 = v12;
  v29 = v19;
  v30 = buf;
  v31 = v11;
  v32 = v15;
  v33 = v17;
  _NSExtensionItemsFromActivityItemValuesForExtensionItemDataRequestWithProcessingBlock(v6, v7, v27);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISUIActivityExtensionItemData setExtensionItems:](v19, "setExtensionItems:", v20);
  share_sheet_log();
  v21 = objc_claimAutoreleasedReturnValue();
  share_sheet_log();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = os_signpost_id_make_with_pointer(v22, a1);

  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    v26[0] = 0;
    _os_signpost_emit_with_name_impl(&dword_19E419000, v21, OS_SIGNPOST_INTERVAL_END, v23, "PreparingItemData", (const char *)&unk_19E4D535F, (uint8_t *)v26, 2u);
  }

  v24 = v19;
  _Block_object_dispose(buf, 8);

  return v24;
}

void __116__UIAirDropExtensionItemDataSource_preparedActivityExtensionItemDataForActivityItemValues_extensionItemDataRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  void *v20;
  CGImageSource *v21;
  CGImageSource *v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  +[_UIActivityItemMapping _attachmentNameForActivityItem:activityType:](_UIActivityItemMapping, "_attachmentNameForActivityItem:activityType:", v6, *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(*(id *)(a1 + 40), "addAttachmentName:forItem:", v7, v5);
  +[_UIActivityItemMapping _subjectForActivityItem:activityType:](_UIActivityItemMapping, "_subjectForActivityItem:activityType:", v6, *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(*(id *)(a1 + 40), "addSubject:forItem:", v8, v5);
  v9 = *(_QWORD *)(a1 + 56);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(_QWORD *)(v10 + 24);
  if (v9 < 1 || v9 > v11)
  {
    *(_QWORD *)(v10 + 24) = v11 + 1;
    share_sheet_log();
    v12 = objc_claimAutoreleasedReturnValue();
    share_sheet_log();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_signpost_id_make_with_pointer(v13, v6);

    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19E419000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "FetchingPreview", (const char *)&unk_19E4D535F, buf, 2u);
    }

    +[_UIActivityItemMapping _thumbnailImageDataForActivityItem:thumbnailSize:activityType:](_UIActivityItemMapping, "_thumbnailImageDataForActivityItem:thumbnailSize:activityType:", v6, *(_QWORD *)(a1 + 32), *(double *)(a1 + 64), *(double *)(a1 + 72));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      objc_msgSend(*(id *)(a1 + 40), "addPreviewImageData:forItem:", v15, v5);
    +[_UIActivityItemMapping _thumbnailImageForActivityItem:thumbnailSize:activityType:](_UIActivityItemMapping, "_thumbnailImageForActivityItem:thumbnailSize:activityType:", v6, *(_QWORD *)(a1 + 32), *(double *)(a1 + 64), *(double *)(a1 + 72));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      objc_msgSend(*(id *)(a1 + 40), "addPreviewImage:forItem:", v16, v5);
    share_sheet_log();
    v17 = objc_claimAutoreleasedReturnValue();
    share_sheet_log();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_signpost_id_make_with_pointer(v18, v6);

    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19E419000, v17, OS_SIGNPOST_INTERVAL_END, v19, "FetchingPreview", (const char *)&unk_19E4D535F, buf, 2u);
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[_UIActivityItemMapping _dataTypeIdentifierForActivityItem:activityType:](_UIActivityItemMapping, "_dataTypeIdentifierForActivityItem:activityType:", v6, *(_QWORD *)(a1 + 32));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20
      || (v21 = CGImageSourceCreateWithData((CFDataRef)v6, 0)) != 0
      && (v22 = v21, CGImageSourceGetType(v21), v20 = (void *)objc_claimAutoreleasedReturnValue(), CFRelease(v22), v20))
    {
      objc_msgSend(*(id *)(a1 + 40), "addDataType:forItem:", v20, v5);

    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v6, "isFileURL"))
      {
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __116__UIAirDropExtensionItemDataSource_preparedActivityExtensionItemDataForActivityItemValues_extensionItemDataRequest___block_invoke_5;
        v23[3] = &unk_1E40028D0;
        v24 = v6;
        objc_msgSend(v5, "registerItemForTypeIdentifier:loadHandler:", CFSTR("com.apple.ShareUI.airdrop.supplementalSecurityContext"), v23);

      }
    }
  }

}

void __116__UIAirDropExtensionItemDataSource_preparedActivityExtensionItemDataForActivityItemValues_extensionItemDataRequest___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void (**v3)(id, id, _QWORD);
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  airdropSupplementalSecurityContextForURL(v2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v4, 0);

}

@end

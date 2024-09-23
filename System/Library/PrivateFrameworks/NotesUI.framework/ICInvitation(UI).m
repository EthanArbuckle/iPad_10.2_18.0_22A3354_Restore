@implementation ICInvitation(UI)

- (void)updateFromShare:()UI
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C94A88]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setRootObjectType:", v6);

  objc_msgSend(a1, "setServerShare:", v4);
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C94A80]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setTitle:", v8);

  objc_msgSend(v4, "creationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setCreationDate:", v9);

  objc_msgSend(v4, "modificationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setModificationDate:", v10);

  objc_opt_class();
  objc_msgSend(v4, "encryptedValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D638E8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setSnippet:", v13);

  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D638E0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setSnippetAttachmentType:", (__int16)objc_msgSend(v15, "integerValue"));

  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D638D8]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setSnippetAttachmentCount:", objc_msgSend(v17, "integerValue"));

  objc_msgSend(v4, "ic_encryptedInlineableDataAssetForKeyPrefix:", *MEMORY[0x1E0D638C0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setThumbnailDataLight:", v18);

  objc_msgSend(v4, "ic_encryptedInlineableDataAssetForKeyPrefix:", *MEMORY[0x1E0D638B8]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setThumbnailDataDark:", v19);

  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D638A8]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setNoteCount:", objc_msgSend(v21, "integerValue"));

  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D638B0]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setNoteCountRecursive:", objc_msgSend(v23, "integerValue"));

  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D638F0]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setSubfolderCount:", objc_msgSend(v25, "integerValue"));

  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D638F8]);
  v27 = (id)objc_claimAutoreleasedReturnValue();

  ICDynamicCast();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setSubfolderCountRecursive:", objc_msgSend(v26, "integerValue"));

}

- (id)typeDescription
{
  void *v2;
  int v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  int v7;

  objc_msgSend(a1, "rootObjectType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.notes.note"));

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0D64218];
    v5 = CFSTR("Shared Note");
  }
  else
  {
    objc_msgSend(a1, "rootObjectType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.notes.folder"));

    v4 = (void *)MEMORY[0x1E0D64218];
    if (v7)
      v5 = CFSTR("Shared Folder");
    else
      v5 = CFSTR("Shared Item");
  }
  objc_msgSend(v4, "localizedFrameworkStringForKey:value:table:allowSiri:", v5, v5, 0, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)participantsInfoDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;
  const __CFString *v22;
  const __CFString *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v29;
  const __CFString *v30;
  uint64_t v31;

  objc_msgSend(a1, "serverShare");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_nonCurrentUserAcceptedParticipants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "ic_compactMap:", &__block_literal_global_35);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rootObjectType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.notes.note"));

  if (!v6)
  {
    objc_msgSend(a1, "rootObjectType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.notes.folder"));

    v13 = objc_msgSend(v4, "count");
    if (v12)
    {
      if (v13)
      {
        if (objc_msgSend(v4, "count") == 1)
        {
          v14 = objc_msgSend(v3, "count");
          v8 = (void *)MEMORY[0x1E0CB3940];
          v9 = (void *)MEMORY[0x1E0D64218];
          if (v14 == 1)
          {
            v10 = CFSTR("Shared folder with %@");
            goto LABEL_15;
          }
        }
        else
        {
          v25 = objc_msgSend(v4, "count");
          v8 = (void *)MEMORY[0x1E0CB3940];
          v9 = (void *)MEMORY[0x1E0D64218];
          if (v25 == 2)
          {
            v22 = CFSTR("Shared folder with %@ and %@");
            goto LABEL_30;
          }
        }
        v23 = CFSTR("Shared folder with %@ and %lu others");
        goto LABEL_33;
      }
      if (objc_msgSend(v3, "count"))
      {
        v18 = (void *)MEMORY[0x1E0CB3940];
        v19 = (void *)MEMORY[0x1E0D64218];
        v20 = CFSTR("Shared folder with %lu people");
        goto LABEL_25;
      }
      v29 = (void *)MEMORY[0x1E0D64218];
      v30 = CFSTR("Shared folder");
    }
    else
    {
      if (v13)
      {
        if (objc_msgSend(v4, "count") == 1)
        {
          v15 = objc_msgSend(v3, "count");
          v8 = (void *)MEMORY[0x1E0CB3940];
          v9 = (void *)MEMORY[0x1E0D64218];
          if (v15 == 1)
          {
            v10 = CFSTR("With %@");
            goto LABEL_15;
          }
        }
        else
        {
          v26 = objc_msgSend(v4, "count");
          v8 = (void *)MEMORY[0x1E0CB3940];
          v9 = (void *)MEMORY[0x1E0D64218];
          if (v26 == 2)
          {
            v22 = CFSTR("With %@ and %@");
            goto LABEL_30;
          }
        }
        v23 = CFSTR("With %@ and %lu others");
        goto LABEL_33;
      }
      if (objc_msgSend(v3, "count"))
      {
        v18 = (void *)MEMORY[0x1E0CB3940];
        v19 = (void *)MEMORY[0x1E0D64218];
        v20 = CFSTR("With %lu people");
        goto LABEL_25;
      }
      v29 = (void *)MEMORY[0x1E0D64218];
      v30 = CFSTR("Shared item");
    }
LABEL_41:
    objc_msgSend(v29, "localizedFrameworkStringForKey:value:table:allowSiri:", v30, v30, 0, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  if (objc_msgSend(v4, "count"))
  {
    if (objc_msgSend(v4, "count") == 1)
    {
      v7 = objc_msgSend(v3, "count");
      v8 = (void *)MEMORY[0x1E0CB3940];
      v9 = (void *)MEMORY[0x1E0D64218];
      if (v7 == 1)
      {
        v10 = CFSTR("Shared note with %@");
LABEL_15:
        objc_msgSend(v9, "localizedFrameworkStringForKey:value:table:allowSiri:", v10, v10, 0, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "localizedStringWithFormat:", v16, v17, v31);
LABEL_34:
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      }
      goto LABEL_20;
    }
    v21 = objc_msgSend(v4, "count");
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = (void *)MEMORY[0x1E0D64218];
    if (v21 != 2)
    {
LABEL_20:
      v23 = CFSTR("Shared note with %@ and %lu others");
LABEL_33:
      objc_msgSend(v9, "localizedFrameworkStringForKey:value:table:allowSiri:", v23, v23, 0, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringWithFormat:", v16, v17, objc_msgSend(v3, "count") - 1);
      goto LABEL_34;
    }
    v22 = CFSTR("Shared note with %@ and %@");
LABEL_30:
    objc_msgSend(v9, "localizedFrameworkStringForKey:value:table:allowSiri:", v22, v22, 0, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v16, v17, v27);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_35:
    goto LABEL_36;
  }
  if (!objc_msgSend(v3, "count"))
  {
    v29 = (void *)MEMORY[0x1E0D64218];
    v30 = CFSTR("Shared note");
    goto LABEL_41;
  }
  v18 = (void *)MEMORY[0x1E0CB3940];
  v19 = (void *)MEMORY[0x1E0D64218];
  v20 = CFSTR("Shared note with %lu people");
LABEL_25:
  objc_msgSend(v19, "localizedFrameworkStringForKey:value:table:allowSiri:", v20, v20, 0, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringWithFormat:", v16, objc_msgSend(v3, "count"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_36:

LABEL_37:
  return v24;
}

- (id)contentDescription
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;

  objc_msgSend(a1, "rootObjectType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.notes.note"));

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0D63BB8];
    objc_msgSend(a1, "snippet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(a1, "snippetAttachmentType");
    v7 = objc_msgSend(a1, "snippetAttachmentCount");
    objc_msgSend(a1, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentInfoTextWithSnippet:attachmentContentInfoType:attachmentContentInfoCount:account:", v5, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "rootObjectType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.notes.folder"));

    if (v11)
      objc_msgSend(MEMORY[0x1E0D63B10], "contentInfoTextWithNoteCount:subfolderCount:", objc_msgSend(a1, "noteCount"), objc_msgSend(a1, "subfolderCount"));
    else
      objc_msgSend(a1, "snippet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v12;
    if (v12)
    {
      v13 = v12;
      v5 = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("No contents"), CFSTR("No contents"), 0, 1);
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v13;
  }

  return v9;
}

- (id)joinDescription
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;

  objc_msgSend(a1, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fullName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_localizedNameWithDefaultFormattingStyle");
  v4 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primaryEmail");
  v6 = objc_claimAutoreleasedReturnValue();

  if (v4 && v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("You will join as %@ (%@)"), CFSTR("You will join as %@ (%@)"), 0, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v8, v4, v6);
  }
  else
  {
    if (!(v4 | v6))
    {
      v11 = 0;
      goto LABEL_11;
    }
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("You will join as %@"), CFSTR("You will join as %@"), 0, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v10 = v4;
    else
      v10 = v6;
    objc_msgSend(v9, "localizedStringWithFormat:", v8, v10, v13);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v11;
}

- (id)joinActionTitle
{
  void *v2;
  int v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  int v7;

  objc_msgSend(a1, "rootObjectType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.notes.note"));

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0D64218];
    v5 = CFSTR("View Note");
  }
  else
  {
    objc_msgSend(a1, "rootObjectType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.notes.folder"));

    v4 = (void *)MEMORY[0x1E0D64218];
    if (v7)
      v5 = CFSTR("View Folder");
    else
      v5 = CFSTR("View");
  }
  objc_msgSend(v4, "localizedFrameworkStringForKey:value:table:allowSiri:", v5, v5, 0, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)removeActionTitle
{
  void *v2;
  int v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  int v7;

  objc_msgSend(a1, "rootObjectType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.notes.note"));

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0D64218];
    v5 = CFSTR("Remove Note");
  }
  else
  {
    objc_msgSend(a1, "rootObjectType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.notes.folder"));

    v4 = (void *)MEMORY[0x1E0D64218];
    if (v7)
      v5 = CFSTR("Remove Folder");
    else
      v5 = CFSTR("Remove");
  }
  objc_msgSend(v4, "localizedFrameworkStringForKey:value:table:allowSiri:", v5, v5, 0, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)hasThumbnail
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a1, "thumbnailDataLight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "thumbnailDataDark");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 != 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)thumbnailImageForAppearance:()UI size:
{
  void *v5;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;

  v9 = objc_msgSend(a5, "type");
  if (v9 == 1)
  {
    v10 = objc_alloc(MEMORY[0x1E0DC3870]);
    objc_msgSend(a1, "thumbnailDataDark");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0DC3870]);
    objc_msgSend(a1, "thumbnailDataLight");
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v12 = (void *)v11;
    v13 = (void *)objc_msgSend(v10, "initWithData:", v11);
    objc_msgSend(MEMORY[0x1E0DC3BF8], "ic_scale");
    objc_msgSend(v13, "ic_scaledImageWithSize:scale:", a2, a3, v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

@end

@implementation ICMentionUIModel

- (id)labelColor
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  objc_super v19;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  -[ICInlineAttachmentUIModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __30__ICMentionUIModel_labelColor__block_invoke;
  v20[3] = &unk_1E5C1D9D0;
  v22 = &v23;
  v6 = v3;
  v21 = v6;
  objc_msgSend(v4, "performBlockAndWait:", v20);

  if (v6 && !*((_BYTE *)v24 + 24))
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__56;
    v17 = __Block_byref_object_dispose__56;
    objc_msgSend(MEMORY[0x1E0DC3658], "ICUnknownInlineAttachmentTextColor");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "managedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __30__ICMentionUIModel_labelColor__block_invoke_6;
    v10[3] = &unk_1E5C20078;
    v11 = v6;
    v12 = &v13;
    objc_msgSend(v8, "performBlockAndWait:", v10);

    v7 = (id)v14[5];
    _Block_object_dispose(&v13, 8);

  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)ICMentionUIModel;
    -[ICInlineAttachmentUIModel labelColor](&v19, sel_labelColor);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v23, 8);
  return v7;
}

uint64_t __30__ICMentionUIModel_labelColor__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isUnsupported");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __30__ICMentionUIModel_labelColor__block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "tokenContentIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_tokenSafeText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D63BB0], "allUserRecordName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "tintColor");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "note");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "serverShareCheckingParent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "participants");
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "ic_userRecordNameInNote:", v9, (_QWORD)v21);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "isEqualToString:", v2))
          {
            objc_msgSend(v9, "collaborationColorManager");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "highlightColorForUserID:note:", v2, v9);
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v20 = *(void **)(v19 + 40);
            *(_QWORD *)(v19 + 40) = v18;

            goto LABEL_13;
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v13)
          continue;
        break;
      }
    }
LABEL_13:

  }
}

- (BOOL)fadesColorDuringHighlight
{
  return 0;
}

@end

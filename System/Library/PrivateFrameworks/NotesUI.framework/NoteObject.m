@implementation NoteObject

void __59__NoteObject_ICLegacyNoteUI__appendAttributedString_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "htmlString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");
  if ((objc_msgSend(*(id *)(a1 + 32), "isPlainText") & 1) == 0)
  {
    v3 = objc_msgSend(v2, "ic_HTMLInsertionPoint");
    ICNoteHTMLFromPlainText();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  if (v3)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isPlainText"))
    {
      v7 = objc_msgSend(v2, "characterAtIndex:", v3 - 1);
      objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v7) = objc_msgSend(v8, "characterIsMember:", v7);

      if ((v7 & 1) != 0)
        goto LABEL_9;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n%@"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<div>%@</div>"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    }
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
LABEL_9:
  v12 = (void *)objc_msgSend(v2, "mutableCopy");
  objc_msgSend(v12, "insertString:atIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v3);
  v13 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "setModificationDate:", v13);

  v14 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setHtmlString:", v14);

  objc_msgSend(*(id *)(a1 + 32), "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");

  if (!v16)
  {
    objc_msgSend(*(id *)(a1 + 40), "string");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ICNoteTitleFromPlainText();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setTitle:", v18);

  }
  v19 = *(void **)(a1 + 48);
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v20 + 40);
  objc_msgSend(v19, "save:", &obj);
  objc_storeStrong((id *)(v20 + 40), obj);

}

void __95__NoteObject_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[6];
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v2 = *(void **)(a1 + 32);
  objc_msgSend((id)*MEMORY[0x1E0CEC630], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqualToString:", v3);

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__78;
  v14 = __Block_byref_object_dispose__78;
  v15 = 0;
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  if ((_DWORD)v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __95__NoteObject_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_8;
    v9[3] = &unk_1E5C1D9D0;
    v9[4] = *(_QWORD *)(a1 + 40);
    v9[5] = &v10;
    objc_msgSend(v4, "performBlockAndWait:", v9);

    objc_msgSend((id)v11[5], "dataUsingEncoding:", 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __95__NoteObject_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_2;
    v8[3] = &unk_1E5C1D9D0;
    v8[4] = *(_QWORD *)(a1 + 40);
    v8[5] = &v10;
    objc_msgSend(v6, "performBlockAndWait:", v8);

    objc_msgSend(MEMORY[0x1E0D63BB8], "attributedStringFromHTMLString:readerDelegate:", v11[5], *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v5, "loadDataWithTypeIdentifier:forItemProviderCompletionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }

  _Block_object_dispose(&v10, 8);
}

void __95__NoteObject_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "body");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentAsPlainText");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __95__NoteObject_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "content");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __108__NoteObject_ItemProviderWriting___loadFileRepresentationOfTypeIdentifier_forItemProviderCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "content");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __53__NoteObject_ItemProviderWriting__fileWrapperForURL___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = (void *)MEMORY[0x1E0D63B78];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attachmentWithContentID:context:", v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "fileURL");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

@end

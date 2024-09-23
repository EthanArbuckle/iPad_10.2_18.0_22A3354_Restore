@implementation NoteObject(ICLegacyNoteUI)

- (BOOL)appendAttributedString:()ICLegacyNoteUI error:
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _BOOL8 v14;
  _QWORD v16[5];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  __CFString *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__6;
  v31 = __Block_byref_object_dispose__6;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__6;
  v25 = __Block_byref_object_dispose__6;
  v26 = &stru_1E5C2F8C0;
  if (objc_msgSend(v4, "length"))
  {
    v6 = *MEMORY[0x1E0DC1148];
    v7 = *MEMORY[0x1E0DC1128];
    v33[0] = *MEMORY[0x1E0DC1118];
    v33[1] = v7;
    v34[0] = v6;
    v34[1] = &unk_1E5C71A18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataFromRange:documentAttributes:error:", 0, objc_msgSend(v4, "length"), v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v9, 4);
    v11 = (void *)v22[5];
    v22[5] = v10;

  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __59__NoteObject_ICLegacyNoteUI__appendAttributedString_error___block_invoke;
  v16[3] = &unk_1E5C1E308;
  v16[4] = a1;
  v19 = &v21;
  v12 = v4;
  v17 = v12;
  v13 = v5;
  v18 = v13;
  v20 = &v27;
  objc_msgSend(v13, "performBlockAndWait:", v16);
  v14 = v28[5] == 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

@end

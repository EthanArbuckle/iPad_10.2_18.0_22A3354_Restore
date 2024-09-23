@implementation ICMarkupUtilities(UI)

+ (uint64_t)dataToEditForAttachment:()UI includeMarkupModelData:
{
  return objc_msgSend(a1, "dataToEditForAttachment:includeMarkupModelData:embedMarkupModelDataInImage:", a3, a4, 1);
}

+ (id)dataToEditForAttachment:()UI includeMarkupModelData:embedMarkupModelDataInImage:
{
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v8 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__73;
  v23 = __Block_byref_object_dispose__73;
  v24 = 0;
  objc_msgSend(v8, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __100__ICMarkupUtilities_UI__dataToEditForAttachment_includeMarkupModelData_embedMarkupModelDataInImage___block_invoke;
  v13[3] = &unk_1E5C23BC0;
  v10 = v8;
  v14 = v10;
  v15 = &v19;
  v17 = a4;
  v16 = a1;
  v18 = a5;
  objc_msgSend(v9, "performBlockAndWait:", v13);

  v11 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v11;
}

@end

@implementation CollectAttachmentsForConfiguration

void ___CollectAttachmentsForConfiguration_block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "diagnosticContainers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    PXFlatMap();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "attachments");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

id ___CollectAttachmentsForConfiguration_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v2, "attachments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  objc_msgSend(v2, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v10[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXFeedbackTapToRadarUtilities attachmentURLForDiagnosticDictionaries:descriptionName:](PXFeedbackTapToRadarUtilities, "attachmentURLForDiagnosticDictionaries:descriptionName:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(v3, "addObject:", v8);

  }
  return v3;
}

@end

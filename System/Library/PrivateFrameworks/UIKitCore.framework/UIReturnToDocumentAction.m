@implementation UIReturnToDocumentAction

uint64_t __54___UIReturnToDocumentAction__hasReturnToSenderFeature__block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  _MergedGlobals_1232 = result;
  return result;
}

void __47___UIReturnToDocumentAction_actionWithFileURL___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(id, void *);
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_QWORD *)(a1 + 32) && (objc_msgSend(*(id *)(a1 + 40), "_hasReturnToSenderFeature") & 1) != 0)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x2050000000;
    v4 = (void *)getSYDocumentAttributesClass_softClass;
    v25 = getSYDocumentAttributesClass_softClass;
    if (!getSYDocumentAttributesClass_softClass)
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __getSYDocumentAttributesClass_block_invoke;
      v21[3] = &unk_1E16B14C0;
      v21[4] = &v22;
      __getSYDocumentAttributesClass_block_invoke((uint64_t)v21);
      v4 = (void *)v23[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v22, 8);
    objc_msgSend(v5, "documentAttributesForFileAtURL:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      _UILocalizedString(CFSTR("ACTION_TITLE_RETURNTOSENDER"), (uint64_t)CFSTR("Title of the return to sender button in the document menu"), CFSTR("Shared with You"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("envelope"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __47___UIReturnToDocumentAction_actionWithFileURL___block_invoke_2;
      v19[3] = &unk_1E16B2C10;
      v9 = v6;
      v20 = v9;
      +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v7, v8, CFSTR("com.apple.returntodocument"), v19);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "sender");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 && objc_msgSend(v14, "length"))
      {
        v15 = (void *)MEMORY[0x1E0CB3940];
        _UILocalizedString(CFSTR("ACTION_SUBTITLE_RETURNTOSENDER_FORMAT"), (uint64_t)CFSTR("Subtitle for the return to sender button in the document menu. Must have one placeholder that will be replaced with the originator's name."), CFSTR("From %@"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", v16, v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setSubtitle:", v17);

      }
      v26[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v3[2](v3, v18);

    }
    else
    {
      v3[2](v3, (void *)MEMORY[0x1E0C9AA60]);
    }

  }
  else
  {
    v3[2](v3, (void *)MEMORY[0x1E0C9AA60]);
  }

}

void __47___UIReturnToDocumentAction_actionWithFileURL___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  id v7;
  void *v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  id v15;
  id v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 buf;
  void (*v26)(uint64_t);
  void *v27;
  uint64_t *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2050000000;
  v4 = (void *)qword_1ECD808B0;
  v24 = qword_1ECD808B0;
  v5 = MEMORY[0x1E0C809B0];
  if (!qword_1ECD808B0)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v26 = __getSYDocumentWorkflowsClientClass_block_invoke;
    v27 = &unk_1E16B14C0;
    v28 = &v21;
    __getSYDocumentWorkflowsClientClass_block_invoke((uint64_t)&buf);
    v4 = (void *)v22[3];
  }
  v6 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v21, 8);
  v7 = objc_alloc_init(v6);
  v21 = 0;
  v22 = &v21;
  v23 = 0x2050000000;
  v8 = (void *)qword_1ECD808B8;
  v24 = qword_1ECD808B8;
  if (!qword_1ECD808B8)
  {
    *(_QWORD *)&buf = v5;
    *((_QWORD *)&buf + 1) = 3221225472;
    v26 = __getSYReturnToDocumentRequestClass_block_invoke;
    v27 = &unk_1E16B14C0;
    v28 = &v21;
    __getSYReturnToDocumentRequestClass_block_invoke((uint64_t)&buf);
    v8 = (void *)v22[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v21, 8);
  v10 = objc_alloc_init(v9);
  objc_msgSend(v10, "setDocumentAttributes:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "sender");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_IsKindOfUIView((uint64_t)v11) & 1) != 0)
  {
    objc_msgSend(v3, "sender");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      goto LABEL_15;
  }
  else
  {

  }
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = 0;
      _os_log_fault_impl(&dword_185066000, v17, OS_LOG_TYPE_FAULT, "Invoked return to document action from an unknown sender: %@", (uint8_t *)&buf, 0xCu);
    }

  }
  else
  {
    v13 = qword_1ECD808A8;
    if (!qword_1ECD808A8)
    {
      v13 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v13, (unint64_t *)&qword_1ECD808A8);
    }
    v14 = *(NSObject **)(v13 + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = 0;
      _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "Invoked return to document action from an unknown sender: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  v12 = 0;
LABEL_15:
  v18[0] = v5;
  v18[1] = 3221225472;
  v18[2] = __47___UIReturnToDocumentAction_actionWithFileURL___block_invoke_15;
  v18[3] = &unk_1E16DD760;
  v19 = v7;
  v20 = v12;
  v15 = v12;
  v16 = v7;
  objc_msgSend(v16, "performRequest:completion:", v10, v18);

}

void __47___UIReturnToDocumentAction_actionWithFileURL___block_invoke_15(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = *(id *)(a1 + 32);
  if (v12 && (a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_viewControllerForAncestor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v12, "localizedDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedFailureReason");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v7, v8, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      _UILocalizedString(CFSTR("RETURNTOSENDER_ERROR_DISMISS_BUTTON"), (uint64_t)CFSTR("Button of an error showing when the return to document action failed"), CFSTR("Dismiss"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v10, 0, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addAction:", v11);

      objc_msgSend(v6, "presentViewController:animated:completion:", v9, 1, 0);
    }

  }
}

@end

@implementation LNEntityMetadata

void __82__LNEntityMetadata_Strings__wf_descriptionClassForEntityType_appBundleIdentifier___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  _QWORD v43[3];
  _QWORD v44[3];
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD v49[3];
  _QWORD v50[3];
  _QWORD v51[5];
  _QWORD v52[5];
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[3];
  _QWORD v56[3];
  const __CFString *v57;
  void *v58;
  const __CFString *v59;
  void *v60;
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[11];
  _QWORD v64[13];

  v64[11] = *MEMORY[0x1E0C80C00];
  v63[0] = *MEMORY[0x1E0DC7E90];
  v61[0] = CFSTR("CalendarEntity");
  objc_opt_self();
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v40;
  v61[1] = CFSTR("CalendarScreenType");
  objc_opt_self();
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = v39;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v38;
  v63[1] = *MEMORY[0x1E0DC7EF8];
  v59 = CFSTR("MTLinkTab");
  objc_opt_self();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v37;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v36;
  v63[2] = *MEMORY[0x1E0DC7EB0];
  v57 = CFSTR("DOCFileEntity");
  objc_opt_self();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v35;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v64[2] = v34;
  v63[3] = *MEMORY[0x1E0DC7ED0];
  v55[0] = CFSTR("AccountEntity");
  objc_opt_self();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v33;
  v55[1] = CFSTR("MailboxEntity");
  objc_opt_self();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v32;
  v55[2] = CFSTR("MessageEntity");
  objc_opt_self();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v56[2] = v31;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v64[3] = v30;
  v63[4] = *MEMORY[0x1E0DC7EE8];
  v53[0] = CFSTR("CKChatItem");
  objc_opt_self();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v29;
  v53[1] = CFSTR("CKConversation");
  objc_opt_self();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v54[1] = v28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v64[4] = v27;
  v63[5] = *MEMORY[0x1E0DC7F18];
  v51[0] = CFSTR("AccountEntity");
  objc_opt_self();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v26;
  v51[1] = CFSTR("AppLocationEntity");
  objc_opt_self();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v25;
  v51[2] = CFSTR("FolderEntity");
  objc_opt_self();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v52[2] = v24;
  v51[3] = CFSTR("NoteEntity");
  objc_opt_self();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v52[3] = v23;
  v51[4] = CFSTR("TagEntity");
  objc_opt_self();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v52[4] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v64[5] = v21;
  v63[6] = *MEMORY[0x1E0DC7F38];
  v49[0] = CFSTR("TTRListEntity");
  objc_opt_self();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v20;
  v49[1] = CFSTR("TTRReminderEntity");
  objc_opt_self();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v19;
  v49[2] = CFSTR("TTRSmartListEntity");
  objc_opt_self();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v50[2] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v64[6] = v17;
  v63[7] = *MEMORY[0x1E0DC7F40];
  v47[0] = CFSTR("TabEntity");
  objc_opt_self();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v16;
  v47[1] = CFSTR("TabGroupEntity");
  objc_opt_self();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v15;
  v47[2] = CFSTR("ReadingListItemEntity");
  objc_opt_self();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v48[2] = v14;
  v47[3] = CFSTR("BookmarkEntity");
  objc_opt_self();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v48[3] = v13;
  v47[4] = CFSTR("ViewEntity");
  objc_opt_self();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v48[4] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v64[7] = v11;
  v63[8] = *MEMORY[0x1E0DC7FD8];
  v45[0] = CFSTR("RootNavigationDestination");
  objc_opt_self();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = CFSTR("WFWorkflowReference");
  v46[0] = v0;
  objc_opt_self();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v64[8] = v2;
  v63[9] = *MEMORY[0x1E0DC7FC0];
  v43[0] = CFSTR("RCFolderEntity");
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v3;
  v43[1] = CFSTR("RCRecordingEntity");
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v4;
  v43[2] = CFSTR("RCUIElementEntity");
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v64[9] = v6;
  v63[10] = *MEMORY[0x1E0DC7E88];
  v41 = CFSTR("BookAppEntity");
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v64[10] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 11);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)wf_descriptionClassForEntityType_appBundleIdentifier__descriptionClassForEntityTypeByAppBundleIdentifier;
  wf_descriptionClassForEntityType_appBundleIdentifier__descriptionClassForEntityTypeByAppBundleIdentifier = v9;

}

BOOL __116__LNEntityMetadata_Workflow__wf_contentItemClassWithQueryMetadata_appBundleIdentifier_displayedAppBundleIdentifier___block_invoke(uint64_t a1, void *a2, const char *a3, id block)
{
  void (*v7)(void);
  objc_method *ClassMethod;
  const char *TypeEncoding;
  objc_class *Class;

  v7 = imp_implementationWithBlock(block);
  ClassMethod = class_getClassMethod(*(Class *)(a1 + 32), a3);
  TypeEncoding = method_getTypeEncoding(ClassMethod);
  Class = object_getClass(a2);
  return class_addMethod(Class, a3, v7, TypeEncoding);
}

id __116__LNEntityMetadata_Workflow__wf_contentItemClassWithQueryMetadata_appBundleIdentifier_displayedAppBundleIdentifier___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __116__LNEntityMetadata_Workflow__wf_contentItemClassWithQueryMetadata_appBundleIdentifier_displayedAppBundleIdentifier___block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __116__LNEntityMetadata_Workflow__wf_contentItemClassWithQueryMetadata_appBundleIdentifier_displayedAppBundleIdentifier___block_invoke_4(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __116__LNEntityMetadata_Workflow__wf_contentItemClassWithQueryMetadata_appBundleIdentifier_displayedAppBundleIdentifier___block_invoke_5(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (!v2)
    v2 = *(void **)(a1 + 40);
  return v2;
}

@end

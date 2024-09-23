@implementation WFWorkflowContentItem

+ (id)propertyBuilders
{
  void *v2;
  void *v3;
  void *v4;
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
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Folder"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyPath:name:class:", CFSTR("folderName"), v19, objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v18;
  v3 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Icon"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyPath:name:class:", CFSTR("workflowIcon"), v17, objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filterable:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v5;
  v6 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Action Count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyPath:name:class:", CFSTR("actionCount"), v7, objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v8;
  v9 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Last Modified Date"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "keyPath:name:class:", CFSTR("workflowReference.modificationDate"), v10, objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "userInfo:", *MEMORY[0x1E0D14210]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "tense:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeUnits:", 8444);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)stringConversionBehavior
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D13ED8];
  objc_msgSend(a1, "propertyForName:", CFSTR("Name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessingProperty:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E40];
  objc_msgSend(MEMORY[0x1E0D14020], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)outputTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)MEMORY[0x1E0C99E40];
  objc_msgSend(MEMORY[0x1E0D14020], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D14020], "typeWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC7B30], "typeWithString:", CFSTR("com.apple.shortcut"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC7B30], "typeWithString:", CFSTR("com.apple.shortcuts.workflow-file"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC7B30], "typeWithString:", *MEMORY[0x1E0D14310]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D14020], "typeWithClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, v6, v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)contentCategories
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0D14140];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Shortcut (singular)"), CFSTR("Shortcut"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Shortcuts (plural)"), CFSTR("Shortcuts"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Shortcuts"));
}

- (WFWorkflowReference)workflowReference
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D14020], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowContentItem getRepresentationsForType:error:](self, "getRepresentationsForType:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFWorkflowReference *)v6;
}

- (id)workflowIcon
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0DC7E40];
  -[WFWorkflowContentItem workflowReference](self, "workflowReference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "icon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithIcon:size:", v4, 512.0, 512.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)actionCount
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[WFWorkflowContentItem workflowReference](self, "workflowReference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v3, "actionCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)folderName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[WFDatabaseProxy defaultDatabase](WFDatabaseProxy, "defaultDatabase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowContentItem workflowReference](self, "workflowReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "folderForWorkflowReference:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  dispatch_semaphore_t v22;
  NSObject *v23;
  dispatch_time_t v24;
  void *v25;
  void *v26;
  void *v27;
  WFWorkflowReference *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char isKindOfClass;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  WFWorkflowReference *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[4];
  NSObject *v59;
  _BYTE *v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  _BYTE buf[24];
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  _QWORD v72[3];

  v72[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if ((Class)objc_opt_class() == a3)
  {
    v26 = (void *)MEMORY[0x1E0D14018];
    -[WFWorkflowContentItem workflowIcon](self, "workflowIcon");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowContentItem name](self, "name");
    v28 = (WFWorkflowReference *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "object:named:", v27, v28);
    v29 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if ((Class)objc_opt_class() == a3)
  {
    -[WFWorkflowContentItem workflowReference](self, "workflowReference");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFDatabaseProxy defaultDatabase](WFDatabaseProxy, "defaultDatabase");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "workflowRecordForDescriptor:error:", v30, a5);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D14018], "object:", v32);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
  if ((Class)objc_opt_class() == a3)
  {
    -[WFWorkflowContentItem internalRepresentation](self, "internalRepresentation");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      goto LABEL_13;
    objc_msgSend(MEMORY[0x1E0D14020], "typeWithClass:", objc_opt_class());
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowContentItem getRepresentationsForType:error:](self, "getRepresentationsForType:error:", v35, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "firstObject");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "object");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = [WFWorkflowReference alloc];
    objc_msgSend(v27, "name");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "icon");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v57, "backgroundColorValue");
    objc_msgSend(v27, "icon");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v56, "glyphCharacter");
    objc_msgSend(v27, "associatedAppBundleIdentifier");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "workflowSubtitle");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "actionsDescription");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "actions");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v55, "count");
    v40 = objc_msgSend(v27, "syncHash");
    objc_msgSend(v27, "creationDate");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "modificationDate");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "remoteQuarantineHash");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v27, "disabledOnLockScreen");
    objc_msgSend(v27, "source");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    BYTE1(v48) = v44;
    LOBYTE(v48) = 0;
    LOWORD(v47) = 0;
    v28 = -[WFWorkflowReference initWithIdentifier:name:color:glyphCharacter:associatedAppBundleIdentifier:subtitle:actionsDescription:actionCount:syncHash:isDeleted:hiddenFromLibraryAndSync:creationDate:modificationDate:lastRunDate:remoteQuarantineStatus:remoteQuarantineHash:hasShortcutInputVariables:disabledOnLockScreen:source:runEventsCount:](v53, "initWithIdentifier:name:color:glyphCharacter:associatedAppBundleIdentifier:subtitle:actionsDescription:actionCount:syncHash:isDeleted:hiddenFromLibraryAndSync:creationDate:modificationDate:lastRunDate:remoteQuarantineStatus:remoteQuarantineHash:hasShortcutInputVariables:disabledOnLockScreen:source:runEventsCount:", CFSTR("soup"), v54, v52, v38, v51, v50, v39, v49, v40, v47, v41, v42, 0, 0, v43,
            v48,
            v45,
            0);

    objc_msgSend(MEMORY[0x1E0D14018], "object:", v28);
    v29 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v25 = (void *)v29;

    goto LABEL_14;
  }
  if ((Class)objc_opt_class() != a3)
  {
LABEL_13:
    v25 = 0;
    goto LABEL_14;
  }
  getWFAppIntentsLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[WFWorkflowContentItem workflowReference](self, "workflowReference");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[WFWorkflowContentItem generateObjectRepresentationForClass:options:error:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v11;
    _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_DEFAULT, "%s Creating LNEntity for asset: %@", buf, 0x16u);

  }
  v12 = objc_alloc(MEMORY[0x1E0D44178]);
  v13 = (void *)objc_msgSend(v12, "initWithBundleIdentifier:", *MEMORY[0x1E0DC7FA0]);
  v14 = objc_alloc(MEMORY[0x1E0D43C80]);
  -[WFWorkflowContentItem workflowReference](self, "workflowReference");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x1E0D14290];
  v18 = (void *)objc_msgSend(v14, "initWithValue:typeName:", v16, *MEMORY[0x1E0D14290]);

  v19 = objc_alloc(MEMORY[0x1E0D44218]);
  v72[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithIdentifiers:entityType:", v20, v17);

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v69 = __Block_byref_object_copy__55907;
  v70 = __Block_byref_object_dispose__55908;
  v71 = 0;
  v62 = 0;
  v63 = &v62;
  v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__55907;
  v66 = __Block_byref_object_dispose__55908;
  v67 = 0;
  v22 = dispatch_semaphore_create(0);
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __76__WFWorkflowContentItem_generateObjectRepresentationForClass_options_error___block_invoke;
  v58[3] = &unk_1E7AF71C0;
  v60 = buf;
  v61 = &v62;
  v23 = v22;
  v59 = v23;
  objc_msgSend(v13, "performQuery:completionHandler:", v21, v58);
  v24 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v23, v24);
  objc_msgSend(MEMORY[0x1E0D14018], "object:named:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v63[5]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(buf, 8);

LABEL_14:
  return v25;
}

- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5
{
  void (**v7)(id, _QWORD, id);
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  WFP2PSignedShortcutFileExporter *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  void (**v25)(id, _QWORD, id);
  id v26;

  v7 = (void (**)(id, _QWORD, id))a3;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0D14020], "typeWithClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  -[WFWorkflowContentItem getRepresentationsForType:error:](self, "getRepresentationsForType:error:", v9, &v26);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v26;
  objc_msgSend(v10, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "object");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v7[2](v7, 0, v11);
    goto LABEL_15;
  }
  if (!objc_msgSend(v8, "conformsToString:", CFSTR("com.apple.shortcut")))
  {
    if (objc_msgSend(v8, "conformsToString:", CFSTR("com.apple.shortcuts.workflow-file")))
    {
      objc_msgSend(v13, "fileRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      objc_msgSend(v15, "writeToDiskWithFormat:error:", 100, &v22);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v17 = v22;

      ((void (**)(id, id, id))v7)[2](v7, v16, v17);
    }
    else
    {
      if (!objc_msgSend(v8, "conformsToString:", *MEMORY[0x1E0D14310]))
      {
        objc_msgSend((id)objc_opt_class(), "badCoercionErrorForType:", v8);
        v14 = (WFP2PSignedShortcutFileExporter *)objc_claimAutoreleasedReturnValue();
        v7[2](v7, 0, v14);
        goto LABEL_4;
      }
      objc_msgSend(v13, "fileRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      objc_msgSend(v18, "fileDataWithFormat:error:", 100, &v21);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v21;

      if (v19)
      {
        objc_msgSend(MEMORY[0x1E0D13F78], "fileWithData:ofType:proposedFilename:", v19, v8, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(id, void *, id))v7)[2](v7, v20, v16);

      }
      else
      {
        v7[2](v7, 0, v16);
      }

    }
    goto LABEL_15;
  }
  v14 = -[WFShortcutExporter initWithWorkflowRecord:]([WFP2PSignedShortcutFileExporter alloc], "initWithWorkflowRecord:", v13);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __68__WFWorkflowContentItem_generateFileRepresentation_options_forType___block_invoke;
  v23[3] = &unk_1E7AF71F0;
  v25 = v7;
  v24 = v13;
  -[WFP2PSignedShortcutFileExporter exportWorkflowWithCompletion:](v14, "exportWorkflowWithCompletion:", v23);

LABEL_4:
LABEL_15:

}

- (BOOL)getListSubtitle:(id)a3
{
  id v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v5 = a3;
    -[WFWorkflowContentItem workflowReference](self, "workflowReference");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subtitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))a3 + 2))(v5, v7);

  }
  return 1;
}

- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4
{
  double height;
  double width;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  if (a3)
  {
    height = a4.height;
    width = a4.width;
    v8 = (void *)MEMORY[0x1E0DC7E40];
    v9 = a3;
    -[WFWorkflowContentItem workflowReference](self, "workflowReference");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "icon");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageWithIcon:size:", v11, width, height);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))a3 + 2))(v9, v12, 0);

  }
  return 1;
}

- (id)defaultSourceForRepresentation:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D13EA0], "shortcutsAppAttributionSetWithDisclosureLevel:", 1);
}

void __68__WFWorkflowContentItem_generateFileRepresentation_options_forType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void (*v11)(uint64_t, _QWORD, id);
  id v12;

  v12 = a2;
  if (v12)
  {
    v5 = (void *)MEMORY[0x1E0D13F78];
    v6 = *(void **)(a1 + 32);
    v7 = a3;
    objc_msgSend(v6, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fileWithURL:options:ofType:proposedFilename:", v12, 3, 0, v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(void (**)(uint64_t, _QWORD, id))(v10 + 16);
    v9 = a3;
    v11(v10, 0, v9);
  }

}

void __76__WFWorkflowContentItem_generateObjectRepresentationForClass_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  int v25;
  const char *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  getWFAppIntentsLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 136315650;
    v26 = "-[WFWorkflowContentItem generateObjectRepresentationForClass:options:error:]_block_invoke";
    v27 = 2112;
    v28 = v9;
    v29 = 2112;
    v30 = v6;
    _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_DEFAULT, "%s Recieved output: %@ error: %@", (uint8_t *)&v25, 0x20u);

  }
  objc_msgSend(v5, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;

  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "value");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
  }
  else
  {
    v16 = 0;
  }
  v17 = v16;

  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v17;

  objc_msgSend(v14, "displayRepresentation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "title");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "wf_localizedString");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v24 = *(void **)(v23 + 40);
  *(_QWORD *)(v23 + 40) = v22;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end

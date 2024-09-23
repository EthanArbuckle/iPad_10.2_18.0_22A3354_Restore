@implementation WFContextualActionRunRequest

- (WFContextualActionRunRequest)initWithAction:(id)a3 actionContext:(id)a4
{
  id v8;
  id v9;
  int v10;
  uint64_t v11;
  WFContextualActionRunRequest *v12;
  WFContextualActionRunRequest *v13;
  unint64_t v14;
  __CFString *v15;
  _BOOL8 v16;
  WFContextualActionRunRequest *v17;
  void *v19;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContextualActionRunRequest.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionContext"));

  }
  v10 = objc_msgSend(v8, "showsUserInterfaceWhenRunning");
  if (objc_msgSend(v9, "surface") == 5 || (!v10 ? (v11 = 3) : (v11 = 0), objc_msgSend(v9, "surface") == 16))
    v11 = 1;
  v20.receiver = self;
  v20.super_class = (Class)WFContextualActionRunRequest;
  v12 = -[WFWorkflowRunRequest initWithInput:presentationMode:](&v20, sel_initWithInput_presentationMode_, 0, v11);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_action, a3);
    objc_storeStrong((id *)&v13->_actionContext, a4);
    v14 = objc_msgSend(v9, "surface");
    if (v14 > 0x12)
      v15 = 0;
    else
      v15 = *off_1E5FC58D0[v14];
    v16 = objc_msgSend(v9, "surface") == 5
       || objc_msgSend(v9, "surface") == 6
       || objc_msgSend(v9, "surface") == 16
       || objc_msgSend(v9, "surface") == 10
       || objc_msgSend(v9, "surface") == 11
       || objc_msgSend(v9, "surface") == 15
       || objc_msgSend(v9, "surface") == 12
       || objc_msgSend(v9, "surface") == 13
       || objc_msgSend(v9, "surface") == 18;
    -[WFWorkflowRunRequest setRunSource:](v13, "setRunSource:", v15);
    -[WFWorkflowRunRequest setAllowsDialogNotifications:](v13, "setAllowsDialogNotifications:", v16);
    -[WFWorkflowRunRequest setOutputBehavior:](v13, "setOutputBehavior:", 2);
    v17 = v13;

  }
  return v13;
}

- (void)getInputWithCompletionHandler:(id)a3
{
  void (**v4)(id, id, _QWORD);
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  void (**v10)(id, id, _QWORD);

  v4 = (void (**)(id, id, _QWORD))a3;
  -[WFContextualActionRunRequest input](self, "input");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFContextualActionRunRequest input](self, "input");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v6, 0);
  }
  else
  {
    -[WFContextualActionRunRequest action](self, "action");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __62__WFContextualActionRunRequest_getInputWithCompletionHandler___block_invoke;
    v8[3] = &unk_1E5FC5898;
    v8[4] = self;
    v9 = v7;
    v10 = v4;
    v6 = v7;
    objc_msgSend(v6, "getInputWithCompletionHandler:", v8);

  }
}

- (id)queueIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[WFContextualActionRunRequest actionContext](self, "actionContext", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "files");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "fileURL");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "absoluteString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v12 = (void *)objc_msgSend(v3, "copy");
  return v12;
}

- (WFContextualActionRunRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  WFContextualActionRunRequest *v8;
  WFContextualActionRunRequest *v9;
  objc_super v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v5, CFSTR("actionContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("action"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    && (v11.receiver = self,
        v11.super_class = (Class)WFContextualActionRunRequest,
        v8 = -[WFWorkflowRunRequest initWithCoder:](&v11, sel_initWithCoder_, v4),
        (self = v8) != 0))
  {
    objc_storeStrong((id *)&v8->_action, v7);
    objc_storeStrong((id *)&self->_actionContext, v6);
    self = self;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFContextualActionRunRequest;
  v4 = a3;
  -[WFWorkflowRunRequest encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[WFContextualActionRunRequest actionContext](self, "actionContext", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("actionContext"));

  -[WFContextualActionRunRequest action](self, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("action"));

}

- (WFContextualAction)action
{
  return self->_action;
}

- (WFContextualActionContext)actionContext
{
  return self->_actionContext;
}

- (WFContentCollection)input
{
  return self->_input;
}

- (void)setInput:(id)a3
{
  objc_storeStrong((id *)&self->_input, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_actionContext, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

void __62__WFContextualActionRunRequest_getInputWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  void *v43;
  id obj;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  _BYTE v58[128];
  uint8_t v59[128];
  _BYTE buf[24];
  void *v61;
  uint64_t *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  v43 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "setInput:", v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v42 = v6;
    if (v6)
    {
      getWFVoiceShortcutClientLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "-[WFContextualActionRunRequest getInputWithCompletionHandler:]_block_invoke";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v9;
        *(_WORD *)&buf[22] = 2112;
        v61 = v42;
        _os_log_impl(&dword_1AF681000, v8, OS_LOG_TYPE_ERROR, "%s %@ tried to self-populate its input, but it failed: %@", buf, 0x20u);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "actionContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "files");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    obj = v11;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v51;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v51 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          objc_msgSend(v15, "type");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            v54 = 0;
            v55 = &v54;
            v56 = 0x2050000000;
            v17 = (void *)getWFFileTypeClass_softClass;
            v57 = getWFFileTypeClass_softClass;
            if (!getWFFileTypeClass_softClass)
            {
              *(_QWORD *)buf = MEMORY[0x1E0C809B0];
              *(_QWORD *)&buf[8] = 3221225472;
              *(_QWORD *)&buf[16] = __getWFFileTypeClass_block_invoke;
              v61 = &unk_1E5FC8858;
              v62 = &v54;
              __getWFFileTypeClass_block_invoke((uint64_t)buf);
              v17 = (void *)v55[3];
            }
            v18 = objc_retainAutorelease(v17);
            _Block_object_dispose(&v54, 8);
            objc_msgSend(v15, "type");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "typeWithUTType:", v19);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

          }
          v54 = 0;
          v55 = &v54;
          v56 = 0x2050000000;
          v20 = (void *)getWFFileRepresentationClass_softClass;
          v57 = getWFFileRepresentationClass_softClass;
          if (!getWFFileRepresentationClass_softClass)
          {
            *(_QWORD *)buf = MEMORY[0x1E0C809B0];
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = __getWFFileRepresentationClass_block_invoke;
            v61 = &unk_1E5FC8858;
            v62 = &v54;
            __getWFFileRepresentationClass_block_invoke((uint64_t)buf);
            v20 = (void *)v55[3];
          }
          v21 = objc_retainAutorelease(v20);
          _Block_object_dispose(&v54, 8);
          objc_msgSend(v15, "fileURL");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "fileWithURL:options:ofType:", v22, 29, v16);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v23)
          {
            getWFVoiceShortcutClientLogObject();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
            {
              objc_msgSend(v15, "fileURL");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315650;
              *(_QWORD *)&buf[4] = "-[WFContextualActionRunRequest getInputWithCompletionHandler:]_block_invoke";
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v15;
              *(_WORD *)&buf[22] = 2112;
              v61 = v39;
              _os_log_impl(&dword_1AF681000, v38, OS_LOG_TYPE_FAULT, "%s Couldn't represent contextual action file: %@ (%@)", buf, 0x20u);

            }
            v40 = *(_QWORD *)(a1 + 48);
            objc_msgSend(*(id *)(a1 + 32), "unableToDecodeInputError");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(uint64_t, _QWORD, void *))(v40 + 16))(v40, 0, v41);

            v37 = obj;
            goto LABEL_39;
          }
          objc_msgSend(v45, "addObject:", v23);

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
        if (v12)
          continue;
        break;
      }
    }

    v54 = 0;
    v55 = &v54;
    v56 = 0x2050000000;
    v24 = (void *)getWFContentCollectionClass_softClass;
    v57 = getWFContentCollectionClass_softClass;
    if (!getWFContentCollectionClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getWFContentCollectionClass_block_invoke;
      v61 = &unk_1E5FC8858;
      v62 = &v54;
      __getWFContentCollectionClass_block_invoke((uint64_t)buf);
      v24 = (void *)v55[3];
    }
    v25 = objc_retainAutorelease(v24);
    _Block_object_dispose(&v54, 8);
    v26 = objc_alloc_init(v25);
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v27 = v45;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
    if (v28)
    {
      v29 = *(_QWORD *)v47;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v47 != v29)
            objc_enumerationMutation(v27);
          v31 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j);
          v54 = 0;
          v55 = &v54;
          v56 = 0x2050000000;
          v32 = (void *)getWFContentLocationClass_softClass;
          v57 = getWFContentLocationClass_softClass;
          if (!getWFContentLocationClass_softClass)
          {
            *(_QWORD *)buf = MEMORY[0x1E0C809B0];
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = __getWFContentLocationClass_block_invoke;
            v61 = &unk_1E5FC8858;
            v62 = &v54;
            __getWFContentLocationClass_block_invoke((uint64_t)buf);
            v32 = (void *)v55[3];
          }
          v33 = objc_retainAutorelease(v32);
          _Block_object_dispose(&v54, 8);
          objc_msgSend(v33, "contentLocationForFile:", v31);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (v34)
            objc_msgSend(v26, "addFile:origin:disclosureLevel:", v31, v34, 1);
          else
            objc_msgSend(v26, "addFile:", v31);

        }
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
      }
      while (v28);
    }

    v35 = *(_QWORD *)(a1 + 32);
    v36 = *(void **)(v35 + 136);
    *(_QWORD *)(v35 + 136) = v26;
    v37 = v26;

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_39:

    v7 = v42;
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

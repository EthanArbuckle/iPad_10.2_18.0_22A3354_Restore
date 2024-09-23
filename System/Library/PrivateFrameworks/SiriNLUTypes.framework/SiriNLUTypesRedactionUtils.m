@implementation SiriNLUTypesRedactionUtils

+ (id)getRedactedUsoGraph:(id)a3
{
  siri::ontology *v3;
  uint64_t *SharedUsoVocabManager;
  std::__shared_weak_count *v5;
  uint64_t v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  siri::ontology::UsoGraphProtoWriter *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  siri::ontology::UsoGraph *v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  sirinluexternal::UsoGraph *v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  uint64_t v33;
  siri::ontology::UsoGraphProtoWriter *v34;
  siri::ontology::UsoGraph *v35;
  uint64_t v36;
  std::__shared_weak_count *v37;
  sirinluexternal::UsoGraph *v38;
  uint64_t v39;
  std::__shared_weak_count *v40;

  v3 = (siri::ontology *)a3;
  SharedUsoVocabManager = (uint64_t *)siri::ontology::getSharedUsoVocabManager(v3);
  v6 = *SharedUsoVocabManager;
  v5 = (std::__shared_weak_count *)SharedUsoVocabManager[1];
  v39 = *SharedUsoVocabManager;
  v40 = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  +[SiriNLUTypesConverterUtils convertUsoGraphFromObjCToCpp:](SiriNLUTypesConverterUtils, "convertUsoGraphFromObjCToCpp:", v3);
  if (v5)
  {
    v9 = (unint64_t *)&v5->__shared_owners_;
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
    v36 = v6;
    v37 = v5;
    do
      v11 = __ldxr(v9);
    while (__stxr(v11 + 1, v9));
    do
      v12 = __ldaxr(v9);
    while (__stlxr(v12 - 1, v9));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  else
  {
    v36 = v6;
    v37 = 0;
  }
  siri::ontology::UsoGraphProtoReader::fromProtobuf((siri::ontology::UsoGraphProtoReader *)&v36, v38, &v35);
  objc_msgSend(MEMORY[0x1E0DA2DE0], "getRedactedGraph:", &v35);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13 && (objc_msgSend(v13, "redactedGraph"), v34))
  {
    siri::ontology::UsoGraphProtoWriter::toProtobuf(v34, &v33);
    +[SiriNLUTypesConverterUtils convertUsoGraphFromCppToObjC:](SiriNLUTypesConverterUtils, "convertUsoGraphFromCppToObjC:", &v33);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v33;
    v33 = 0;
    if (v17)
      (*(void (**)(uint64_t))(*(_QWORD *)v17 + 8))(v17);
    v18 = v34;
    v34 = 0;
    if (v18)
    {
      v19 = MEMORY[0x1C3BB7050](v18, v15);
      MEMORY[0x1C3BB720C](v19, 0x10A0C403D23BABBLL);
    }
  }
  else
  {
    v16 = 0;
  }

  v23 = v35;
  v35 = 0;
  if (v23)
  {
    v24 = MEMORY[0x1C3BB7050](v23, v20, v21, v22);
    MEMORY[0x1C3BB720C](v24, 0x10A0C403D23BABBLL);
  }
  v25 = v37;
  if (v37)
  {
    v26 = (unint64_t *)&v37->__shared_owners_;
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }
  v28 = v38;
  v38 = 0;
  if (v28)
    (*(void (**)(sirinluexternal::UsoGraph *))(*(_QWORD *)v28 + 8))(v28);
  v29 = v40;
  if (v40)
  {
    v30 = (unint64_t *)&v40->__shared_owners_;
    do
      v31 = __ldaxr(v30);
    while (__stlxr(v31 - 1, v30));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }

  return v16;
}

+ (id)redactUserParse:(id)a3
{
  void *v4;
  uint64_t v5;
  char v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  int v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v75;
  id obj;
  uint64_t v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v75 = a3;
  objc_msgSend(v75, "userDialogActs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
  if (v5)
  {
    v6 = 0;
    v77 = *(_QWORD *)v80;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v80 != v77)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
        v9 = (void *)objc_msgSend(v8, "copy");
        if (objc_msgSend(v8, "hasUserStatedTask"))
        {
          objc_msgSend(v8, "userStatedTask");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "hasTask");

          if (v11)
          {
            objc_msgSend(v8, "userStatedTask");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "task");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = (void *)objc_msgSend(v13, "copy");
            objc_msgSend(a1, "getRedactedUsoGraph:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "userStatedTask");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setTask:", v15);

          }
          v6 = 1;
        }
        if (objc_msgSend(v8, "hasAccepted"))
        {
          objc_msgSend(v8, "accepted");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "hasReference");

          if (v18)
          {
            objc_msgSend(v8, "accepted");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "reference");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = (void *)objc_msgSend(v20, "copy");
            objc_msgSend(a1, "getRedactedUsoGraph:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "accepted");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setReference:", v22);

          }
          v6 = 1;
        }
        if (objc_msgSend(v8, "hasRejected"))
        {
          objc_msgSend(v8, "rejected");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "hasReference");

          if (v25)
          {
            objc_msgSend(v8, "rejected");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "reference");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = (void *)objc_msgSend(v27, "copy");
            objc_msgSend(a1, "getRedactedUsoGraph:", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "rejected");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setReference:", v29);

          }
          v6 = 1;
        }
        if (objc_msgSend(v8, "hasCancelled"))
        {
          objc_msgSend(v8, "cancelled");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "hasReference");

          if (v32)
          {
            objc_msgSend(v8, "cancelled");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "reference");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = (void *)objc_msgSend(v34, "copy");
            objc_msgSend(a1, "getRedactedUsoGraph:", v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "cancelled");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "setReference:", v36);

          }
          v6 = 1;
        }
        if (objc_msgSend(v8, "hasWantedToRepeat"))
        {
          objc_msgSend(v8, "wantedToRepeat");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "hasReference");

          if (v39)
          {
            objc_msgSend(v8, "wantedToRepeat");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "reference");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = (void *)objc_msgSend(v41, "copy");
            objc_msgSend(a1, "getRedactedUsoGraph:", v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "wantedToRepeat");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "setReference:", v43);

          }
          v6 = 1;
        }
        if (objc_msgSend(v8, "hasAcknowledged"))
        {
          objc_msgSend(v8, "acknowledged");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "hasReference");

          if (v46)
          {
            objc_msgSend(v8, "acknowledged");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "reference");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = (void *)objc_msgSend(v48, "copy");
            objc_msgSend(a1, "getRedactedUsoGraph:", v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "acknowledged");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "setReference:", v50);

          }
          v6 = 1;
        }
        if (objc_msgSend(v8, "hasWantedToProceed"))
        {
          objc_msgSend(v8, "wantedToProceed");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_msgSend(v52, "hasReference");

          if (v53)
          {
            objc_msgSend(v8, "wantedToProceed");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "reference");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = (void *)objc_msgSend(v55, "copy");
            objc_msgSend(a1, "getRedactedUsoGraph:", v56);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "wantedToProceed");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "setReference:", v57);

          }
          v6 = 1;
        }
        if (objc_msgSend(v8, "hasWantedToPause"))
        {
          objc_msgSend(v8, "wantedToPause");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = objc_msgSend(v59, "hasReference");

          if (v60)
          {
            objc_msgSend(v8, "wantedToPause");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "reference");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = (void *)objc_msgSend(v62, "copy");
            objc_msgSend(a1, "getRedactedUsoGraph:", v63);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "wantedToPause");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "setReference:", v64);

          }
          v6 = 1;
        }
        if (objc_msgSend(v8, "hasWantedToUndo"))
        {
          objc_msgSend(v8, "wantedToUndo");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = objc_msgSend(v66, "hasReference");

          if (v67)
          {
            objc_msgSend(v8, "wantedToUndo");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "reference");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = (void *)objc_msgSend(v69, "copy");
            objc_msgSend(a1, "getRedactedUsoGraph:", v70);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "wantedToUndo");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "setReference:", v71);

          }
        }
        else if ((v6 & 1) == 0)
        {

          goto LABEL_46;
        }
        objc_msgSend(v78, "addObject:", v9);

        v6 = 1;
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
      if (v5)
        continue;
      break;
    }

    v73 = (void *)objc_msgSend(v75, "copy");
    objc_msgSend(v73, "setUserDialogActs:", v78);
  }
  else
  {
LABEL_46:

    v73 = 0;
  }

  return v73;
}

@end

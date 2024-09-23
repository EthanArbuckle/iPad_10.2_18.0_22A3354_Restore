@implementation WRCheckForBadWorkflowDict

void __WRCheckForBadWorkflowDict_block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_class *v16;
  id v17;
  id v18;
  void *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  const char *ClassName;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  NSObject *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _BYTE v100[128];
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  if (!v9)
  {
    WRMakeError(1, CFSTR("Unknown workflow key \"%@\"), v10, v11, v12, v13, v14, v15, (uint64_t)v7);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v24 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v22;

    *a4 = 1;
    goto LABEL_47;
  }
  v16 = (objc_class *)v9;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    object_getClassName(v8);
    NSStringFromClass(v16);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    WRMakeError(6, CFSTR("Wrong value type for workflow key \"%@\": %s, expected %@"), v25, v26, v27, v28, v29, v30, (uint64_t)v7);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v33 = *(void **)(v32 + 40);
    *(_QWORD *)(v32 + 40) = v31;

LABEL_46:
    *a4 = 1;
    goto LABEL_47;
  }
  if (v16 == (objc_class *)objc_opt_class())
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("signposts")))
    {
      v98 = 0u;
      v99 = 0u;
      v96 = 0u;
      v97 = 0u;
      v34 = v8;
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v96, v101, 16);
      if (!v35)
      {
LABEL_38:

        goto LABEL_47;
      }
      v36 = v35;
      v37 = *(_QWORD *)v97;
LABEL_12:
      v38 = 0;
      while (1)
      {
        if (*(_QWORD *)v97 != v37)
          objc_enumerationMutation(v34);
        v39 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * v38);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          WRCheckForBadSignpostDict(v39);
        }
        else
        {
          ClassName = object_getClassName(v39);
          WRMakeError(6, CFSTR("Wrong type for workflow signpost dict: %s"), v42, v43, v44, v45, v46, v47, (uint64_t)ClassName);
        }
        v40 = objc_claimAutoreleasedReturnValue();
        v48 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v49 = *(void **)(v48 + 40);
        *(_QWORD *)(v48 + 40) = v40;

        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
          break;
        if (v36 == ++v38)
        {
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v96, v101, 16);
          if (v36)
            goto LABEL_12;
          goto LABEL_38;
        }
      }
    }
    else
    {
      if (!objc_msgSend(v7, "isEqualToString:", CFSTR("diagnostics")))
      {
        v71 = *__error();
        _wrlog();
        v72 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT))
          __WRCheckForBadWorkflowDict_block_invoke_cold_1((uint64_t)v7, v72, v73, v74, v75, v76, v77, v78);

        *__error() = v71;
        WRMakeError(6, CFSTR("unhandled workflow array key %@"), v79, v80, v81, v82, v83, v84, (uint64_t)v7);
        v85 = objc_claimAutoreleasedReturnValue();
        v86 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v87 = *(void **)(v86 + 40);
        *(_QWORD *)(v86 + 40) = v85;

        goto LABEL_46;
      }
      v94 = 0u;
      v95 = 0u;
      v92 = 0u;
      v93 = 0u;
      v34 = v8;
      v50 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v92, v100, 16);
      if (!v50)
        goto LABEL_38;
      v51 = v50;
      v52 = *(_QWORD *)v93;
LABEL_27:
      v53 = 0;
      while (1)
      {
        if (*(_QWORD *)v93 != v52)
          objc_enumerationMutation(v34);
        v54 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * v53);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          WRCheckForBadDiagnosticDict(v54);
        }
        else
        {
          v56 = object_getClassName(v54);
          WRMakeError(6, CFSTR("Wrong type for workflow diagnostic dict: %s"), v57, v58, v59, v60, v61, v62, (uint64_t)v56);
        }
        v55 = objc_claimAutoreleasedReturnValue();
        v63 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v64 = *(void **)(v63 + 40);
        *(_QWORD *)(v63 + 40) = v55;

        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
          break;
        if (v51 == ++v53)
        {
          v51 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v92, v100, 16);
          if (v51)
            goto LABEL_27;
          goto LABEL_38;
        }
      }
    }
    *a4 = 1;
    goto LABEL_38;
  }
  v17 = v7;
  v18 = v8;
  if (objc_msgSend(v17, "isEqualToString:", CFSTR("name")))
  {
    v19 = v18;
    v20 = 4;
LABEL_6:
    WRValidateString(v19, v20, v17);
    v21 = objc_claimAutoreleasedReturnValue();
    goto LABEL_45;
  }
  if (objc_msgSend(v17, "isEqualToString:", CFSTR("maximum_duration")))
  {
    WRValidateDouble(v18, v17, 3600.0);
    v21 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v17, "isEqualToString:", CFSTR("contextual_telemetry")))
    {
      v19 = v18;
      v20 = 0;
      goto LABEL_6;
    }
    WRMakeError(1, CFSTR("Unknown workflow leaf key %@"), v65, v66, v67, v68, v69, v70, (uint64_t)v17);
    v21 = objc_claimAutoreleasedReturnValue();
  }
LABEL_45:
  v88 = v21;

  v89 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v90 = *(void **)(v89 + 40);
  *(_QWORD *)(v89 + 40) = v88;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    goto LABEL_46;
LABEL_47:

}

void __WRCheckForBadWorkflowDict_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_24A5B4000, a2, a3, "unhandled workflow array key %{public}@", a5, a6, a7, a8, 2u);
}

@end

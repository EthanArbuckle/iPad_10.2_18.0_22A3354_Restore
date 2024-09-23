@implementation WRCheckForBadSignpostDict

void __WRCheckForBadSignpostDict_block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
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
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  const char *ClassName;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  int v63;
  NSObject *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  if (v9)
  {
    v16 = (objc_class *)v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v16 != (objc_class *)objc_opt_class())
      {
        WRValidateSignpostDictLeafEntry(v7, v8);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v19 = *(void **)(v18 + 40);
        *(_QWORD *)(v18 + 40) = v17;

        if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
          goto LABEL_9;
        goto LABEL_8;
      }
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("diagnostics")))
      {
        v87 = 0u;
        v88 = 0u;
        v85 = 0u;
        v86 = 0u;
        v32 = v8;
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v85, v90, 16);
        if (v33)
        {
          v34 = v33;
          v35 = *(_QWORD *)v86;
LABEL_13:
          v36 = 0;
          while (1)
          {
            if (*(_QWORD *)v86 != v35)
              objc_enumerationMutation(v32);
            v37 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v36);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              WRCheckForBadDiagnosticDict(v37);
            }
            else
            {
              ClassName = object_getClassName(v37);
              WRMakeError(6, CFSTR("Wrong type for signpost diagnostic dict: %s"), v40, v41, v42, v43, v44, v45, (uint64_t)ClassName);
            }
            v38 = objc_claimAutoreleasedReturnValue();
            v46 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v47 = *(void **)(v46 + 40);
            *(_QWORD *)(v46 + 40) = v38;

            if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
              break;
            if (v34 == ++v36)
            {
              v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v85, v90, 16);
              if (v34)
                goto LABEL_13;
              goto LABEL_37;
            }
          }
LABEL_36:
          *a4 = 1;
          goto LABEL_37;
        }
        goto LABEL_37;
      }
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("environment_field_names")))
      {
        v83 = 0u;
        v84 = 0u;
        v81 = 0u;
        v82 = 0u;
        v32 = v8;
        v48 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v81, v89, 16);
        if (v48)
        {
          v49 = v48;
          v50 = *(_QWORD *)v82;
LABEL_26:
          v51 = 0;
          while (1)
          {
            if (*(_QWORD *)v82 != v50)
              objc_enumerationMutation(v32);
            v52 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v51);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              WRValidateSignpostDictLeafEntry(v7, v52);
            }
            else
            {
              v54 = object_getClassName(v52);
              WRMakeError(6, CFSTR("Wrong type for signpost environmental field name: %s"), v55, v56, v57, v58, v59, v60, (uint64_t)v54);
            }
            v53 = objc_claimAutoreleasedReturnValue();
            v61 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v62 = *(void **)(v61 + 40);
            *(_QWORD *)(v61 + 40) = v53;

            if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
              goto LABEL_36;
            if (v49 == ++v51)
            {
              v49 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v81, v89, 16);
              if (v49)
                goto LABEL_26;
              break;
            }
          }
        }
LABEL_37:

        goto LABEL_9;
      }
      v63 = *__error();
      _wrlog();
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
        __WRCheckForBadSignpostDict_block_invoke_cold_1((uint64_t)v7, v64, v65, v66, v67, v68, v69, v70);

      *__error() = v63;
      WRMakeError(6, CFSTR("unhandled signpost array key %@"), v71, v72, v73, v74, v75, v76, (uint64_t)v7);
      v77 = objc_claimAutoreleasedReturnValue();
      v78 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v79 = *(void **)(v78 + 40);
      *(_QWORD *)(v78 + 40) = v77;

    }
    else
    {
      object_getClassName(v8);
      NSStringFromClass(v16);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      WRMakeError(6, CFSTR("Wrong value type for signpost key \"%@\": %s, expected %@"), v23, v24, v25, v26, v27, v28, (uint64_t)v7);
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v31 = *(void **)(v30 + 40);
      *(_QWORD *)(v30 + 40) = v29;

    }
LABEL_8:
    *a4 = 1;
    goto LABEL_9;
  }
  WRMakeError(1, CFSTR("Unknown signpost key \"%@\"), v10, v11, v12, v13, v14, v15, (uint64_t)v7);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = v20;

  *a4 = 1;
LABEL_9:

}

void __WRCheckForBadSignpostDict_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_24A5B4000, a2, a3, "unhandled signpost array key %{public}@", a5, a6, a7, a8, 2u);
}

@end

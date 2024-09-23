@implementation WRCheckForBadDiagnosticDict

void __WRCheckForBadDiagnosticDict_block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_class *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
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
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  id v51;

  v51 = a2;
  v7 = a3;
  v8 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v51);
  if (v8)
  {
    v15 = (objc_class *)v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = v51;
      v17 = v7;
      if ((objc_msgSend(v16, "isEqualToString:", CFSTR("trigger_threshold_duration_sum")) & 1) != 0
        || (objc_msgSend(v16, "isEqualToString:", CFSTR("trigger_threshold_duration_union")) & 1) != 0
        || objc_msgSend(v16, "isEqualToString:", CFSTR("trigger_threshold_duration_single")))
      {
        WRValidateDouble(v17, v16, 0.0);
        v18 = objc_claimAutoreleasedReturnValue();
      }
      else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("trigger_event_timeout")) & 1) != 0
             || (objc_msgSend(v16, "isEqualToString:", CFSTR("gather_tailspin")) & 1) != 0
             || (objc_msgSend(v16, "isEqualToString:", CFSTR("option_tailspin_includes_oslogs")) & 1) != 0
             || (objc_msgSend(v16, "isEqualToString:", CFSTR("report_spindump_this_thread")) & 1) != 0
             || (objc_msgSend(v16, "isEqualToString:", CFSTR("report_spindump_main_thread")) & 1) != 0
             || (objc_msgSend(v16, "isEqualToString:", CFSTR("report_spindump_this_dispatchqueue")) & 1) != 0
             || objc_msgSend(v16, "isEqualToString:", CFSTR("option_report_omit_network_bound_intervals")))
      {
        WRValidateBool(v17, v16);
        v18 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (objc_msgSend(v16, "isEqualToString:", CFSTR("trigger_threshold_count")))
        {
          v34 = v17;
          v35 = v16;
          v50 = v34;
          if (objc_msgSend(v34, "longLongValue") < 0)
          {
            WRMakeError(8, CFSTR("%@ is negative (%lld)"), v36, v37, v38, v39, v40, v41, (uint64_t)v35);
            v19 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v34, "unsignedLongLongValue");
            v19 = 0;
          }

LABEL_8:
          v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v21 = *(void **)(v20 + 40);
          *(_QWORD *)(v20 + 40) = v19;

          if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
            goto LABEL_14;
          goto LABEL_13;
        }
        if ((objc_msgSend(v16, "isEqualToString:", CFSTR("option_report_other_signpost")) & 1) != 0
          || objc_msgSend(v16, "isEqualToString:", CFSTR("name")))
        {
          v42 = v17;
          v43 = 20;
        }
        else
        {
          if ((objc_msgSend(v16, "isEqualToString:", CFSTR("report_spindump_thread_name")) & 1) == 0
            && (objc_msgSend(v16, "isEqualToString:", CFSTR("report_spindump_dispatchqueue_label")) & 1) == 0
            && !objc_msgSend(v16, "isEqualToString:", CFSTR("option_report_other_processes")))
          {
            WRMakeError(1, CFSTR("Unknown diagnostic key %@"), v44, v45, v46, v47, v48, v49, (uint64_t)v16);
            v18 = objc_claimAutoreleasedReturnValue();
            goto LABEL_7;
          }
          v42 = v17;
          v43 = 1;
        }
        WRValidateString(v42, v43, v16);
        v18 = objc_claimAutoreleasedReturnValue();
      }
LABEL_7:
      v19 = v18;
      goto LABEL_8;
    }
    object_getClassName(v7);
    NSStringFromClass(v15);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    WRMakeError(6, CFSTR("Wrong value type for diagnostic key \"%@\": %s, expected %@"), v25, v26, v27, v28, v29, v30, (uint64_t)v51);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v33 = *(void **)(v32 + 40);
    *(_QWORD *)(v32 + 40) = v31;

  }
  else
  {
    WRMakeError(1, CFSTR("Unknown diagnostic key \"%@\"), v9, v10, v11, v12, v13, v14, (uint64_t)v51);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v24 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v22;
  }

LABEL_13:
  *a4 = 1;
LABEL_14:

}

@end

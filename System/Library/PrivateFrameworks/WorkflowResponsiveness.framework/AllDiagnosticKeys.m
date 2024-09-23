@implementation AllDiagnosticKeys

void __AllDiagnosticKeys_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v17 = (void *)MEMORY[0x24BDBCE70];
  v16 = objc_opt_class();
  v15 = objc_opt_class();
  v14 = objc_opt_class();
  v13 = objc_opt_class();
  v12 = objc_opt_class();
  v11 = objc_opt_class();
  v0 = objc_opt_class();
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v17, "dictionaryWithObjectsAndKeys:", v16, CFSTR("name"), v15, CFSTR("trigger_threshold_duration_sum"), v14, CFSTR("trigger_threshold_duration_union"), v13, CFSTR("trigger_threshold_duration_single"), v12, CFSTR("trigger_threshold_count"), v11, CFSTR("trigger_event_timeout"), v0, CFSTR("gather_tailspin"), v1, CFSTR("option_tailspin_includes_oslogs"), v2,
    CFSTR("report_spindump_this_thread"),
    v3,
    CFSTR("report_spindump_thread_name"),
    v4,
    CFSTR("report_spindump_main_thread"),
    v5,
    CFSTR("report_spindump_this_dispatchqueue"),
    v6,
    CFSTR("report_spindump_dispatchqueue_label"),
    v7,
    CFSTR("option_report_other_signpost"),
    v8,
    CFSTR("option_report_other_processes"),
    objc_opt_class(),
    CFSTR("option_report_omit_network_bound_intervals"),
    0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)AllDiagnosticKeys_allDiagnosticKeys;
  AllDiagnosticKeys_allDiagnosticKeys = v9;

}

@end

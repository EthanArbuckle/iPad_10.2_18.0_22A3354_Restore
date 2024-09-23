@implementation AllSignpostKeys

void __AllSignpostKeys_block_invoke()
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
  void *v16;

  v16 = (void *)MEMORY[0x24BDBCE70];
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
  objc_msgSend(v16, "dictionaryWithObjectsAndKeys:", v15, CFSTR("start"), v14, CFSTR("end"), v13, CFSTR("end_group"), v12, CFSTR("subsystem"), v11, CFSTR("category"), v0, CFSTR("name"), v1, CFSTR("event_identifier_field_name"), v2, CFSTR("individuation_field_name"), v3,
    CFSTR("environment_field_names"),
    v4,
    CFSTR("network_bound"),
    v5,
    CFSTR("diagnostics"),
    v6,
    CFSTR("disabled"),
    v7,
    CFSTR("overall_interval"),
    v8,
    CFSTR("diagnostics_threshold_seconds"),
    objc_opt_class(),
    CFSTR("diagnostics_threshold_count"),
    0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)AllSignpostKeys_allSignpostKeys;
  AllSignpostKeys_allSignpostKeys = v9;

}

@end

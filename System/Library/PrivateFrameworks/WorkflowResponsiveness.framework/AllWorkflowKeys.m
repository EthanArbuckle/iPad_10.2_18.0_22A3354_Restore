@implementation AllWorkflowKeys

void __AllWorkflowKeys_block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v0 = (void *)MEMORY[0x24BDBCE70];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  objc_msgSend(v0, "dictionaryWithObjectsAndKeys:", v1, CFSTR("name"), v2, CFSTR("maximum_duration"), v3, CFSTR("contextual_telemetry"), v4, CFSTR("signposts"), objc_opt_class(), CFSTR("diagnostics"), 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)AllWorkflowKeys_allWorkflowKeys;
  AllWorkflowKeys_allWorkflowKeys = v5;

}

@end

@implementation WFSerializationNameMigrations

void __WFSerializationNameMigrations_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("WFDictionaryFieldValue");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("WFTokenAttachmentParameterState");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("WFTokenStringParameterState");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("WFTextTokenAttachment");
  v3[3] = objc_opt_class();
  v2[4] = CFSTR("WFTextTokenString");
  v3[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)WFSerializationNameMigrations__serializationNameMigrations;
  WFSerializationNameMigrations__serializationNameMigrations = v0;

}

@end

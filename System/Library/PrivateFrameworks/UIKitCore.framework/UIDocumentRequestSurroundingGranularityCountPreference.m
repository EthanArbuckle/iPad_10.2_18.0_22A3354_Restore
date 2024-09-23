@implementation UIDocumentRequestSurroundingGranularityCountPreference

void ___UIDocumentRequestSurroundingGranularityCountPreference_block_invoke()
{
  void *v0;
  NSObject *v1;
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (!os_variant_has_internal_diagnostics())
    goto LABEL_2;
  TIGetDocumentRequestSurroundingGranularityCountValue();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_2:
    qword_1ECD7F0C8 = 2;
    return;
  }
  qword_1ECD7F0C8 = objc_msgSend(v0, "integerValue");
  _UIKeyboardLog();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v2 = 136315394;
    v3 = "SurroundingGranularityCount";
    v4 = 2048;
    v5 = qword_1ECD7F0C8;
    _os_log_impl(&dword_185066000, v1, OS_LOG_TYPE_DEFAULT, "Obtained RTIDocumentRequest default %s=%ld from user defaults", (uint8_t *)&v2, 0x16u);
  }

}

@end

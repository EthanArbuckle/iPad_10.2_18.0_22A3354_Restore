@implementation SYDocumentWorkflowsContentType

+ (BOOL)isPagesContentType:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = !objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("com.apple.iwork.pages.pages"))
    || !objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("com.apple.iwork.pages.sffpages"))
    || !objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("com.apple.iwork.pages.template"))
    || objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("com.apple.iwork.pages.sfftemplate")) == 0;

  return v4;
}

+ (BOOL)isMSWordContentType:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("com.microsoft.word.doc")))
    v4 = objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("com.microsoft.word.docx")) == 0;
  else
    v4 = 1;

  return v4;
}

+ (BOOL)isPDFContentType:(id)a3
{
  return objc_msgSend(a3, "caseInsensitiveCompare:", CFSTR("com.adobe.pdf")) == 0;
}

+ (BOOL)isImageContentType:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  char v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[SYDocumentWorkflowsContentType isImageContentType:].cold.1((uint64_t)v3, v5);

  }
  v6 = objc_msgSend(v4, "conformsToType:", *MEMORY[0x1E0CEC520]);

  return v6;
}

+ (void)isImageContentType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1BCC38000, a2, OS_LOG_TYPE_ERROR, "Unknown content type: %@", (uint8_t *)&v2, 0xCu);
}

@end

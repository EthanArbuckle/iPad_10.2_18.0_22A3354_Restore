@implementation SYDocumentAttributes(Writing)

- (void)saveToFileURL:()Writing additionalAttributes:completion:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1BCC38000, a2, OS_LOG_TYPE_ERROR, "Unable to serialize document attributes, error: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)_removeDocumentAttributesForFileAtURL:()Writing keepDocumentRelatedUniqueIdentifierKey:error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
}

@end

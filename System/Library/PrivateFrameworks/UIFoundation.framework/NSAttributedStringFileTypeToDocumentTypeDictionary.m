@implementation NSAttributedStringFileTypeToDocumentTypeDictionary

uint64_t __NSAttributedStringFileTypeToDocumentTypeDictionary_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  id v6;

  v6 = objc_alloc(MEMORY[0x1E0C99D80]);
  v0 = objc_msgSend((id)*MEMORY[0x1E0CEC590], "identifier");
  v1 = objc_msgSend((id)*MEMORY[0x1E0CEC5C0], "identifier");
  v2 = objc_msgSend((id)*MEMORY[0x1E0CEC5C8], "identifier");
  v3 = objc_msgSend((id)*MEMORY[0x1E0CEC4E8], "identifier");
  v4 = objc_msgSend((id)*MEMORY[0x1E0CEC518], "identifier");
  result = objc_msgSend(v6, "initWithObjectsAndKeys:", CFSTR("NSPlainText"), v0, CFSTR("NSRTF"), v1, CFSTR("NSRTFD"), v2, CFSTR("NSRTFD"), v3, CFSTR("NSHTML"), v4, CFSTR("NSWebArchive"), objc_msgSend((id)*MEMORY[0x1E0CEC658], "identifier"), 0);
  NSAttributedStringFileTypeToDocumentTypeDictionary___fileTypeToDocTypeDict = result;
  return result;
}

@end

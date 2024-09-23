@implementation InitializeFileExtensions

void ___InitializeFileExtensions_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("THM"), CFSTR("BTH"), CFSTR("THL"), CFSTR("THP"), CFSTR("JPG"), CFSTR("WTH"), CFSTR("LRZ"), CFSTR("TH2"), CFSTR("THO"), 0);
  v1 = (void *)__metadataFileExtensions;
  __metadataFileExtensions = v0;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("LRZ"), CFSTR("TH2"), CFSTR("THO"), 0);
  v3 = (void *)__obsoleteFileExtensions;
  __obsoleteFileExtensions = v2;

  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("JPG"), CFSTR("PNG"), CFSTR("TIF"), CFSTR("GIF"), CFSTR("HEIF"), CFSTR("HEIC"), 0);
  v5 = (void *)__imageFileExtensions;
  __imageFileExtensions = v4;

}

@end

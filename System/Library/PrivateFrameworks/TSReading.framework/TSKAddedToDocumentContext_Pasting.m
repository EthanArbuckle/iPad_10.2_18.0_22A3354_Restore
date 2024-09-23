@implementation TSKAddedToDocumentContext_Pasting

- (TSKAddedToDocumentContext_Pasting)init
{
  TSKAddedToDocumentContext_Pasting *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSKAddedToDocumentContext_Pasting;
  result = -[TSKAddedToDocumentContext_Pasting init](&v3, sel_init);
  if (result)
    result->mTableIDMap = 0;
  return result;
}

- (void)dealloc
{
  __CFDictionary *mTableIDMap;
  objc_super v4;

  mTableIDMap = self->mTableIDMap;
  if (mTableIDMap)
    CFRelease(mTableIDMap);
  v4.receiver = self;
  v4.super_class = (Class)TSKAddedToDocumentContext_Pasting;
  -[TSKAddedToDocumentContext_Pasting dealloc](&v4, sel_dealloc);
}

- (__CFDictionary)tableIDMap
{
  return self->mTableIDMap;
}

- (void)setTableIDMap:(__CFDictionary *)a3
{
  __CFDictionary *mTableIDMap;

  if (a3)
    CFRetain(a3);
  mTableIDMap = self->mTableIDMap;
  if (mTableIDMap)
    CFRelease(mTableIDMap);
  self->mTableIDMap = a3;
}

- (id)description
{
  return CFSTR("Pasted");
}

- (BOOL)wasPasted
{
  return 1;
}

- (BOOL)autoUpdateSmartFields
{
  return 1;
}

- (BOOL)uniqueBookmarks
{
  return 1;
}

- (BOOL)syncChanges
{
  return 1;
}

@end

@implementation TSKAddedToDocumentContext

+ (id)unarchivingContext
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    +[TSKAddedToDocumentContext unarchivingContext]::sUnarchivingContext = objc_alloc_init(TSKAddedToDocumentContext_Unarchiving);
  }
  return (id)+[TSKAddedToDocumentContext unarchivingContext]::sUnarchivingContext;
}

+ (id)importingContextWithImporterID:(id)a3
{
  return -[TSKAddedToDocumentContext_Importing initWithImporterID:]([TSKAddedToDocumentContext_Importing alloc], "initWithImporterID:", a3);
}

+ (id)importingMasterTemplateContextWithImporterID:(id)a3
{
  return -[TSKAddedToDocumentContext_Importing initWithImporterID:]([TSKAddedToDocumentContext_ImportingMasterTemplate alloc], "initWithImporterID:", a3);
}

+ (id)pastingContext
{
  return objc_alloc_init(TSKAddedToDocumentContext_Pasting);
}

+ (id)pastingMatchStyleContext
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    +[TSKAddedToDocumentContext pastingMatchStyleContext]::sPastingMatchStyleContext = objc_alloc_init(TSKAddedToDocumentContext_PastingMatchStyle);
  }
  return (id)+[TSKAddedToDocumentContext pastingMatchStyleContext]::sPastingMatchStyleContext;
}

+ (id)dragMoveContext
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    +[TSKAddedToDocumentContext dragMoveContext]::sPastingContext = objc_alloc_init(TSKAddedToDocumentContext_DragMove);
  }
  return (id)+[TSKAddedToDocumentContext dragMoveContext]::sPastingContext;
}

+ (id)dragCopyContext
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    +[TSKAddedToDocumentContext dragCopyContext]::sPastingContext = objc_alloc_init(TSKAddedToDocumentContext_DragCopy);
  }
  return (id)+[TSKAddedToDocumentContext dragCopyContext]::sPastingContext;
}

+ (id)insertingPrototypeContext
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    +[TSKAddedToDocumentContext insertingPrototypeContext]::sInsertingPrototypeContext = objc_alloc_init(TSKAddedToDocumentContext_InsertingPrototype);
  }
  return (id)+[TSKAddedToDocumentContext insertingPrototypeContext]::sInsertingPrototypeContext;
}

+ (id)movingContext
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    +[TSKAddedToDocumentContext movingContext]::sMovingContext = objc_alloc_init(TSKAddedToDocumentContext_Moving);
  }
  return (id)+[TSKAddedToDocumentContext movingContext]::sMovingContext;
}

+ (id)unhidingContext
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    +[TSKAddedToDocumentContext unhidingContext]::sUnhidingContext = objc_alloc_init(TSKAddedToDocumentContext_Unhiding);
  }
  return (id)+[TSKAddedToDocumentContext unhidingContext]::sUnhidingContext;
}

+ (id)undoDeleteContext
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    +[TSKAddedToDocumentContext undoDeleteContext]::sUndoDeleteContext = objc_alloc_init(TSKAddedToDocumentContext_UndoDelete);
  }
  return (id)+[TSKAddedToDocumentContext undoDeleteContext]::sUndoDeleteContext;
}

+ (id)exportFootnoteContext
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    +[TSKAddedToDocumentContext exportFootnoteContext]::sExportFootnoteContext = objc_alloc_init(TSKAddedToDocumentContext_ExportFootnotes);
  }
  return (id)+[TSKAddedToDocumentContext exportFootnoteContext]::sExportFootnoteContext;
}

+ (id)changeTrackingSubstorageForCopyContext
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    +[TSKAddedToDocumentContext changeTrackingSubstorageForCopyContext]::sChangeTrackingSubstorageContext = objc_alloc_init(TSKAddedToDocumentContext_SubstorageForChangeTrackingCopy);
  }
  return (id)+[TSKAddedToDocumentContext changeTrackingSubstorageForCopyContext]::sChangeTrackingSubstorageContext;
}

- (BOOL)wasUnarchived
{
  return 0;
}

- (id)importerID
{
  return 0;
}

- (BOOL)wasImported
{
  return -[TSKAddedToDocumentContext importerID](self, "importerID") != 0;
}

- (BOOL)wasImportedFromMasterTemplate
{
  return 0;
}

- (BOOL)wasPasted
{
  return 0;
}

- (BOOL)wasDragOperation
{
  return 0;
}

- (BOOL)wasDragMoved
{
  return 0;
}

- (BOOL)wasMoved
{
  return 0;
}

- (BOOL)wasUnhidden
{
  return 0;
}

- (BOOL)wasUndoDelete
{
  return 0;
}

- (BOOL)invokeDOLC
{
  return 1;
}

- (BOOL)autoUpdateSmartFields
{
  return 0;
}

- (BOOL)uniqueBookmarks
{
  return 0;
}

- (BOOL)syncChanges
{
  return 0;
}

- (BOOL)matchStyle
{
  return 0;
}

- (BOOL)exportingFootnotes
{
  return 0;
}

- (BOOL)changeTrackingSubstorage
{
  return 0;
}

- (id)undoContext
{
  return 0;
}

- (__CFDictionary)tableIDMap
{
  return 0;
}

- (void)setTableIDMap:(__CFDictionary *)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAddedToDocumentContext setTableIDMap:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentObjectProtocol.mm"), 721, CFSTR("Only the pasting context accepts a table ID map."));
}

@end

@implementation CRLWPStickyNoteItem

- (BOOL)canAspectRatioLockBeChangedByUser
{
  return 1;
}

- (Class)layoutClass
{
  uint64_t v2;
  uint64_t v3;

  v2 = type metadata accessor for CRLWPStickyNoteLayout();
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

- (Class)repClass
{
  uint64_t v2;
  uint64_t v3;

  v2 = type metadata accessor for CRLWPStickyNoteRep();
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

- (Class)editorClass
{
  uint64_t v2;
  uint64_t v3;

  v2 = type metadata accessor for CRLWPStickyNoteEditor();
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

- (BOOL)allowsChangeShape
{
  return 0;
}

@end

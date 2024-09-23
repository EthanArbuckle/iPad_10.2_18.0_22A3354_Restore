@implementation CRLWPDictationAndAutocorrectionCoordinator

- (_TtC8Freeform25CRLSelectionPathValidator)selectionPathValidator
{
  return (_TtC8Freeform25CRLSelectionPathValidator *)*(id *)self->selectionPathValidator;
}

- (BOOL)isPrimarySelectionPathReceiver
{
  return self->isPrimarySelectionPathReceiver[0];
}

- (void)setIsPrimarySelectionPathReceiver:(BOOL)a3
{
  self->isPrimarySelectionPathReceiver[0] = a3;
}

- (id)selectionStateSnapshot
{
  uint64_t v3;
  uint64_t v4;
  _BYTE v6[24];

  swift_beginAccess(self->keyToSelectionMap, v6, 0, 0);
  v3 = *(_QWORD *)self->keyToSelectionMap;
  swift_retain(self);
  swift_bridgeObjectRetain(v3);
  sub_1006C2E78(v4, (uint64_t)self);
  swift_release(self);
  swift_bridgeObjectRelease(v3);
  return 0;
}

- (void)validateSelectionStateUsing:(id)a3
{
  id v4;

  v4 = a3;
  swift_retain(self);
  sub_1006C3598();

  swift_release(self);
}

@end

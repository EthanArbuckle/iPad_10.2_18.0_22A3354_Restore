@implementation ICSelectionStateModelObjectSelectionOptions

- (ICTextViewScrollState)scrollState
{
  return (ICTextViewScrollState *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                          + OBJC_IVAR___ICSelectionStateModelObjectSelectionOptions_scrollState));
}

- (BOOL)startEditing
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___ICSelectionStateModelObjectSelectionOptions_startEditing);
}

- (BOOL)showInkPicker
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___ICSelectionStateModelObjectSelectionOptions_showInkPicker);
}

- (BOOL)dismissOverlayContent
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___ICSelectionStateModelObjectSelectionOptions_dismissOverlayContent);
}

- (BOOL)showLatestUpdatesIfAvailable
{
  return *((_BYTE *)&self->super.isa
         + OBJC_IVAR___ICSelectionStateModelObjectSelectionOptions_showLatestUpdatesIfAvailable);
}

- (BOOL)animated
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___ICSelectionStateModelObjectSelectionOptions_animated);
}

- (BOOL)ensurePresented
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___ICSelectionStateModelObjectSelectionOptions_ensurePresented);
}

- (id)copyWithZone:(void *)a3
{
  return (id)sub_10015B214(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD *__return_ptr))sub_10015A6E4);
}

- (BOOL)isEqual:(id)a3
{
  return sub_10015B280(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))type metadata accessor for ICSelectionStateModel.ObjectSelectionOptions);
}

- (ICSelectionStateModelObjectSelectionOptions)init
{
  ICSelectionStateModelObjectSelectionOptions *result;

  result = (ICSelectionStateModelObjectSelectionOptions *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.ObjectSelectionOptions", 34, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end

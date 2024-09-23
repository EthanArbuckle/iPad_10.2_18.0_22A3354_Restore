@implementation ICSelectionStateModelContainerSelectionOptions

- (BOOL)forceApply
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptions_forceApply);
}

- (ICNoteBrowseViewController)noteBrowseViewController
{
  return (ICNoteBrowseViewController *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR___ICSelectionStateModelContainerSelectionOptions_noteBrowseViewController);
}

- (void)setNoteBrowseViewController:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptions_noteBrowseViewController, a3);
}

- (BOOL)usingRootViewController
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptions_usingRootViewController);
}

- (BOOL)ensurePresented
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptions_ensurePresented);
}

- (NSNumber)ensureSelectedNote
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptions_ensureSelectedNote));
}

- (BOOL)deferUntilDataLoaded
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptions_deferUntilDataLoaded);
}

- (NSNumber)dismissOverlayContent
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptions_dismissOverlayContent));
}

- (NSNumber)keepEditorShowing
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptions_keepEditorShowing));
}

- (BOOL)animated
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptions_animated);
}

- (ICSelectionStateModelContainerSelectionOptionsCompletionBlocks)completionBlocks
{
  return (ICSelectionStateModelContainerSelectionOptionsCompletionBlocks *)*(id *)((char *)&self->super.isa + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptions_completionBlocks);
}

- (id)copyWithZone:(void *)a3
{
  return (id)sub_10015B214(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD *__return_ptr))sub_10015AFEC);
}

- (BOOL)isEqual:(id)a3
{
  return sub_10015B280(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))type metadata accessor for ICSelectionStateModel.ContainerSelectionOptions);
}

- (ICSelectionStateModelContainerSelectionOptions)init
{
  ICSelectionStateModelContainerSelectionOptions *result;

  result = (ICSelectionStateModelContainerSelectionOptions *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.ContainerSelectionOptions", 37, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptions_noteBrowseViewController);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptions_ensureSelectedNote));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptions_dismissOverlayContent));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptions_keepEditorShowing));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptions_completionBlocks));
}

@end

@implementation ICNotesSharedIndexedViewHelper

+ (id)makeNoteSearchResultViewWithNote:(id)a3 attachmentURL:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(qword_2543BD0C0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_2431577BC();
    v8 = sub_2431577C8();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = sub_2431577C8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = (void *)swift_unknownObjectRetain();
  v11 = _sSo30ICNotesSharedIndexedViewHelperC15NotesUIServicesE020makeNoteSearchResultD04with13attachmentURLSo28CSSearchableItemAttributeSetCSgSo017ICSearchIndexableI0_p_10Foundation0N0VSgtFZ_0(v10, (uint64_t)v7);
  swift_unknownObjectRelease();
  sub_24314C174((uint64_t)v7, qword_2543BD0C0);
  return v11;
}

- (ICNotesSharedIndexedViewHelper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICNotesSharedIndexedViewHelper;
  return -[ICNotesSharedIndexedViewHelper init](&v3, sel_init);
}

@end

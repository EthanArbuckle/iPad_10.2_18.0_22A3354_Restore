@implementation CRLiOSFolderGridViewController.SectionHeader

- (_TtCC8Freeform30CRLiOSFolderGridViewController13SectionHeader)initWithFrame:(CGRect)a3
{
  return (_TtCC8Freeform30CRLiOSFolderGridViewController13SectionHeader *)sub_1004DBF30(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC8Freeform30CRLiOSFolderGridViewController13SectionHeader)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004DDAEC();
}

- (void)collapseButtonTapped:(id)a3
{
  uint64_t Strong;
  uint64_t v6;
  _TtCC8Freeform30CRLiOSFolderGridViewController13SectionHeader *v7;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController13SectionHeader_delegate);
  if (Strong)
  {
    v6 = Strong;
    swift_unknownObjectRetain(a3);
    v7 = self;
    sub_100B7F604((uint64_t)v7);
    swift_unknownObjectRelease(a3);

    swift_unknownObjectRelease(v6);
  }
}

- (void).cxx_destruct
{
  sub_1004DD8A4(*(void **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController13SectionHeader_sectionIdentifier), *(id *)&self->sectionIdentifier[OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController13SectionHeader_sectionIdentifier], *(_QWORD *)&self->sectionIdentifier[OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController13SectionHeader_sectionIdentifier+ 8], self->sectionIdentifier[OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController13SectionHeader_sectionIdentifier+ 16]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController13SectionHeader_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController13SectionHeader_pinLabelToLeadingEdgeOfCollapseButtonConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController13SectionHeader_titleLabelTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController13SectionHeader_collapseButton));
  sub_1004CBB0C((uint64_t)self + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController13SectionHeader_delegate);
}

@end

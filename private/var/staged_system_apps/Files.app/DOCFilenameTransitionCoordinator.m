@implementation DOCFilenameTransitionCoordinator

- (_TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7532DOCFilenameTransitionCoordinator)init
{
  objc_class *ObjectType;
  char *v4;
  char *v5;
  uint64_t v6;
  _TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7532DOCFilenameTransitionCoordinator *v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7532DOCFilenameTransitionCoordinator_thumbnail) = 0;
  v4 = (char *)self
     + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7532DOCFilenameTransitionCoordinator_thumbnailStyle;
  *(_QWORD *)v4 = 0;
  v4[8] = 1;
  v5 = (char *)self
     + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7532DOCFilenameTransitionCoordinator_sourceRect;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  v5[32] = 1;
  v6 = OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7532DOCFilenameTransitionCoordinator_group;
  v7 = self;
  *(Class *)((char *)&self->super.isa + v6) = (Class)dispatch_group_create();

  v9.receiver = v7;
  v9.super_class = ObjectType;
  return -[DOCFilenameTransitionCoordinator init](&v9, "init");
}

- (double)transitionDuration:(id)a3
{
  return 0.4;
}

- (void)animateTransition:(id)a3
{
  _TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7532DOCFilenameTransitionCoordinator *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_100288344((uint64_t)a3);
  swift_unknownObjectRelease(a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7532DOCFilenameTransitionCoordinator_thumbnail));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7532DOCFilenameTransitionCoordinator_group));
}

@end

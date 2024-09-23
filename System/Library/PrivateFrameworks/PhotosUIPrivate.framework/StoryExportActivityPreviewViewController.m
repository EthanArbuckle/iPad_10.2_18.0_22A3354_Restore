@implementation StoryExportActivityPreviewViewController

- (_TtC15PhotosUIPrivate40StoryExportActivityPreviewViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AAC9CC58();
}

- (void)viewDidLoad
{
  _TtC15PhotosUIPrivate40StoryExportActivityPreviewViewController *v2;

  v2 = self;
  sub_1AAC9CD24();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC15PhotosUIPrivate40StoryExportActivityPreviewViewController *v4;

  v4 = self;
  sub_1AAC9D158(a3, (SEL *)&selRef_viewDidAppear_, 1);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC15PhotosUIPrivate40StoryExportActivityPreviewViewController *v4;

  v4 = self;
  sub_1AAC9D158(a3, (SEL *)&selRef_viewDidDisappear_, 0);

}

- (void)viewDidLayoutSubviews
{
  _TtC15PhotosUIPrivate40StoryExportActivityPreviewViewController *v2;

  v2 = self;
  sub_1AAC9D224();

}

- (_TtC15PhotosUIPrivate40StoryExportActivityPreviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1AB08D498();
  v5 = a4;
  sub_1AAC9D758();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate40StoryExportActivityPreviewViewController_exportActivityItemProvider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate40StoryExportActivityPreviewViewController_storyView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate40StoryExportActivityPreviewViewController_storyTraitCollection));
  swift_unknownObjectRelease();
}

@end

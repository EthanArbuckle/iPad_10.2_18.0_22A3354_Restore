@implementation SessionPromptAlertViewController

- (_TtC9SeymourUI32SessionPromptAlertViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B349950();
}

- (void)viewDidLoad
{
  _TtC9SeymourUI32SessionPromptAlertViewController *v2;

  v2 = self;
  sub_22B347600();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC9SeymourUI32SessionPromptAlertViewController *v6;

  v5 = a3;
  v6 = self;
  sub_22B3479BC(a3);

}

- (void)burnbarOnButtonTapped
{
  _TtC9SeymourUI32SessionPromptAlertViewController *v2;

  v2 = self;
  sub_22B348430();

}

- (void)burnbarOffButtonTapped
{
  _TtC9SeymourUI32SessionPromptAlertViewController *v2;

  v2 = self;
  sub_22B348484();

}

- (_TtC9SeymourUI32SessionPromptAlertViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI32SessionPromptAlertViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI32SessionPromptAlertViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD v11[16];

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_featureView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_primaryPhoneButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_secondaryPhoneButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_primaryTVButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_secondaryTVButton));
  v3 = *(_OWORD *)((char *)&self->super._editButtonItem
                 + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_styleProvider);
  v11[12] = *(_OWORD *)((char *)&self->super._savedHeaderSuperview
                      + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_styleProvider);
  v11[13] = v3;
  v4 = *(_OWORD *)((char *)&self->super._modalPresentationStyle
                 + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_styleProvider);
  v11[14] = *(_OWORD *)((char *)&self->super._strongSearchDisplayController
                      + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_styleProvider);
  v11[15] = v4;
  v5 = *(_OWORD *)((char *)&self->super._dimmingView
                 + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_styleProvider);
  v11[8] = *(_OWORD *)((char *)&self->super._previousRootViewController
                     + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_styleProvider);
  v11[9] = v5;
  v6 = *(_OWORD *)((char *)&self->super._externalObjectsTableForViewLoading
                 + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_styleProvider);
  v11[10] = *(_OWORD *)((char *)&self->super._currentAction
                      + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_styleProvider);
  v11[11] = v6;
  v7 = *(_OWORD *)((char *)&self->super._title
                 + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_styleProvider);
  v11[4] = *(_OWORD *)((char *)&self->super._navigationItem
                     + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_styleProvider);
  v11[5] = v7;
  v8 = *(_OWORD *)((char *)&self->super._childModalViewControllers
                 + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_styleProvider);
  v11[6] = *(_OWORD *)((char *)&self->super._nibBundle
                     + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_styleProvider);
  v11[7] = v8;
  v9 = *(_OWORD *)((char *)&self->super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_styleProvider);
  v11[0] = *(_OWORD *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_styleProvider);
  v11[1] = v9;
  v10 = *(_OWORD *)((char *)&self->super._tab
                  + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_styleProvider);
  v11[2] = *(_OWORD *)((char *)&self->super._view
                     + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_styleProvider);
  v11[3] = v10;
  sub_22B34A144((uint64_t)v11);
}

@end

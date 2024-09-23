@implementation IntelligenceUI.PromptComposeViewController

- (void)loadView
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtCO5UIKit14IntelligenceUI27PromptComposeViewController_promptComposeView);
  v4 = *(_QWORD *)(v3 + OBJC_IVAR____TtCO5UIKit14IntelligenceUI17PromptComposeView_entryView)
     + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView_delegate;
  swift_beginAccess();
  *(_QWORD *)(v4 + 8) = &protocol witness table for IntelligenceUI.PromptComposeViewController;
  swift_unknownObjectWeakAssign();
  -[UIViewController setView:](self, sel_setView_, v3);
}

- (_TtCO5UIKit14IntelligenceUI27PromptComposeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_1865074F8();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtCO5UIKit14IntelligenceUI27PromptComposeViewController *)IntelligenceUI.PromptComposeViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtCO5UIKit14IntelligenceUI27PromptComposeViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtCO5UIKit14IntelligenceUI27PromptComposeViewController *v8;
  _TtCO5UIKit14IntelligenceUI27PromptComposeViewController *v9;
  objc_super v11;

  v5 = OBJC_IVAR____TtCO5UIKit14IntelligenceUI27PromptComposeViewController_promptComposeView;
  v6 = objc_allocWithZone((Class)type metadata accessor for IntelligenceUI.PromptComposeView());
  v7 = a3;
  v8 = self;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for IntelligenceUI.PromptComposeViewController();
  v9 = -[UIViewController initWithCoder:](&v11, sel_initWithCoder_, v7);

  return v9;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO5UIKit14IntelligenceUI27PromptComposeViewController_promptComposeView));
}

@end

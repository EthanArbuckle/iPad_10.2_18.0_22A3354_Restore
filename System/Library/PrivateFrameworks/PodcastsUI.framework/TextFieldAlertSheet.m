@implementation TextFieldAlertSheet

- (void)loadView
{
  uint64_t v3;
  uint64_t v4;
  objc_class *v5;
  char *v6;
  char *v7;
  _TtC10PodcastsUI19TextFieldAlertSheet *v8;
  _TtC10PodcastsUI19TextFieldAlertSheet *v9;
  objc_super v10;

  v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC10PodcastsUI19TextFieldAlertSheet_size);
  v4 = *(_QWORD *)((char *)&self->super.super.super._responderFlags
                 + OBJC_IVAR____TtC10PodcastsUI19TextFieldAlertSheet_size);
  v5 = (objc_class *)type metadata accessor for SheetView();
  v6 = (char *)objc_allocWithZone(v5);
  v7 = &v6[OBJC_IVAR____TtC10PodcastsUI9SheetView_sizeRestrictions];
  *(_QWORD *)v7 = v3;
  *((_QWORD *)v7 + 1) = v4;
  *((_QWORD *)v7 + 2) = v3;
  *((_QWORD *)v7 + 3) = v4;
  v10.receiver = v6;
  v10.super_class = v5;
  v8 = self;
  v9 = -[TextFieldAlertSheet initWithFrame:](&v10, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  -[TextFieldAlertSheet setView:](v8, sel_setView_, v9, v10.receiver, v10.super_class);

}

- (_TtC10PodcastsUI19TextFieldAlertSheet)initWithCoder:(id)a3
{
  _TtC10PodcastsUI19TextFieldAlertSheet *result;

  result = (_TtC10PodcastsUI19TextFieldAlertSheet *)sub_1DA670570();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC10PodcastsUI19TextFieldAlertSheet *v2;

  v2 = self;
  sub_1DA51FCBC();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  uint64_t v5;
  uint64_t ObjectType;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TextFieldAlertSheet();
  v4 = (char *)v7.receiver;
  -[TextFieldAlertSheet viewWillAppear:](&v7, sel_viewWillAppear_, v3);
  v5 = *(_QWORD *)&v4[OBJC_IVAR____TtC10PodcastsUI19TextFieldAlertSheet_inputField + 8];
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(ObjectType, v5);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10PodcastsUI19TextFieldAlertSheet_inputField));
}

@end

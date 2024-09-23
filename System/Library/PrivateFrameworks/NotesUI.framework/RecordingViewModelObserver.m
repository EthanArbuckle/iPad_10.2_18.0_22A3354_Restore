@implementation RecordingViewModelObserver

- (void)viewModelDidUpdate:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC7NotesUIP33_931ED5D202064EE3B683A14E2BAF530A26RecordingViewModelObserver *v8;
  uint64_t v9;

  v4 = sub_1ACA3F45C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1ACA3F42C();
  v8 = self;
  sub_1AC96031C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC7NotesUIP33_931ED5D202064EE3B683A14E2BAF530A26RecordingViewModelObserver)init
{
  _QWORD *v3;
  objc_class *v4;
  objc_super v6;

  *((_BYTE *)&self->super.isa
  + OBJC_IVAR____TtC7NotesUIP33_931ED5D202064EE3B683A14E2BAF530A26RecordingViewModelObserver_isShowingPlaceholder) = 0;
  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC7NotesUIP33_931ED5D202064EE3B683A14E2BAF530A26RecordingViewModelObserver_delegate);
  v4 = (objc_class *)type metadata accessor for RecordingViewModelObserver();
  v3[1] = 0;
  v3[2] = 0;
  *v3 = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return -[RecordingViewModelObserver init](&v6, sel_init);
}

- (void).cxx_destruct
{
  sub_1AC964110(*(void **)((char *)&self->super.isa+ OBJC_IVAR____TtC7NotesUIP33_931ED5D202064EE3B683A14E2BAF530A26RecordingViewModelObserver_delegate), *(_QWORD *)&self->isShowingPlaceholder[OBJC_IVAR____TtC7NotesUIP33_931ED5D202064EE3B683A14E2BAF530A26RecordingViewModelObserver_delegate], *(void **)&self->delegate[OBJC_IVAR____TtC7NotesUIP33_931ED5D202064EE3B683A14E2BAF530A26RecordingViewModelObserver_delegate+ 7]);
}

@end

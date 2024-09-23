@implementation TranscriptViewController

- (_TtC7NotesUI24TranscriptViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AC986C24();
}

- (void)loadView
{
  _TtC7NotesUI24TranscriptViewController *v2;

  v2 = self;
  sub_1AC980E08();

}

- (void)dealloc
{
  void *v3;
  _TtC7NotesUI24TranscriptViewController *v4;
  objc_super v5;

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7NotesUI24TranscriptViewController_interactionTimer);
  v4 = self;
  if (v3)
    objc_msgSend(v3, sel_invalidate);
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TranscriptViewController();
  -[TranscriptViewController dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NotesUI24TranscriptViewController____lazy_storage___scrollViewResizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NotesUI24TranscriptViewController_selectionFeedbackGenerator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NotesUI24TranscriptViewController_selectActiveSegmentGR));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NotesUI24TranscriptViewController_longPressRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NotesUI24TranscriptViewController_interactionTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NotesUI24TranscriptViewController_audioController));
  sub_1AC986AE4(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC7NotesUI24TranscriptViewController_representableAdapter), *(_QWORD *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC7NotesUI24TranscriptViewController_representableAdapter));
  swift_release();
  sub_1AC7C3AB0((uint64_t)self + OBJC_IVAR____TtC7NotesUI24TranscriptViewController_lastScrolledDate, &qword_1ED6E80C0);
  sub_1AC7C3AB0((uint64_t)self + OBJC_IVAR____TtC7NotesUI24TranscriptViewController_activeSegment, (uint64_t *)&unk_1EECA31C0);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TranscriptViewController();
  v4 = v8.receiver;
  -[TranscriptViewController viewWillAppear:](&v8, sel_viewWillAppear_, v3);
  sub_1AC981408();
  v5 = objc_msgSend(v4, sel_view, v8.receiver, v8.super_class);
  if (v5)
  {
    v6 = v5;
    type metadata accessor for TranscriptView();
    objc_msgSend((id)swift_dynamicCastClassUnconditional(), sel_setScrollsToTop_, 1);

    v7 = sub_1AC9805A4();
    objc_msgSend(v7, sel_startAutoResizing);

  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TranscriptViewController();
  v4 = v6.receiver;
  -[TranscriptViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
  v5 = sub_1AC9805A4();
  objc_msgSend(v5, sel_stopAutoResizing, v6.receiver, v6.super_class);

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  _TtC7NotesUI24TranscriptViewController *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED6E80C0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC7NotesUI24TranscriptViewController_currentlyDragging) = 1;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC7NotesUI24TranscriptViewController_currentlyScrolling) = 1;
  v8 = a3;
  v9 = self;
  sub_1ACA3F9B4();
  v10 = sub_1ACA3F9C0();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 0, 1, v10);
  v11 = (uint64_t)v9 + OBJC_IVAR____TtC7NotesUI24TranscriptViewController_lastScrolledDate;
  swift_beginAccess();
  sub_1AC987078((uint64_t)v7, v11);
  swift_endAccess();

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  id v11;
  _TtC7NotesUI24TranscriptViewController *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED6E80C0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (char *)self + OBJC_IVAR____TtC7NotesUI24TranscriptViewController_previousContentOffset;
  *(_QWORD *)v10 = 0;
  *((_QWORD *)v10 + 1) = 0;
  v10[16] = 1;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC7NotesUI24TranscriptViewController_currentlyDragging) = 0;
  v11 = a3;
  v12 = self;
  sub_1ACA3F9B4();
  v13 = sub_1ACA3F9C0();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v9, 0, 1, v13);
  v14 = (uint64_t)v12 + OBJC_IVAR____TtC7NotesUI24TranscriptViewController_lastScrolledDate;
  swift_beginAccess();
  sub_1AC987078((uint64_t)v9, v14);
  swift_endAccess();

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  _TtC7NotesUI24TranscriptViewController *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED6E80C0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC7NotesUI24TranscriptViewController_currentlyScrolling) = 0;
  v8 = a3;
  v9 = self;
  sub_1ACA3F9B4();
  v10 = sub_1ACA3F9C0();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 0, 1, v10);
  v11 = (uint64_t)v9 + OBJC_IVAR____TtC7NotesUI24TranscriptViewController_lastScrolledDate;
  swift_beginAccess();
  sub_1AC987078((uint64_t)v7, v11);
  swift_endAccess();

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _TtC7NotesUI24TranscriptViewController *v10;

  v4 = a3;
  v10 = self;
  objc_msgSend(v4, sel_contentOffset);
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, sel_contentSize);
  sub_1AC98197C(v4, v6, v8, v9);

}

- (void)audioPlaybackTimeDidChangeWithNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC7NotesUI24TranscriptViewController *v8;
  uint64_t v9;

  v4 = sub_1ACA3F45C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1ACA3F42C();
  v8 = self;
  sub_1AC983968();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)audioDidPlayWithNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _TtC7NotesUI24TranscriptViewController *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;

  v4 = sub_1ACA3F45C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1ACA3F42C();
  v8 = qword_1EEC9F370;
  v9 = self;
  if (v8 != -1)
    swift_once();
  v10 = sub_1ACA405CC();
  __swift_project_value_buffer(v10, (uint64_t)qword_1EECA3050);
  v11 = sub_1ACA405C0();
  v12 = sub_1ACA42408();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1AC7A1000, v11, v12, "Transcript State Machine: Received audio did play, waiting for audioPlaybackTimeDidChange.", v13, 2u);
    MEMORY[0x1AF446574](v13, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)audioDidPauseWithNotification:(id)a3
{
  sub_1AC984234(self, (uint64_t)a2, (uint64_t)a3, sub_1AC983DEC);
}

- (void)audioDidStopWithNotification:(id)a3
{
  sub_1AC984234(self, (uint64_t)a2, (uint64_t)a3, sub_1AC983F8C);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)tap:(id)a3
{
  id v4;
  _TtC7NotesUI24TranscriptViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1AC98546C(v4);

}

- (void)longPress:(void *)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  char *v7;
  id v8;
  id v9;

  v4 = OBJC_IVAR____TtC7NotesUI24TranscriptViewController_interactionTimer;
  v5 = *(void **)&a1[OBJC_IVAR____TtC7NotesUI24TranscriptViewController_interactionTimer];
  v6 = a3;
  v7 = a1;
  objc_msgSend(v5, sel_invalidate);
  v8 = objc_msgSend((id)objc_opt_self(), sel_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_, v7, sel_inactivityTimerFired, 0, 0, 5.0);
  v9 = *(id *)&a1[v4];
  *(_QWORD *)&a1[v4] = v8;

}

- (void)userDidInteract
{
  uint64_t v3;
  void *v4;
  _TtC7NotesUI24TranscriptViewController *v5;
  objc_class *v6;
  id v7;

  v3 = OBJC_IVAR____TtC7NotesUI24TranscriptViewController_interactionTimer;
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7NotesUI24TranscriptViewController_interactionTimer);
  v5 = self;
  objc_msgSend(v4, sel_invalidate);
  v6 = (objc_class *)objc_msgSend((id)objc_opt_self(), sel_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_, v5, sel_inactivityTimerFired, 0, 0, 5.0);
  v7 = *(Class *)((char *)&self->super.super.super.isa + v3);
  *(Class *)((char *)&self->super.super.super.isa + v3) = v6;

}

- (void)inactivityTimerFired
{
  _TtC7NotesUI24TranscriptViewController *v2;

  v2 = self;
  sub_1AC985858();

}

- (_TtC7NotesUI24TranscriptViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NotesUI24TranscriptViewController *result;

  v4 = a4;
  result = (_TtC7NotesUI24TranscriptViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (double)topInsetForResizer:(id)a3
{
  id v4;
  _TtC7NotesUI24TranscriptViewController *v5;
  id v6;
  double result;
  void *v8;
  double v9;
  double v10;

  v4 = a3;
  v5 = self;
  v6 = -[TranscriptViewController view](v5, sel_view);
  if (v6)
  {
    v8 = v6;
    type metadata accessor for TranscriptView();
    objc_msgSend((id)swift_dynamicCastClassUnconditional(), sel_textContainerInset);
    v10 = v9;

    return v10;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (double)consumedBottomAreaForResizer:(id)a3
{
  id v4;
  _TtC7NotesUI24TranscriptViewController *v5;
  double v6;
  double v7;

  v4 = a3;
  v5 = self;
  sub_1AC986E1C();
  v7 = v6;

  return v7;
}

- (id)keyboardResizerScrollView
{
  _TtC7NotesUI24TranscriptViewController *v2;
  id result;

  v2 = self;
  result = -[TranscriptViewController view](v2, sel_view);
  if (result)
  {

    type metadata accessor for TranscriptView();
    return (id)swift_dynamicCastClassUnconditional();
  }
  else
  {
    __break(1u);
  }
  return result;
}

@end

@implementation ICSystemPaperViewController

- (ICSystemPaperViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (ICSystemPaperViewController *)sub_100312D7C(v5, v7, a4);
}

- (ICSystemPaperViewController)initWithCoder:(id)a3
{
  return (ICSystemPaperViewController *)sub_100313324(a3);
}

+ (id)newSystemPaperViewController
{
  return (id)sub_10032200C(0, (uint64_t)_swiftEmptyArrayStorage);
}

+ (id)newSystemPaperViewControllerWithIncomingLink:(id)a3 incomingImageData:(id)a4
{
  uint64_t v5;
  id v6;
  void *v7;

  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for Data);
  v6 = a3;
  v7 = (void *)sub_10032200C(a3, v5);

  swift_bridgeObjectRelease(v5);
  return v7;
}

- (void)viewDidLoad
{
  ICSystemPaperViewController *v2;

  v2 = self;
  sub_1003145A0();

}

- (void)viewWillAppear:(BOOL)a3
{
  ICSystemPaperViewController *v4;

  v4 = self;
  sub_100315E30(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  ICSystemPaperViewController *v4;

  v4 = self;
  sub_100315F50(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  ICSystemPaperViewController *v4;

  v4 = self;
  sub_1003167FC(a3);

}

- (void)deleteCurrentNote
{
  ICSystemPaperViewController *v2;

  v2 = self;
  sub_100317908();

}

- (BOOL)shouldShowModernAccountAlert
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___ICSystemPaperViewController_shouldShowModernAccountAlert);
}

- (void)setShouldShowModernAccountAlert:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___ICSystemPaperViewController_shouldShowModernAccountAlert) = a3;
}

- (ICNote)currentNote
{
  id v2;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___ICSystemPaperViewController_currentNoteEditorViewController);
  if (v2)
    v2 = objc_msgSend(v2, "note");
  return (ICNote *)v2;
}

- (void)setCurrentNote:(id)a3
{
  ICSystemPaperViewController *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_100318A54(a3, 0, 0, 0, 0);

}

- (void)setCurrentNote:(id)a3 animated:(BOOL)a4 direction:(int64_t)a5 setEditing:(BOOL)a6 showInkPicker:(BOOL)a7
{
  _BOOL4 v8;
  _BOOL4 v10;
  id v13;
  ICSystemPaperViewController *v14;

  v8 = a6;
  v10 = a4;
  v13 = a3;
  v14 = self;
  sub_100318A54(a3, v10, a5, v8, a7);

}

- (ICNoteEditorViewController)currentNoteEditorViewController
{
  return (ICNoteEditorViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                               + OBJC_IVAR___ICSystemPaperViewController_currentNoteEditorViewController));
}

- (void)setCurrentNoteEditorViewController:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___ICSystemPaperViewController_currentNoteEditorViewController);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___ICSystemPaperViewController_currentNoteEditorViewController) = (Class)a3;
  v3 = a3;

}

- (ICViewControllerManager)viewControllerManager
{
  return (ICViewControllerManager *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR___ICSystemPaperViewController_viewControllerManager);
}

- (void)setViewControllerManager:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___ICSystemPaperViewController_viewControllerManager, a3);
}

- (UIImageView)launchImageView
{
  return (UIImageView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                + OBJC_IVAR___ICSystemPaperViewController_launchImageView));
}

- (void)setLaunchImageView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICSystemPaperViewController_launchImageView);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICSystemPaperViewController_launchImageView) = (Class)a3;
  v3 = a3;

}

- (UIButton)doneButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR___ICSystemPaperViewController_doneButton));
}

- (void)setDoneButton:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICSystemPaperViewController_doneButton);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICSystemPaperViewController_doneButton) = (Class)a3;
  v3 = a3;

}

- (UIButton)newNoteButton
{
  return (UIButton *)objc_retain(*(id *)((char *)&self->super.super.super.isa
                                       + OBJC_IVAR___ICSystemPaperViewController_newNoteButton));
}

- (void)setNewNoteButton:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICSystemPaperViewController_newNoteButton);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICSystemPaperViewController_newNoteButton) = (Class)a3;
  v3 = a3;

}

- (UIButton)moreButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR___ICSystemPaperViewController_moreButton));
}

- (void)setMoreButton:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICSystemPaperViewController_moreButton);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICSystemPaperViewController_moreButton) = (Class)a3;
  v3 = a3;

}

- (UIButton)backToNotesButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR___ICSystemPaperViewController_backToNotesButton));
}

- (void)setBackToNotesButton:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICSystemPaperViewController_backToNotesButton);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICSystemPaperViewController_backToNotesButton) = (Class)a3;
  v3 = a3;

}

- (UIView)pageContainerView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR___ICSystemPaperViewController_pageContainerView));
}

- (void)setPageContainerView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICSystemPaperViewController_pageContainerView);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICSystemPaperViewController_pageContainerView) = (Class)a3;
  v3 = a3;

}

- (UIPageControl)pageControl
{
  return (UIPageControl *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                  + OBJC_IVAR___ICSystemPaperViewController_pageControl));
}

- (void)setPageControl:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICSystemPaperViewController_pageControl);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICSystemPaperViewController_pageControl) = (Class)a3;
  v3 = a3;

}

- (UIButton)paletteButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR___ICSystemPaperViewController_paletteButton));
}

- (void)setPaletteButton:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICSystemPaperViewController_paletteButton);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICSystemPaperViewController_paletteButton) = (Class)a3;
  v3 = a3;

}

- (void)didTapScreenshotButton:(id)a3
{
  sub_10031FD9C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD *))sub_10031DB14);
}

- (void)didTapDoneButton:(id)a3
{
  id v4;
  ICSystemPaperViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1003222AC();

}

- (void)didTapPaletteButton:(id)a3
{
  id v4;
  ICSystemPaperViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10032240C();

}

- (void)backToNotesWithKeyboard
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  ICSystemPaperViewController *v8;

  v2 = qword_1005CEC88;
  v8 = self;
  if (v2 != -1)
    swift_once(&qword_1005CEC88, sub_100312D34);
  v3 = type metadata accessor for Logger(0);
  v4 = sub_10012A0B0(v3, (uint64_t)qword_1005D8C80);
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Going back to notes with keyboard", v7, 2u);
    swift_slowDealloc(v7, -1, -1);
  }

  sub_10031ED08();
}

- (void)didTapBackToNotes:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  ICSystemPaperViewController *v11;

  v4 = qword_1005CEC88;
  v5 = a3;
  v11 = self;
  if (v4 != -1)
    swift_once(&qword_1005CEC88, sub_100312D34);
  v6 = type metadata accessor for Logger(0);
  v7 = sub_10012A0B0(v6, (uint64_t)qword_1005D8C80);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Tapped back to notes button", v10, 2u);
    swift_slowDealloc(v10, -1, -1);
  }

  sub_10031ED08();
}

- (void)didTapAddNoteButton:(id)a3 event:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  ICSystemPaperViewController *v14;

  v6 = qword_1005CEC88;
  v7 = a3;
  v8 = a4;
  v14 = self;
  if (v6 != -1)
    swift_once(&qword_1005CEC88, sub_100312D34);
  v9 = type metadata accessor for Logger(0);
  v10 = sub_10012A0B0(v9, (uint64_t)qword_1005D8C80);
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Tapped add note button", v13, 2u);
    swift_slowDealloc(v13, -1, -1);
  }

  sub_100318704(v8);
}

- (void)openNotesSettings:(id)a3
{
  sub_10031FD9C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD *))sub_10031FC1C);
}

- (void)prepareForSegue:(id)a3 sender:(id)a4
{
  id v7;
  ICSystemPaperViewController *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  ICSystemPaperViewController *v12;
  _OWORD v13[2];

  if (a4)
  {
    v7 = a3;
    v8 = self;
    swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v13, v9);
    swift_unknownObjectRelease(a4, v10);
  }
  else
  {
    memset(v13, 0, sizeof(v13));
    v11 = a3;
    v12 = self;
  }
  sub_10031FE0C(a3);

  sub_100012DDC((uint64_t)v13, &qword_1005CF190);
}

- (void)toolPickerVisibilityDidChange:(id)a3
{
  id v4;
  ICSystemPaperViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100316F0C();
  sub_1003157DC();

}

- (id)inkPaletteButtonViewWithInkPaletteController:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR___ICSystemPaperViewController_paletteButton));
}

- (BOOL)canSwipeInDirection:(int64_t)a3
{
  ICSystemPaperViewController *v4;

  v4 = self;
  LOBYTE(a3) = sub_1003200F4(a3);

  return a3 & 1;
}

- (void)synthesizeSwipeForDirection:(int64_t)a3
{
  ICSystemPaperViewController *v4;

  v4 = self;
  sub_100320428(a3);

}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___ICSystemPaperViewController_toolPickerForWindow);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICSystemPaperViewController_pageControlFadeOutTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICSystemPaperViewController_editorViewControllerUpdateDispatchQueue));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICSystemPaperViewController_editorViewControllerUpdateSemaphore));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___ICSystemPaperViewController_emptyNoteIds));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___ICSystemPaperViewController_incomingImageData));
  sub_100012DDC((uint64_t)self + OBJC_IVAR___ICSystemPaperViewController_launchPreview, (uint64_t *)&unk_1005D8FA0);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___ICSystemPaperViewController_editorCachePool));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___ICSystemPaperViewController_subscriptions));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICSystemPaperViewController____lazy_storage___indexer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICSystemPaperViewController_currentNoteEditorViewController));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___ICSystemPaperViewController_viewControllerManager);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICSystemPaperViewController_toolPickerBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICSystemPaperViewController_toolPickerBackgroundViewBottomConstraint));
}

- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  id v6;
  id v7;
  ICSystemPaperViewController *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_100322570(v7);

  return v9;
}

- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  id v6;
  id v7;
  ICSystemPaperViewController *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_100322778(v7);

  return v9;
}

- (void)pageViewController:(id)a3 willTransitionToViewControllers:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  ICSystemPaperViewController *v10;

  v7 = sub_1000163BC(0, &qword_1005D3D50, UIViewController_ptr);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = a3;
  v10 = self;
  sub_100322980(v8);

  swift_bridgeObjectRelease(v8);
}

- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6
{
  uint64_t v11;
  uint64_t v12;
  id v13;
  ICSystemPaperViewController *v14;

  v11 = sub_1000163BC(0, &qword_1005D3D50, UIViewController_ptr);
  v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a5, v11);
  v13 = a3;
  v14 = self;
  sub_100322CB8(a4, v12, a6);

  swift_bridgeObjectRelease(v12);
}

- (void)indexer:(id)a3 didChangeContentWithDifference:(id)a4 controller:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  ICSystemPaperViewController *v15;
  uint64_t v16;

  v9 = sub_100012E18((uint64_t *)&unk_1005D8F30);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static CollectionDifference._unconditionallyBridgeFromObjectiveC(_:)(a4, (char *)&type metadata for Any + 8);
  v13 = a3;
  v14 = a5;
  v15 = self;
  sub_1003231CC();

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

@end

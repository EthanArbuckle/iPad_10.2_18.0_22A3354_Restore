@implementation CRLiOSMediaReplacer

- (_TtC8Freeform19CRLiOSMediaReplacer)init
{
  _TtC8Freeform19CRLiOSMediaReplacer *result;

  result = (_TtC8Freeform19CRLiOSMediaReplacer *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLiOSMediaReplacer", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform19CRLiOSMediaReplacer_interactiveCanvasController));

  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform19CRLiOSMediaReplacer_pickerList);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform19CRLiOSMediaReplacer_photoPicker);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform19CRLiOSMediaReplacer_photoPickerLoadingProgress));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform19CRLiOSMediaReplacer_filePicker);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform19CRLiOSMediaReplacer_cameraPicker);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform19CRLiOSMediaReplacer_stickerPicker);

}

- (void)showMediaReplacerForMediaReplacingRep:(id)a3
{
  id v4;
  _TtC8Freeform19CRLiOSMediaReplacer *v5;

  v4 = a3;
  v5 = self;
  sub_100875394(v4);

}

- (void)hideMediaReplacerWithCompletionBlock:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  _TtC8Freeform19CRLiOSMediaReplacer *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject(&unk_101283448, 24, 7);
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_100565828;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_100876A08((uint64_t)v7, v6);
  sub_1004C1024((uint64_t)v7, v6);

}

- (BOOL)isShowingUI
{
  _TtC8Freeform19CRLiOSMediaReplacer *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_100876CAC();

  return v3;
}

- (void)presentGenerativePlayground:(id)a3
{
  sub_100876F48(self, (uint64_t)a2, (uint64_t)a3, 0);
}

- (void)presentGenerativePlaygroundForCurrentSelection:(id)a3
{
  sub_100876F48(self, (uint64_t)a2, (uint64_t)a3, 1);
}

- (void)generativePlaygroundHelper:(id)a3 didCreateImageAt:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC8Freeform19CRLiOSMediaReplacer *v12;
  uint64_t v13;

  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10087B590((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)generativePlaygroundHelperDidCancel:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _TtC8Freeform19CRLiOSMediaReplacer *v9;
  id v10;
  _TtC8Freeform19CRLiOSMediaReplacer *v11;
  id v12;

  v5 = OBJC_IVAR____TtC8Freeform19CRLiOSMediaReplacer_gpHelper;
  v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform19CRLiOSMediaReplacer_gpHelper);
  if (v6)
  {
    v7 = *(void **)(v6 + OBJC_IVAR____TtC8Freeform29CRLGenerativePlaygroundHelper_viewController);
    v8 = a3;
    v9 = self;
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);
    v12 = *(Class *)((char *)&self->super.isa + v5);
  }
  else
  {
    v10 = a3;
    v11 = self;
    v12 = 0;
  }
  *(Class *)((char *)&self->super.isa + v5) = 0;

}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC8Freeform19CRLiOSMediaReplacer *v10;

  v7 = type metadata accessor for URL(0);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = a3;
  v10 = self;
  sub_100878038(v9, v8);

  swift_bridgeObjectRelease();
}

- (void)documentPickerWasCancelled:(id)a3
{
  id v4;
  _TtC8Freeform19CRLiOSMediaReplacer *v5;

  v4 = a3;
  v5 = self;
  sub_100878848(v4);

}

- (void)imagePickerControllerDidCancel:(id)a3
{
  id v4;
  _TtC8Freeform19CRLiOSMediaReplacer *v5;

  v4 = a3;
  v5 = self;
  sub_100878ABC(v4);

}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC8Freeform19CRLiOSMediaReplacer *v12;

  type metadata accessor for InfoKey(0);
  v8 = v7;
  v9 = sub_1005034A0(&qword_1013DEE20, 255, (uint64_t (*)(uint64_t))type metadata accessor for InfoKey, (uint64_t)&unk_100EF45F0);
  v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, v8, (char *)&type metadata for Any + 8, v9);
  v11 = a3;
  v12 = self;
  sub_100878D48(v11, v10);

  swift_bridgeObjectRelease();
}

- (void)prepareForPopoverPresentation:(id)a3
{
  id v4;
  _TtC8Freeform19CRLiOSMediaReplacer *v5;

  v4 = a3;
  v5 = self;
  sub_10087A328(v4);

}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  id v8;
  _TtC8Freeform19CRLiOSMediaReplacer *v9;

  v8 = a3;
  v9 = self;
  sub_10087B734(&a4->origin.x, a5);

}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;
  _TtC8Freeform19CRLiOSMediaReplacer *v5;

  v4 = a3;
  v5 = self;
  sub_10087A694(v4);

}

- (void)insertStickerFromItemProvider:(id)a3 completionHandler:(id)a4
{
  void *v6;
  id v7;
  _TtC8Freeform19CRLiOSMediaReplacer *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_10087B9C8(v7, v8, v6);
  _Block_release(v6);
  _Block_release(v6);

}

@end

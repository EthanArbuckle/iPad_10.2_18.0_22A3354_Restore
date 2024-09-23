@implementation PaperDocumentDelegate

- (BOOL)documentCanBeEdited:(id)a3
{
  id v4;
  _TtC8PaperKit21PaperDocumentDelegate *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = specialized PaperDocumentDelegate.documentCanBeEdited(_:)();

  return self & 1;
}

- (void)pdfDocument:(id)a3 detectedAnnotations:(id)a4 forPage:(id)a5
{
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  _TtC8PaperKit21PaperDocumentDelegate *v13;
  id v14;

  type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for PDFAnnotation);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = MEMORY[0x1DF0E666C]((char *)self + OBJC_IVAR____TtC8PaperKit21PaperDocumentDelegate_documentView);
  if (v9)
  {
    v10 = (void *)v9;
    type metadata accessor for PaperKitPDFPage(0);
    v11 = (void *)swift_dynamicCastClassUnconditional();
    v14 = a3;
    v12 = a5;
    v13 = self;
    PaperDocumentView.addFormFields(_:for:)(v8, v11);

    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (void)pdfDocument:(id)a3 handleTabFrom:(id)a4 direction:(unint64_t)a5
{
  id v8;
  id v9;
  _TtC8PaperKit21PaperDocumentDelegate *v10;

  v8 = a3;
  v9 = a4;
  v10 = self;
  specialized PaperDocumentDelegate.pdfDocument(_:handleTabFrom:direction:)(v9, a5);

}

- (void)PDFView:(id)a3 allowsFormFillingMode:(BOOL)a4 forPage:(id)a5
{
  id v8;
  id v9;
  _TtC8PaperKit21PaperDocumentDelegate *v10;

  v8 = a3;
  v9 = a5;
  v10 = self;
  specialized PaperDocumentDelegate.pdfView(_:allowsFormFillingMode:for:)(a4);

}

- (void)PDFView:(id)a3 allowsFormFillingMode:(BOOL)a4 withAutofill:(BOOL)a5 forPage:(id)a6
{
  id v10;
  id v11;
  _TtC8PaperKit21PaperDocumentDelegate *v12;

  v10 = a3;
  v11 = a6;
  v12 = self;
  specialized PaperDocumentDelegate.pdfView(_:allowsFormFillingMode:withAutofill:for:)(a4, a5);

}

- (void)PDFView:(id)a3 allowsFormFillingMode:(BOOL)a4 withRecognitionConfidence:(unint64_t)a5 forPage:(id)a6
{
  id v10;
  id v11;
  _TtC8PaperKit21PaperDocumentDelegate *v12;

  v10 = a3;
  v11 = a6;
  v12 = self;
  specialized PaperDocumentDelegate.pdfView(_:allowsFormFillingMode:with:for:)(a4, a5);

}

- (void)pdfDocument:(id)a3 didReceiveAnalysis:(id)a4 forPage:(id)a5
{
  id v8;
  id v9;
  _TtC8PaperKit21PaperDocumentDelegate *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  v10 = self;
  specialized PaperDocumentDelegate.pdfDocument(_:didReceive:for:)(v8);

}

- (BOOL)respondsToSelector:(SEL)a3
{
  _TtC8PaperKit21PaperDocumentDelegate *v5;
  BOOL v6;
  _TtC8PaperKit21PaperDocumentDelegate *v7;
  objc_super v9;

  if (!a3)
  {
    v7 = self;
    goto LABEL_5;
  }
  v5 = self;
  if ((static Selector.== infix(_:_:)() & 1) == 0)
  {
LABEL_5:
    v9.receiver = self;
    v9.super_class = (Class)type metadata accessor for PaperDocumentDelegate();
    v6 = -[PaperDocumentDelegate respondsToSelector:](&v9, sel_respondsToSelector_, a3);

    return v6;
  }

  return 1;
}

- (void)PDFViewWillClickOnLink:(id)a3 withURL:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC8PaperKit21PaperDocumentDelegate *v12;
  uint64_t v13;

  v6 = type metadata accessor for URL();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = a3;
  v12 = self;
  specialized PaperDocumentDelegate.pdfViewWillClick(onLink:with:)((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)documentCameraViewController:(id)a3 didFinishWithScan:(id)a4
{
  uint64_t v7;
  void *v8;
  void (*v9)(id);
  id v10;
  id v11;
  _TtC8PaperKit21PaperDocumentDelegate *v12;

  v7 = MEMORY[0x1DF0E666C]((char *)self + OBJC_IVAR____TtC8PaperKit21PaperDocumentDelegate_documentView, a2);
  if (v7)
  {
    v8 = (void *)v7;
    v9 = *(void (**)(id))(v7 + OBJC_IVAR____TtC8PaperKit17PaperDocumentView_docScanDismissBlock);
    v10 = a3;
    v11 = a4;
    v12 = self;
    outlined copy of ModifiedContent<MiniButton<<<opaque return type of View.popover<A>(isPresented:attachmentAnchor:content:)>>.0>, _FrameLayout>?((uint64_t)v9);

    if (v9)
    {
      v9(v11);
      outlined consume of (@escaping @callee_guaranteed () -> ())?((uint64_t)v9);
    }

  }
}

- (void)documentCameraViewControllerDidCancel:(id)a3
{
  uint64_t v5;
  void *v6;
  void (*v7)(_QWORD);
  id v8;
  _TtC8PaperKit21PaperDocumentDelegate *v9;

  v5 = MEMORY[0x1DF0E666C]((char *)self + OBJC_IVAR____TtC8PaperKit21PaperDocumentDelegate_documentView, a2);
  if (v5)
  {
    v6 = (void *)v5;
    v7 = *(void (**)(_QWORD))(v5 + OBJC_IVAR____TtC8PaperKit17PaperDocumentView_docScanDismissBlock);
    v8 = a3;
    v9 = self;
    outlined copy of ModifiedContent<MiniButton<<<opaque return type of View.popover<A>(isPresented:attachmentAnchor:content:)>>.0>, _FrameLayout>?((uint64_t)v7);

    if (v7)
    {
      v7(0);
      outlined consume of (@escaping @callee_guaranteed () -> ())?((uint64_t)v7);
    }

  }
}

- (void)documentCameraViewController:(id)a3 didFailWithError:(id)a4
{
  uint64_t v7;
  void *v8;
  void (*v9)(_QWORD);
  id v10;
  _TtC8PaperKit21PaperDocumentDelegate *v11;
  id v12;

  v7 = MEMORY[0x1DF0E666C]((char *)self + OBJC_IVAR____TtC8PaperKit21PaperDocumentDelegate_documentView, a2);
  if (v7)
  {
    v8 = (void *)v7;
    v9 = *(void (**)(_QWORD))(v7 + OBJC_IVAR____TtC8PaperKit17PaperDocumentView_docScanDismissBlock);
    v10 = a3;
    v12 = a4;
    v11 = self;
    outlined copy of ModifiedContent<MiniButton<<<opaque return type of View.popover<A>(isPresented:attachmentAnchor:content:)>>.0>, _FrameLayout>?((uint64_t)v9);

    if (v9)
    {
      v9(0);
      outlined consume of (@escaping @callee_guaranteed () -> ())?((uint64_t)v9);
    }

  }
}

- (BOOL)canvasView:(id)a3 shouldBeginDrawingWithTouch:(id)a4
{
  return 1;
}

- (void)canvasViewDidBeginDrawing:(id)a3
{
  id v4;
  _TtC8PaperKit21PaperDocumentDelegate *v5;

  v4 = a3;
  v5 = self;
  specialized PaperDocumentDelegate.canvasViewDidBeginDrawing(_:)();

}

- (void)canvasViewDidEndDrawing:(id)a3
{
  id v4;
  _TtC8PaperKit21PaperDocumentDelegate *v5;

  v4 = a3;
  v5 = self;
  specialized PaperDocumentDelegate.canvasViewDidEndDrawing(_:)();

}

- (_TtC8PaperKit21PaperDocumentDelegate)init
{
  _TtC8PaperKit21PaperDocumentDelegate *result;

  result = (_TtC8PaperKit21PaperDocumentDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end

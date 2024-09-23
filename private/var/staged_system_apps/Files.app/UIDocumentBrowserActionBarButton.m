@implementation UIDocumentBrowserActionBarButton

- (UIDocumentBrowserAction)docAction
{
  return (UIDocumentBrowserAction *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                            + OBJC_IVAR____TtC5Files32UIDocumentBrowserActionBarButton_docAction));
}

- (void)setDocAction:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Files32UIDocumentBrowserActionBarButton_docAction);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files32UIDocumentBrowserActionBarButton_docAction) = (Class)a3;
  v3 = a3;

}

- (_TtC5Files32UIDocumentBrowserActionBarButton)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files32UIDocumentBrowserActionBarButton_docAction) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UIDocumentBrowserActionBarButton();
  return -[UIDocumentBrowserActionBarButton init](&v3, "init");
}

- (_TtC5Files32UIDocumentBrowserActionBarButton)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files32UIDocumentBrowserActionBarButton_docAction) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for UIDocumentBrowserActionBarButton();
  return -[UIDocumentBrowserActionBarButton initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files32UIDocumentBrowserActionBarButton_docAction));
}

@end

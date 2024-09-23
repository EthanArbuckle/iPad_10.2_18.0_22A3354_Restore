@implementation WebViewWarmer

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  void (*v4)(uint64_t);
  id v7;
  id v8;
  uint64_t v9;
  _TtC17PromotedContentUIP33_F33E7C2993C44F3307C22CD11BA85E0E13WebViewWarmer *v10;

  v4 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtC17PromotedContentUIP33_F33E7C2993C44F3307C22CD11BA85E0E13WebViewWarmer_finished);
  if (v4)
  {
    v7 = a3;
    v8 = a4;
    v10 = self;
    v9 = sub_1B12EACC0((uint64_t)v4);
    v4(v9);
    sub_1B12C41A0((uint64_t)v4);

  }
}

- (_TtC17PromotedContentUIP33_F33E7C2993C44F3307C22CD11BA85E0E13WebViewWarmer)init
{
  objc_class *ObjectType;
  _QWORD *v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC17PromotedContentUIP33_F33E7C2993C44F3307C22CD11BA85E0E13WebViewWarmer_finished);
  *v4 = 0;
  v4[1] = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return -[WebViewWarmer init](&v6, sel_init);
}

- (void).cxx_destruct
{
  sub_1B12C41A0(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC17PromotedContentUIP33_F33E7C2993C44F3307C22CD11BA85E0E13WebViewWarmer_finished));
}

@end

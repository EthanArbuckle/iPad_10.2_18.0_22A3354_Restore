@implementation RUITextActivityIndicatorView

- (_TtC8RemoteUI28RUITextActivityIndicatorView)initWithFrame:(CGRect)a3
{
  return (_TtC8RemoteUI28RUITextActivityIndicatorView *)sub_209F464A0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8RemoteUI28RUITextActivityIndicatorView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC8RemoteUI28RUITextActivityIndicatorView *result;

  v5 = OBJC_IVAR____TtC8RemoteUI28RUITextActivityIndicatorView_activityIndicator;
  v6 = objc_allocWithZone(MEMORY[0x24BEBD398]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithActivityIndicatorStyle_, 100);
  v8 = OBJC_IVAR____TtC8RemoteUI28RUITextActivityIndicatorView_label;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_init);

  result = (_TtC8RemoteUI28RUITextActivityIndicatorView *)sub_209F677E0();
  __break(1u);
  return result;
}

- (void)startAnimating
{
  sub_209F467E0((char *)self, (uint64_t)a2, (SEL *)&selRef_startAnimating, 0);
}

- (void)stopAnimating
{
  sub_209F467E0((char *)self, (uint64_t)a2, (SEL *)&selRef_stopAnimating, 1);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8RemoteUI28RUITextActivityIndicatorView_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8RemoteUI28RUITextActivityIndicatorView_label));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8RemoteUI28RUITextActivityIndicatorView_stackView));
}

@end

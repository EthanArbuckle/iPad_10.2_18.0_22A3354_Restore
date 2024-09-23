@implementation _SEHostable

- (_SEHostingHandle)handle
{
  return (_SEHostingHandle *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR____SEHostable_handle));
}

- (CALayer)layer
{
  return (CALayer *)objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____SEHostable__context), sel_layer);
}

- (void)setLayer:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____SEHostable__context), sel_setLayer_, a3);
}

- (_SEHostable)init
{
  sub_245DC118C();
}

+ (id)createHostableWithError:(id *)a3
{
  return (id)sub_245DC3F7C();
}

+ (id)createHostableWithOptions:(id)a3 error:(id *)a4
{
  void *v4;

  sub_245DC4C88();
  v4 = (void *)sub_245DC3E08();
  swift_bridgeObjectRelease();
  return v4;
}

- (void)dealloc
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[_SEHostable dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{

}

- (void)invalidate
{
  void *v2;
  _SEHostable *v3;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____SEHostable__invalidationSignal);
  v3 = self;
  if (objc_msgSend(v2, sel_signal))
    objc_msgSend(*(id *)((char *)&v3->super.isa + OBJC_IVAR____SEHostable__context), sel_invalidate);

}

@end

@implementation ObjcSingleFireEvent

- (void)fire
{
  uint64_t v2;
  _TtC20PreviewsFoundationOS19ObjcSingleFireEvent *v3;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC20PreviewsFoundationOS19ObjcSingleFireEvent_event);
  v3 = self;
  sub_2448E0C30(v2);

}

- (void)cancel
{
  _TtC20PreviewsFoundationOS19ObjcSingleFireEvent *v2;

  v2 = self;
  SingleFireEvent.cancel()();

}

- (void)addObserver:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC20PreviewsFoundationOS19ObjcSingleFireEvent *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = _Block_copy(a3);
  v5 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC20PreviewsFoundationOS19ObjcSingleFireEvent_event);
  _Block_copy(v4);
  v6 = self;
  sub_2448E0A54(v5, (void (**)(_QWORD))v4, &v8);
  v7 = v8;
  if (v8)
  {
    sub_2448E1168((uint64_t)&v8);
    sub_2447C6AE8(v7);
  }
  _Block_release(v4);

}

- (BOOL)hasFired
{
  uint64_t v2;
  _TtC20PreviewsFoundationOS19ObjcSingleFireEvent *v3;
  unint64_t v4;
  unint64_t v6;

  v2 = (*(_QWORD **)((char *)&self->super.isa + OBJC_IVAR____TtC20PreviewsFoundationOS19ObjcSingleFireEvent_event))[2];
  v3 = self;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 32));
  sub_2448B02F8((unint64_t *)(v2 + 16), &v6);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 32));
  v4 = v6;
  swift_release();
  sub_2448B0808(v4);

  return v4 == 0;
}

- (_TtC20PreviewsFoundationOS19ObjcSingleFireEvent)init
{
  objc_class *ObjectType;
  uint64_t v4;
  objc_class *v5;
  _TtC20PreviewsFoundationOS19ObjcSingleFireEvent *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = OBJC_IVAR____TtC20PreviewsFoundationOS19ObjcSingleFireEvent_event;
  type metadata accessor for SingleFireEvent();
  v5 = (objc_class *)swift_allocObject();
  v6 = self;
  SingleFireEvent.init(description:)(0, 0);
  *(Class *)((char *)&self->super.isa + v4) = v5;

  v8.receiver = v6;
  v8.super_class = ObjectType;
  return -[ObjcSingleFireEvent init](&v8, sel_init);
}

- (void).cxx_destruct
{
  swift_release();
}

@end

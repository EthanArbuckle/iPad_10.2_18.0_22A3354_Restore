@implementation UVObjCSingleFireEvent

- (UVObjCSingleFireEvent)init
{
  UVObjCSingleFireEvent *v2;
  _TtC20PreviewsFoundationOS19ObjcSingleFireEvent *v3;
  _TtC20PreviewsFoundationOS19ObjcSingleFireEvent *event;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UVObjCSingleFireEvent;
  v2 = -[UVObjCSingleFireEvent init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC20PreviewsFoundationOS19ObjcSingleFireEvent);
    event = v2->_event;
    v2->_event = v3;

  }
  return v2;
}

- (void)fire
{
  -[ObjcSingleFireEvent fire](self->_event, "fire");
}

- (void)cancel
{
  -[ObjcSingleFireEvent cancel](self->_event, "cancel");
}

- (void)addObserver:(id)a3
{
  -[ObjcSingleFireEvent addObserver:](self->_event, "addObserver:", a3);
}

- (BOOL)hasFired
{
  return -[ObjcSingleFireEvent hasFired](self->_event, "hasFired");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
}

@end

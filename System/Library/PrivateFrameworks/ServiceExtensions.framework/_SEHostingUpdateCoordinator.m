@implementation _SEHostingUpdateCoordinator

- (_SEHostingUpdateCoordinator)init
{
  return (_SEHostingUpdateCoordinator *)_SEHostingUpdateCoordinator.init()();
}

- (id)initFromXPCRepresentation:(id)a3
{
  id v4;

  swift_unknownObjectRetain();
  v4 = sub_245DC408C((uint64_t)a3);
  swift_unknownObjectRelease();
  return v4;
}

- (id)xpcRepresentation
{
  id v2;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____SEHostingUpdateCoordinator__fence);
  if (v2)
    v2 = objc_msgSend(v2, sel_createXPCRepresentation);
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SEHostingUpdateCoordinator)initWithCoder:(id)a3
{
  id v3;
  _SEHostingUpdateCoordinator *v4;

  v3 = a3;
  v4 = (_SEHostingUpdateCoordinator *)sub_245DC418C();

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  _SEHostingUpdateCoordinator *v6;
  id v7;

  v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____SEHostingUpdateCoordinator__fence);
  v5 = a3;
  v6 = self;
  v7 = (id)sub_245DC4CAC();
  objc_msgSend(v5, sel_encodeObject_forKey_, v4, v7);

}

- (void)dealloc
{
  _SEHostingUpdateCoordinator *v2;

  v2 = self;
  _SEHostingUpdateCoordinator.__deallocating_deinit();
}

- (void).cxx_destruct
{

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)addHostable:(id)a3
{
  char *v4;
  _SEHostingUpdateCoordinator *v5;

  v4 = (char *)a3;
  v5 = self;
  _SEHostingUpdateCoordinator.add(_:)(v4);

}

- (void)addHostingView:(id)a3
{
  id v4;
  _SEHostingUpdateCoordinator *v5;

  v4 = a3;
  v5 = self;
  _SEHostingUpdateCoordinator.add(_:)(v4);

}

- (void)commit
{
  _SEHostingUpdateCoordinator *v2;

  v2 = self;
  _SEHostingUpdateCoordinator.commit()();

}

@end

@implementation SSKMirroredDisplayTransformer

- (void)transformPhysicalDisplayWith:(id)a3
{
  SSKMirroredDisplayTransformer *v5;
  id v6;

  swift_unknownObjectRetain();
  v5 = self;
  v6 = (id)sub_246017CF8();
  objc_msgSend(a3, sel_setUniqueIdentifier_, v6);
  swift_unknownObjectRelease();

}

- (BOOL)derivesDisplays
{
  return 1;
}

- (BOOL)shouldTransformConnectingDisplays
{
  return 1;
}

- (SSKMirroredDisplayTransformer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MirroredDisplayTransformer();
  return -[SSKMirroredDisplayTransformer init](&v3, sel_init);
}

@end

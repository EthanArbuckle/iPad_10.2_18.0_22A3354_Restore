@implementation PersistentContainer

- (_TtC15ReportingPlugin19PersistentContainer)initWithName:(id)a3 managedObjectModel:(id)a4
{
  id v6;
  void *v7;
  _TtC15ReportingPlugin19PersistentContainer *v8;
  objc_super v10;

  sub_24549A0B4();
  v6 = a4;
  v7 = (void *)sub_24549A0A8();
  swift_bridgeObjectRelease();
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for PersistentContainer();
  v8 = -[NSPersistentContainer initWithName:managedObjectModel:](&v10, sel_initWithName_managedObjectModel_, v7, v6);

  return v8;
}

@end

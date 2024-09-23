@implementation TTRISearchController

- (_TtC9RemindersP33_6BFE23A799CB20D2DB7CA4EA96508B8A20TTRISearchController)initWithSearchResultsController:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC9RemindersP33_6BFE23A799CB20D2DB7CA4EA96508B8A20TTRISearchController_ttri_isBeingDismissed) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[TTRISearchController initWithSearchResultsController:](&v7, "initWithSearchResultsController:", a3);
}

- (_TtC9RemindersP33_6BFE23A799CB20D2DB7CA4EA96508B8A20TTRISearchController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_class *ObjectType;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC9RemindersP33_6BFE23A799CB20D2DB7CA4EA96508B8A20TTRISearchController *v12;
  objc_super v14;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v9 = v8;
    *((_BYTE *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC9RemindersP33_6BFE23A799CB20D2DB7CA4EA96508B8A20TTRISearchController_ttri_isBeingDismissed) = 0;
    v10 = a4;
    a3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
  }
  else
  {
    *((_BYTE *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC9RemindersP33_6BFE23A799CB20D2DB7CA4EA96508B8A20TTRISearchController_ttri_isBeingDismissed) = 0;
    v11 = a4;
  }
  v14.receiver = self;
  v14.super_class = ObjectType;
  v12 = -[TTRISearchController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", a3, a4);

  return v12;
}

- (_TtC9RemindersP33_6BFE23A799CB20D2DB7CA4EA96508B8A20TTRISearchController)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC9RemindersP33_6BFE23A799CB20D2DB7CA4EA96508B8A20TTRISearchController_ttri_isBeingDismissed) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[TTRISearchController initWithCoder:](&v7, "initWithCoder:", a3);
}

@end

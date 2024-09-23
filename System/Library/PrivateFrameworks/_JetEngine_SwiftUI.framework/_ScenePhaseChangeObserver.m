@implementation _ScenePhaseChangeObserver

- (_ScenePhaseChangeObserver)init
{
  objc_class *ObjectType;
  uint64_t v4;
  _ScenePhaseChangeObserver *v5;
  _ScenePhaseChangeObserver *v6;
  void *v7;
  _ScenePhaseChangeObserver *v8;
  id v9;
  id v10;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = OBJC_IVAR____ScenePhaseChangeObserver_multicastDelegate;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253ED2A48);
  swift_allocObject();
  v5 = self;
  *(Class *)((char *)&self->super.isa + v4) = (Class)sub_20E4A518C();

  v12.receiver = v5;
  v12.super_class = ObjectType;
  v6 = -[_ScenePhaseChangeObserver init](&v12, sel_init);
  v7 = (void *)objc_opt_self();
  v8 = v6;
  v9 = objc_msgSend(v7, sel_defaultCenter);
  objc_msgSend(v9, sel_addObserver_selector_name_object_, v8, sel_didEnterBackground, *MEMORY[0x24BEBE6F0], 0);

  v10 = objc_msgSend(v7, sel_defaultCenter);
  objc_msgSend(v10, sel_addObserver_selector_name_object_, v8, sel_willEnterForegroundNotification, *MEMORY[0x24BEBE710], 0);

  return v8;
}

- (void)dealloc
{
  _ScenePhaseChangeObserver *v2;

  v2 = self;
  sub_20E4754D4();
}

- (void).cxx_destruct
{
  swift_release();
}

- (void)didEnterBackground
{
  _ScenePhaseChangeObserver *v2;

  v2 = self;
  sub_20E4A5180();

}

- (void)willEnterForegroundNotification
{
  _ScenePhaseChangeObserver *v2;

  v2 = self;
  sub_20E4A5180();

}

@end

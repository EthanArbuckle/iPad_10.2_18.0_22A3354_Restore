@implementation REMSuggestedAttributesTrainer

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMSuggestedAttributesTrainer)initWithCoder:(id)a3
{
  return -[REMStoreSwiftInvocation init](self, sel_init, a3);
}

- (void)dealloc
{
  objc_class *ObjectType;
  uint64_t v4;
  REMSuggestedAttributesTrainer *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = qword_1EE71C1A0;
  v5 = self;
  if (v4 != -1)
    swift_once();
  v6 = sub_1A4690318();
  __swift_project_value_buffer(v6, (uint64_t)qword_1EE721E20);
  v7 = sub_1A469030C();
  v8 = sub_1A4691008();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1A442D000, v7, v8, "REMSuggestedAttributesTrainer deinit", v9, 2u);
    MEMORY[0x1A85A0114](v9, -1, -1);
  }

  v10.receiver = v5;
  v10.super_class = ObjectType;
  -[REMSuggestedAttributesTrainer dealloc](&v10, sel_dealloc);
}

- (REMSuggestedAttributesTrainer)initWithFetchResultTokenToDiffAgainst:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[REMStoreSwiftInvocation initWithFetchResultTokenToDiffAgainst:](&v5, sel_initWithFetchResultTokenToDiffAgainst_, a3);
}

@end

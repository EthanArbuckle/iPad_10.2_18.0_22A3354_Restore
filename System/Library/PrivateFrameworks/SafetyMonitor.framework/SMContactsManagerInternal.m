@implementation SMContactsManagerInternal

- (SMContactsManagerInternal)init
{
  return (SMContactsManagerInternal *)sub_245534668();
}

- (void)dealloc
{
  void *v3;
  SMContactsManagerInternal *v4;
  id v5;
  objc_super v6;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_removeObserver_name_object_, v4, *MEMORY[0x24BDBA3D0], 0);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for ContactsManager();
  -[SMContactsManagerInternal dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (SMContactsManagerInternal)shared
{
  if (qword_257484708 != -1)
    swift_once();
  return (SMContactsManagerInternal *)(id)static ContactsManager.shared;
}

- (id)contactWith:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  SMContactsManagerInternal *v7;
  Swift::String_optional v8;
  Class isa;

  if (a3)
  {
    v4 = sub_24558F7B8();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  v8.value._countAndFlagsBits = v4;
  v8.value._object = v6;
  isa = ContactsManager.contact(with:)(v8).super.isa;

  swift_bridgeObjectRelease();
  return isa;
}

- (id)activeSessionRecipientContactsFor:(id)a3
{
  id v5;
  SMContactsManagerInternal *v6;
  void *v7;

  v5 = a3;
  v6 = self;
  ContactsManager.activeSessionRecipientContacts(for:)(a3);

  sub_24552DEE8(0, &qword_257484B98);
  v7 = (void *)sub_24558F830();
  swift_bridgeObjectRelease();
  return v7;
}

- (id)fetchAdditionalInfoFor:(id)a3 keysToFetch:(id)a4
{
  void *v5;
  char v7;
  SMContactsManagerInternal *v8;
  unint64_t v9;
  void *v10;
  Swift::OpaquePointer_optional v12;
  Swift::OpaquePointer_optional v13;

  v5 = a3;
  if (a3)
  {
    sub_24552DEE8(0, &qword_257484B98);
    v5 = (void *)sub_24558F83C();
  }
  if (a4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257484B90);
    v7 = sub_24558F83C();
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  v12.value._rawValue = v5;
  v12.is_nil = v7;
  v9 = (unint64_t)ContactsManager.fetchAdditionalInfo(for:keysToFetch:)(v12, v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v9)
  {
    sub_24552DEE8(0, &qword_257484B98);
    v10 = (void *)sub_24558F830();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)fetchSelfContact
{
  SMContactsManagerInternal *v2;
  void *v3;

  v2 = self;
  v3 = (void *)ContactsManager.fetchSelfContact()();

  return v3;
}

@end

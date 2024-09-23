@implementation RUIXMLSanitizer

- (RUIXMLSanitizer)init
{
  uint64_t ObjectType;
  RUIXMLSanitizer *v3;
  uint64_t v5;

  ObjectType = swift_getObjectType();
  v5 = 0;
  v3 = (RUIXMLSanitizer *)(*(uint64_t (**)(uint64_t *))(ObjectType + 112))(&v5);
  swift_deallocPartialClassInstance();
  return v3;
}

- (id)sanitizedXML:(id)a3 error:(id *)a4
{
  id v5;
  RUIXMLSanitizer *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;

  v5 = a3;
  v6 = self;
  v7 = sub_209F66AB4();
  v9 = v8;

  v10 = sub_209F520E4(v7, v9);
  v12 = v11;

  sub_209EE4928(v7, v9);
  v13 = (void *)sub_209F66AA8();
  sub_209EE4928((uint64_t)v10, v12);
  return v13;
}

- (id)sanitizedDataWithElement:(id)a3 error:(id *)a4
{
  id v5;
  RUIXMLSanitizer *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;

  v5 = a3;
  v6 = self;
  v7 = sub_209F525C0();
  v9 = v8;

  v10 = (void *)sub_209F66AA8();
  sub_209EE4928(v7, v9);
  return v10;
}

- (id)sanitizedXMLElementWithData:(id)a3 error:(id *)a4
{
  id v5;
  RUIXMLSanitizer *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;

  v5 = a3;
  v6 = self;
  v7 = sub_209F66AB4();
  v9 = v8;

  v10 = (void *)sub_209F527E0(v7, v9);
  sub_209EE4928(v7, v9);
  return v10;
}

- (id)logStringWithXMLString:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  RUIXMLSanitizer *v8;
  void *v9;

  v5 = sub_209F672C4();
  v7 = v6;
  v8 = self;
  sub_209F57474(v5, v7);
  swift_bridgeObjectRelease();

  v9 = (void *)sub_209F672A0();
  swift_bridgeObjectRelease();
  return v9;
}

@end

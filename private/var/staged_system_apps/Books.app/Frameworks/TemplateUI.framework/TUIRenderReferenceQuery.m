@implementation TUIRenderReferenceQuery

+ (id)queryWithUUID:(id)a3 uid:(id)a4 refId:(id)a5 refInstance:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  _TUIRenderReferenceQuery *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init(_TUIRenderReferenceQuery);
  -[_TUIRenderReferenceQuery setUUID:](v13, "setUUID:", v12);

  -[_TUIRenderReferenceQuery setUid:](v13, "setUid:", v11);
  -[_TUIRenderReferenceQuery setRefId:](v13, "setRefId:", v10);

  -[_TUIRenderReferenceQuery setRefInstance:](v13, "setRefInstance:", v9);
  return v13;
}

+ (id)queryWithUUID:(id)a3 uid:(id)a4 identifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  _TUIRenderIdentifierQuery *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(_TUIRenderIdentifierQuery);
  -[_TUIRenderIdentifierQuery setUUID:](v10, "setUUID:", v9);

  -[_TUIRenderIdentifierQuery setUid:](v10, "setUid:", v8);
  -[_TUIRenderIdentifierQuery setIdentifier:](v10, "setIdentifier:", v7);

  return v10;
}

@end

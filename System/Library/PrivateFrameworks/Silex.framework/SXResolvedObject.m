@implementation SXResolvedObject

- (id)initWitObject:(id)a3 conditionTypes:(id)a4
{
  id v7;
  id v8;
  SXResolvedObject *v9;
  SXResolvedObject *v10;
  uint64_t v11;
  NSSet *conditionTypes;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SXResolvedObject;
  v9 = -[SXResolvedObject init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_object, a3);
    v11 = objc_msgSend(v8, "copy");
    conditionTypes = v10->_conditionTypes;
    v10->_conditionTypes = (NSSet *)v11;

  }
  return v10;
}

- (SXJSONObject)object
{
  return self->_object;
}

- (NSSet)conditionTypes
{
  return self->_conditionTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditionTypes, 0);
  objc_storeStrong((id *)&self->_object, 0);
}

@end

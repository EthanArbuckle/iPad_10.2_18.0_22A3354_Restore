@implementation _UINullFeedback

+ (id)nullFeedback
{
  return objc_alloc_init((Class)a1);
}

- (_UINullFeedback)init
{
  _UINullFeedback *v2;
  uint64_t v3;
  NSUUID *uuid;
  _UINullFeedback *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UINullFeedback;
  v2 = -[_UIFeedback init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = objc_claimAutoreleasedReturnValue();
    uuid = v2->_uuid;
    v2->_uuid = (NSUUID *)v3;

    v5 = v2;
  }

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UINullFeedback;
  if (-[_UIFeedback isEqual:](&v7, sel_isEqual_, v4))
    v5 = -[NSUUID isEqual:](self->_uuid, "isEqual:", v4[16]);
  else
    v5 = 0;

  return v5;
}

- (_UINullFeedback)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  _UINullFeedback *v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSUUID *uuid;
  _UINullFeedback *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UINullFeedback;
  v5 = -[_UIFeedback initWithDictionaryRepresentation:](&v12, sel_initWithDictionaryRepresentation_, v4);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithUUIDString:", v7);
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v8;

    v10 = v5;
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UINullFeedback;
  -[_UIFeedback dictionaryRepresentation](&v7, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[NSUUID UUIDString](self->_uuid, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("UUID"));

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)type
{
  return CFSTR("NULL");
}

- (unint64_t)_effectivePlayableFeedbackTypes
{
  return 0;
}

- (BOOL)isHighPriority
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end

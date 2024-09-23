@implementation ATXShortcutsEditorEventMetadata

- (ATXShortcutsEditorEventMetadata)initWithNumStepsInShortcut:(unint64_t)a3
{
  ATXShortcutsEditorEventMetadata *v4;
  uint64_t v5;
  ATXPBShortcutsEditorEventMetadata *proto;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ATXShortcutsEditorEventMetadata;
  v4 = -[ATXShortcutsEditorEventMetadata init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_opt_new();
    proto = v4->_proto;
    v4->_proto = (ATXPBShortcutsEditorEventMetadata *)v5;

    -[ATXPBShortcutsEditorEventMetadata setNumStepsInShortcut:](v4->_proto, "setNumStepsInShortcut:", a3);
  }
  return v4;
}

- (unint64_t)numStepsInShortcut
{
  return -[ATXPBShortcutsEditorEventMetadata numStepsInShortcut](self->_proto, "numStepsInShortcut");
}

- (void)setNumStepsInShortcut:(unint64_t)a3
{
  -[ATXPBShortcutsEditorEventMetadata setNumStepsInShortcut:](self->_proto, "setNumStepsInShortcut:", a3);
}

- (id)encodeAsProto
{
  return (id)-[ATXPBShortcutsEditorEventMetadata data](self->_proto, "data");
}

- (ATXShortcutsEditorEventMetadata)initWithProto:(id)a3
{
  return -[ATXShortcutsEditorEventMetadata initWithNumStepsInShortcut:](self, "initWithNumStepsInShortcut:", objc_msgSend(a3, "numStepsInShortcut"));
}

- (ATXShortcutsEditorEventMetadata)initWithProtoData:(id)a3
{
  id v4;
  ATXPBShortcutsEditorEventMetadata *v5;
  ATXShortcutsEditorEventMetadata *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBShortcutsEditorEventMetadata initWithData:]([ATXPBShortcutsEditorEventMetadata alloc], "initWithData:", v4);

    self = -[ATXShortcutsEditorEventMetadata initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  return self->_proto;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ATXShortcutsEditorEventMetadata encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXShortcutsEditorEventMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXShortcutsEditorEventMetadata *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXShortcutsEditorEventMetadata initWithProtoData:](self, "initWithProtoData:", v5);
  return v6;
}

- (unint64_t)hash
{
  return -[ATXPBShortcutsEditorEventMetadata hash](self->_proto, "hash");
}

- (BOOL)isEqual:(id)a3
{
  ATXShortcutsEditorEventMetadata *v4;
  ATXShortcutsEditorEventMetadata *v5;
  BOOL v6;

  v4 = (ATXShortcutsEditorEventMetadata *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXShortcutsEditorEventMetadata isEqualToATXShortcutsEditorEventMetadata:](self, "isEqualToATXShortcutsEditorEventMetadata:", v5);

  return v6;
}

- (BOOL)isEqualToATXShortcutsEditorEventMetadata:(id)a3
{
  return -[ATXPBShortcutsEditorEventMetadata isEqual:](self->_proto, "isEqual:", *((_QWORD *)a3 + 1));
}

- (id)jsonDict
{
  return -[ATXPBShortcutsEditorEventMetadata dictionaryRepresentation](self->_proto, "dictionaryRepresentation");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proto, 0);
}

@end

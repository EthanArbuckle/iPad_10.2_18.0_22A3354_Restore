@implementation VIOntologyNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VIOntologyNode)initWithKnowledgeGraphID:(id)a3 labelDebugDescription:(id)a4
{
  id v6;
  id v7;
  VIOntologyNode *v8;
  uint64_t v9;
  NSString *knowledgeGraphID;
  uint64_t v11;
  NSString *labelDebugDescription;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VIOntologyNode;
  v8 = -[VIOntologyNode init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    knowledgeGraphID = v8->_knowledgeGraphID;
    v8->_knowledgeGraphID = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    labelDebugDescription = v8->_labelDebugDescription;
    v8->_labelDebugDescription = (NSString *)v11;

  }
  return v8;
}

- (VIOntologyNode)initWithCoder:(id)a3
{
  id v4;
  VIOntologyNode *v5;
  uint64_t v6;
  NSString *knowledgeGraphID;
  uint64_t v8;
  NSString *labelDebugDescription;

  v4 = a3;
  v5 = -[VIOntologyNode init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("knowledgeGraphID"));
    v6 = objc_claimAutoreleasedReturnValue();
    knowledgeGraphID = v5->_knowledgeGraphID;
    v5->_knowledgeGraphID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("labelDebugDescription"));
    v8 = objc_claimAutoreleasedReturnValue();
    labelDebugDescription = v5->_labelDebugDescription;
    v5->_labelDebugDescription = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *knowledgeGraphID;
  id v5;

  knowledgeGraphID = self->_knowledgeGraphID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", knowledgeGraphID, CFSTR("knowledgeGraphID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_labelDebugDescription, CFSTR("labelDebugDescription"));

}

- (BOOL)isEqual:(id)a3
{
  VIOntologyNode *v4;
  VIOntologyNode *v5;
  VIOntologyNode *v6;
  NSString *knowledgeGraphID;
  void *v8;
  NSString *labelDebugDescription;
  void *v10;
  char IsEqual;

  v4 = (VIOntologyNode *)a3;
  if (v4 == self)
  {
    IsEqual = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    knowledgeGraphID = self->_knowledgeGraphID;
    -[VIOntologyNode knowledgeGraphID](v6, "knowledgeGraphID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (VIObjectIsEqual((unint64_t)knowledgeGraphID, (uint64_t)v8))
    {
      labelDebugDescription = self->_labelDebugDescription;
      -[VIOntologyNode labelDebugDescription](v6, "labelDebugDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      IsEqual = VIObjectIsEqual((unint64_t)labelDebugDescription, (uint64_t)v10);

    }
    else
    {
      IsEqual = 0;
    }

  }
  return IsEqual;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_knowledgeGraphID, "hash");
  return -[NSString hash](self->_labelDebugDescription, "hash") ^ v3;
}

- (NSString)knowledgeGraphID
{
  return self->_knowledgeGraphID;
}

- (NSString)labelDebugDescription
{
  return self->_labelDebugDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelDebugDescription, 0);
  objc_storeStrong((id *)&self->_knowledgeGraphID, 0);
}

@end

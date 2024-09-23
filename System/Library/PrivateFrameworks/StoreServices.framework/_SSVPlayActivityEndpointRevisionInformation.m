@implementation _SSVPlayActivityEndpointRevisionInformation

- (unint64_t)hash
{
  uint64_t v3;
  NSString *revisionVersionToken;
  unint64_t v5;

  v3 = -[NSIndexSet hash](self->_additionalPendingRevisionsIndexSet, "hash");
  revisionVersionToken = self->_revisionVersionToken;
  v5 = self->_currentRevision ^ v3;
  return v5 ^ -[NSString hash](revisionVersionToken, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _SSVPlayActivityEndpointRevisionInformation *v4;
  NSIndexSet *additionalPendingRevisionsIndexSet;
  NSString *revisionVersionToken;
  char v7;

  v4 = (_SSVPlayActivityEndpointRevisionInformation *)a3;
  if (v4 == self)
    goto LABEL_9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || self->_currentRevision != v4->_currentRevision
    || (additionalPendingRevisionsIndexSet = self->_additionalPendingRevisionsIndexSet,
        additionalPendingRevisionsIndexSet != v4->_additionalPendingRevisionsIndexSet)
    && !-[NSIndexSet isEqualToIndexSet:](additionalPendingRevisionsIndexSet, "isEqualToIndexSet:"))
  {
    v7 = 0;
    goto LABEL_10;
  }
  revisionVersionToken = self->_revisionVersionToken;
  if (revisionVersionToken == v4->_revisionVersionToken)
  {
LABEL_9:
    v7 = 1;
    goto LABEL_10;
  }
  v7 = -[NSString isEqualToString:](revisionVersionToken, "isEqualToString:");
LABEL_10:

  return v7;
}

- (_SSVPlayActivityEndpointRevisionInformation)initWithCoder:(id)a3
{
  id v4;
  _SSVPlayActivityEndpointRevisionInformation *v5;
  void *v6;
  _SSVPlayActivityEndpointRevisionInformation *v7;
  NSIndexSet *v8;
  NSIndexSet *additionalPendingRevisionsIndexSet;
  NSIndexSet *v10;

  v4 = a3;
  v5 = (_SSVPlayActivityEndpointRevisionInformation *)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("CurrentRevision"));
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RevisionVersionToken"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      v7 = -[_SSVPlayActivityEndpointRevisionInformation init](self, "init");
      if (v7)
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AdditionalPendingRevisions"));
        v8 = (NSIndexSet *)objc_claimAutoreleasedReturnValue();
        additionalPendingRevisionsIndexSet = v7->_additionalPendingRevisionsIndexSet;
        v7->_additionalPendingRevisionsIndexSet = v8;
        v10 = v8;

        v7->_currentRevision = (unint64_t)v5;
        objc_storeStrong((id *)&v7->_revisionVersionToken, v6);

      }
      self = v7;
      v5 = self;
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSIndexSet *additionalPendingRevisionsIndexSet;
  id v5;

  additionalPendingRevisionsIndexSet = self->_additionalPendingRevisionsIndexSet;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", additionalPendingRevisionsIndexSet, CFSTR("AdditionalPendingRevisions"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_currentRevision, CFSTR("CurrentRevision"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_revisionVersionToken, CFSTR("RevisionVersionToken"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 8), self->_additionalPendingRevisionsIndexSet);
    *(_QWORD *)(v5 + 16) = self->_currentRevision;
    objc_storeStrong((id *)(v5 + 24), self->_revisionVersionToken);
  }
  return (id)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSIndexSet)additionalPendingRevisionsIndexSet
{
  return self->_additionalPendingRevisionsIndexSet;
}

- (void)setAdditionalPendingRevisionsIndexSet:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)currentRevision
{
  return self->_currentRevision;
}

- (void)setCurrentRevision:(unint64_t)a3
{
  self->_currentRevision = a3;
}

- (NSString)revisionVersionToken
{
  return self->_revisionVersionToken;
}

- (void)setRevisionVersionToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_revisionVersionToken, 0);
  objc_storeStrong((id *)&self->_additionalPendingRevisionsIndexSet, 0);
}

@end

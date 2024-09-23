@implementation SourceSearchContext

- (SourceSearchContext)initWithQuery:(id)a3 criterion:(id)a4 delegate:(id)a5 useLocalIndex:(BOOL)a6 sessionID:(unint64_t)a7
{
  return -[SourceSearchContext initWithQuery:criterion:delegate:offset:useLocalIndex:sessionID:](self, "initWithQuery:criterion:delegate:offset:useLocalIndex:sessionID:", a3, a4, a5, 0, a6, a7);
}

- (SourceSearchContext)initWithQuery:(id)a3 criterion:(id)a4 delegate:(id)a5 offset:(id)a6 useLocalIndex:(BOOL)a7 sessionID:(unint64_t)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  SourceSearchContext *v19;
  SourceSearchContext *v20;
  objc_super v22;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SourceSearchContext;
  v19 = -[SourceSearchContext init](&v22, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_query, a3);
    objc_storeStrong((id *)&v20->_criterion, a4);
    objc_storeWeak((id *)&v20->_delegate, v17);
    objc_storeStrong((id *)&v20->_offset, a6);
    v20->_useLocalIndex = a7;
    v20->_sessionID = a8;
  }

  return v20;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p> useLocalIndex:%{BOOL}d criterion=%@"), objc_opt_class(self), self, -[SourceSearchContext useLocalIndex](self, "useLocalIndex"), self->_criterion);
}

- (id)copyWithZone:(_NSZone *)a3
{
  SourceSearchContext *v4;
  EMQuery *query;
  MFMessageCriterion *criterion;
  id WeakRetained;
  SourceSearchContext *v8;

  if (-[SourceSearchContext isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class(SourceSearchContext)))return self;
  v4 = [SourceSearchContext alloc];
  criterion = self->_criterion;
  query = self->_query;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = -[SourceSearchContext initWithQuery:criterion:delegate:offset:useLocalIndex:sessionID:](v4, "initWithQuery:criterion:delegate:offset:useLocalIndex:sessionID:", query, criterion, WeakRetained, self->_offset, self->_useLocalIndex, self->_sessionID);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  SourceSearchContext *v4;
  uint64_t v5;
  SourceSearchContext *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  unsigned __int8 v11;
  BOOL v12;

  v4 = (SourceSearchContext *)a3;
  if (v4 == self)
    goto LABEL_6;
  v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
  {
LABEL_9:
    v12 = 0;
    goto LABEL_10;
  }
  v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SourceSearchContext criterion](v6, "criterion"));
  if (!objc_msgSend(v7, "isEqual:", self->_criterion))
  {
LABEL_8:

    goto LABEL_9;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SourceSearchContext delegate](v6, "delegate"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!objc_msgSend(v8, "isEqual:", WeakRetained))
  {

    goto LABEL_8;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SourceSearchContext query](v6, "query"));
  v11 = objc_msgSend(v10, "isEqual:", self->_query);

  if ((v11 & 1) == 0)
    goto LABEL_9;
LABEL_6:
  v12 = 1;
LABEL_10:

  return v12;
}

- (unint64_t)hash
{
  return (unint64_t)-[EMQuery hash](self->_query, "hash");
}

- (NSArray)referencedMailboxes
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SourceSearchContext criterion](self, "criterion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "referencedMailboxes"));

  return (NSArray *)v3;
}

- (id)referencedConversations
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SourceSearchContext criterion](self, "criterion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "referencedConversations"));

  return v3;
}

- (MFMessageCriterion)criterion
{
  return self->_criterion;
}

- (void)setCriterion:(id)a3
{
  objc_storeStrong((id *)&self->_criterion, a3);
}

- (EMQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (EDRemoteSearchDelegate)delegate
{
  return (EDRemoteSearchDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDate)offset
{
  return self->_offset;
}

- (void)setOffset:(id)a3
{
  objc_storeStrong((id *)&self->_offset, a3);
}

- (BOOL)useLocalIndex
{
  return self->_useLocalIndex;
}

- (unint64_t)sessionID
{
  return self->_sessionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offset, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_criterion, 0);
}

@end

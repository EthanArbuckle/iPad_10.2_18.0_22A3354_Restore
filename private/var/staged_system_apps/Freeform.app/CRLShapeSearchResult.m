@implementation CRLShapeSearchResult

- (CRLShapeSearchResult)initWithIdentifier:(id)a3 matchingKeyword:(id)a4 priority:(unint64_t)a5 score:(id)a6
{
  id v11;
  id v12;
  id v13;
  CRLShapeSearchResult *v14;
  CRLShapeSearchResult *v15;
  NSString *v16;
  NSString *matchingKeyword;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CRLShapeSearchResult;
  v14 = -[CRLShapeSearchResult init](&v19, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong(&v14->_identifier, a3);
    v16 = (NSString *)objc_msgSend(v12, "copy");
    matchingKeyword = v15->_matchingKeyword;
    v15->_matchingKeyword = v16;

    v15->_priority = a5;
    objc_storeStrong((id *)&v15->_score, a6);
  }

  return v15;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v3 = objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeSearchResult identifier](self, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeSearchResult matchingKeyword](self, "matchingKeyword"));
  v6 = -[CRLShapeSearchResult priority](self, "priority");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeSearchResult score](self, "score"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p identifier=%@ matchingKeyword=%@ priority=%lu score=%@>"), v3, self, v4, v5, v6, v7));

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;

  v4 = a3;
  v6 = objc_opt_class(CRLShapeSearchResult, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeSearchResult identifier](self, "identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  if (objc_msgSend(v9, "isEqual:", v10))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeSearchResult matchingKeyword](self, "matchingKeyword"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "matchingKeyword"));
    v13 = objc_msgSend(v11, "isEqual:", v12);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v5;
  id v6;

  v6 = objc_msgSend(self->_identifier, "hash");
  v3 = sub_1000BC018((char *)&v6, 8, 0xCBF29CE484222325);
  v5 = -[NSString hash](self->_matchingKeyword, "hash");
  return sub_1000BC018((char *)&v5, 8, v3);
}

- (id)identifier
{
  return self->_identifier;
}

- (NSString)matchingKeyword
{
  return self->_matchingKeyword;
}

- (BOOL)isExactMatch
{
  return self->_isExactMatch;
}

- (void)setIsExactMatch:(BOOL)a3
{
  self->_isExactMatch = a3;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (NSNumber)score
{
  return self->_score;
}

- (void)setScore:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_matchingKeyword, 0);
  objc_storeStrong(&self->_identifier, 0);
}

@end

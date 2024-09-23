@implementation THPaginationResultsKey

- (THPaginationResultsKey)initWithContentNodeGUID:(id)a3 presentationType:(id)a4
{
  THPaginationResultsKey *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)THPaginationResultsKey;
  v6 = -[THPaginationResultsKey init](&v8, "init");
  if (v6)
  {
    v6->_contentNodeGUID = (NSString *)objc_msgSend(a3, "copy");
    v6->_presentationType = (THPresentationType *)objc_msgSend(a4, "copyFixingSize");
  }
  return v6;
}

- (THPaginationResultsKey)initWithContentNode:(id)a3 presentationType:(id)a4
{
  THPaginationResultsKey *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)THPaginationResultsKey;
  v6 = -[THPaginationResultsKey init](&v8, "init");
  if (v6)
  {
    v6->_contentNodeGUID = (NSString *)objc_msgSend(objc_msgSend(a3, "nodeGUID"), "copy");
    v6->_presentationType = (THPresentationType *)objc_msgSend(a4, "copyFixingSize");
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (THPaginationResultsKey)initWithCoder:(id)a3
{
  uint64_t v4;
  THPaginationResultsKey *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)THPaginationResultsKey;
  v5 = -[THPaginationResultsKey init](&v8, "init");
  if (v5)
  {
    v5->_contentNodeGUID = (NSString *)objc_msgSend(objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v4), CFSTR("contentNodeGUID")), "copy");
    v5->_presentationType = (THPresentationType *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(THPresentationType, v6), CFSTR("presentationTypeGUID"));
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", -[THPaginationResultsKey contentNodeGUID](self, "contentNodeGUID"), CFSTR("contentNodeGUID"));
  objc_msgSend(a3, "encodeObject:forKey:", -[THPaginationResultsKey presentationType](self, "presentationType"), CFSTR("presentationTypeGUID"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "initWithContentNodeGUID:presentationType:", self->_contentNodeGUID, self->_presentationType);
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](-[THPaginationResultsKey contentNodeGUID](self, "contentNodeGUID"), "hash");
  return -[THPresentationType hashIncludingSize](-[THPaginationResultsKey presentationType](self, "presentationType"), "hashIncludingSize")+ v3;
}

- (void)dealloc
{
  objc_super v3;

  self->_contentNodeGUID = 0;
  self->_presentationType = 0;
  v3.receiver = self;
  v3.super_class = (Class)THPaginationResultsKey;
  -[THPaginationResultsKey dealloc](&v3, "dealloc");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  _BOOL4 v9;

  v5 = objc_opt_class(THPaginationResultsKey, a2);
  *(_QWORD *)&v6 = TSUDynamicCast(v5, a3).n128_u64[0];
  v8 = v7;
  v9 = -[NSString isEqualToString:](-[THPaginationResultsKey contentNodeGUID](self, "contentNodeGUID", v6), "isEqualToString:", objc_msgSend(v7, "contentNodeGUID"));
  if (v9)
    LOBYTE(v9) = -[THPresentationType isEqualIncludingSize:](-[THPaginationResultsKey presentationType](self, "presentationType"), "isEqualIncludingSize:", objc_msgSend(v8, "presentationType"));
  return v9;
}

- (NSString)contentNodeGUID
{
  return self->_contentNodeGUID;
}

- (void)setContentNodeGUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (THPresentationType)presentationType
{
  return self->_presentationType;
}

- (void)setPresentationType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end

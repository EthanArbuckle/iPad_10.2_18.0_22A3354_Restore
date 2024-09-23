@implementation WBSHistoryVisitIdentifier

- (WBSHistoryVisitIdentifier)initWithURLString:(id)a3 visitTime:(double)a4
{
  id v6;
  WBSHistoryVisitIdentifier *v7;
  uint64_t v8;
  NSString *urlString;
  uint64_t v10;
  void *v11;
  WBSHistoryVisitIdentifier *v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WBSHistoryVisitIdentifier;
  v7 = -[WBSHistoryVisitIdentifier init](&v14, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    urlString = v7->_urlString;
    v7->_urlString = (NSString *)v8;

    v7->_visitTime = a4;
    v10 = -[NSString hash](v7->_urlString, "hash");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_hash = objc_msgSend(v11, "hash") ^ v10;

    v12 = v7;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithURLString:visitTime:", self->_urlString, self->_visitTime);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double visitTime;
  double v7;
  NSString *urlString;
  void *v9;
  BOOL v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    visitTime = self->_visitTime;
    objc_msgSend(v5, "visitTime");
    if (visitTime == v7)
    {
      urlString = self->_urlString;
      objc_msgSend(v5, "urlString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[NSString isEqualToString:](urlString, "isEqualToString:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; urlString = \"%@\"; visitTime = %lf; associatedHistoryItem = %@; associatedHistoryVisit = %@>"),
    v5,
    self,
    self->_urlString,
    *(_QWORD *)&self->_visitTime,
    self->_associatedHistoryItem,
    self->_associatedHistoryVisit);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *urlString;
  id v5;

  urlString = self->_urlString;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", urlString, CFSTR("urlString"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("visitTime"), self->_visitTime);

}

- (WBSHistoryVisitIdentifier)initWithCoder:(id)a3
{
  id v4;
  WBSHistoryVisitIdentifier *v5;
  uint64_t v6;
  NSString *urlString;
  double v8;
  uint64_t v9;
  void *v10;
  WBSHistoryVisitIdentifier *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WBSHistoryVisitIdentifier;
  v5 = -[WBSHistoryVisitIdentifier init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("urlString"));
    v6 = objc_claimAutoreleasedReturnValue();
    urlString = v5->_urlString;
    v5->_urlString = (NSString *)v6;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("visitTime"));
    v5->_visitTime = v8;
    v9 = -[NSString hash](v5->_urlString, "hash");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5->_visitTime);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hash = objc_msgSend(v10, "hash") ^ v9;

    v11 = v5;
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (NSString)urlString
{
  return self->_urlString;
}

- (double)visitTime
{
  return self->_visitTime;
}

- (WBSHistoryItem)associatedHistoryItem
{
  return self->_associatedHistoryItem;
}

- (void)setAssociatedHistoryItem:(id)a3
{
  objc_storeStrong((id *)&self->_associatedHistoryItem, a3);
}

- (WBSHistoryVisit)associatedHistoryVisit
{
  return self->_associatedHistoryVisit;
}

- (void)setAssociatedHistoryVisit:(id)a3
{
  objc_storeStrong((id *)&self->_associatedHistoryVisit, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedHistoryVisit, 0);
  objc_storeStrong((id *)&self->_associatedHistoryItem, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
}

@end

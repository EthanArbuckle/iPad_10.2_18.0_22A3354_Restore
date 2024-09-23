@implementation WBSHistoryServiceVisit

- (WBSHistoryServiceVisit)initWithVisit:(id)a3
{
  id v4;
  WBSHistoryServiceVisit *v5;
  void *v6;
  uint64_t v7;
  NSString *title;
  double v9;
  void *v10;
  void *v11;
  WBSHistoryServiceVisit *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WBSHistoryServiceVisit;
  v5 = -[WBSHistoryServiceObject initWithDatabaseID:](&v14, sel_initWithDatabaseID_, objc_msgSend(v4, "databaseID"));
  if (v5)
  {
    objc_msgSend(v4, "item");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_itemID = objc_msgSend(v6, "databaseID");

    objc_msgSend(v4, "title");
    v7 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v7;

    objc_msgSend(v4, "visitTime");
    v5->_visitTime = v9;
    v5->_loadSuccessful = objc_msgSend(v4, "loadWasSuccessful");
    v5->_httpNonGet = objc_msgSend(v4, "wasHTTPNonGet");
    v5->_synthesized = objc_msgSend(v4, "isSynthesized");
    objc_msgSend(v4, "redirectSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_redirectSource = objc_msgSend(v10, "databaseID");

    objc_msgSend(v4, "redirectDestination");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_redirectDestination = objc_msgSend(v11, "databaseID");

    v5->_origin = objc_msgSend(v4, "origin");
    v5->_attributes = objc_msgSend(v4, "attributes");
    v12 = v5;
  }

  return v5;
}

- (WBSHistoryServiceVisit)initWithSQLRow:(id)a3
{
  id v4;
  WBSHistoryServiceVisit *v5;
  double v6;
  uint64_t v7;
  NSString *title;
  WBSHistoryServiceVisit *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WBSHistoryServiceVisit;
  v5 = -[WBSHistoryServiceObject initWithDatabaseID:](&v11, sel_initWithDatabaseID_, objc_msgSend(v4, "int64AtIndex:", 0));
  if (v5)
  {
    v5->_itemID = objc_msgSend(v4, "int64AtIndex:", 1);
    objc_msgSend(v4, "doubleAtIndex:", 2);
    v5->_visitTime = v6;
    objc_msgSend(v4, "stringAtIndex:", 3);
    v7 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v7;

    v5->_loadSuccessful = objc_msgSend(v4, "BOOLAtIndex:", 4);
    v5->_httpNonGet = objc_msgSend(v4, "BOOLAtIndex:", 5);
    v5->_synthesized = objc_msgSend(v4, "BOOLAtIndex:", 6);
    v5->_redirectSource = objc_msgSend(v4, "int64AtIndex:", 7);
    v5->_redirectDestination = objc_msgSend(v4, "int64AtIndex:", 8);
    v5->_origin = objc_msgSend(v4, "int64AtIndex:", 9);
    v5->_attributes = objc_msgSend(v4, "int64AtIndex:", 11);
    v5->_score = objc_msgSend(v4, "intAtIndex:", 12);
    v9 = v5;
  }

  return v5;
}

- (id)_initWithDatabaseID:(int64_t)a3 serviceVisit:(id)a4
{
  id v6;
  WBSHistoryServiceVisit *v7;
  void *v8;
  uint64_t v9;
  NSString *title;
  double v11;
  WBSHistoryServiceVisit *v12;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WBSHistoryServiceVisit;
  v7 = -[WBSHistoryServiceObject initWithDatabaseID:](&v14, sel_initWithDatabaseID_, a3);
  if (v7)
  {
    v7->_itemID = objc_msgSend(v6, "itemID");
    objc_msgSend(v6, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    title = v7->_title;
    v7->_title = (NSString *)v9;

    objc_msgSend(v6, "visitTime");
    v7->_visitTime = v11;
    v7->_loadSuccessful = objc_msgSend(v6, "loadSuccessful");
    v7->_httpNonGet = objc_msgSend(v6, "httpNonGet");
    v7->_synthesized = objc_msgSend(v6, "synthesized");
    v7->_redirectSource = objc_msgSend(v6, "redirectSource");
    v7->_redirectDestination = objc_msgSend(v6, "redirectDestination");
    v7->_origin = objc_msgSend(v6, "origin");
    v7->_attributes = objc_msgSend(v6, "attributes");
    v7->_score = objc_msgSend(v6, "score");
    v12 = v7;
  }

  return v7;
}

- (WBSHistoryServiceVisit)visitWithUpdatedID:(int64_t)a3 updatedItemID:(int64_t)a4
{
  _QWORD *v5;

  v5 = -[WBSHistoryServiceVisit _initWithDatabaseID:serviceVisit:]([WBSHistoryServiceVisit alloc], "_initWithDatabaseID:serviceVisit:", a3, self);
  v5[3] = a4;
  return (WBSHistoryServiceVisit *)v5;
}

- (WBSHistoryServiceVisit)initWithCoder:(id)a3
{
  id v4;
  WBSHistoryServiceVisit *v5;
  uint64_t v6;
  NSString *title;
  double v8;
  WBSHistoryServiceVisit *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WBSHistoryServiceVisit;
  v5 = -[WBSHistoryServiceObject initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_itemID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("itemID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("visitTime"));
    v5->_visitTime = v8;
    v5->_loadSuccessful = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("loadSuccessful"));
    v5->_httpNonGet = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("httpNonGet"));
    v5->_synthesized = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("synthesized"));
    v5->_redirectSource = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("redirectSource"));
    v5->_redirectDestination = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("redirectDestination"));
    v5->_origin = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("origin"));
    v5->_attributes = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("attributes"));
    v5->_score = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("score"));
    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)WBSHistoryServiceVisit;
  -[WBSHistoryServiceObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_itemID, CFSTR("itemID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("visitTime"), self->_visitTime);
  objc_msgSend(v4, "encodeBool:forKey:", self->_loadSuccessful, CFSTR("loadSuccessful"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_httpNonGet, CFSTR("httpNonGet"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_synthesized, CFSTR("synthesized"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_redirectSource, CFSTR("redirectSource"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_redirectDestination, CFSTR("redirectDestination"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_origin, CFSTR("origin"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_attributes, CFSTR("attributes"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_score, CFSTR("score"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)itemID
{
  return self->_itemID;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (double)visitTime
{
  return self->_visitTime;
}

- (BOOL)loadSuccessful
{
  return self->_loadSuccessful;
}

- (BOOL)httpNonGet
{
  return self->_httpNonGet;
}

- (BOOL)synthesized
{
  return self->_synthesized;
}

- (int64_t)redirectSource
{
  return self->_redirectSource;
}

- (void)setRedirectSource:(int64_t)a3
{
  self->_redirectSource = a3;
}

- (int64_t)redirectDestination
{
  return self->_redirectDestination;
}

- (void)setRedirectDestination:(int64_t)a3
{
  self->_redirectDestination = a3;
}

- (int64_t)origin
{
  return self->_origin;
}

- (void)setOrigin:(int64_t)a3
{
  self->_origin = a3;
}

- (int64_t)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(int64_t)a3
{
  self->_attributes = a3;
}

- (int)score
{
  return self->_score;
}

- (void)setScore:(int)a3
{
  self->_score = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
}

@end

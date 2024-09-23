@implementation _PSContactSuggesterArchive

- (_PSContactSuggesterArchive)initWithArchiveDate:(id)a3 contactPriorDictionary:(id)a4
{
  id v7;
  id v8;
  _PSContactSuggesterArchive *v9;
  _PSContactSuggesterArchive *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_PSContactSuggesterArchive;
  v9 = -[_PSContactSuggesterArchive init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_archiveDate, a3);
    objc_storeStrong((id *)&v10->_contactPriorDictionary, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[_PSContactSuggesterArchive archiveDate](self, "archiveDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSContactSuggesterArchive contactPriorDictionary](self, "contactPriorDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithArchiveDate:contactPriorDictionary:", v5, v6);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[_PSContactSuggesterArchive contactPriorDictionary](self, "contactPriorDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_contactPriorDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[_PSContactSuggesterArchive archiveDate](self, "archiveDate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_archiveDate);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, v7);

}

- (_PSContactSuggesterArchive)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _PSContactSuggesterArchive *v15;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_contactPriorDictionary);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_archiveDate);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[_PSContactSuggesterArchive initWithArchiveDate:contactPriorDictionary:](self, "initWithArchiveDate:contactPriorDictionary:", v14, v12);
  return v15;
}

- (NSDate)archiveDate
{
  return self->_archiveDate;
}

- (NSDictionary)contactPriorDictionary
{
  return self->_contactPriorDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactPriorDictionary, 0);
  objc_storeStrong((id *)&self->_archiveDate, 0);
}

@end

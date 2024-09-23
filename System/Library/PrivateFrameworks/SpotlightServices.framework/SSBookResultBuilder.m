@implementation SSBookResultBuilder

+ (id)bundleId
{
  return CFSTR("com.apple.iBooks");
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

- (SSBookResultBuilder)initWithResult:(id)a3
{
  id v4;
  SSBookResultBuilder *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SSBookResultBuilder;
  v5 = -[SSResultBuilder initWithResult:](&v13, sel_initWithResult_, v4);
  if (v5)
  {
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6110], objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSBookResultBuilder setAuthor:](v5, "setAuthor:", v8);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("NO_TITLE"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSBookResultBuilder setAuthor:](v5, "setAuthor:", v9);

    }
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6330], objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSBookResultBuilder setGenre:](v5, "setGenre:", v10);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6450], objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSBookResultBuilder setDate:](v5, "setDate:", v11);

  }
  return v5;
}

- (id)buildCompactCardSection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)objc_opt_new();
  -[SSBookResultBuilder author](self, "author");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  -[SSBookResultBuilder genre](self, "genre");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "addObject:", v5);
  -[SSBookResultBuilder date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSBookResultBuilder date](self, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[SSDateFormatManager stringsFromDate:toDate:isAllDay:](SSDateFormatManager, "stringsFromDate:toDate:isAllDay:", v6, v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v8);

  }
  v12.receiver = self;
  v12.super_class = (Class)SSBookResultBuilder;
  -[SSResultBuilder buildCompactCardSection](&v12, sel_buildCompactCardSection);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "richTextsFromStrings:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDescriptions:", v10);

  return v9;
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
  objc_storeStrong((id *)&self->_author, a3);
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
  objc_storeStrong((id *)&self->_genre, a3);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_author, 0);
}

@end

@implementation SSNewsResultBuilder

+ (id)bundleId
{
  return CFSTR("com.apple.news");
}

+ (id)newsFootnoteWithNewsSource:(id)a3 publishedDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v8 = v7;
  if (v5)
    objc_msgSend(v7, "addObject:", v5);
  if (v6)
  {
    +[SSDateFormatManager dynamicCompactStringFromDate:](SSDateFormatManager, "dynamicCompactStringFromDate:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

  }
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(" - "));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

- (SSNewsResultBuilder)initWithResult:(id)a3
{
  id v4;
  SSNewsResultBuilder *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SSNewsResultBuilder;
  v5 = -[SSResultBuilder initWithResult:](&v10, sel_initWithResult_, v4);
  if (v5)
  {
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA60D0], objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSNewsResultBuilder setPublishedDate:](v5, "setPublishedDate:", v6);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6968], objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSNewsResultBuilder setTitle:](v5, "setTitle:", v7);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA64A0], objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSNewsResultBuilder setNewsSource:](v5, "setNewsSource:", v8);

  }
  return v5;
}

- (id)buildInlineCardSection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SSNewsResultBuilder;
  -[SSResultBuilder buildInlineCardSection](&v11, sel_buildInlineCardSection);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (SSSnippetModernizationEnabled())
  {
    objc_msgSend(v3, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMaxLines:", 2);
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0D8C660];
    v6 = (void *)objc_opt_class();
    -[SSNewsResultBuilder newsSource](self, "newsSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSNewsResultBuilder publishedDate](self, "publishedDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "newsFootnoteWithNewsSource:publishedDate:", v4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFootnote:", v9);

  }
  return v3;
}

- (id)buildDescriptions
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (SSSnippetModernizationEnabled())
  {
    v11.receiver = self;
    v11.super_class = (Class)SSNewsResultBuilder;
    -[SSResultBuilder buildDescriptions](&v11, sel_buildDescriptions);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0D8C660];
    v5 = (void *)objc_opt_class();
    -[SSNewsResultBuilder newsSource](self, "newsSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSNewsResultBuilder publishedDate](self, "publishedDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "newsFootnoteWithNewsSource:publishedDate:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    return v10;
  }
}

- (NSDate)publishedDate
{
  return self->_publishedDate;
}

- (void)setPublishedDate:(id)a3
{
  objc_storeStrong((id *)&self->_publishedDate, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)newsSource
{
  return self->_newsSource;
}

- (void)setNewsSource:(id)a3
{
  objc_storeStrong((id *)&self->_newsSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newsSource, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_publishedDate, 0);
}

@end

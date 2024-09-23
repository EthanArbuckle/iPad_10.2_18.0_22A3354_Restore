@implementation SSPodcastResultBuilder

+ (id)bundleId
{
  return CFSTR("com.apple.podcasts");
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

+ (BOOL)supportsResult:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___SSPodcastResultBuilder;
  if ((objc_msgSendSuper2(&v9, sel_supportsResult_, v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v4, "contentType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "bundleId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "hasPrefix:", v7);

  }
  return v5;
}

- (SSPodcastResultBuilder)initWithResult:(id)a3
{
  id v4;
  SSPodcastResultBuilder *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SSPodcastResultBuilder;
  v5 = -[SSResultBuilder initWithResult:](&v12, sel_initWithResult_, v4);
  if (v5)
  {
    objc_msgSend(v4, "lastUsedDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSPodcastResultBuilder setLastViewedDate:](v5, "setLastViewedDate:", v6);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6158], objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSPodcastResultBuilder setName:](v5, "setName:", v7);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6150], objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSPodcastResultBuilder setPodcastDescription:](v5, "setPodcastDescription:", v8);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6108], objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSPodcastResultBuilder setImageURL:](v5, "setImageURL:", v9);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6048], objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSPodcastResultBuilder setAuthors:](v5, "setAuthors:", v10);

  }
  return v5;
}

- (id)buildLastViewedString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[SSPodcastResultBuilder lastViewedDate](self, "lastViewedDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[SSDateFormatManager dateLastOpenedStringFormat](SSDateFormatManager, "dateLastOpenedStringFormat");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[SSPodcastResultBuilder lastViewedDate](self, "lastViewedDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SSDateFormatManager dyanmicStringFromDate:](SSDateFormatManager, "dyanmicStringFromDate:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)buildInlineCardSection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SSPodcastResultBuilder;
  -[SSResultBuilder buildInlineCardSection](&v8, sel_buildInlineCardSection);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((SSSnippetModernizationEnabled() & 1) == 0)
  {
    v4 = (void *)MEMORY[0x1E0D8C660];
    -[SSPodcastResultBuilder buildLastViewedString](self, "buildLastViewedString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFootnote:", v6);

  }
  objc_msgSend(v3, "setPunchoutOptions:", 0);
  return v3;
}

- (id)buildCompactCardSection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SSPodcastResultBuilder;
  -[SSResultBuilder buildCompactCardSection](&v10, sel_buildCompactCardSection);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D8C660];
  -[SSPodcastResultBuilder buildLastViewedString](self, "buildLastViewedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDescriptions:", v8);

  return v3;
}

- (id)buildDescriptions
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  -[SSResultBuilder result](self, "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.podcasts.show"))
    && (-[SSPodcastResultBuilder authors](self, "authors"), (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = (void *)v5;
    v7 = SSSnippetModernizationEnabled();

    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0D8C660];
      -[SSPodcastResultBuilder authors](self, "authors");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "textWithString:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      return v12;
    }
  }
  else
  {

  }
  v14.receiver = self;
  v14.super_class = (Class)SSPodcastResultBuilder;
  -[SSResultBuilder buildDescriptions](&v14, sel_buildDescriptions);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSDate)lastViewedDate
{
  return self->_lastViewedDate;
}

- (void)setLastViewedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastViewedDate, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)podcastDescription
{
  return self->_podcastDescription;
}

- (void)setPodcastDescription:(id)a3
{
  objc_storeStrong((id *)&self->_podcastDescription, a3);
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_imageURL, a3);
}

- (NSArray)authors
{
  return self->_authors;
}

- (void)setAuthors:(id)a3
{
  objc_storeStrong((id *)&self->_authors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authors, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_podcastDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_lastViewedDate, 0);
}

@end

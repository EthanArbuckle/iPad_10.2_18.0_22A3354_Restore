@implementation VUIRatingToResourceMapper

- (VUIRatingToResourceMapper)init
{
  VUIRatingToResourceMapper *v2;
  VUIRatingToResourceMapper *v3;
  NSDictionary *mappingDictionary;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUIRatingToResourceMapper;
  v2 = -[VUIRatingToResourceMapper init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    mappingDictionary = v2->_mappingDictionary;
    v2->_mappingDictionary = (NSDictionary *)&unk_1EA0BC350;

  }
  return v3;
}

- (id)resourceForRating:(id)a3 ratingSystem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[VUIRatingToResourceMapper _cleanRatingName:](self, "_cleanRatingName:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIRatingToResourceMapper mappingDictionary](self, "mappingDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("resource"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v11, "length"))
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "uppercaseString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@_"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", v14, &stru_1E9FF3598);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/_/g"), CFSTR("-"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/Plus/gi"), CFSTR("+"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v17;
      v11 = v6;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_cleanRatingName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0CB38E8];
    v4 = a3;
    objc_msgSend(v3, "regularExpressionWithPattern:options:error:", CFSTR("([^0-9A-Z])+"), 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByReplacingMatchesInString:options:range:withTemplate:", v4, 0, 0, objc_msgSend(v4, "length"), &stru_1E9FF3598);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "lowercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("brmovies_|brtv_|brmovie"), 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "stringByReplacingMatchesInString:options:range:withTemplate:", v7, 0, 0, objc_msgSend(v7, "length"), CFSTR("bars"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (NSDictionary)mappingDictionary
{
  return self->_mappingDictionary;
}

- (void)setMappingDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_mappingDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mappingDictionary, 0);
}

@end

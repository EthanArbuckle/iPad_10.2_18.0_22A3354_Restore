@implementation BKSeriesInfo

- (BKSeriesInfo)initWithDictionary:(id)a3
{
  id v4;
  BKSeriesInfo *v5;
  BKSeriesInfo *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BKSeriesInfo;
  v5 = -[BKSeriesInfo init](&v8, "init");
  v6 = v5;
  if (v5)
    -[BKSeriesInfo setInfoDictionary:](v5, "setInfoDictionary:", v4);

  return v6;
}

+ (id)seriesInfoWithDictionary:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1)), "initWithDictionary:", v4);

  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKSeriesInfo infoDictionary](self, "infoDictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<BKSeriesInfo: %p> data: %@"), self, v3));

  return (NSString *)v4;
}

- (NSString)adamId
{
  return (NSString *)-[NSDictionary objectForKey:](self->_infoDictionary, "objectForKey:", CFSTR("adamId"));
}

- (NSNumber)itemTypeRaw
{
  return (NSNumber *)-[NSDictionary objectForKey:](self->_infoDictionary, "objectForKey:", CFSTR("itemTypeRaw"));
}

- (NSString)author
{
  return (NSString *)-[NSDictionary objectForKey:](self->_infoDictionary, "objectForKey:", CFSTR("author"));
}

- (NSString)sortAuthor
{
  return (NSString *)-[NSDictionary objectForKey:](self->_infoDictionary, "objectForKey:", CFSTR("sortAuthor"));
}

- (BOOL)isExplicit
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_infoDictionary, "objectForKey:", CFSTR("isExplicit")));
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isAudiobook
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_infoDictionary, "objectForKey:", CFSTR("isAudiobook")));
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isContainer
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_infoDictionary, "objectForKey:", CFSTR("isContainer")));
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (float)popularity
{
  void *v2;
  float v3;
  float v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_infoDictionary, "objectForKey:", CFSTR("popularity")));
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (NSNumber)seriesSortKey
{
  return (NSNumber *)-[NSDictionary objectForKey:](self->_infoDictionary, "objectForKey:", CFSTR("position"));
}

- (NSDecimalNumber)sequenceNumber
{
  return (NSDecimalNumber *)-[NSDictionary objectForKey:](self->_infoDictionary, "objectForKey:", CFSTR("sequenceNumber"));
}

- (NSString)sequenceDisplayName
{
  return (NSString *)-[NSDictionary objectForKey:](self->_infoDictionary, "objectForKey:", CFSTR("sequenceDisplayName"));
}

- (NSNumber)coverAspectRatio
{
  return (NSNumber *)-[NSDictionary objectForKey:](self->_infoDictionary, "objectForKey:", CFSTR("coverAspectRatio"));
}

- (NSString)seriesId
{
  return (NSString *)-[NSDictionary objectForKey:](self->_infoDictionary, "objectForKey:", CFSTR("seriesAdamId"));
}

- (NSString)seriesTitle
{
  return (NSString *)-[NSDictionary objectForKey:](self->_infoDictionary, "objectForKey:", CFSTR("seriesTitle"));
}

- (NSNumber)seriesIsOrdered
{
  return (NSNumber *)-[NSDictionary objectForKey:](self->_infoDictionary, "objectForKey:", CFSTR("seriesIsOrdered"));
}

- (NSString)title
{
  return (NSString *)-[NSDictionary objectForKey:](self->_infoDictionary, "objectForKey:", CFSTR("title"));
}

- (NSNumber)authorCount
{
  return (NSNumber *)-[NSDictionary objectForKey:](self->_infoDictionary, "objectForKey:", CFSTR("authorCount"));
}

- (NSArray)authorNames
{
  return (NSArray *)-[NSDictionary objectForKey:](self->_infoDictionary, "objectForKey:", CFSTR("authorNames"));
}

- (NSNumber)hasTooManyAuthors
{
  return (NSNumber *)-[NSDictionary objectForKey:](self->_infoDictionary, "objectForKey:", CFSTR("hasTooManyAuthors"));
}

- (NSNumber)narratorCount
{
  return (NSNumber *)-[NSDictionary objectForKey:](self->_infoDictionary, "objectForKey:", CFSTR("narratorCount"));
}

- (NSArray)narratorNames
{
  return (NSArray *)-[NSDictionary objectForKey:](self->_infoDictionary, "objectForKey:", CFSTR("narratorNames"));
}

- (NSNumber)hasTooManyNarrators
{
  return (NSNumber *)-[NSDictionary objectForKey:](self->_infoDictionary, "objectForKey:", CFSTR("hasTooManyNarrators"));
}

- (NSArray)children
{
  return (NSArray *)-[NSDictionary objectForKey:](self->_infoDictionary, "objectForKey:", CFSTR("children"));
}

- (NSArray)childrenIds
{
  return (NSArray *)-[NSDictionary objectForKey:](self->_infoDictionary, "objectForKey:", CFSTR("childrenIds"));
}

- (NSArray)genres
{
  return (NSArray *)-[NSDictionary objectForKey:](self->_infoDictionary, "objectForKey:", CFSTR("genres"));
}

- (NSArray)genreNames
{
  return (NSArray *)-[NSDictionary objectForKey:](self->_infoDictionary, "objectForKey:", CFSTR("genreNames"));
}

- (NSString)kind
{
  return (NSString *)-[NSDictionary objectForKey:](self->_infoDictionary, "objectForKey:", CFSTR("kind"));
}

- (NSString)name
{
  return (NSString *)-[NSDictionary objectForKey:](self->_infoDictionary, "objectForKey:", CFSTR("name"));
}

- (NSString)nameRaw
{
  return (NSString *)-[NSDictionary objectForKey:](self->_infoDictionary, "objectForKey:", CFSTR("nameRaw"));
}

- (NSDate)releaseDate
{
  return (NSDate *)-[NSDictionary objectForKey:](self->_infoDictionary, "objectForKey:", CFSTR("releaseDate"));
}

- (NSURL)shortUrl
{
  return (NSURL *)-[NSDictionary objectForKey:](self->_infoDictionary, "objectForKey:", CFSTR("shortUrl"));
}

- (NSString)tellAFriendMessageContentsUrl
{
  return (NSString *)-[NSDictionary objectForKey:](self->_infoDictionary, "objectForKey:", CFSTR("tellAFriendMessageContentsUrl"));
}

- (NSString)genre
{
  return (NSString *)-[NSDictionary objectForKey:](self->_infoDictionary, "objectForKey:", CFSTR("genre"));
}

- (NSURL)url
{
  return (NSURL *)-[NSDictionary objectForKey:](self->_infoDictionary, "objectForKey:", CFSTR("url"));
}

- (NSString)mappedItemId
{
  return (NSString *)-[NSDictionary objectForKey:](self->_infoDictionary, "objectForKey:", CFSTR("mappedItemId"));
}

- (NSNumber)mappedItemTypeRaw
{
  return (NSNumber *)-[NSDictionary objectForKey:](self->_infoDictionary, "objectForKey:", CFSTR("mappedItemTypeRaw"));
}

- (NSDictionary)infoDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInfoDictionary:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoDictionary, 0);
}

@end

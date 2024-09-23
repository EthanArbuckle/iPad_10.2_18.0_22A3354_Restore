@implementation MTPodcastParser

- (MTPodcastParser)init
{
  MTPodcastParser *v2;
  MTDateParser *v3;
  MTDateParser *dateParser;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTPodcastParser;
  v2 = -[MTPodcastParser init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(MTDateParser);
    dateParser = v2->_dateParser;
    v2->_dateParser = v3;

  }
  return v2;
}

- (id)dateFromRSSDateString:(id)a3
{
  return -[MTDateParser dateFromRSSDateString:](self->_dateParser, "dateFromRSSDateString:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateParser, 0);
}

@end

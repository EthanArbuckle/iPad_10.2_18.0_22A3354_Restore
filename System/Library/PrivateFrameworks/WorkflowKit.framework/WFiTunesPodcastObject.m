@implementation WFiTunesPodcastObject

- (WFiTunesPodcastObject)initWithName:(id)a3 identifier:(id)a4 podcastUUID:(id)a5 feedURL:(id)a6 kind:(id)a7
{
  id v12;
  id v13;
  WFiTunesPodcastObject *v14;
  WFiTunesPodcastObject *v15;
  WFiTunesPodcastObject *v16;
  objc_super v18;

  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)WFiTunesPodcastObject;
  v14 = -[WFiTunesObject initWithName:identifier:kind:](&v18, sel_initWithName_identifier_kind_, a3, a4, a7);
  v15 = v14;
  if (v14)
  {
    -[WFiTunesPodcastObject setPodcastUUID:](v14, "setPodcastUUID:", v12);
    -[WFiTunesPodcastObject setFeedURL:](v15, "setFeedURL:", v13);
    v16 = v15;
  }

  return v15;
}

- (NSString)podcastUUID
{
  return self->_podcastUUID;
}

- (void)setPodcastUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSURL)feedURL
{
  return self->_feedURL;
}

- (void)setFeedURL:(id)a3
{
  objc_storeStrong((id *)&self->_feedURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedURL, 0);
  objc_storeStrong((id *)&self->_podcastUUID, 0);
}

+ (id)JSONKeyPathsByPropertyKey
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___WFiTunesPodcastObject;
  objc_msgSendSuper2(&v6, sel_JSONKeyPathsByPropertyKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v7[0] = CFSTR("podcastUUID");
  v7[1] = CFSTR("feedURL");
  v8[0] = CFSTR("podcastUUID");
  v8[1] = CFSTR("feedUrl");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  return v3;
}

@end

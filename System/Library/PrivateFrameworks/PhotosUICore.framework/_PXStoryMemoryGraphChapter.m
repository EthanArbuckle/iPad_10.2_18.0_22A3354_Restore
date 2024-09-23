@implementation _PXStoryMemoryGraphChapter

- (_PXStoryMemoryGraphChapter)init
{
  _PXStoryMemoryGraphChapter *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *graphChapterDictionary;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_PXStoryMemoryGraphChapter;
  v2 = -[_PXStoryMemoryGraphChapter init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    graphChapterDictionary = v2->_graphChapterDictionary;
    v2->_graphChapterDictionary = v3;

  }
  return v2;
}

- (NSDictionary)graphChapterDictionary
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_graphChapterDictionary, "copy");
}

- (void)setGraphChapterDictionary:(id)a3
{
  -[NSMutableDictionary setDictionary:](self->_graphChapterDictionary, "setDictionary:", a3);
}

- (NSString)localizedTitle
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_graphChapterDictionary, "objectForKeyedSubscript:", CFSTR("title"));
}

- (void)setLocalizedTitle:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_graphChapterDictionary, "setObject:forKeyedSubscript:", v4, CFSTR("title"));

}

- (NSString)localizedSubtitle
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_graphChapterDictionary, "objectForKeyedSubscript:", CFSTR("subtitle"));
}

- (void)setLocalizedSubtitle:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_graphChapterDictionary, "setObject:forKeyedSubscript:", v4, CFSTR("subtitle"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphChapterDictionary, 0);
}

@end

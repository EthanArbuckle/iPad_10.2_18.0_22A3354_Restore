@implementation PGGraphMusicAlbumNode

- (PGGraphMusicAlbumNode)initWithTitle:(id)a3
{
  id v5;
  PGGraphMusicAlbumNode *v6;
  PGGraphMusicAlbumNode *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphMusicAlbumNode;
  v6 = -[PGGraphNode init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_title, a3);

  return v7;
}

- (PGGraphMusicAlbumNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  void *v6;
  PGGraphMusicAlbumNode *v7;

  objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("name"), a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PGGraphMusicAlbumNode initWithTitle:](self, "initWithTitle:", v6);

  return v7;
}

- (BOOL)hasProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = !v6 || objc_msgSend(v6, "isEqual:", self->_title);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (id)propertyDictionary
{
  NSString *title;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  title = self->_title;
  v4 = CFSTR("name");
  v5[0] = title;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PGGraphMusicAlbumNode (%@)"), self->_title);
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("MusicAlbum");
  return CFSTR("MusicAlbum");
}

- (unsigned)domain
{
  return 1000;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
}

@end

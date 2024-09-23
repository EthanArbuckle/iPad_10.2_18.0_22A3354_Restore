@implementation WFiTunesArtistObject

- (NSString)type
{
  return self->_type;
}

- (NSString)genre
{
  return self->_genre;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (id)JSONKeyPathsByPropertyKey
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;
  _QWORD v7[7];
  _QWORD v8[8];

  v8[7] = *MEMORY[0x1E0C80C00];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___WFiTunesArtistObject;
  objc_msgSendSuper2(&v6, sel_JSONKeyPathsByPropertyKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v7[0] = CFSTR("identifier");
  v7[1] = CFSTR("name");
  v8[0] = CFSTR("artistId");
  v8[1] = CFSTR("artistName");
  v7[2] = CFSTR("censoredName");
  v7[3] = CFSTR("kind");
  v8[2] = CFSTR("artistCensoredName");
  v8[3] = CFSTR("kind");
  v7[4] = CFSTR("viewURL");
  v7[5] = CFSTR("type");
  v8[4] = CFSTR("artistLinkUrl");
  v8[5] = CFSTR("artistType");
  v7[6] = CFSTR("genre");
  v8[6] = CFSTR("primaryGenreName");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  return v3;
}

@end

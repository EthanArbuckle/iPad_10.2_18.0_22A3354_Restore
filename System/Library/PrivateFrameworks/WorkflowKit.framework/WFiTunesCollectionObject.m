@implementation WFiTunesCollectionObject

- (NSString)type
{
  return self->_type;
}

- (NSString)genre
{
  return self->_genre;
}

- (NSNumber)trackCount
{
  return self->_trackCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackCount, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (id)JSONKeyPathsByPropertyKey
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;
  _QWORD v7[9];
  _QWORD v8[10];

  v8[9] = *MEMORY[0x1E0C80C00];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___WFiTunesCollectionObject;
  objc_msgSendSuper2(&v6, sel_JSONKeyPathsByPropertyKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v7[0] = CFSTR("price");
  v7[1] = CFSTR("identifier");
  v8[0] = CFSTR("collectionPrice");
  v8[1] = CFSTR("collectionId");
  v7[2] = CFSTR("name");
  v7[3] = CFSTR("censoredName");
  v8[2] = CFSTR("collectionName");
  v8[3] = CFSTR("collectionCensoredName");
  v7[4] = CFSTR("kind");
  v7[5] = CFSTR("trackCount");
  v8[4] = CFSTR("kind");
  v8[5] = CFSTR("trackCount");
  v7[6] = CFSTR("genre");
  v7[7] = CFSTR("viewURL");
  v8[6] = CFSTR("primaryGenreName");
  v8[7] = CFSTR("collectionViewUrl");
  v7[8] = CFSTR("type");
  v8[8] = CFSTR("collectionType");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  return v3;
}

@end

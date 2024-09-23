@implementation WFiTunesMediaTrackObject

- (NSURL)previewURL
{
  return self->_previewURL;
}

- (NSString)genre
{
  return self->_genre;
}

- (WFTimeInterval)duration
{
  return self->_duration;
}

- (BOOL)streamable
{
  return self->_streamable;
}

- (BOOL)explicit
{
  return self->_explicit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_previewURL, 0);
}

+ (id)JSONKeyPathsByPropertyKey
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;
  _QWORD v7[11];
  _QWORD v8[12];

  v8[11] = *MEMORY[0x1E0C80C00];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___WFiTunesMediaTrackObject;
  objc_msgSendSuper2(&v6, sel_JSONKeyPathsByPropertyKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v7[0] = CFSTR("identifier");
  v7[1] = CFSTR("name");
  v8[0] = CFSTR("trackId");
  v8[1] = CFSTR("trackName");
  v7[2] = CFSTR("censoredName");
  v7[3] = CFSTR("kind");
  v8[2] = CFSTR("trackCensoredName");
  v8[3] = CFSTR("kind");
  v7[4] = CFSTR("price");
  v7[5] = CFSTR("viewURL");
  v8[4] = &unk_1E7B8D9B8;
  v8[5] = CFSTR("trackViewUrl");
  v7[6] = CFSTR("duration");
  v7[7] = CFSTR("genre");
  v8[6] = CFSTR("trackTimeMillis");
  v8[7] = CFSTR("primaryGenreName");
  v7[8] = CFSTR("previewURL");
  v7[9] = CFSTR("explicit");
  v8[8] = CFSTR("previewUrl");
  v8[9] = CFSTR("trackExplicitness");
  v7[10] = CFSTR("streamable");
  v8[10] = CFSTR("isStreamable");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  return v3;
}

+ (id)durationJSONTransformer
{
  return +[MTLValueTransformer transformerUsingForwardBlock:reverseBlock:](MTLValueTransformer, "transformerUsingForwardBlock:reverseBlock:", &__block_literal_global_432, &__block_literal_global_437);
}

+ (id)explicitJSONTransformer
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B20], "mtl_valueMappingTransformerWithDictionary:defaultValue:reverseDefaultValue:", &unk_1E7B8DE78, MEMORY[0x1E0C9AAA0], MEMORY[0x1E0C9AAB0]);
}

+ (id)priceJSONTransformer
{
  return +[MTLValueTransformer transformerUsingForwardBlock:](MTLValueTransformer, "transformerUsingForwardBlock:", &__block_literal_global_442);
}

id __48__WFiTunesMediaTrackObject_priceJSONTransformer__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "objectForKey:", CFSTR("trackPrice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("price"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

uint64_t __51__WFiTunesMediaTrackObject_durationJSONTransformer__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  double v3;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "timeInterval");
  return objc_msgSend(v2, "numberWithDouble:", v3 * 1000.0);
}

id __51__WFiTunesMediaTrackObject_durationJSONTransformer__block_invoke(uint64_t a1, void *a2)
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(a2, "doubleValue");
  v3 = v2 / 1000.0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingTimeInterval:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 224;
  objc_msgSend(v5, "components:fromDate:toDate:options:", 224, v4, v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "hour"))
  {
    v9 = 1;
  }
  else
  {
    v10 = objc_msgSend(v8, "minute");
    if (v10)
      v9 = 1;
    else
      v9 = 0x10000;
    if (v10)
      v7 = 224;
    else
      v7 = 192;
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D140A8]), "initWithTimeInterval:allowedUnits:unitsStyle:zeroFormattingBehavior:", v7, 0, v9, v3);

  return v11;
}

@end

@implementation AXKonaSpeechSegment

+ (NSDictionary)encodingReplacements
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = (void *)EncodingReplacements;
  if (!EncodingReplacements)
  {
    v3 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathForResource:ofType:", CFSTR("KonaEncodingReplacements"), CFSTR("plist"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dictionaryWithContentsOfFile:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)EncodingReplacements;
    EncodingReplacements = v6;

    v2 = (void *)EncodingReplacements;
  }
  return (NSDictionary *)v2;
}

- (AXKonaSpeechSegment)init
{
  AXKonaSpeechSegment *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXKonaSpeechSegment;
  result = -[AXKonaSpeechSegment init](&v3, sel_init);
  if (result)
    result->_encodedString = 0;
  return result;
}

- (void)dealloc
{
  char *encodedString;
  objc_super v4;

  encodedString = self->_encodedString;
  if (encodedString)
    free(encodedString);
  v4.receiver = self;
  v4.super_class = (Class)AXKonaSpeechSegment;
  -[AXKonaSpeechSegment dealloc](&v4, sel_dealloc);
}

- (void)setText:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char *encodedString;
  size_t v15;
  char *v16;
  unint64_t i;
  id v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v4 = (void *)objc_msgSend(v18, "copy");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  +[AXKonaSpeechSegment encodingReplacements](AXKonaSpeechSegment, "encodingReplacements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v21;
    do
    {
      v9 = 0;
      v10 = v4;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v9);
        +[AXKonaSpeechSegment encodingReplacements](AXKonaSpeechSegment, "encodingReplacements");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", v11, v13);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        ++v9;
        v10 = v4;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  objc_storeStrong((id *)&self->_text, v4);
  encodedString = self->_encodedString;
  if (encodedString)
  {
    free(encodedString);
    self->_encodedString = 0;
  }
  v19 = 0;
  v15 = objc_msgSend(v4, "maximumLengthOfBytesUsingEncoding:", -[AXKonaSpeechSegment targetEncoding](self, "targetEncoding"));
  v16 = (char *)malloc_type_malloc(v15, 0xECBC1A28uLL);
  self->_encodedString = v16;
  objc_msgSend(v4, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v16, v15, &v19, -[AXKonaSpeechSegment targetEncoding](self, "targetEncoding"), 1, 0, objc_msgSend(v4, "length"), 0);
  -[AXKonaSpeechSegment setEncodedStringLength:](self, "setEncodedStringLength:", v19);
  for (i = 0; objc_msgSend(v4, "length") > i; ++i)
  {
    if (self->_encodedString[i] == 63 && objc_msgSend(v4, "characterAtIndex:", i) != 63)
      self->_encodedString[i] = 32;
  }

}

- (char)encodedString
{
  return self->_encodedString;
}

- (NSString)text
{
  return self->_text;
}

- (unint64_t)targetEncoding
{
  return self->_targetEncoding;
}

- (void)setTargetEncoding:(unint64_t)a3
{
  self->_targetEncoding = a3;
}

- (unint64_t)encodedStringLength
{
  return self->_encodedStringLength;
}

- (void)setEncodedStringLength:(unint64_t)a3
{
  self->_encodedStringLength = a3;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (AXKonaMarker)marker
{
  return self->_marker;
}

- (void)setMarker:(id)a3
{
  objc_storeStrong((id *)&self->_marker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_marker, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end

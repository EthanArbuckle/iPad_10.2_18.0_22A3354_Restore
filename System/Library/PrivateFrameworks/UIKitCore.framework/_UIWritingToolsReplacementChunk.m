@implementation _UIWritingToolsReplacementChunk

- (_UIWritingToolsReplacementChunk)initWithReplacementChunk:(id)a3 originalRange:(_NSRange)a4 uuid:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  id v11;
  _UIWritingToolsReplacementChunk *v12;
  _UIWritingToolsReplacementChunk *v13;
  uint64_t v14;
  int64_t v15;
  objc_super v17;

  length = a4.length;
  location = a4.location;
  v10 = a3;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_UIWritingToolsReplacementChunk;
  v12 = -[_UIWritingToolsReplacementChunk init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_replacement, a3);
    v13->_originalRange.location = location;
    v13->_originalRange.length = length;
    objc_storeStrong((id *)&v13->_uuid, a5);
    v14 = objc_msgSend(v10, "length");
    v15 = v13->_originalRange.length + v13->_originalRange.location;
    v13->_lengthDelta = v14 - length;
    v13->_originalEndIndex = v15;
  }

  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIWritingToolsReplacementChunk;
  -[_UIWritingToolsReplacementChunk description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" range={%lu, %lu} delta=%ld end=%lu uuid=%p replacement=%@"), self->_originalRange.location, self->_originalRange.length, self->_lengthDelta, self->_originalEndIndex, self->_uuid, self->_replacement);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (_NSRange)originalRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_originalRange.length;
  location = self->_originalRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (NSAttributedString)replacement
{
  return self->_replacement;
}

- (int64_t)lengthDelta
{
  return self->_lengthDelta;
}

- (int64_t)originalEndIndex
{
  return self->_originalEndIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacement, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end

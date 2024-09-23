@implementation VKCMockDataDetectorElement

- (VKCMockDataDetectorElement)initWithDictionary:(id)a3
{
  id v4;
  VKCMockDataDetectorElement *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSArray *boundingQuads;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VKCMockDataDetectorElement;
  v5 = -[VKCBaseDataDetectorElement init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", VKCMockResultDataDetectorTypesKey);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_dataDetectorTypes = objc_msgSend(v6, "unsignedLongLongValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", VKCMockResultDataDetectorQuadsKey);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = (void *)MEMORY[0x1E0C9AA60];
    if (v7)
      v9 = (void *)v7;
    v10 = v9;

    objc_msgSend(v10, "vk_compactMap:", &__block_literal_global_17);
    v11 = objc_claimAutoreleasedReturnValue();

    boundingQuads = v5->_boundingQuads;
    v5->_boundingQuads = (NSArray *)v11;

    objc_msgSend(v4, "objectForKeyedSubscript:", VKCMockResultDataDetectorRangeKey);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", VKCMockResultRangeLocationKey);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "unsignedLongValue");

    objc_msgSend(v13, "objectForKeyedSubscript:", VKCMockResultRangeLengthKey);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "unsignedLongValue");

    v5->_characterRange.location = v15;
    v5->_characterRange.length = v17;

  }
  return v5;
}

VKQuad *__49__VKCMockDataDetectorElement_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  VKQuad *v3;

  v2 = a2;
  v3 = -[VKQuad initWithDictionary:]([VKQuad alloc], "initWithDictionary:", v2);

  return v3;
}

- (unint64_t)dataDetectorTypes
{
  return self->_dataDetectorTypes;
}

- (_NSRange)characterRange
{
  _NSRange *p_characterRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_characterRange = &self->_characterRange;
  location = self->_characterRange.location;
  length = p_characterRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (id)boundingQuads
{
  return self->_boundingQuads;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boundingQuads, 0);
}

@end

@implementation VSSpeechWordTimingInfo

- (VSSpeechWordTimingInfo)initWithCoder:(id)a3
{
  id v4;
  VSSpeechWordTimingInfo *v5;
  double v6;
  void *v7;
  NSUInteger v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VSSpeechWordTimingInfo;
  v5 = -[VSSpeechWordTimingInfo init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_startTime"));
    v5->_startTime = v6;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_textRange"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_textRange.location = objc_msgSend(v7, "rangeValue");
    v5->_textRange.length = v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double startTime;
  id v5;
  id v6;

  startTime = self->_startTime;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_startTime"), startTime);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", self->_textRange.location, self->_textRange.length);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("_textRange"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  VSSpeechWordTimingInfo *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = -[VSSpeechWordTimingInfo init](+[VSSpeechWordTimingInfo allocWithZone:](VSSpeechWordTimingInfo, "allocWithZone:", a3), "init");
  -[VSSpeechWordTimingInfo startTime](self, "startTime");
  -[VSSpeechWordTimingInfo setStartTime:](v4, "setStartTime:");
  v5 = -[VSSpeechWordTimingInfo textRange](self, "textRange");
  -[VSSpeechWordTimingInfo setTextRange:](v4, "setTextRange:", v5, v6);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v14;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    objc_msgSend(v5, "startTime");
    v7 = v6;
    -[VSSpeechWordTimingInfo startTime](self, "startTime");
    if (v7 == v8)
    {
      v9 = objc_msgSend(v5, "textRange");
      v11 = v10;
      v14 = v9 == -[VSSpeechWordTimingInfo textRange](self, "textRange") && v11 == v12;
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[VSSpeechWordTimingInfo startTime](self, "startTime");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  v6 = -[VSSpeechWordTimingInfo textRange](self, "textRange") - v5 + 32 * v5;
  -[VSSpeechWordTimingInfo textRange](self, "textRange");
  return v7 - v6 + 32 * v6 + 29791;
}

- (id)description
{
  void *v2;
  double startTime;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  startTime = self->_startTime;
  NSStringFromRange(self->_textRange);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<VSSpeechWordTimingInfo>{startTime = %.3f; textRange = %@}"),
    *(_QWORD *)&startTime,
    v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (_NSRange)textRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_textRange.length;
  location = self->_textRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setTextRange:(_NSRange)a3
{
  self->_textRange = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)wordTimingInfoFrom:(id)a3 timestamps:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  VSSpeechWordTimingInfo *v16;
  unint64_t j;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v16 = objc_alloc_init(VSSpeechWordTimingInfo);
        objc_msgSend(v15, "doubleValue", (_QWORD)v22);
        -[VSSpeechWordTimingInfo setStartTime:](v16, "setStartTime:");
        if (v12 >= objc_msgSend(v5, "length"))
        {

          goto LABEL_18;
        }
        for (j = v12; j < objc_msgSend(v5, "length"); ++j)
        {
          if (!objc_msgSend(v7, "characterIsMember:", objc_msgSend(v5, "characterAtIndex:", j)))
            break;
        }
        v12 = j;
        if (j < objc_msgSend(v5, "length"))
        {
          v12 = j;
          do
          {
            if ((objc_msgSend(v7, "characterIsMember:", objc_msgSend(v5, "characterAtIndex:", v12)) & 1) != 0)
              break;
            ++v12;
          }
          while (v12 < objc_msgSend(v5, "length"));
        }
        -[VSSpeechWordTimingInfo setTextRange:](v16, "setTextRange:", j, v12 - j);
        objc_msgSend(v8, "addObject:", v16);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_18:

  objc_msgSend(v8, "lastObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "textRange");
  if (v19 + v20 < (unint64_t)objc_msgSend(v5, "length"))
    objc_msgSend(v18, "setTextRange:", objc_msgSend(v18, "textRange"), objc_msgSend(v5, "length") - objc_msgSend(v18, "textRange"));

  return v8;
}

+ (unint64_t)extraBytesFromUTF8ToUTF16With:(const char *)a3 totalLength:(unint64_t)a4 begin:(unint64_t)a5 end:(unint64_t)a6
{
  unint64_t v6;
  NSObject *v9;
  unint64_t result;
  const char *v11;
  char v12;
  int v13;
  int v14;
  unint64_t v15;
  int v16;
  unint64_t v17;
  __int16 v18;
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a6 - a5;
  if (a6 <= a5)
    return 0;
  if (a6 <= a4)
  {
    result = 0;
    v11 = &a3[a5];
    do
    {
      v12 = *v11++;
      v13 = v12 & 0xE0;
      v14 = v12 & 0xF0;
      if ((v12 & 0xF8) == 0xF0)
        v15 = result + 2;
      else
        v15 = result;
      if (v14 == 224)
        v15 = result + 2;
      if (v13 == 192)
        ++result;
      else
        result = v15;
      --v6;
    }
    while (v6);
  }
  else
  {
    VSGetLogDefault();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v16 = 134218240;
      v17 = a6;
      v18 = 2048;
      v19 = a4;
      _os_log_error_impl(&dword_1DE15E000, v9, OS_LOG_TYPE_ERROR, "Out of word boundary: %ld is greater than %ld", (uint8_t *)&v16, 0x16u);
    }

    return -1;
  }
  return result;
}

+ (id)utf16TimingInfoWithUTF8Range:(id)a3 withText:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  VSSpeechWordTimingInfo *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v29;
  id obj;
  uint64_t v31;
  uint64_t v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_retainAutorelease(v7);
  v9 = objc_msgSend(v8, "UTF8String");
  v10 = objc_msgSend(v8, "lengthOfBytesUsingEncoding:", 4);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v6;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v32)
  {
    v11 = 0;
    v12 = 0;
    v31 = *(_QWORD *)v35;
    v29 = v8;
    while (2)
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v35 != v31)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v15 = objc_alloc_init(VSSpeechWordTimingInfo);
        objc_msgSend(v14, "startTime");
        -[VSSpeechWordTimingInfo setStartTime:](v15, "setStartTime:");
        v16 = objc_msgSend(a1, "extraBytesFromUTF8ToUTF16With:totalLength:begin:end:", v9, v10, v11, objc_msgSend(v14, "textRange"));
        if (v16 == -1
          || (v17 = v16,
              v18 = objc_msgSend(v14, "textRange"),
              v19 = objc_msgSend(v14, "textRange"),
              objc_msgSend(v14, "textRange"),
              v21 = objc_msgSend(a1, "extraBytesFromUTF8ToUTF16With:totalLength:begin:end:", v9, v10, v18, v20 + v19),
              v21 == -1))
        {

          v8 = v29;
          goto LABEL_12;
        }
        v22 = v21;
        v23 = v17 + v12;
        v24 = objc_msgSend(v14, "textRange") - v23;
        objc_msgSend(v14, "textRange");
        -[VSSpeechWordTimingInfo setTextRange:](v15, "setTextRange:", v24, v25 - v22);
        v12 = v23 + v22;
        objc_msgSend(v33, "addObject:", v15);
        v26 = objc_msgSend(v14, "textRange");
        objc_msgSend(v14, "textRange");
        v11 = v27 + v26;

      }
      v8 = v29;
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v32)
        continue;
      break;
    }
  }
LABEL_12:

  return v33;
}

+ (void)adjustWordTimingInfo:(id)a3 forContext:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "vs_markerStringForContext:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "textRange", (_QWORD)v16) - v7;
        objc_msgSend(v13, "textRange");
        objc_msgSend(v13, "setTextRange:", v14, v15);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

}

@end

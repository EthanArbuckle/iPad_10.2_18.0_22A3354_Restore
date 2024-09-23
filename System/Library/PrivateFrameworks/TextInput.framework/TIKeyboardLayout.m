@implementation TIKeyboardLayout

- (TIKeyboardLayout)initWithCapacity:(unint64_t)a3
{
  TIKeyboardLayout *v4;
  TIKeyboardLayout *v5;
  CGSize v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardLayout;
  v4 = -[TIKeyboardLayout init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    -[TIKeyboardLayout ensureFrameCapacity:](v4, "ensureFrameCapacity:", a3);
    -[TIKeyboardLayout ensureStringCapacity:](v5, "ensureStringCapacity:", 5 * a3);
    v6 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v5->_frame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v5->_frame.size = v6;
  }
  return v5;
}

- (TIKeyboardLayout)initWithCoder:(id)a3
{
  id v4;
  TIKeyboardLayout *v5;
  id v6;
  const void *v7;
  id v8;
  const void *v9;
  unint64_t stringsSize;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  unint64_t v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TIKeyboardLayout;
  v5 = -[TIKeyboardLayout init](&v17, sel_init);
  if (v5)
  {
    v5->_usesTwoHands = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("usesTwoHands"));
    v16 = 0;
    v6 = objc_retainAutorelease(v4);
    v7 = (const void *)objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("frames"), &v16);
    v5->_count = v16 >> 3;
    -[TIKeyboardLayout ensureFrameCapacity:](v5, "ensureFrameCapacity:");
    memcpy(v5->_frames, v7, 8 * v5->_count);
    v8 = objc_retainAutorelease(v6);
    v9 = (const void *)objc_msgSend(v8, "decodeBytesForKey:returnedLength:", CFSTR("strings"), &v5->_stringsSize);
    -[TIKeyboardLayout ensureStringCapacity:](v5, "ensureStringCapacity:", v5->_stringsSize);
    memcpy(v5->_strings, v9, v5->_stringsSize);
    stringsSize = v5->_stringsSize;
    if (stringsSize)
      v5->_strings[stringsSize - 1] = 0;
    -[TIKeyboardLayout _decodeCGRectForKey:withDecoder:](v5, "_decodeCGRectForKey:withDecoder:", CFSTR("frame"), v8);
    v5->_frame.origin.x = v11;
    v5->_frame.origin.y = v12;
    v5->_frame.size.width = v13;
    v5->_frame.size.height = v14;
    v5->_shifted = objc_msgSend(v8, "decodeBoolForKey:", CFSTR("shifted"));
  }

  return v5;
}

- (CGRect)_decodeCGRectForKey:(id)a3 withDecoder:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  float v9;
  float v10;
  void *v11;
  float v12;
  float v13;
  void *v14;
  float v15;
  float v16;
  void *v17;
  float v18;
  float v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@.origin.x"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "decodeFloatForKey:", v8);
  v10 = v9;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.origin.y"), v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "decodeFloatForKey:", v11);
  v13 = v12;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.size.width"), v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "decodeFloatForKey:", v14);
  v16 = v15;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.size.height"), v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "decodeFloatForKey:", v17);
  v19 = v18;

  v20 = v10;
  v21 = v13;
  v22 = v16;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (void)addKeyWithString:(id)a3 frame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  int v10;
  const __CFString *v11;
  __CFString *v12;
  __CFString *v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  objc_msgSend(v9, "lowercaseString");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("İ"));

  if (v10)
  {

    v11 = CFSTR("i");
  }
  else
  {
    v11 = v12;
  }
  v13 = (__CFString *)v11;
  -[TIKeyboardLayout addKeyWithExactString:frame:](self, "addKeyWithExactString:frame:", v11, x, y, width, height);

}

- (void)addKeyWithExactString:(id)a3 frame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  unint64_t v9;
  id v10;
  _ShortRect *frames;
  unint64_t count;
  id v13;
  const char *v14;
  size_t v15;
  CGRect v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = self->_count + 1;
  v10 = a3;
  -[TIKeyboardLayout ensureFrameCapacity:](self, "ensureFrameCapacity:", v9);
  count = self->_count;
  frames = self->_frames;
  self->_count = count + 1;
  frames[count] = (_ShortRect)(((unint64_t)(unsigned __int16)(int)width << 32) | ((unint64_t)(int)height << 48) | ((unint64_t)(unsigned __int16)(int)y << 16) | (unsigned __int16)(int)x);
  v13 = objc_retainAutorelease(v10);
  v14 = (const char *)objc_msgSend(v13, "UTF8String");

  v15 = strlen(v14) + 1;
  -[TIKeyboardLayout ensureStringCapacity:](self, "ensureStringCapacity:", self->_stringsSize + v15);
  strlcpy(&self->_strings[self->_stringsSize], v14, v15);
  self->_stringsSize += v15;
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  self->_frame = CGRectUnion(self->_frame, v16);
}

- (void)ensureStringCapacity:(unint64_t)a3
{
  unint64_t stringsCapacity;
  unint64_t v5;
  size_t v6;
  char *v7;
  char *v8;
  char *strings;

  stringsCapacity = self->_stringsCapacity;
  if (stringsCapacity < a3)
  {
    v5 = 2 * stringsCapacity;
    if (v5 <= a3)
      v6 = a3;
    else
      v6 = v5;
    v7 = (char *)malloc_type_calloc(v6, 8uLL, 0x100004000313F17uLL);
    v8 = v7;
    strings = self->_strings;
    if (strings)
    {
      memcpy(v7, strings, self->_stringsSize);
      free(self->_strings);
    }
    self->_strings = v8;
    self->_stringsCapacity = v6;
  }
}

- (void)ensureFrameCapacity:(unint64_t)a3
{
  unint64_t framesCapacity;
  unint64_t v5;
  size_t v6;
  _ShortRect *v7;
  _ShortRect *v8;
  _ShortRect *frames;

  framesCapacity = self->_framesCapacity;
  if (framesCapacity < a3)
  {
    v5 = 2 * framesCapacity;
    if (v5 <= a3)
      v6 = a3;
    else
      v6 = v5;
    v7 = (_ShortRect *)malloc_type_calloc(v6, 8uLL, 0x100004000313F17uLL);
    v8 = v7;
    frames = self->_frames;
    if (frames)
    {
      memcpy(v7, frames, 8 * self->_count);
      free(self->_frames);
    }
    self->_frames = v8;
    self->_framesCapacity = v6;
  }
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 usesTwoHands;
  id v5;

  usesTwoHands = self->_usesTwoHands;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", usesTwoHands, CFSTR("usesTwoHands"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", self->_frames, 8 * self->_count, CFSTR("frames"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", self->_strings, self->_stringsSize, CFSTR("strings"));
  -[TIKeyboardLayout _encodeCGRect:forKey:withCoder:](self, "_encodeCGRect:forKey:withCoder:", CFSTR("frame"), v5, self->_frame.origin.x, self->_frame.origin.y, self->_frame.size.width, self->_frame.size.height);
  objc_msgSend(v5, "encodeBool:forKey:", self->_shifted, CFSTR("shifted"));

}

- (void)_encodeCGRect:(CGRect)a3 forKey:(id)a4 withCoder:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  float x;
  void *v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  id v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = a5;
  v12 = a4;
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@.origin.x"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v14 = x;
  objc_msgSend(v11, "encodeFloat:forKey:", v13, v14);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.origin.y"), v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&y = y;
  LODWORD(v16) = LODWORD(y);
  objc_msgSend(v11, "encodeFloat:forKey:", v15, v16);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.size.width"), v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&width = width;
  LODWORD(v18) = LODWORD(width);
  objc_msgSend(v11, "encodeFloat:forKey:", v17, v18);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.size.height"), v12);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  *(float *)&height = height;
  LODWORD(v19) = LODWORD(height);
  objc_msgSend(v11, "encodeFloat:forKey:", v20, v19);

}

- (BOOL)usesTwoHands
{
  return self->_usesTwoHands;
}

- (void)setUsesTwoHands:(BOOL)a3
{
  self->_usesTwoHands = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)enumerateKeysUsingBlock:(id)a3
{
  void (**v4)(id, char *, unint64_t, _BYTE *, double, double, double, double);
  unint64_t v5;
  char *strings;
  uint64_t v7;
  size_t v8;
  char v9;

  v4 = (void (**)(id, char *, unint64_t, _BYTE *, double, double, double, double))a3;
  v9 = 0;
  if (self->_count)
  {
    v5 = 0;
    strings = self->_strings;
    do
    {
      if (strings - self->_strings >= self->_stringsSize)
        break;
      v7 = (uint64_t)self->_frames[v5];
      v4[2](v4, strings, v5++, &v9, (double)(__int16)v7, (double)((int)v7 >> 16), (double)((int)((unint64_t)v7 >> 16) >> 16), (double)(v7 >> 48));
      v8 = strlen(strings);
      if (v5 >= self->_count)
        break;
      strings += v8 + 1;
    }
    while (!v9);
  }

}

- (BOOL)isEqual:(id)a3
{
  TIKeyboardLayout *v4;
  TIKeyboardLayout *v5;
  TIKeyboardLayout *v6;
  unint64_t count;
  size_t stringsSize;
  BOOL v9;

  v4 = (TIKeyboardLayout *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = v5;
      v9 = v5->_usesTwoHands == self->_usesTwoHands
        && (count = v5->_count, count == self->_count)
        && (stringsSize = v5->_stringsSize, stringsSize == self->_stringsSize)
        && !memcmp(v5->_strings, self->_strings, stringsSize)
        && !memcmp(v6->_frames, self->_frames, 8 * count)
        && CGRectEqualToRect(v6->_frame, self->_frame)
        && v6->_shifted == self->_shifted;

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (void)dealloc
{
  _ShortRect *frames;
  char *strings;
  objc_super v5;

  frames = self->_frames;
  if (frames)
    free(frames);
  strings = self->_strings;
  if (strings)
    free(strings);
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardLayout;
  -[TIKeyboardLayout dealloc](&v5, sel_dealloc);
}

- (unint64_t)hash
{
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __24__TIKeyboardLayout_hash__block_invoke;
  v5[3] = &unk_1E2439D30;
  v5[4] = &v6;
  -[TIKeyboardLayout enumerateKeysUsingBlock:](self, "enumerateKeysUsingBlock:", v5);
  v3 = (unint64_t)((double)(257
                                 * (unint64_t)((double)(257
                                                             * (unint64_t)((double)(257
                                                                                         * (unint64_t)((double)(unint64_t)(257 * v7[3]) + self->_frame.origin.x * 100.0))
                                                                                + self->_frame.origin.y * 100.0))
                                                    + self->_frame.size.width * 100.0))
                        + self->_frame.size.height * 100.0);
  v7[3] = v3;
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (const)firstKeyString
{
  return self->_strings;
}

- (int64_t)keyContainingPoint:(CGPoint)a3
{
  int64_t v3;
  _QWORD v5[5];
  CGPoint v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = -1;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__TIKeyboardLayout_keyContainingPoint___block_invoke;
  v5[3] = &unk_1E2439D58;
  v6 = a3;
  v5[4] = &v7;
  -[TIKeyboardLayout enumerateKeysUsingBlock:](self, "enumerateKeysUsingBlock:", v5);
  v3 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, const char *, double, double, double, double);
  void *v14;
  id v15;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", self->_count);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __31__TIKeyboardLayout_description__block_invoke;
  v14 = &unk_1E2439D80;
  v15 = v3;
  v4 = v3;
  -[TIKeyboardLayout enumerateKeysUsingBlock:](self, "enumerateKeysUsingBlock:", &v11);
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p; keys = [%@]>"), v7, self, v8, v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isShifted
{
  return self->_shifted;
}

- (void)setShifted:(BOOL)a3
{
  self->_shifted = a3;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

void __31__TIKeyboardLayout_description__block_invoke(uint64_t a1, const char *a2, double a3, double a4, double a5, double a6)
{
  const char *v11;
  void *v12;
  void *v13;
  id v14;

  if (*a2 == 10)
    v11 = "\\n";
  else
    v11 = a2;
  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("\"%@\"(x=%.0f,y=%.0f,w=%.0f,h=%.0f)"), v13, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v14);
}

BOOL __39__TIKeyboardLayout_keyContainingPoint___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, uint64_t a6, uint64_t a7, _BYTE *a8)
{
  _BOOL8 result;

  result = CGRectContainsPoint(*(CGRect *)&a2, *(CGPoint *)(a1 + 40));
  if (result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a7;
    *a8 = 1;
  }
  return result;
}

uint64_t __24__TIKeyboardLayout_hash__block_invoke(uint64_t result, _BYTE *a2)
{
  char v2;
  unsigned __int8 *v3;
  int v4;

  v2 = *a2;
  if (*a2)
  {
    v3 = a2 + 1;
    do
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 257
                                                                      * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                              + 8)
                                                                                  + 24)
                                                                      + v2;
      v4 = *v3++;
      v2 = v4;
    }
    while (v4);
  }
  return result;
}

@end

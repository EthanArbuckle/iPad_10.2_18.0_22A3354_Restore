@implementation TIHardwareKeyboardLayout

- (TIHardwareKeyboardLayout)initWithKeyboardType:(int64_t)a3
{
  TIHardwareKeyboardLayout *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TIHardwareKeyboardLayout;
  result = -[TIKeyboardLayout initWithCapacity:](&v5, sel_initWithCapacity_, 60);
  if (result)
    result->_keyboardType = a3;
  return result;
}

- (TIHardwareKeyboardLayout)initWithCoder:(id)a3
{
  id v4;
  TIHardwareKeyboardLayout *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TIHardwareKeyboardLayout;
  v5 = -[TIKeyboardLayout initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_keyboardType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("keyboardType"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TIHardwareKeyboardLayout;
  v4 = a3;
  -[TIKeyboardLayout encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_keyboardType, CFSTR("keyboardType"), v5.receiver, v5.super_class);

}

- (BOOL)isEqual:(id)a3
{
  TIHardwareKeyboardLayout *v4;
  BOOL v5;
  objc_super v7;

  v4 = (TIHardwareKeyboardLayout *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && v4->_keyboardType == self->_keyboardType)
    {
      v7.receiver = self;
      v7.super_class = (Class)TIHardwareKeyboardLayout;
      v5 = -[TIKeyboardLayout isEqual:](&v7, sel_isEqual_, v4);
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (void)addString:(id)a3 forKeyCode:(unint64_t)a4
{
  double x;
  double y;
  double width;
  double height;
  id v10;
  CGRect v11;

  v10 = a3;
  -[TIHardwareKeyboardLayout _frameForKeyCode:](self, "_frameForKeyCode:", a4);
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  if (!CGRectIsNull(v11))
    -[TIKeyboardLayout addKeyWithString:frame:](self, "addKeyWithString:frame:", v10, x, y, width, height);

}

- (void)addExactString:(id)a3 forKeyCode:(unint64_t)a4
{
  double x;
  double y;
  double width;
  double height;
  id v10;
  CGRect v11;

  v10 = a3;
  -[TIHardwareKeyboardLayout _frameForKeyCode:](self, "_frameForKeyCode:", a4);
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  if (!CGRectIsNull(v11))
    -[TIKeyboardLayout addKeyWithExactString:frame:](self, "addKeyWithExactString:frame:", v10, x, y, width, height);

}

- (CGRect)_frameForKeyCode:(unint64_t)a3
{
  int64_t keyboardType;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  __int128 v17;
  __int128 v18;
  CGRect result;

  keyboardType = self->_keyboardType;
  if (keyboardType == 2)
  {
    -[TIHardwareKeyboardLayout _JISFrames](self, "_JISFrames");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (keyboardType == 1)
      -[TIHardwareKeyboardLayout _ISOFrames](self, "_ISOFrames");
    else
      -[TIHardwareKeyboardLayout _ANSIFrames](self, "_ANSIFrames");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v8, "getValue:", &v17);
    v10 = *((double *)&v17 + 1);
    v9 = *(double *)&v17;
    v12 = *((double *)&v18 + 1);
    v11 = *(double *)&v18;
  }
  else
  {
    v9 = *MEMORY[0x1E0C9D628];
    v10 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v13 = v9;
  v14 = v10;
  v15 = v11;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)_ANSIFrames
{
  void *v2;
  void *v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v2 = (void *)__ansiFrames;
  if (!__ansiFrames)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 60);
    v4 = 0;
    v5 = 0.0;
    do
    {
      v6 = qword_18C5E7520[v4];
      _TIValueForCGRect(v5, 0.0, 94.0, 88.0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v7, v8);

      v5 = v5 + 94.0;
      ++v4;
    }
    while (v4 != 13);
    v9 = 144.0;
    _TIValueForCGRect(v5, 0.0, 144.0, 88.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, &unk_1E24C0358);

    _TIValueForCGRect(0.0, 88.0, 144.0, 88.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, &unk_1E24C0370);

    for (i = 0; i != 13; ++i)
    {
      v13 = qword_18C5E7588[i];
      _TIValueForCGRect(v9, 88.0, 94.0, 88.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v14, v15);

      v9 = v9 + 94.0;
    }
    v16 = 0;
    v17 = 166.0;
    do
    {
      v18 = qword_18C5E75F0[v16];
      _TIValueForCGRect(v17, 176.0, 94.0, 88.0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v19, v20);

      v17 = v17 + 94.0;
      ++v16;
    }
    while (v16 != 11);
    _TIValueForCGRect(v17, 176.0, 166.0, 88.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, &unk_1E24C0388);

    v22 = 0;
    v23 = 213.0;
    do
    {
      v24 = qword_18C5E7648[v22];
      _TIValueForCGRect(v23, 264.0, 94.0, 88.0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v25, v26);

      v23 = v23 + 94.0;
      ++v22;
    }
    while (v22 != 10);
    _TIValueForCGRect(401.0, 352.0, 564.0, 88.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v27, &unk_1E24C03A0);

    v28 = (void *)__ansiFrames;
    __ansiFrames = (uint64_t)v3;

    v2 = (void *)__ansiFrames;
  }
  return v2;
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)flushLayoutCaches
{
  void *v2;

  v2 = (void *)__ansiFrames;
  __ansiFrames = 0;

}

@end

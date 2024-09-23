@implementation PGPlaybackStatePrerollAttributes

+ (id)prerollAttributesForAdContentWithRequiredLinearPlaybackEndTime:(double)a3 preferredTintColor:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRequiredLinearPlaybackEndTime:preferredTintColor:contentType:", v6, 1, a3);

  return v7;
}

+ (id)prerollAttributesForSponsoredContentWithRequiredLinearPlaybackEndTime:(double)a3 preferredTintColor:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRequiredLinearPlaybackEndTime:preferredTintColor:contentType:", v6, 2, a3);

  return v7;
}

- (PGPlaybackStatePrerollAttributes)initWithRequiredLinearPlaybackEndTime:(double)a3 preferredTintColor:(id)a4 contentType:(int64_t)a5
{
  _BOOL4 v8;
  int v9;
  _BOOL4 v10;
  id v11;
  _BOOL8 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  PGPlaybackStatePrerollAttributes *v21;
  double v23;
  double v24;
  double v25;
  double v26;

  v8 = (*(_QWORD *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) - 1 < 0xFFFFFFFFFFFFFLL;
  if (a3 >= 0.0)
    v8 = 0;
  v9 = (*(_QWORD *)&a3 & 0x7FFFFFFFFFFFFFFFLL) == 0 || v8;
  v10 = a3 < 0.0 && ((*(_QWORD *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF;
  v11 = a4;
  v12 = v11 != 0;
  if (a3 <= 0.0)
    v13 = v12 + 1;
  else
    v13 = v12 | 2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, &unk_1E6242900);

  if (((v9 | v10) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v16, &unk_1E6242918);

  }
  if (v11)
  {
    v25 = 0.0;
    v26 = 0.0;
    v23 = 0.0;
    v24 = 0.0;
    objc_msgSend(v11, "getRed:green:blue:alpha:", &v26, &v25, &v24, &v23);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v26);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v17, &unk_1E6242930);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v18, &unk_1E6242948);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v19, &unk_1E6242960);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v23);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v20, &unk_1E6242978);

  }
  v21 = -[PGPlaybackStatePrerollAttributes initWithDictionary:](self, "initWithDictionary:", v14);

  return v21;
}

- (PGPlaybackStatePrerollAttributes)initWithDictionary:(id)a3
{
  id v4;
  PGPlaybackStatePrerollAttributes *v5;
  uint64_t v6;
  NSDictionary *dictionaryRepresentation;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGPlaybackStatePrerollAttributes;
  v5 = -[PGPlaybackStatePrerollAttributes init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    dictionaryRepresentation = v5->_dictionaryRepresentation;
    v5->_dictionaryRepresentation = (NSDictionary *)v6;

  }
  return v5;
}

- (UIColor)preferredTintColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;

  -[PGPlaybackStatePrerollAttributes dictionaryRepresentation](self, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", &unk_1E6242930);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PGPlaybackStatePrerollAttributes dictionaryRepresentation](self, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", &unk_1E6242930);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

    -[PGPlaybackStatePrerollAttributes dictionaryRepresentation](self, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", &unk_1E6242948);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v12 = v11;

    -[PGPlaybackStatePrerollAttributes dictionaryRepresentation](self, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", &unk_1E6242960);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v16 = v15;

    -[PGPlaybackStatePrerollAttributes dictionaryRepresentation](self, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", &unk_1E6242978);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v20 = v19;

    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v8, v12, v16, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
  return (UIColor *)v21;
}

- (int64_t)contentType
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PGPlaybackStatePrerollAttributes dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", &unk_1E6242900);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (double)requiredLinearPlaybackEndTime
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[PGPlaybackStatePrerollAttributes dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", &unk_1E6242918);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  objc_msgSend(v5, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPlaybackStatePrerollAttributes dictionaryRepresentation](self, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToDictionary:", v7);

  return v8;
}

- (id)description
{
  return -[PGPlaybackStatePrerollAttributes descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[PGPlaybackStatePrerollAttributes succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[PGPlaybackStatePrerollAttributes descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  int64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;

  -[PGPlaybackStatePrerollAttributes succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPlaybackStatePrerollAttributes requiredLinearPlaybackEndTime](self, "requiredLinearPlaybackEndTime");
  v5 = (id)objc_msgSend(v4, "appendDouble:withName:decimalPrecision:", CFSTR("requiredLinearPlaybackEndTime"), 3);
  v6 = -[PGPlaybackStatePrerollAttributes contentType](self, "contentType");
  v7 = CFSTR("unknown");
  if (v6 == 1)
    v7 = CFSTR("Advertisement");
  if (v6 == 2)
    v8 = CFSTR("Sponsored");
  else
    v8 = v7;
  objc_msgSend(v4, "appendString:withName:", v8, CFSTR("Content Type"));
  -[PGPlaybackStatePrerollAttributes preferredTintColorDescription](self, "preferredTintColorDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:skipIfEmpty:", v9, CFSTR("preferredTintColor"), 1);

  return v4;
}

- (id)preferredTintColorDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[PGPlaybackStatePrerollAttributes dictionaryRepresentation](self, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", &unk_1E6242930);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PGPlaybackStatePrerollAttributes dictionaryRepresentation](self, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", &unk_1E6242930);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGPlaybackStatePrerollAttributes dictionaryRepresentation](self, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", &unk_1E6242948);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGPlaybackStatePrerollAttributes dictionaryRepresentation](self, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", &unk_1E6242960);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGPlaybackStatePrerollAttributes dictionaryRepresentation](self, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", &unk_1E6242978);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("r: %@ g: %@ b: %@ a: %@"), v6, v8, v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (NSDictionary)dictionaryRepresentation
{
  return self->_dictionaryRepresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaryRepresentation, 0);
}

@end

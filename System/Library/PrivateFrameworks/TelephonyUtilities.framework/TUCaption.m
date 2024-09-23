@implementation TUCaption

- (TUCaption)initWithCaptionsToken:(id)a3 utteranceStartTimestamp:(id)a4 utteranceDuration:(id)a5
{
  id v8;
  id v9;
  id v10;
  TUCaption *v11;
  TUCaption *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[TUCaption initWithCaptionsToken:utteranceStartTimestamp:utteranceDuration:]", CFSTR("token"));
  v11 = -[TUCaption initWithCaptionsToken:](self, "initWithCaptionsToken:", v8);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_utteranceStartTimestamp, a4);
    objc_storeStrong((id *)&v12->_utteranceDuration, a5);
  }

  return v12;
}

- (TUCaption)initWithCaptionsToken:(id)a3
{
  id v4;
  TUCaption *v5;
  double v6;
  void *v7;
  uint64_t v8;
  NSString *text;
  objc_super v11;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[TUCaption initWithCaptionsToken:]", CFSTR("token"));
  v11.receiver = self;
  v11.super_class = (Class)TUCaption;
  v5 = -[TUCaption init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "confidence");
    v5->_confidence = v6;
    objc_msgSend(v4, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    text = v5->_text;
    v5->_text = (NSString *)v8;

  }
  return v5;
}

- (TUCaption)initWithCaption:(id)a3
{
  id v4;
  TUCaption *v5;
  void *v6;
  uint64_t v7;
  NSString *text;
  double v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUCaption;
  v5 = -[TUCaption init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    text = v5->_text;
    v5->_text = (NSString *)v7;

    objc_msgSend(v4, "confidence");
    v5->_confidence = v9;
  }

  return v5;
}

- (TUCaption)initWithConfidence:(double)a3 text:(id)a4
{
  id v6;
  TUCaption *v7;
  TUCaption *v8;
  uint64_t v9;
  NSString *text;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TUCaption;
  v7 = -[TUCaption init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_confidence = a3;
    v9 = objc_msgSend(v6, "copy");
    text = v8->_text;
    v8->_text = (NSString *)v9;

  }
  return v8;
}

+ (id)unarchivedObjectClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
}

+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CB3710];
  v7 = a3;
  objc_msgSend(a1, "unarchivedObjectClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unarchivedObjectOfClasses:fromData:error:", v8, v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)archivedDataWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a3);
}

- (void)encodeWithCoder:(id)a3
{
  NSString *text;
  void *v5;
  double confidence;
  void *v7;
  NSNumber *utteranceDuration;
  void *v9;
  NSNumber *utteranceStartTimestamp;
  void *v11;
  id v12;

  v12 = a3;
  text = self->_text;
  NSStringFromSelector(sel_text);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", text, v5);

  confidence = self->_confidence;
  NSStringFromSelector(sel_confidence);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeDouble:forKey:", v7, confidence);

  utteranceDuration = self->_utteranceDuration;
  if (utteranceDuration)
  {
    NSStringFromSelector(sel_utteranceDuration);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodeObject:forKey:", utteranceDuration, v9);

  }
  utteranceStartTimestamp = self->_utteranceStartTimestamp;
  if (utteranceStartTimestamp)
  {
    NSStringFromSelector(sel_utteranceDuration);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodeObject:forKey:", utteranceStartTimestamp, v11);

  }
}

- (TUCaption)initWithCoder:(id)a3
{
  id v4;
  TUCaption *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *text;
  void *v10;
  double v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSNumber *utteranceDuration;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSNumber *utteranceStartTimestamp;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)TUCaption;
  v5 = -[TUCaption init](&v21, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_text);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v8;

    NSStringFromSelector(sel_confidence);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDoubleForKey:", v10);
    v5->_confidence = v11;

    v12 = objc_opt_class();
    NSStringFromSelector(sel_utteranceDuration);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    utteranceDuration = v5->_utteranceDuration;
    v5->_utteranceDuration = (NSNumber *)v14;

    v16 = objc_opt_class();
    NSStringFromSelector(sel_utteranceStartTimestamp);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    utteranceStartTimestamp = v5->_utteranceStartTimestamp;
    v5->_utteranceStartTimestamp = (NSNumber *)v18;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TUCaption initWithCaption:](+[TUCaption allocWithZone:](TUCaption, "allocWithZone:", a3), "initWithCaption:", self);
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_confidence);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCaption confidence](self, "confidence");
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@=%f"), v4, v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  -[TUCaption utteranceDuration](self, "utteranceDuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TUCaption utteranceDuration](self, "utteranceDuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" utteranceDuration=%@"), v7);

  }
  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  -[TUCaption utteranceStartTimestamp](self, "utteranceStartTimestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[TUCaption utteranceStartTimestamp](self, "utteranceStartTimestamp");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" utteranceStartTimestamp=%@"), v9);

  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  double v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[TUCaption text](self, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[TUCaption confidence](self, "confidence");
  v6 = (unint64_t)v5;
  -[TUCaption utteranceDuration](self, "utteranceDuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4 ^ objc_msgSend(v7, "hash");
  -[TUCaption utteranceStartTimestamp](self, "utteranceStartTimestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 ^ objc_msgSend(v9, "hash") ^ v6;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  TUCaption *v4;
  BOOL v5;

  v4 = (TUCaption *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[TUCaption isEqualToCaption:](self, "isEqualToCaption:", v4);
  }

  return v5;
}

- (BOOL)isEqualToCaption:(id)a3
{
  id v4;
  NSString *text;
  void *v6;
  double confidence;
  double v8;
  NSNumber *utteranceDuration;
  void *v10;
  NSNumber *utteranceStartTimestamp;
  void *v12;
  char v13;

  v4 = a3;
  text = self->_text;
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (TUObjectsAreEqualOrNil((unint64_t)text, (uint64_t)v6)
    && (confidence = self->_confidence, objc_msgSend(v4, "confidence"), confidence == v8))
  {
    utteranceDuration = self->_utteranceDuration;
    objc_msgSend(v4, "utteranceDuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (TUObjectsAreEqualOrNil((unint64_t)utteranceDuration, (uint64_t)v10))
    {
      utteranceStartTimestamp = self->_utteranceStartTimestamp;
      objc_msgSend(v4, "utteranceStartTimestamp");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = TUObjectsAreEqualOrNil((unint64_t)utteranceStartTimestamp, (uint64_t)v12);

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)combinedStringFromCaptions:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (objc_class *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__TUCaption_combinedStringFromCaptions___block_invoke;
  v9[3] = &unk_1E38A29A0;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(" "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __40__TUCaption_combinedStringFromCaptions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "text");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

+ (double)averageConfidenceOverCaptions:(id)a3
{
  id v3;
  double v4;
  double v5;
  _QWORD v7[5];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__TUCaption_averageConfidenceOverCaptions___block_invoke;
  v7[3] = &unk_1E38A29C8;
  v7[4] = &v8;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);
  v4 = v9[3];
  v5 = v4 / (double)(unint64_t)objc_msgSend(v3, "count");
  _Block_object_dispose(&v8, 8);

  return v5;
}

double __43__TUCaption_averageConfidenceOverCaptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  double result;

  objc_msgSend(a2, "confidence");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = v4 + *(double *)(v3 + 24);
  *(double *)(v3 + 24) = result;
  return result;
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)utteranceStartTimestamp
{
  return self->_utteranceStartTimestamp;
}

- (NSNumber)utteranceDuration
{
  return self->_utteranceDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utteranceDuration, 0);
  objc_storeStrong((id *)&self->_utteranceStartTimestamp, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end

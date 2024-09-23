@implementation USOSerializedUtteranceAlignment

- (USOSerializedUtteranceAlignment)initWithNodeIndex:(unint64_t)a3 asrHypothesisIndex:(unsigned int)a4 spans:(id)a5
{
  id v9;
  USOSerializedUtteranceAlignment *v10;
  USOSerializedUtteranceAlignment *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)USOSerializedUtteranceAlignment;
  v10 = -[USOSerializedUtteranceAlignment init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_nodeIndex = a3;
    v10->_asrHypothesisIndex = a4;
    objc_storeStrong((id *)&v10->_spans, a5);
  }

  return v11;
}

- (USOSerializedUtteranceAlignment)initWithCoder:(id)a3
{
  id v4;
  USOSerializedUtteranceAlignment *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *spans;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)USOSerializedUtteranceAlignment;
  v5 = -[USOSerializedUtteranceAlignment init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nodeIndex"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("asrHypothesisIndex"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("spans"));
    v11 = objc_claimAutoreleasedReturnValue();
    spans = v5->_spans;
    v5->_spans = (NSArray *)v11;

    v5->_nodeIndex = objc_msgSend(v6, "unsignedLongLongValue");
    v5->_asrHypothesisIndex = objc_msgSend(v7, "unsignedIntValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedLongLong:", -[USOSerializedUtteranceAlignment nodeIndex](self, "nodeIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("nodeIndex"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[USOSerializedUtteranceAlignment asrHypothesisIndex](self, "asrHypothesisIndex"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("asrHypothesisIndex"));

  -[USOSerializedUtteranceAlignment spans](self, "spans");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("spans"));

}

- (unint64_t)nodeIndex
{
  return self->_nodeIndex;
}

- (void)setNodeIndex:(unint64_t)a3
{
  self->_nodeIndex = a3;
}

- (unsigned)asrHypothesisIndex
{
  return self->_asrHypothesisIndex;
}

- (void)setAsrHypothesisIndex:(unsigned int)a3
{
  self->_asrHypothesisIndex = a3;
}

- (NSArray)spans
{
  return self->_spans;
}

- (void)setSpans:(id)a3
{
  objc_storeStrong((id *)&self->_spans, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spans, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
